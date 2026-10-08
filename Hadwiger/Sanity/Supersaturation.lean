module

public import Hadwiger.Supersaturation
public import Hadwiger.Defs.ConnectedMatching
public import Hadwiger.Sanity.HoleRelation
public import Hadwiger.Sanity.Law

@[expose] public section

/-!
# Sanity checks for the abstract hole relation, units, conflicts and supersaturation
(not in the paper)

Nothing in this file is a statement of the paper. It pins the definitions of
`Hadwiger/Defs/HoleRel.lean` and `Hadwiger/Supersaturation.lean` from both sides, and holds
the general lemmas about them that later files need.

* The abstract graph on positions has independence number at most two, by the proof of the
  first half of equation `eq:sample-independence` (blueprint S-2.3) with `HoleData` replaced
  by `HoleRel`.
* Units: `(x, x)` is always a unit; being a unit does not depend on the order; in the example
  of `Hadwiger.exists_holeData_hole` the pair `(0, 1)` is not a unit and `(0, 0)` is.
* Conflicts: symmetric; no pair conflicts with itself; a conflict between two units exists in
  a small example; and the paper's sentence "Two disjoint edges fail to touch precisely when
  all four cross pairs are holes" (end of Section 2.1) holds for `Conflict` and the signed-off
  `EdgesTouch`.
* The conflict probability is the double sum it should be, and lies in `[0, 1]` for a law.
* `Supersaturated`: weaker for smaller `ε`; trivially true for `ε ≤ 0`; true for an empty
  reason when a cap is below `1`; and in a small example it holds, with a law that satisfies
  the caps, exactly for `ε ≤ 1/2`.

Added at milestone M4, first slice. Blueprint entries: `S-M4.rel`, `S-M4.unit`,
`S-M4.conflict`, `S-M4.touch`, `S-M4.conflprob`, `S-M4.sup`.
-/

namespace Hadwiger

namespace HoleRel

variable {Ω : Type*}

/-! ### The graph on positions -/

/-- **Support (M4).** The graph on positions for an abstract hole relation has independence
number at most two. This is the first half of equation `eq:sample-independence` (blueprint
S-2.3) in the abstract setting, with the proof of
`Hadwiger.HoleData.indepNum_positionGraph_le_two` word for word: an independent triple of
positions would give a hole triangle. -/
theorem indepNum_positionGraph_le_two (H : HoleRel Ω) {m : ℕ} (o : Fin m → Ω) :
    (H.positionGraph o).indepNum ≤ 2 := by
  obtain ⟨s, hs⟩ := (H.positionGraph o).exists_isNIndepSet_indepNum
  by_contra hlt
  have h3 : 2 < s.card := by
    rw [hs.card_eq]
    exact not_le.mp hlt
  obtain ⟨p, hp, q, hq, t, ht, hpq, hpt, hqt⟩ := Finset.two_lt_card.mp h3
  have hole : ∀ {x y : Fin m}, x ∈ s → y ∈ s → x ≠ y → H.Rel (o x) (o y) := by
    intro x y hx hy hxy
    by_contra hno
    exact hs.isIndepSet hx hy hxy ⟨hxy, hno⟩
  exact H.triangle_free (hole hp hq hpq) (hole hq ht hqt) (hole hp ht hpt)

/-- **Sanity (M4).** If the relation has no holes among the elements of the list, the graph
on positions is complete. -/
theorem positionGraph_eq_top (H : HoleRel Ω) {m : ℕ} (o : Fin m → Ω)
    (h : ∀ p q, ¬ H.Rel (o p) (o q)) : H.positionGraph o = ⊤ := by
  ext p q
  exact ⟨fun hpq => hpq.1, fun hpq => ⟨hpq, h p q⟩⟩

/-! ### Units -/

/-- **Sanity (M4).** `(x, x)` is a unit, because the relation has no loops. So the endpoints
of a unit may coincide. -/
theorem isUnit_diag (H : HoleRel Ω) (x : Ω) : H.IsUnit (x, x) :=
  H.irrefl x

/-- **Sanity (M4).** Being a unit does not depend on the order of the pair. -/
theorem isUnit_swap (H : HoleRel Ω) {x y : Ω} : H.IsUnit (x, y) ↔ H.IsUnit (y, x) :=
  ⟨fun h h' => h (H.symm h'), fun h h' => h (H.symm h')⟩

