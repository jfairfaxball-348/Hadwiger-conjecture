import Hadwiger.ChromaticBounds

/-!
# The hole relation and its triangle-freeness (Section 2.1)

Paper, Section 2.1 (`sec:geometry`, "A triangle-free relation"):

"Let `X` and `V` be finite-dimensional vector spaces over `F_2`. Fix a linear functional
`a ∈ X*` and a symmetric bilinear form `T` on `X`, and write `r(x) = a + T(x, ·) ∈ X*`.
Let `Ω` be a finite set. For each `i ∈ Ω`, suppose we have an injective linear map
`U_i : X → V` and a linear functional `u_i ∈ V*`."

Definition 2.1 (`def:hole`), Lemma 2.2 (`lem:hole-triangle-free`) and the graph on
positions with equation (2.3) (`eq:sample-independence`).

This file is the abstract part of Section 2 only. The concrete construction of
`X, a, T, V, U_o, u_o` (Sections 2.2 to 2.4) is not stated yet.

Blueprint entries: `D-2.0`, `D-2.1`, `L-2.2`, `D-2.G`, `S-2.3`. Milestone M3.
Fidelity notes are in `blueprint/FIDELITY.md` (F-HOLE, F-POSGRAPH).

Lemma 2.2 and both halves of equation (2.3) are proved here, by the paper's proofs
(milestone M3). That the hole relation can hold at all is checked separately, in
`Hadwiger/Sanity/HoleRelation.lean`; that check is not a statement of the paper.

Everything here is **new**; only Mathlib's linear algebra and `SimpleGraph` are used, and,
for the second half of equation (2.3), the colour-class bound `S-1.a` of
`Hadwiger/ChromaticBounds.lean`.
-/

namespace Hadwiger

/-- The linear data of Section 2.1: vector spaces `X`, `V` over `F_2 = ZMod 2`, a functional
`a` on `X`, a symmetric bilinear form `T` on `X`, and for each `i : Ω` an injective linear
map `U i : X → V` and a functional `u i` on `V`.

The paper assumes `X`, `V` finite-dimensional and `Ω` finite. Those hypotheses are not part
of this structure: Definition 2.1 and Lemma 2.2 do not mention them. Statements that need
finiteness will assume it explicitly. -/
structure HoleData (X V Ω : Type*) [AddCommGroup X] [Module (ZMod 2) X]
    [AddCommGroup V] [Module (ZMod 2) V] where
  /-- The linear functional `a ∈ X*`. -/
  a : X →ₗ[ZMod 2] ZMod 2
  /-- The bilinear form `T` on `X`. -/
  T : X →ₗ[ZMod 2] X →ₗ[ZMod 2] ZMod 2
  /-- `T` is symmetric. -/
  T_symm : ∀ x y, T x y = T y x
  /-- The linear maps `U_i : X → V`. -/
  U : Ω → X →ₗ[ZMod 2] V
  /-- Each `U_i` is injective. -/
  U_injective : ∀ i, Function.Injective (U i)
  /-- The linear functionals `u_i ∈ V*`. -/
  u : Ω → V →ₗ[ZMod 2] ZMod 2

namespace HoleData

variable {X V Ω : Type*} [AddCommGroup X] [Module (ZMod 2) X]
  [AddCommGroup V] [Module (ZMod 2) V]

/-- The affine-gradient map `r(x) = a + T(x, ·) ∈ X*`. -/
def r (D : HoleData X V Ω) (x : X) : X →ₗ[ZMod 2] ZMod 2 :=
  D.a + D.T x

/-- **Definition 2.1.** Elements `i, j` have a *hole* between them if there are
`λ_i, λ_j ∈ X` with

`U_i λ_i = U_j λ_j`,  `u_j ∘ U_i = r(λ_i)`,  `u_i ∘ U_j = r(λ_j)`,  `a(λ_i) + a(λ_j) = 1`.

The middle two are identities of linear functionals on all of `X`. -/
def Hole (D : HoleData X V Ω) (i j : Ω) : Prop :=
  ∃ li lj : X,
    D.U i li = D.U j lj ∧
    (D.u j).comp (D.U i) = D.r li ∧
    (D.u i).comp (D.U j) = D.r lj ∧
    D.a li + D.a lj = 1

/-- **Lemma 2.2, symmetry.** The hole relation is symmetric: interchange the endpoints. -/
theorem Hole.symm {D : HoleData X V Ω} {i j : Ω} (h : D.Hole i j) : D.Hole j i := by
  obtain ⟨li, lj, h1, h2, h3, h4⟩ := h
  exact ⟨lj, li, h1.symm, h3, h2, by rw [add_comm]; exact h4⟩

