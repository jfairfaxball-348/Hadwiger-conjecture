import Hadwiger.Defs.RelEntropy

/-!
# Sanity checks for relative entropy (not in the paper)

Nothing in this file is a statement of the paper. It pins the definition
`Hadwiger.relEntropy` of `Hadwiger/Defs/RelEntropy.lean`:

* `D(ρ‖ρ) = 0`;
* `D(δ_a‖q) = −log q(a)` for the point mass `δ_a`: points where the first argument is `0`
  contribute nothing (`0 log 0 = 0`), and the sign and the order of the two arguments are
  the paper's;
* in particular `D(δ_a‖uniform) = log n` on a type with `n` elements.

Not here: that relative entropy is nonnegative. The paper proves it inside the proof of
Lemma 3.2 ("For completeness, …"), so it belongs to the slice that proves that lemma.
Also not here: agreement with Mathlib's `InformationTheory.klDiv`; see blueprint entry
`S-M4.kl-mathlib`.

Added at milestone M4, first slice. Blueprint entry: `S-M4.kl`.
-/

namespace Hadwiger

variable {α : Type*} [Fintype α]

/-- **Sanity (M4).** `D(ρ‖ρ) = 0`, for any weight function `ρ`. -/
theorem relEntropy_self (ρ : α → ℝ) : relEntropy ρ ρ = 0 := by
  unfold relEntropy
  refine Finset.sum_eq_zero fun x _ => ?_
  by_cases h : ρ x = 0
  · simp [h]
  · simp [div_self h]

/-- **Sanity (M4).** The relative entropy of the point mass at `a` against `q` is
`−log q(a)`: only the point `a` contributes.

When `q a = 0` both sides are the junk value `0`; the honest value is `+∞`. The identity is
about the paper's `D` when `q a > 0`. -/
theorem relEntropy_single [DecidableEq α] (a : α) (q : α → ℝ) :
    relEntropy (Pi.single a 1) q = -Real.log (q a) := by
  unfold relEntropy
  rw [Finset.sum_eq_single a]
  · simp [Real.log_inv]
  · intro b _ hb
    simp [Pi.single_eq_of_ne hb]
  · intro h
    exact absurd (Finset.mem_univ a) h

/-- **Sanity (M4).** The relative entropy of a point mass against the uniform law on a type
with `n` elements is `log n`. -/
theorem relEntropy_single_uniform [DecidableEq α] (a : α) :
    relEntropy (Pi.single a 1) (fun _ : α => (Fintype.card α : ℝ)⁻¹)
      = Real.log (Fintype.card α) := by
  rw [relEntropy_single, Real.log_inv, neg_neg]

end Hadwiger
