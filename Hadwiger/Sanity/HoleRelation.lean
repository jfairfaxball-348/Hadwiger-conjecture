module

public import Hadwiger.HoleRelation

@[expose] public section

/-!
# Sanity check for the hole relation (not in the paper)

Nothing in this file is a statement of the paper. It holds one lemma, which pins the
definition `Hadwiger.HoleData.Hole` of `Hadwiger/HoleRelation.lean` from below: the hole
relation can hold (`exists_holeData_hole`). Lemma 2.2 pins it from above: it has no loops
and no triangles.

Why it matters. If no `HoleData` had a hole, every graph on positions would be complete,
and Lemma 2.2 and equation (2.2) would be true and empty.

Added at milestone M3 on the user's decision of 2026-10-07 (question Q4 of
`blueprint/M0_REVIEW_SHEET.md`). Blueprint entry: `S-M3.hole-nonvacuous`, in the section
"Sanity checks (not in the paper)".
-/

namespace Hadwiger

/-- **Sanity (M3).** The hole relation is not vacuous: there is linear data, with `X` and
`V` both `F_2^2` and `Ω` a set of two elements, in which the two elements have a hole
between them.

The data is the hand example of `blueprint/M0_REVIEW_SHEET.md`, item R-10, unchanged. With
coordinates `x = (x_1, x_2)` (in Lean `x 0`, `x 1`):

* `a(x) = x_1` and `T = 0`, so `r(x) = a` for every `x`;
* `U_0` is the identity and `U_1` swaps the two coordinates;
* `u_0(y) = y_2` and `u_1(y) = y_1`.

The witnesses are `λ_0 = (1, 0)` and `λ_1 = (0, 1)`. Then `U_0 λ_0 = (1, 0) = U_1 λ_1`;
`u_1 U_0 = a = r(λ_0)`; `u_0 U_1 = a = r(λ_1)`; and `a(λ_0) + a(λ_1) = 1 + 0 = 1`.

`X` and `V` are finite-dimensional and `Ω` is finite, so the example also lies in the
class of the paper, which assumes both (`blueprint/FIDELITY.md`, F-HOLE). -/
theorem exists_holeData_hole :
    ∃ D : HoleData (Fin 2 → ZMod 2) (Fin 2 → ZMod 2) (Fin 2), D.Hole 0 1 := by
  refine ⟨{ a := LinearMap.proj 0
            T := 0
            T_symm := fun _ _ => rfl
            U := ![LinearMap.id, LinearMap.funLeft (ZMod 2) (ZMod 2) (Equiv.swap 0 1)]
            U_injective := ?_
            u := ![LinearMap.proj 1, LinearMap.proj 0] },
          ![1, 0], ![0, 1], ?_, ?_, ?_, ?_⟩
  · -- both `U_i` are injective
    intro i
    fin_cases i
    · exact Function.injective_id
    · exact LinearMap.funLeft_injective_of_surjective _ _ _ (Equiv.surjective _)
  · -- `U_0 λ_0 = U_1 λ_1`
    ext k
    fin_cases k <;> simp [LinearMap.funLeft_apply]
  · -- `u_1 U_0 = r(λ_0)`
    refine LinearMap.ext fun x => ?_
    simp [HoleData.r]
  · -- `u_0 U_1 = r(λ_1)`
    refine LinearMap.ext fun x => ?_
    simp [HoleData.r, LinearMap.funLeft_apply]
  · -- `a(λ_0) + a(λ_1) = 1`
    simp

end Hadwiger
