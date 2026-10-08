module

public import Hadwiger.Defs.FractionalColoring

@[expose] public section

/-!
# Sanity checks for fractional colourings (not in the paper)

Nothing in this file is a statement of the paper. These lemmas pin the definitions
`Hadwiger.FractionalColoring` and `Hadwiger.fractionalChromaticNumber` of
`Hadwiger/Defs/FractionalColoring.lean` from both sides (milestone M0,
`blueprint/MILESTONES.md`).

* the infimum in `fractionalChromaticNumber` is over a nonempty set that is bounded below,
  so it is a genuine infimum and not the junk value `sInf ∅ = 0`:
  `range_total_nonempty`, `bddBelow_range_total`, with the two resulting rules
  `fractionalChromaticNumber_le_total` and `le_fractionalChromaticNumber`;
* from above (explicit colourings): `exists_fractionalColoring_of_family`;
* from below (counting): `FractionalColoring.card_le_mul_total`;
* two values: `fractionalChromaticNumber_top` (`χ_f(K_n) = n`) and
  `fractionalChromaticNumber_cycleGraph_five` (`χ_f(C_5) = 5/2`, a value that is not an
  integer, so the definition is not secretly the ordinary chromatic number);
* the infimum is attained (`exists_fractionalColoring_total_eq`), so it is the paper's
  "minimum of `∑_I w_I`". This one is not in the M0 list; it was added because the paper
  says "minimum" and the definition says `sInf`.

`FractionalColoring.card_le_mul_total` is the counting step of the paper's proof of
Corollary 1.2, for an arbitrary bound `k` on the sizes of independent sets. It is used here
only for the two examples. The paper's statement `χ_f(G) ≥ |V|/α(G)` (blueprint `S-1.b`,
milestone M1) is not proved in this file.

Since milestone M1 this file is imported by `Hadwiger/ChromaticBounds.lean`, which uses the
general lemmas here (`card_le_mul_total`, `exists_fractionalColoring_of_family`,
`fractionalChromaticNumber_le_total`, `le_fractionalChromaticNumber`,
`range_total_nonempty`) to prove `S-1.b` and `S-1.c`, and by way of it
`fractionalChromaticNumber_nonneg` is used in Corollary 1.2. The lemmas were not moved; the
reason is in `docs/SESSION_LOG.md` (M1 session). Nothing in this file became a statement of
the paper by being used.

Blueprint entries: `S-M0.fcol-*`, `S-M0.chif-*`, in the section "Sanity checks (not in the
paper)".
-/

namespace Hadwiger

open Finset SimpleGraph

variable {V : Type*} [Fintype V]

/-! ### The set of totals -/

/-- The total weight of a fractional colouring is nonnegative. -/
theorem FractionalColoring.total_nonneg {G : SimpleGraph V} (w : FractionalColoring G) :
    0 ≤ w.total :=
  Finset.sum_nonneg fun s _ => w.nonneg s

/-- **Sanity (M0).** `0` is a lower bound of the set of totals. -/
theorem zero_mem_lowerBounds_range_total (G : SimpleGraph V) :
    (0 : ℝ) ∈ lowerBounds (Set.range (FractionalColoring.total (G := G))) := by
  rintro _ ⟨w, rfl⟩
  exact w.total_nonneg

/-- The set of totals is bounded below. -/
theorem bddBelow_range_total (G : SimpleGraph V) :
    BddBelow (Set.range (FractionalColoring.total (G := G))) :=
  ⟨0, zero_mem_lowerBounds_range_total G⟩

/-- `χ_f(G)` is at most the total of any fractional colouring. -/
theorem fractionalChromaticNumber_le_total {G : SimpleGraph V} (w : FractionalColoring G) :
    fractionalChromaticNumber G ≤ w.total :=
  csInf_le (bddBelow_range_total G) ⟨w, rfl⟩

/-! ### Explicit fractional colourings -/

