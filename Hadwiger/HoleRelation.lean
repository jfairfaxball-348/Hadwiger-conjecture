import Mathlib

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

Everything here is **new**; only Mathlib's linear algebra and `SimpleGraph` are used.
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

/-- **Lemma 2.2, no loops.** No element has a hole to itself. -/
theorem not_hole_self (D : HoleData X V Ω) (i : Ω) : ¬ D.Hole i i := by
  sorry

/-- **Lemma 2.2, triangle-freeness.** No three elements have holes on all three pairs.
The paper says "three distinct elements"; distinctness is not assumed here, because a
repeated element would already need a loop. -/
theorem not_hole_triangle (D : HoleData X V Ω) {i j k : Ω}
    (hij : D.Hole i j) (hjk : D.Hole j k) (hik : D.Hole i k) : False := by
  sorry

/-- **The graph on positions** (Section 2.1, after Lemma 2.2). Given a list
`o_1, …, o_m` of elements of `Ω`, two distinct positions are adjacent when their elements
have no hole between them. Elements may repeat. -/
def positionGraph (D : HoleData X V Ω) {m : ℕ} (o : Fin m → Ω) : SimpleGraph (Fin m) where
  Adj p q := p ≠ q ∧ ¬ D.Hole (o p) (o q)
  symm := ⟨fun _ _ h => ⟨h.1.symm, fun h' => h.2 h'.symm⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

/-- **Equation (2.3), first half.** The graph on positions has independence number at most
two: an independent triple of positions would give a hole triangle. -/
theorem indepNum_positionGraph_le_two (D : HoleData X V Ω) {m : ℕ} (o : Fin m → Ω) :
    (D.positionGraph o).indepNum ≤ 2 := by
  sorry

end HoleData

end Hadwiger