/-! ### Conflicts -/

/-- **Sanity (M4).** Conflict is symmetric. -/
theorem Conflict.symm {H : HoleRel Ω} {u v : Ω × Ω} (h : H.Conflict u v) : H.Conflict v u :=
  ⟨H.symm h.1, H.symm h.2.2.1, H.symm h.2.1, H.symm h.2.2.2⟩

/-- **Sanity (M4).** No ordered pair conflicts with itself: that would need a hole from an
element to itself. This is the paper's reason ("a repeated unit would require a hole from a
raw vertex to itself"). -/
theorem not_conflict_self (H : HoleRel Ω) (u : Ω × Ω) : ¬ H.Conflict u u :=
  fun h => H.irrefl _ h.1

/-- **Sanity (M4).** No unit conflicts with itself, for a second reason that does not use the
absence of loops: a conflict of `(x, y)` with itself needs a hole between `x` and `y`. -/
theorem IsUnit.not_conflict_self {H : HoleRel Ω} {u : Ω × Ω} (hu : H.IsUnit u) :
    ¬ H.Conflict u u :=
  fun h => hu h.2.1

/-- **Sanity (M4).** "Two disjoint edges fail to touch precisely when all four cross pairs
are holes" (Section 2.1, last paragraph), for the graph on positions: two pairs of positions
with all four cross pairs distinct do not touch exactly when the two pairs of elements
conflict. This ties `Conflict` to the signed-off `EdgesTouch`. -/
theorem not_edgesTouch_iff_conflict (H : HoleRel Ω) {m : ℕ} (o : Fin m → Ω)
    {p q p' q' : Fin m} (h1 : p ≠ p') (h2 : p ≠ q') (h3 : q ≠ p') (h4 : q ≠ q') :
    ¬ EdgesTouch (H.positionGraph o) s(p, q) s(p', q') ↔
      H.Conflict (o p, o q) (o p', o q') := by
  constructor
  · intro h
    have key : ∀ x y, x ∈ s(p, q) → y ∈ s(p', q') → x ≠ y → H.Rel (o x) (o y) := by
      intro x y hx hy hxy
      by_contra hno
      exact h ⟨x, hx, y, hy, hxy, hno⟩
    exact ⟨key p p' (Sym2.mem_mk_left _ _) (Sym2.mem_mk_left _ _) h1,
      key p q' (Sym2.mem_mk_left _ _) (Sym2.mem_mk_right _ _) h2,
      key q p' (Sym2.mem_mk_right _ _) (Sym2.mem_mk_left _ _) h3,
      key q q' (Sym2.mem_mk_right _ _) (Sym2.mem_mk_right _ _) h4⟩
  · rintro ⟨c1, c2, c3, c4⟩ ⟨x, hx, y, hy, -, hno⟩
    rcases Sym2.mem_iff.mp hx with rfl | rfl <;> rcases Sym2.mem_iff.mp hy with rfl | rfl
    · exact hno c1
    · exact hno c2
    · exact hno c3
    · exact hno c4

/-! ### The conflict probability -/

section ConflictProb

variable [Fintype Ω]

open Classical in
/-- **Sanity (M4).** The conflict probability is `∑ σ(u) σ(v)` over the pairs `(u, v)` that
conflict. -/
theorem conflictProb_eq_sum (H : HoleRel Ω) (σ : Ω × Ω → ℝ) :
    H.conflictProb σ = ∑ u, ∑ v, if H.Conflict u v then σ u * σ v else 0 := by
  unfold conflictProb mass
  rw [Fintype.sum_prod_type]
  rfl

/-- **Sanity (M4).** The conflict probability of nonnegative weights is nonnegative. -/
theorem conflictProb_nonneg (H : HoleRel Ω) {σ : Ω × Ω → ℝ} (hσ : ∀ u, 0 ≤ σ u) :
    0 ≤ H.conflictProb σ :=
  mass_nonneg (p := prodLaw σ σ) (fun z => mul_nonneg (hσ z.1) (hσ z.2)) _