/-- Weights `c i ≥ 0` on a finite family of independent sets `S i`, such that the sets
containing any vertex `v` have total weight at least `1`, give a fractional colouring of
total weight `∑ i, c i`. The weight of a vertex set `s` is the sum of the `c i` with
`S i = s`. -/
theorem exists_fractionalColoring_of_family [DecidableEq V] {G : SimpleGraph V} {ι : Type*}
    [Fintype ι] (S : ι → Finset V) (c : ι → ℝ) (hc : ∀ i, 0 ≤ c i)
    (hS : ∀ i, G.IsIndepSet (S i : Set V))
    (hcover : ∀ v, 1 ≤ ∑ i, if v ∈ S i then c i else 0) :
    ∃ w : FractionalColoring G, w.total = ∑ i, c i := by
  refine ⟨{ weight := fun s => ∑ i, if S i = s then c i else 0
            nonneg := fun s => Finset.sum_nonneg fun i _ => ?_
            indep := fun s hs => ?_
            cover := fun v => (hcover v).trans (le_of_eq ?_) }, ?_⟩
  · split_ifs
    · exact hc i
    · exact le_rfl
  · obtain ⟨i, -, hi⟩ := Finset.exists_ne_zero_of_sum_ne_zero hs
    have hSi : S i = s := by
      by_contra h
      exact hi (by simp [h])
    exact hSi ▸ hS i
  · symm
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [Finset.sum_ite_eq]
    simp
  · show ∑ s, ∑ i, (if S i = s then c i else 0) = ∑ i, c i
    rw [Finset.sum_comm]
    simp

/-- **Sanity (M0).** The set of totals is nonempty: weight `1` on every singleton is a
fractional colouring. So `fractionalChromaticNumber` is never the junk value `sInf ∅`. -/
theorem range_total_nonempty (G : SimpleGraph V) :
    (Set.range (FractionalColoring.total (G := G))).Nonempty := by
  classical
  obtain ⟨w, -⟩ := exists_fractionalColoring_of_family (G := G) (fun v : V => {v})
    (fun _ => (1 : ℝ)) (fun _ => zero_le_one) (fun v => by simp) (fun v => by simp)
  exact ⟨w.total, w, rfl⟩

/-- A lower bound on the total of every fractional colouring is a lower bound on
`χ_f(G)`. -/
theorem le_fractionalChromaticNumber {G : SimpleGraph V} {c : ℝ}
    (h : ∀ w : FractionalColoring G, c ≤ w.total) : c ≤ fractionalChromaticNumber G :=
  le_csInf (range_total_nonempty G) (by rintro _ ⟨w, rfl⟩; exact h w)

/-- `0 ≤ χ_f(G)`. -/
theorem fractionalChromaticNumber_nonneg (G : SimpleGraph V) :
    0 ≤ fractionalChromaticNumber G :=
  le_fractionalChromaticNumber fun w => w.total_nonneg

/-- `χ_f(G) ≤ |V|`: weight `1` on every singleton. -/
theorem fractionalChromaticNumber_le_card (G : SimpleGraph V) :
    fractionalChromaticNumber G ≤ Fintype.card V := by
  classical
  obtain ⟨w, hw⟩ := exists_fractionalColoring_of_family (G := G) (fun v : V => {v})
    (fun _ => (1 : ℝ)) (fun _ => zero_le_one) (fun v => by simp) (fun v => by simp)
  calc fractionalChromaticNumber G ≤ w.total := fractionalChromaticNumber_le_total w
    _ = Fintype.card V := by rw [hw]; simp

/-! ### The counting lower bound -/

/-- If every independent set of `G` has at most `k` vertices, then every fractional
colouring `w` has `|V| ≤ k · total w`.

This is the counting step in the paper's proof of Corollary 1.2:
`|V| ≤ ∑_I |I| w_I ≤ k ∑_I w_I`. -/
theorem FractionalColoring.card_le_mul_total {G : SimpleGraph V} (w : FractionalColoring G)
    (k : ℕ) (hk : ∀ s : Finset V, G.IsIndepSet (s : Set V) → s.card ≤ k) :
    (Fintype.card V : ℝ) ≤ k * w.total := by
  classical
  have h1 : (Fintype.card V : ℝ) ≤ ∑ v : V, ∑ s : Finset V, if v ∈ s then w.weight s else 0 := by
    calc (Fintype.card V : ℝ) = ∑ _v : V, (1 : ℝ) := by simp
      _ ≤ ∑ v : V, ∑ s : Finset V, if v ∈ s then w.weight s else 0 := by
        refine Finset.sum_le_sum fun v _ => (w.cover v).trans (le_of_eq ?_)
        rw [Finset.sum_filter]
  have h2 : ∑ v : V, ∑ s : Finset V, (if v ∈ s then w.weight s else 0)
      = ∑ s : Finset V, (s.card : ℝ) * w.weight s := by
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun s _ => ?_
    rw [← Finset.sum_filter, Finset.filter_mem_eq_inter, Finset.univ_inter, Finset.sum_const,
      nsmul_eq_mul]
  have h3 : ∑ s : Finset V, (s.card : ℝ) * w.weight s ≤ ∑ s : Finset V, (k : ℝ) * w.weight s := by
    refine Finset.sum_le_sum fun s _ => ?_
    by_cases hs : w.weight s = 0
    · simp [hs]
    · exact mul_le_mul_of_nonneg_right (by exact_mod_cast hk s (w.indep s hs)) (w.nonneg s)
  calc (Fintype.card V : ℝ) ≤ ∑ s : Finset V, (s.card : ℝ) * w.weight s := h1.trans_eq h2
    _ ≤ ∑ s : Finset V, (k : ℝ) * w.weight s := h3
    _ = k * w.total := by rw [FractionalColoring.total, Finset.mul_sum]