/-- **Lemma 2.2, no loops.** No element has a hole to itself.

Proof, the paper's: "A loop would have `U_i λ_i = U_i λ_j`, hence `λ_i = λ_j` by
injectivity, contradicting the last equation": `a(λ_i) + a(λ_i) = 0` in `F_2`. -/
theorem not_hole_self (D : HoleData X V Ω) (i : Ω) : ¬ D.Hole i i := by
  rintro ⟨li, lj, hU, -, -, ha⟩
  have hl : li = lj := D.U_injective i hU
  rw [hl, CharTwo.add_self_eq_zero] at ha
  exact zero_ne_one ha

/-- **Lemma 2.2, triangle-freeness.** No three elements have holes on all three pairs.
The paper says "three distinct elements"; distinctness is not assumed here, because a
repeated element would already need a loop.

Proof, the paper's six-term sum. Write `x_{pq}` for the witness at `p` of the hole on
`{p, q}`. For each of the six orderings `(p, q, s)` of the three elements, evaluate the
functional identity of the directed incidence `pq` on `x_{ps}`:
`u_q(U_p x_{ps}) = a(x_{ps}) + T(x_{pq}, x_{ps})`. Add the six equations. On the left, for
fixed `q` the two arguments `U_p x_{ps}` and `U_s x_{sp}` are equal by the sharing equation
of the remaining edge, so the two terms cancel. On the right, for fixed `p` the two bilinear
terms cancel by the symmetry of `T`. What remains is `0 = 1 + 1 + 1` in `F_2`.

The computation uses neither that the three elements are distinct nor that the `U_i` are
injective, so it proves the statement as given here directly; the remark above about loops
is not needed for it. -/
theorem not_hole_triangle (D : HoleData X V Ω) {i j k : Ω}
    (hij : D.Hole i j) (hjk : D.Hole j k) (hik : D.Hole i k) : False := by
  -- `xij` is the witness at `i` of the hole on `{i, j}`; `sij` is its sharing equation,
  -- `fij` the functional identity `u_j U_i = r(x_{ij})`, `aij` the parity equation.
  obtain ⟨xij, xji, sij, fij, fji, aij⟩ := hij
  obtain ⟨xjk, xkj, sjk, fjk, fkj, ajk⟩ := hjk
  obtain ⟨xik, xki, sik, fik, fki, aik⟩ := hik
  -- "evaluate the functional identity for `ij` on `x_{ik}`": the six ordered choices.
  have e1 : D.u j (D.U i xik) = D.a xik + D.T xij xik := LinearMap.congr_fun fij xik
  have e2 : D.u j (D.U k xki) = D.a xki + D.T xkj xki := LinearMap.congr_fun fkj xki
  have e3 : D.u k (D.U i xij) = D.a xij + D.T xik xij := LinearMap.congr_fun fik xij
  have e4 : D.u k (D.U j xji) = D.a xji + D.T xjk xji := LinearMap.congr_fun fjk xji
  have e5 : D.u i (D.U j xjk) = D.a xjk + D.T xji xjk := LinearMap.congr_fun fji xjk
  have e6 : D.u i (D.U k xkj) = D.a xkj + D.T xki xkj := LinearMap.congr_fun fki xkj
  -- "Sum over the six ordered choices."
  have hsum :
      (D.u j (D.U i xik) + D.u j (D.U k xki)) + (D.u k (D.U i xij) + D.u k (D.U j xji))
          + (D.u i (D.U j xjk) + D.u i (D.U k xkj))
        = ((D.a xij + D.a xji) + (D.a xjk + D.a xkj) + (D.a xik + D.a xki))
          + ((D.T xij xik + D.T xik xij) + (D.T xkj xki + D.T xki xkj)
            + (D.T xjk xji + D.T xji xjk)) := by
    rw [e1, e2, e3, e4, e5, e6]
    ring
  -- "For fixed `j`, the two arguments on the left are equal by the sharing equation for
  -- the remaining edge `ik`, so they cancel."
  have hleft :
      (D.u j (D.U i xik) + D.u j (D.U k xki)) + (D.u k (D.U i xij) + D.u k (D.U j xji))
          + (D.u i (D.U j xjk) + D.u i (D.U k xkj)) = 0 := by
    rw [sik, sij, sjk]
    simp only [CharTwo.add_self_eq_zero]
  -- "For fixed `i`, the two bilinear terms cancel by symmetry of `T`."
  have hbil :
      (D.T xij xik + D.T xik xij) + (D.T xkj xki + D.T xki xkj)
          + (D.T xjk xji + D.T xji xjk) = 0 := by
    rw [D.T_symm xik xij, D.T_symm xki xkj, D.T_symm xji xjk]
    simp only [CharTwo.add_self_eq_zero]
  -- "The remaining sum is `1 + 1 + 1 = 1`, a contradiction."
  rw [hleft, hbil, aij, ajk, aik] at hsum
  exact absurd hsum (by decide)