/-- **Sanity (M4).** The conflict probability of a law is at most `1`. -/
theorem conflictProb_le_one (H : HoleRel Ω) {σ : Ω × Ω → ℝ} (hσ : IsLaw σ) :
    H.conflictProb σ ≤ 1 :=
  (isLaw_prodLaw hσ hσ).mass_le_one _

end ConflictProb

/-! ### The supersaturation hypothesis: degenerate cases -/

section Supersaturated

variable [Fintype Ω]

/-- **Sanity (M4).** Supersaturation with a bound `ε` gives supersaturation with any smaller
bound. -/
theorem Supersaturated.anti {H : HoleRel Ω} {μ : Ω → ℝ} {M B ε ε' : ℝ}
    (h : H.Supersaturated μ M B ε) (hε : ε' ≤ ε) : H.Supersaturated μ M B ε' :=
  fun σ hσ hunit hcaps => hε.trans (h σ hσ hunit hcaps)

/-- **Sanity (M4), degenerate case.** With a conflict bound `ε ≤ 0` the hypothesis holds for
every relation, law and caps, because a probability is nonnegative. A statement that assumes
`Supersaturated` and wants a real conclusion must therefore assume `0 < ε`. -/
theorem supersaturated_of_nonpos (H : HoleRel Ω) (μ : Ω → ℝ) (M B : ℝ) {ε : ℝ} (hε : ε ≤ 0) :
    H.Supersaturated μ M B ε :=
  fun _ hσ _ _ => hε.trans (H.conflictProb_nonneg hσ.nonneg)

/-- **Sanity (M4), degenerate case.** With a marginal cap `M < 1` the hypothesis holds for an
empty reason, whatever `ε` is: no law satisfies `σ_1 ≤ M μ`. -/
theorem supersaturated_of_lt_one (H : HoleRel Ω) {μ : Ω → ℝ} (hμ : IsLaw μ) {M : ℝ}
    (hM : M < 1) (B ε : ℝ) : H.Supersaturated μ M B ε :=
  fun _ hσ _ hcaps => absurd (hcaps.one_le_marginalCap hμ hσ) (not_le.mpr hM)

/-- **Sanity (M4), degenerate case.** With a joint cap `B < 1` the hypothesis holds for an
empty reason, whatever `ε` is: no law satisfies `σ ≤ B μ^2`. -/
theorem supersaturated_of_jointCap_lt_one (H : HoleRel Ω) {μ : Ω → ℝ} (hμ : IsLaw μ) (M : ℝ)
    {B : ℝ} (hB : B < 1) (ε : ℝ) : H.Supersaturated μ M B ε :=
  fun _ hσ _ hcaps => absurd (hcaps.one_le_jointCap hμ hσ) (not_le.mpr hB)

end Supersaturated

end HoleRel

/-! ### Examples -/

/-- **Sanity (M4).** In the example of `exists_holeData_hole` (two elements `0`, `1` with a
hole between them), the pair `(0, 1)` is not a unit and the pair `(0, 0)` is. -/
theorem exists_holeData_isUnit :
    ∃ D : HoleData (Fin 2 → ZMod 2) (Fin 2 → ZMod 2) (Fin 2),
      ¬ D.holeRel.IsUnit (0, 1) ∧ D.holeRel.IsUnit (0, 0) := by
  obtain ⟨D, hD⟩ := exists_holeData_hole
  exact ⟨D, fun h => h hD, D.not_hole_self 0⟩

/-- **Sanity (M4).** Two units can conflict: on a set of two elements with a hole between
them, `(0, 0)` and `(1, 1)` are units and all four of their cross pairs are holes. The
relation is "the two elements are different", built inside the proof. -/
theorem exists_holeRel_conflict :
    ∃ H : HoleRel (Fin 2), H.IsUnit (0, 0) ∧ H.IsUnit (1, 1) ∧ H.Conflict (0, 0) (1, 1) := by
  refine ⟨⟨fun i j => i ≠ j, fun h => h.symm, fun i h => h rfl, ?_⟩, ?_, ?_, ?_⟩
  · intro i j k
    revert i j k
    decide
  · exact fun h => h rfl
  · exact fun h => h rfl
  · exact ⟨by decide, by decide, by decide, by decide⟩

/-- **Sanity (M4).** The hypothesis that stands for Theorem 3.1 can hold with a positive
bound, and not for an empty reason. On two elements with a hole between them, with the
uniform law, marginal cap `1` and joint cap `2`: some law on units satisfies the three caps,
and `Supersaturated` holds exactly for the bounds `ε ≤ 1/2`.

The only law on units that satisfies the caps puts weight `1/2` on each of `(0, 0)` and
`(1, 1)`, and two independent units drawn from it conflict with probability `1/2`. -/
theorem exists_holeRel_supersaturated :
    ∃ H : HoleRel (Fin 2),
      (∃ σ : Fin 2 × Fin 2 → ℝ, IsLaw σ ∧ Function.support σ ⊆ {u | H.IsUnit u} ∧
          SatisfiesCaps (fun _ => (1 / 2 : ℝ)) 1 2 σ) ∧
        ∀ ε : ℝ, H.Supersaturated (fun _ => (1 / 2 : ℝ)) 1 2 ε ↔ ε ≤ 1 / 2 := by
  classical
  let H : HoleRel (Fin 2) :=
    ⟨fun i j => i ≠ j, fun h => h.symm, fun i h => h rfl, by
      intro i j k
      revert i j k
      decide⟩
  -- Every law on units that satisfies the caps has conflict probability exactly `1/2`.
  have key : ∀ σ : Fin 2 × Fin 2 → ℝ, IsLaw σ → Function.support σ ⊆ {u | H.IsUnit u} →
      SatisfiesCaps (fun _ => (1 / 2 : ℝ)) 1 2 σ → H.conflictProb σ = 1 / 2 := by
    intro σ hσ hunit hcaps
    have h01 : σ (0, 1) = 0 := by
      by_contra hne
      exact hunit (Function.mem_support.mpr hne) (by decide : (0 : Fin 2) ≠ 1)
    have h10 : σ (1, 0) = 0 := by
      by_contra hne
      exact hunit (Function.mem_support.mpr hne) (by decide : (1 : Fin 2) ≠ 0)
    have hsum := hσ.sum_eq_one
    rw [Fintype.sum_prod_type] at hsum
    simp only [Fin.sum_univ_two, h01, h10] at hsum
    have hf0 := hcaps.fst 0
    have hf1 := hcaps.fst 1
    simp only [marginalFst, Fin.sum_univ_two, h01, h10] at hf0 hf1
    have h00 : σ (0, 0) = 1 / 2 := by linarith
    have h11 : σ (1, 1) = 1 / 2 := by linarith
    rw [H.conflictProb_eq_sum]
    simp only [Fintype.sum_prod_type, Fin.sum_univ_two, h00, h01, h10, h11]
    simp [H, HoleRel.Conflict]
    norm_num
  -- The law with weight `1/2` on `(0, 0)` and on `(1, 1)`.
  let σ₀ : Fin 2 × Fin 2 → ℝ := fun u => if u.1 = u.2 then 1 / 2 else 0
  have hσ₀ : IsLaw σ₀ := by
    refine ⟨fun u => ?_, ?_⟩
    · simp only [σ₀]
      split_ifs <;> norm_num
    · rw [Fintype.sum_prod_type]
      simp [σ₀]
  have hunit₀ : Function.support σ₀ ⊆ {u | H.IsUnit u} := by
    intro u hu
    have hne : σ₀ u ≠ 0 := hu
    have heq : u.1 = u.2 := by
      by_contra hneq
      exact hne (by simp [σ₀, hneq])
    exact fun hrel => hrel heq
  have hcaps₀ : SatisfiesCaps (fun _ => (1 / 2 : ℝ)) 1 2 σ₀ := by
    refine ⟨fun x => ?_, fun y => ?_, fun z => ?_⟩
    · fin_cases x <;> simp [marginalFst, σ₀]
    · fin_cases y <;> simp [marginalSnd, σ₀]
    · simp only [σ₀, prodLaw]
      split_ifs <;> norm_num
  refine ⟨H, ⟨σ₀, hσ₀, hunit₀, hcaps₀⟩, fun ε => ⟨fun h => ?_, fun hε σ hσ hunit hcaps => ?_⟩⟩
  · have h1 := h σ₀ hσ₀ hunit₀ hcaps₀
    rwa [key σ₀ hσ₀ hunit₀ hcaps₀] at h1
  · rw [key σ hσ hunit hcaps]
    exact hε

end Hadwiger