/-! ### Two values -/

/-- **Sanity (M0).** `χ_f(K_n) = n`. -/
theorem fractionalChromaticNumber_top (n : ℕ) :
    fractionalChromaticNumber (⊤ : SimpleGraph (Fin n)) = n := by
  apply le_antisymm
  · simpa using fractionalChromaticNumber_le_card (⊤ : SimpleGraph (Fin n))
  · refine le_fractionalChromaticNumber fun w => ?_
    have h := w.card_le_mul_total 1 fun s hs => by
      rw [Finset.card_le_one]
      intro a ha b hb
      by_contra hab
      exact hs ha hb hab ((top_adj _ _).mpr hab)
    simpa using h

/-- Every independent set of the 5-cycle has at most two vertices. -/
theorem card_le_two_of_isIndepSet_cycleGraph_five (s : Finset (Fin 5))
    (hs : (cycleGraph 5).IsIndepSet (s : Set (Fin 5))) : s.card ≤ 2 := by
  by_contra hlt
  obtain ⟨a, ha, b, hb, c, hc, hab, hac, hbc⟩ := Finset.two_lt_card.mp (not_le.mp hlt)
  have key : ∀ a b c : Fin 5, a ≠ b → a ≠ c → b ≠ c →
      (cycleGraph 5).Adj a b ∨ (cycleGraph 5).Adj a c ∨ (cycleGraph 5).Adj b c := by
    decide
  rcases key a b c hab hac hbc with h | h | h
  · exact hs ha hb hab h
  · exact hs ha hc hac h
  · exact hs hb hc hbc h

/-- **Sanity (M0).** `χ_f(C_5) = 5/2`. Upper bound: weight `1/2` on each of the five
independent sets `{i, i + 2}`; every vertex lies in exactly two of them. Lower bound: an
independent set of `C_5` has at most two vertices, so `5 ≤ 2 · total`. -/
theorem fractionalChromaticNumber_cycleGraph_five :
    fractionalChromaticNumber (cycleGraph 5) = 5 / 2 := by
  apply le_antisymm
  · have hindep : ∀ i : Fin 5, ¬ (cycleGraph 5).Adj i (i + 2) ∧ ¬ (cycleGraph 5).Adj (i + 2) i := by
      decide
    have hcount : ∀ v : Fin 5,
        (univ.filter fun i : Fin 5 => v ∈ ({i, i + 2} : Finset (Fin 5))).card = 2 := by
      decide
    obtain ⟨w, hw⟩ := exists_fractionalColoring_of_family (G := cycleGraph 5)
      (fun i : Fin 5 => ({i, i + 2} : Finset (Fin 5))) (fun _ => (1 / 2 : ℝ))
      (fun _ => by norm_num)
      (fun i => by
        intro a ha b hb hab
        simp only [Finset.coe_insert, Finset.coe_singleton, Set.mem_insert_iff,
          Set.mem_singleton_iff] at ha hb
        rcases ha with ha | ha <;> rcases hb with hb | hb
        · exact absurd (ha.trans hb.symm) hab
        · rw [ha, hb]; exact (hindep i).1
        · rw [ha, hb]; exact (hindep i).2
        · exact absurd (ha.trans hb.symm) hab)
      (fun v => by
        rw [← Finset.sum_filter, Finset.sum_const, hcount v]
        norm_num)
    calc fractionalChromaticNumber (cycleGraph 5) ≤ w.total :=
          fractionalChromaticNumber_le_total w
      _ = 5 / 2 := by rw [hw]; simp; norm_num
  · refine le_fractionalChromaticNumber fun w => ?_
    have h := w.card_le_mul_total 2 card_le_two_of_isIndepSet_cycleGraph_five
    simp only [Fintype.card_fin] at h
    norm_num at h
    linarith

