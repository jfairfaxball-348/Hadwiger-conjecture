module

public import Mathlib

@[expose] public section

/-!
# Relative entropy on a finite type

Paper, Section 3.1: "Relative entropy is taken with natural logarithms:
`D(ρ‖q) = ∑_x ρ(x) log(ρ(x)/q(x))`. Here `q` is a strictly positive probability measure and
`0 log 0 = 0`."

The definition here is **new**. Mathlib has `InformationTheory.klDiv`, the Kullback–Leibler
divergence of two measures, with values in `ℝ≥0∞`; why it is not used is in
`blueprint/FIDELITY.md` (F-KL).

Blueprint entry: `D-3.KL`. Milestone M4, first slice.
-/

namespace Hadwiger

variable {α : Type*}

/-- **Relative entropy** `D(ρ‖q) = ∑_x ρ(x) log(ρ(x)/q(x))`, with the natural logarithm
(`Real.log`), for real weight functions on a finite type.

Junk values, and what they mean for fidelity:

* `0 log 0 = 0` is the paper's convention and holds here: where `ρ x = 0` the term is
  `0 * Real.log 0 = 0`.
* The paper takes `q` strictly positive. Where `q x = 0` and `ρ x > 0` the honest value of
  the term is `+∞`; here it is `ρ x * Real.log (ρ x / 0) = ρ x * Real.log 0 = 0`, a junk
  value. So `relEntropy ρ q` is the paper's `D(ρ‖q)` only when `q x > 0` wherever
  `ρ x > 0`. Every statement that uses it must make sure of that, by a hypothesis or by a
  proof. -/
noncomputable def relEntropy [Fintype α] (ρ q : α → ℝ) : ℝ :=
  ∑ x, ρ x * Real.log (ρ x / q x)

end Hadwiger