/-- **The graph on positions** (Section 2.1, after Lemma 2.2). Given a list
`o_1, …, o_m` of elements of `Ω`, two distinct positions are adjacent when their elements
have no hole between them. Elements may repeat. -/
def positionGraph (D : HoleData X V Ω) {m : ℕ} (o : Fin m → Ω) : SimpleGraph (Fin m) where
  Adj p q := p ≠ q ∧ ¬ D.Hole (o p) (o q)
  symm := ⟨fun _ _ h => ⟨h.1.symm, fun h' => h.2 h'.symm⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

/-- **Equation (2.3), first half.** The graph on positions has independence number at most
two: an independent triple of positions would give a hole triangle.

The paper first observes that the three elements are distinct ("Equal elements are adjacent
because holes have no loops"), because its Lemma 2.2 speaks of three distinct elements.
`not_hole_triangle` has no distinctness hypothesis, so that step is not needed here and
`not_hole_self` is not used in this proof. -/
theorem indepNum_positionGraph_le_two (D : HoleData X V Ω) {m : ℕ} (o : Fin m → Ω) :
    (D.positionGraph o).indepNum ≤ 2 := by
  -- An independent set with `α(G)` positions exists. Suppose it had more than two.
  obtain ⟨s, hs⟩ := (D.positionGraph o).exists_isNIndepSet_indepNum
  by_contra hlt
  have h3 : 2 < s.card := by
    rw [hs.card_eq]
    exact not_le.mp hlt
  obtain ⟨p, hp, q, hq, t, ht, hpq, hpt, hqt⟩ := Finset.two_lt_card.mp h3
  -- Two distinct positions of `s` are not adjacent, so their elements have a hole.
  have hole : ∀ {x y : Fin m}, x ∈ s → y ∈ s → x ≠ y → D.Hole (o x) (o y) := by
    intro x y hx hy hxy
    by_contra hno
    exact hs.isIndepSet hx hy hxy ⟨hxy, hno⟩
  -- "An independent triple of positions would therefore give … a hole triangle."
  exact D.not_hole_triangle (hole hp hq hpq) (hole hq ht hqt) (hole hp ht hpt)

/-- **Equation (2.3), second half.** The graph on `m` positions has `χ(G) ≥ ⌈m/2⌉`.

The chromatic number is Mathlib's `chromaticNumber : ℕ∞`; the statement exhibits it as a
natural number `k`. For a natural number `k`, `k ≥ ⌈m/2⌉` is the same as `m ≤ 2k`, and that
form is used, so that no division or ceiling appears.

Stated on the user's decision of 2026-10-07 (question Q5 of the M0 review sheet). The proof
is the paper's: the first half of equation (2.3) and the colour-class bound of Section 1
(`card_le_indepNum_mul_of_colorable`). The colour-class bound was proved at milestone M1
and the first half of equation (2.3) at milestone M3, so this theorem rests on nothing
unproved. -/
theorem le_two_mul_chromaticNumber_positionGraph (D : HoleData X V Ω) {m : ℕ}
    (o : Fin m → Ω) :
    ∃ k : ℕ, (D.positionGraph o).chromaticNumber = k ∧ m ≤ 2 * k := by
  have hne : (D.positionGraph o).chromaticNumber ≠ ⊤ :=
    ne_top_of_le_ne_top (ENat.natCast_ne_top _) (D.positionGraph o).chromaticNumber_le_card
  obtain ⟨k, hk⟩ := ENat.ne_top_iff_exists.mp hne
  refine ⟨k, hk.symm, ?_⟩
  have hcol : (D.positionGraph o).Colorable k :=
    SimpleGraph.chromaticNumber_le_iff_colorable.mp hk.symm.le
  have h1 := card_le_indepNum_mul_of_colorable (D.positionGraph o) hcol
  rw [Fintype.card_fin] at h1
  exact h1.trans (Nat.mul_le_mul_right k (D.indepNum_positionGraph_le_two o))

end HoleData

end Hadwiger