/-! ### The infimum is a minimum -/

/-- The infimum defining `χ_f(G)` is attained: some fractional colouring has total weight
exactly `χ_f(G)`. So `fractionalChromaticNumber` is the paper's "minimum of `∑_I w_I`".

Proof: the weight functions of fractional colourings of total at most `|V|` form a closed
subset of the compact box `[0, |V|]^(Finset V)`, it is nonempty (unit weights on
singletons), and the total is continuous; a minimiser over this set is a minimiser over
all fractional colourings. -/
theorem exists_fractionalColoring_total_eq (G : SimpleGraph V) :
    ∃ w : FractionalColoring G, w.total = fractionalChromaticNumber G := by
  classical
  let K : Set (Finset V → ℝ) :=
    {f | (∀ s, 0 ≤ f s) ∧ (∀ s : Finset V, ¬ G.IsIndepSet (s : Set V) → f s = 0) ∧
      (∀ v, 1 ≤ ∑ s ∈ univ.filter (fun s : Finset V => v ∈ s), f s) ∧
      ∑ s, f s ≤ Fintype.card V}
  have hclosed : IsClosed K := by
    have h1 : IsClosed {f : Finset V → ℝ | ∀ s, 0 ≤ f s} := by
      simp only [Set.ofPred_forall]
      exact isClosed_iInter fun s => isClosed_le continuous_const (continuous_apply s)
    have h2 : IsClosed {f : Finset V → ℝ |
        ∀ s : Finset V, ¬ G.IsIndepSet (s : Set V) → f s = 0} := by
      simp only [Set.ofPred_forall]
      exact isClosed_iInter fun s => isClosed_iInter fun _ =>
        isClosed_eq (continuous_apply s) continuous_const
    have h3 : IsClosed {f : Finset V → ℝ |
        ∀ v, 1 ≤ ∑ s ∈ univ.filter (fun s : Finset V => v ∈ s), f s} := by
      simp only [Set.ofPred_forall]
      exact isClosed_iInter fun v => isClosed_le continuous_const
        (continuous_finsetSum _ fun s _ => continuous_apply s)
    have h4 : IsClosed {f : Finset V → ℝ | ∑ s, f s ≤ Fintype.card V} :=
      isClosed_le (continuous_finsetSum _ fun s _ => continuous_apply s) continuous_const
    exact h1.inter (h2.inter (h3.inter h4))
  have hsub : K ⊆ Set.pi Set.univ fun _ : Finset V => Set.Icc (0 : ℝ) (Fintype.card V) := by
    intro f hf s _
    exact ⟨hf.1 s,
      (Finset.single_le_sum (fun t _ => hf.1 t) (Finset.mem_univ s)).trans hf.2.2.2⟩
  have hcompact : IsCompact K :=
    (isCompact_univ_pi fun _ => isCompact_Icc).of_isClosed_subset hclosed hsub
  have hmem : ∀ w : FractionalColoring G, w.total ≤ Fintype.card V → w.weight ∈ K :=
    fun w hw => ⟨w.nonneg, fun s hs => by_contra fun h => hs (w.indep s h), w.cover, hw⟩
  obtain ⟨w₁, hw₁⟩ := exists_fractionalColoring_of_family (G := G) (fun v : V => {v})
    (fun _ => (1 : ℝ)) (fun _ => zero_le_one) (fun v => by simp) (fun v => by simp)
  have hne : K.Nonempty := ⟨w₁.weight, hmem w₁ (by rw [hw₁]; simp)⟩
  obtain ⟨f₀, hf₀, hmin⟩ := hcompact.exists_isMinOn hne
    (continuous_finsetSum _ fun s _ => continuous_apply s).continuousOn
  let w₀ : FractionalColoring G :=
    ⟨f₀, hf₀.1, fun s hs => by_contra fun h => hs (hf₀.2.1 s h), hf₀.2.2.1⟩
  refine ⟨w₀, le_antisymm (le_fractionalChromaticNumber fun w => ?_)
    (fractionalChromaticNumber_le_total w₀)⟩
  by_cases hw : w.total ≤ Fintype.card V
  · exact isMinOn_iff.mp hmin _ (hmem w hw)
  · exact hf₀.2.2.2.trans (le_of_lt (not_le.mp hw))

end Hadwiger
