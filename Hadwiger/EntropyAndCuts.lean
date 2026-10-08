import Hadwiger.Defs.Law
import Hadwiger.Defs.RelEntropy
import Hadwiger.Sanity.Law
import Hadwiger.Sanity.RelEntropy

/-!
# Entropy minimizers and terminal cuts (Section 3.1)

Paper, Section 3.1 ("Entropy minimizers and terminal cuts"): Lemma 3.2
(`lem:entropy-support`), the information-projection lemma, and Lemma 3.3
(`lem:terminal-cut`), the max-flow/min-cut lemma for the three caps of equation (3.1).

Both statements were written in the first slice of milestone M4 and signed off by the user on
2026-10-08 (`blueprint/M4_REVIEW_SHEET.md`, items R-30 and R-31).

**Lemma 3.2 is proved** (milestone M4, second slice): its three assertions, by the paper's
proof, with the statements unchanged. The sentences of that proof are separate lemmas: seven
in this file, under "Steps of the paper's proof of Lemma 3.2", and eight general ones about
laws and relative entropy in `Hadwiger/Sanity/Law.lean` and `Hadwiger/Sanity/RelEntropy.lean`,
which this file imports. Blueprint entries `S-L3.2.*`.

**Lemma 3.3 is stated here and not proved**: its proof is `sorry`. It is the third slice.

Lemma 3.3 is stated in the abstract setting: any finite type with a law, in place of the
paper's `Ω_n` with `μ_n`, and real numbers `M`, `B` in place of `M = 2^1000` and `2^{DN}`.

Blueprint entries: `L-3.2`, `L-3.3`. Fidelity notes: `blueprint/FIDELITY.md`, L-3.2 and
L-3.3.
-/

namespace Hadwiger

section EntropySupport

variable {α : Type*} [Fintype α]

/-! ### Steps of the paper's proof of Lemma 3.2

The paper's proof moves from the minimiser `ρ` toward a feasible `ρ'` along the segment
`(1 − t)ρ + tρ'`, `0 ≤ t ≤ 1`, and looks at the entropy `D((1 − t)ρ + tρ'‖q)` near `t = 0`.
At a point `x` the entropy has the term

`((1 − t) ρ(x) + t ρ'(x)) log(((1 − t) ρ(x) + t ρ'(x)) / q(x))`.

The lemmas below are about this term, with `a = ρ(x)`, `b = ρ'(x)`, `c = q(x)`, and about the
sum of the terms. "Right derivative at zero" is rendered by the difference quotient
`t⁻¹ (f(t) − f(0))` as `t → 0+`, which is its definition. They are not statements of the
paper; each is a sentence of its proof. Blueprint entries `S-L3.2.segment`,
`S-L3.2.old-points`, `S-L3.2.new-points`, `S-L3.2.support`, `S-L3.2.first-order`. -/

section Steps

open Filter Topology

/-- **Step (Lemma 3.2).** The segment from the minimiser stays in `P`, so the entropy on it is
nowhere below its value at the minimiser: `D(ρ‖q) ≤ D((1 − t)ρ + tρ'‖q)` for `0 < t ≤ 1`.

Paper: "the entropy along `(1 − t)ρ + tρ'`"; "This contradicts minimality". This is the one
place where convexity of `P` is used. -/
theorem relEntropy_le_relEntropy_segment {P : Set (α → ℝ)} (hconv : Convex ℝ P)
    {q ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q)
    {ρ' : α → ℝ} (hρ' : ρ' ∈ P) (t : ℝ) (ht : 0 < t) (ht1 : t ≤ 1) :
    relEntropy ρ q ≤ relEntropy ((1 - t) • ρ + t • ρ') q :=
  hmin _ (hconv hρ hρ' (sub_nonneg.mpr ht1) ht.le (sub_add_cancel 1 t))

/-- **Step (Lemma 3.2).** If the entropy at the point `t > 0` of the segment is at least the
entropy at `ρ`, the difference quotient at zero, written as a sum over the points, is
nonnegative.

The sum is `t⁻¹ (D((1 − t)ρ + tρ'‖q) − D(ρ‖q))`, term by term. No hypothesis on `ρ`, `ρ'`,
`q` is needed for this. -/
theorem sum_slope_segment_nonneg {ρ ρ' q : α → ℝ} {t : ℝ} (ht : 0 < t)
    (hmin : relEntropy ρ q ≤ relEntropy ((1 - t) • ρ + t • ρ') q) :
    0 ≤ ∑ x, t⁻¹ * (((1 - t) * ρ x + t * ρ' x)
        * Real.log (((1 - t) * ρ x + t * ρ' x) / q x) - ρ x * Real.log (ρ x / q x)) := by
  have h : ∑ x, t⁻¹ * (((1 - t) * ρ x + t * ρ' x)
        * Real.log (((1 - t) * ρ x + t * ρ' x) / q x) - ρ x * Real.log (ρ x / q x))
      = t⁻¹ * (relEntropy ((1 - t) • ρ + t • ρ') q - relEntropy ρ q) := by
    rw [relEntropy, relEntropy, ← Finset.sum_sub_distrib, Finset.mul_sum]
    rfl
  rw [h]
  exact mul_nonneg (inv_nonneg.mpr ht.le) (sub_nonneg.mpr hmin)

/-- **Step (Lemma 3.2).** "At all points where `ρ > 0`, its derivative is finite." At a point
with `a = ρ(x) > 0` and `c = q(x) > 0`, the term of the entropy along the segment has
derivative `(b − a)(log(a/c) + 1)` at `t = 0`, where `b = ρ'(x)` is any real number.

This is Mathlib's two-sided derivative: the term is defined for every real `t`, and near
`t = 0` its argument `(1 − t)a + tb` is positive, so no junk value of `Real.log` is involved
in the derivative. -/
theorem hasDerivAt_segment_mul_log {a b c : ℝ} (ha : 0 < a) (hc : 0 < c) :
    HasDerivAt (fun t : ℝ => ((1 - t) * a + t * b) * Real.log (((1 - t) * a + t * b) / c))
      ((b - a) * (Real.log (a / c) + 1)) 0 := by
  have h1 : HasDerivAt (fun t : ℝ => (1 - t) * a + t * b) (b - a) 0 := by
    have h := (((hasDerivAt_id' (0 : ℝ)).const_sub 1).mul_const a).add
      ((hasDerivAt_id' (0 : ℝ)).mul_const b)
    convert h using 1
    ring
  have h0 : (1 - (0 : ℝ)) * a + 0 * b = a := by ring
  have h2 := (h1.div_const c).log (by rw [h0]; exact (div_pos ha hc).ne')
  have h3 := h1.mul h2
  convert h3 using 1
  rw [h0]
  field_simp

/-- **Step (Lemma 3.2).** The same as `hasDerivAt_segment_mul_log`, in the form used below: at
a point with `ρ(x) > 0` the difference quotient of the term tends to the finite number
`(b − a)(log(a/c) + 1)` as `t → 0+`. -/
theorem tendsto_slope_segment_mul_log {a b c : ℝ} (ha : 0 < a) (hc : 0 < c) :
    Tendsto (fun t : ℝ => t⁻¹ * (((1 - t) * a + t * b)
        * Real.log (((1 - t) * a + t * b) / c) - a * Real.log (a / c)))
      (𝓝[>] 0) (𝓝 ((b - a) * (Real.log (a / c) + 1))) := by
  have h := (hasDerivAt_segment_mul_log (b := b) ha hc).tendsto_slope_zero_right
  simpa using h

/-- **Step (Lemma 3.2).** "The newly occupied points": at a point with `ρ(x) = 0` the term of
the entropy along the segment is `t b log(t b/c)`, and its difference quotient at zero is
exactly `b log(b/c) + b log t` for `t > 0`. When `b = ρ'(x) > 0` this tends to `−∞` as
`t → 0+`, which is the paper's "right derivative `−∞` at zero from the newly occupied points".

Junk values. The term at `t = 0` is `0 * Real.log (0 / c) = 0`, the paper's `0 log 0 = 0`. For
`b = 0` both sides are `0`. For `b > 0` every logarithm has a positive argument. -/
theorem slope_segment_mul_log_of_eq_zero {b c t : ℝ} (hb : 0 ≤ b) (hc : 0 < c) (ht : 0 < t) :
    t⁻¹ * (((1 - t) * 0 + t * b) * Real.log (((1 - t) * 0 + t * b) / c)
        - 0 * Real.log (0 / c))
      = b * Real.log (b / c) + b * Real.log t := by
  rw [mul_zero, zero_add, zero_mul, sub_zero]
  rcases hb.eq_or_lt with rfl | hb
  · simp
  · rw [mul_div_assoc, Real.log_mul ht.ne' (div_pos hb hc).ne']
    field_simp
    ring

/-- **Step (Lemma 3.2), the support assertion.** If the entropy on the segment from `ρ` toward
`ρ'` is nowhere below its value at `ρ`, then `ρ'` vanishes wherever `ρ` does.

Paper: "If `ρ(x) = 0 < ρ'(x)` at a feasible support point, the entropy along `(1 − t)ρ + tρ'`
has right derivative `−∞` at zero from the newly occupied points. At all points where
`ρ > 0`, its derivative is finite. This contradicts minimality, proving the support
assertion."

Proof, as in the paper. Suppose `ρ x₀ = 0 < ρ' x₀`. Split the difference quotient of the
entropy at zero over the points. The points with `ρ > 0` contribute a sum that has a finite
limit as `t → 0+` (`tendsto_slope_segment_mul_log`). The points with `ρ = 0` contribute
`∑ ρ' log(ρ'/q) + (∑ ρ') log t` (`slope_segment_mul_log_of_eq_zero`), where the sums are over
those points and `∑ ρ' ≥ ρ' x₀ > 0`; this tends to `−∞`. So the difference quotient is
negative for some `t ∈ (0, 1]`, against `sum_slope_segment_nonneg`.

The weights need only be nonnegative; that they add up to `1` is not used. -/
theorem eq_zero_of_relEntropy_segment_min {ρ ρ' q : α → ℝ} (hρ : ∀ x, 0 ≤ ρ x)
    (hρ' : ∀ x, 0 ≤ ρ' x) (hq : ∀ x, 0 < q x)
    (hmin : ∀ t : ℝ, 0 < t → t ≤ 1 →
      relEntropy ρ q ≤ relEntropy ((1 - t) • ρ + t • ρ') q)
    {x₀ : α} (hx₀ : ρ x₀ = 0) : ρ' x₀ = 0 := by
  classical
  by_contra hne
  have hpos : 0 < ρ' x₀ := lt_of_le_of_ne (hρ' x₀) (Ne.symm hne)
  -- the points where `ρ > 0`: the sum of their difference quotients has a finite limit
  have hold : Tendsto (fun t : ℝ => ∑ x with ¬ ρ x = 0,
        t⁻¹ * (((1 - t) * ρ x + t * ρ' x)
          * Real.log (((1 - t) * ρ x + t * ρ' x) / q x) - ρ x * Real.log (ρ x / q x)))
      (𝓝[>] 0)
      (𝓝 (∑ x with ¬ ρ x = 0, (ρ' x - ρ x) * (Real.log (ρ x / q x) + 1))) := by
    refine tendsto_finsetSum _ fun x hx => ?_
    have hx' : 0 < ρ x := lt_of_le_of_ne (hρ x) (Ne.symm (Finset.mem_filter.mp hx).2)
    exact tendsto_slope_segment_mul_log hx' (hq x)
  -- the newly occupied points: the sum of their difference quotients tends to `-∞`
  have hm : 0 < ∑ x with ρ x = 0, ρ' x :=
    Finset.sum_pos' (fun x _ => hρ' x)
      ⟨x₀, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hx₀⟩, hpos⟩
  have hnew : Tendsto (fun t : ℝ => (∑ x with ρ x = 0, ρ' x * Real.log (ρ' x / q x))
        + (∑ x with ρ x = 0, ρ' x) * Real.log t) (𝓝[>] 0) atBot :=
    tendsto_const_nhds.add_atBot (Real.tendsto_log_nhdsGT_zero.const_mul_atBot hm)
  have htot := hold.add_atBot hnew
  -- so the difference quotient of the entropy is negative for some `t ∈ (0, 1]`
  obtain ⟨t, hlt, ht⟩ := ((htot.eventually (eventually_lt_atBot 0)).and
    (Ioc_mem_nhdsGT (zero_lt_one' ℝ))).exists
  -- but it is nonnegative there, by minimality
  have hge := sum_slope_segment_nonneg ht.1 (hmin t ht.1 ht.2)
  rw [← Finset.sum_filter_add_sum_filter_not Finset.univ (fun x => ρ x = 0)] at hge
  have hN : ∑ x with ρ x = 0, t⁻¹ * (((1 - t) * ρ x + t * ρ' x)
        * Real.log (((1 - t) * ρ x + t * ρ' x) / q x) - ρ x * Real.log (ρ x / q x))
      = (∑ x with ρ x = 0, ρ' x * Real.log (ρ' x / q x))
        + (∑ x with ρ x = 0, ρ' x) * Real.log t := by
    rw [Finset.sum_mul, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun x hx => ?_
    rw [(Finset.mem_filter.mp hx).2]
    exact slope_segment_mul_log_of_eq_zero (hρ' x) (hq x) ht.1
  rw [hN] at hge
  linarith

/-- **Step (Lemma 3.2), the first-order condition.** For laws `ρ`, `ρ'` such that `ρ'` vanishes
wherever `ρ` does: if the entropy on the segment from `ρ` toward `ρ'` is nowhere below its
value at `ρ`, then `∑_x (ρ'(x) − ρ(x)) log(ρ(x)/q(x)) ≥ 0`.

Paper: "We can therefore differentiate toward any feasible `ρ'` using only points where
`ρ > 0`. The right derivative at the minimizer is nonnegative, giving
`∑_x (ρ'(x) − ρ(x)) log(ρ(x)/q(x)) ≥ 0`, where the constant derivative term cancels because
both measures have total mass one."

Proof, as in the paper. At a point with `ρ > 0` the difference quotient of the term tends to
`(ρ' − ρ)(log(ρ/q) + 1)` (`tendsto_slope_segment_mul_log`). At a point with `ρ = 0` also
`ρ' = 0` by `h0`, the term is `0` for every `t`, and `(ρ' − ρ)(log(ρ/q) + 1)` is `0` too. So
the difference quotient of the entropy tends to `∑ (ρ' − ρ)(log(ρ/q) + 1)`; it is nonnegative
on `(0, 1]` (`sum_slope_segment_nonneg`), hence so is the limit. The "constant derivative
term" is `∑ (ρ' − ρ) = 1 − 1 = 0`.

Junk values. In the sum of the conclusion a point with `ρ x = 0` has the term
`(0 − 0) * Real.log (0 / q x) = 0`: the sum is the paper's sum "using only points where
`ρ > 0`". The hypothesis `h0` is what makes this so; in Lemma 3.2 it is the first assertion. -/
theorem sum_sub_mul_log_nonneg_of_relEntropy_segment_min {ρ ρ' q : α → ℝ} (hρ : IsLaw ρ)
    (hρ' : IsLaw ρ') (hq : ∀ x, 0 < q x) (h0 : ∀ x, ρ x = 0 → ρ' x = 0)
    (hmin : ∀ t : ℝ, 0 < t → t ≤ 1 →
      relEntropy ρ q ≤ relEntropy ((1 - t) • ρ + t • ρ') q) :
    0 ≤ ∑ x, (ρ' x - ρ x) * Real.log (ρ x / q x) := by
  have hlim : ∀ x, Tendsto (fun t : ℝ => t⁻¹ * (((1 - t) * ρ x + t * ρ' x)
        * Real.log (((1 - t) * ρ x + t * ρ' x) / q x) - ρ x * Real.log (ρ x / q x)))
      (𝓝[>] 0) (𝓝 ((ρ' x - ρ x) * (Real.log (ρ x / q x) + 1))) := by
    intro x
    rcases (hρ.nonneg x).eq_or_lt with hx | hx
    · rw [← hx, h0 x hx.symm]
      simp
    · exact tendsto_slope_segment_mul_log hx (hq x)
  have hsum := tendsto_finsetSum Finset.univ fun x _ => hlim x
  have hge : 0 ≤ ∑ x, (ρ' x - ρ x) * (Real.log (ρ x / q x) + 1) := by
    refine ge_of_tendsto hsum ?_
    filter_upwards [Ioc_mem_nhdsGT (zero_lt_one' ℝ)] with t ht
    exact sum_slope_segment_nonneg ht.1 (hmin t ht.1 ht.2)
  have hcancel : ∑ x, (ρ' x - ρ x) * (Real.log (ρ x / q x) + 1)
      = ∑ x, (ρ' x - ρ x) * Real.log (ρ x / q x) := by
    simp only [mul_add, mul_one, Finset.sum_add_distrib, Finset.sum_sub_distrib,
      hρ.sum_eq_one, hρ'.sum_eq_one, sub_self, add_zero]
  rwa [hcancel] at hge

end Steps

/-! ### Lemma 3.2 -/

set_option linter.unusedVariables.funArgs false in
/-- **Lemma 3.2, first assertion.** "Let `P` be a nonempty compact convex set of probability
measures on a finite set, and let `ρ` minimize `D(·‖q)` on `P`. Then `ρ` is positive on the
union of the supports of measures in `P`." Here `q` is a strictly positive probability
measure (Section 3.1).

Form. A probability measure on the finite type `α` is a function `α → ℝ` with `IsLaw`; `P` is
a set of such functions, compact and convex in `α → ℝ`. "Nonempty" is not a separate
hypothesis: it follows from `ρ ∈ P`. "`ρ` minimizes" is `ρ ∈ P` together with
`relEntropy ρ q ≤ relEntropy ρ' q` for every `ρ' ∈ P`. The support of `ρ'` is Mathlib's
`Function.support ρ' = {x | ρ' x ≠ 0}`.

Proved at milestone M4, second slice, by the paper's proof: if `ρ x = 0` and `ρ' x ≠ 0` for
some `ρ' ∈ P`, the entropy along `(1 − t)ρ + tρ'` has right derivative `−∞` at zero, against
minimality (`relEntropy_le_relEntropy_segment`, `eq_zero_of_relEntropy_segment_min`).

Hypotheses not used. `hcomp` ("compact") and `hq` ("`q` is a probability measure", that is,
has total mass one) are the paper's words and are kept as printed, by the user's decision of
2026-10-08 (question Q6 of `blueprint/M4_REVIEW_SHEET.md`). **The proof does not use either.**
The option before this comment silences the linter's warning about that and nothing else. Of
`hP` the proof uses only that the weights of `ρ` and `ρ'` are nonnegative. -/
theorem relEntropy_minimizer_pos {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
    (hconv : Convex ℝ P) (hcomp : IsCompact P)
    {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
    {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q) :
    ∀ x ∈ ⋃ ρ' ∈ P, Function.support ρ', 0 < ρ x := by
  intro x hx
  obtain ⟨ρ', hρ', hx'⟩ := Set.mem_iUnion₂.mp hx
  refine lt_of_le_of_ne ((hP ρ hρ).nonneg x) fun h => hx' ?_
  exact eq_zero_of_relEntropy_segment_min (hP ρ hρ).nonneg (hP ρ' hρ').nonneg hqpos
    (relEntropy_le_relEntropy_segment hconv hρ hmin hρ') h.symm

/-- **Lemma 3.2, second assertion.** With `P`, `q` and the minimizer `ρ` as in the first
assertion: "For every `ρ' ∈ P`, `D(ρ'‖q) − D(ρ‖q) ≥ D(ρ'‖ρ)`."

Form. The paper defines `D(·‖q)` for strictly positive `q`, and `ρ` need not be strictly
positive. By the first assertion `ρ` is positive wherever `ρ'` is, so every term of
`relEntropy ρ' ρ` with `ρ' x > 0` has `ρ x > 0`, and `relEntropy ρ' ρ` is the honest value of
`D(ρ'‖ρ)`, not a junk value (`blueprint/PAPER_ISSUES.md`, PI-008).

Proved at milestone M4, second slice, by the paper's proof: the first-order condition
`∑ (ρ' − ρ) log(ρ/q) ≥ 0` at the minimiser
(`sum_sub_mul_log_nonneg_of_relEntropy_segment_min`) and "the exact identity"
(`relEntropy_sub_relEntropy`). Both take as a hypothesis that `ρ'` vanishes wherever `ρ` does,
and here that hypothesis is supplied by the first assertion: so the honesty of
`relEntropy ρ' ρ` is proved in Lean, and is no longer a remark.

Hypotheses. `hcomp` and `hq` are used in one place only: to call the first assertion, whose
proof does not use them. That `ρ` and `ρ'` have total mass one (`hP`) is used, as in the paper
("the constant derivative term cancels"). -/
theorem relEntropy_le_sub_of_minimizer {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
    (hconv : Convex ℝ P) (hcomp : IsCompact P)
    {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
    {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q)
    {ρ' : α → ℝ} (hρ' : ρ' ∈ P) :
    relEntropy ρ' ρ ≤ relEntropy ρ' q - relEntropy ρ q := by
  -- the first assertion: `ρ'` vanishes wherever `ρ` does
  have hpos := relEntropy_minimizer_pos hP hconv hcomp hq hqpos hρ hmin
  have h0 : ∀ x, ρ x = 0 → ρ' x = 0 := fun x hx => by
    by_contra hne
    exact (hpos x (Set.mem_iUnion₂.mpr ⟨ρ', hρ', hne⟩)).ne' hx
  -- the first-order condition at the minimiser
  have h1 := sum_sub_mul_log_nonneg_of_relEntropy_segment_min (hP ρ hρ) (hP ρ' hρ') hqpos h0
    (relEntropy_le_relEntropy_segment hconv hρ hmin hρ')
  -- the exact identity
  rw [relEntropy_sub_relEntropy (fun x => (hqpos x).ne') fun x hx hx0 => hx (h0 x hx0)]
  linarith

/-- **Lemma 3.2, third assertion.** With `P`, `q`, the minimizer `ρ` and `ρ' ∈ P` as in the
second assertion: "If `ρ'` is supported on a set `S`, the right side is at least
`−log ρ(S)`." The right side is `D(ρ'‖ρ)`.

Form. "`ρ'` is supported on `S`" is `Function.support ρ' ⊆ S`. `ρ(S)` is `mass ρ S`. It is
positive: `ρ'` is a law, so its support has a point, that point is in `S`, and `ρ` is
positive there by the first assertion. So `Real.log (mass ρ S)` is an honest logarithm, not
the junk value `Real.log 0 = 0`.

Proved at milestone M4, second slice, by the paper's proof: "comparison with the normalized
restriction `ρ(·|S)`" and the nonnegativity of relative entropy
(`neg_log_mass_le_relEntropy`, with `relEntropy_eq_relEntropy_restrict_sub_log` and
`relEntropy_nonneg`, in `Hadwiger/Sanity/RelEntropy.lean`). That lemma takes as a hypothesis
that `ρ` is positive wherever `ρ'` is, supplied here by the first assertion, and it proves
`mass ρ S > 0` on the way: so the two remarks above about junk values are proved in Lean.

Hypotheses. `hcomp` and `hq` are used in one place only: to call the first assertion, whose
proof does not use them. -/
theorem neg_log_mass_le_relEntropy_of_minimizer {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
    (hconv : Convex ℝ P) (hcomp : IsCompact P)
    {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
    {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q)
    {ρ' : α → ℝ} (hρ' : ρ' ∈ P) {S : Set α} (hS : Function.support ρ' ⊆ S) :
    -Real.log (mass ρ S) ≤ relEntropy ρ' ρ := by
  -- the first assertion: `ρ` is positive wherever `ρ'` is
  have hpos := relEntropy_minimizer_pos hP hconv hcomp hq hqpos hρ hmin
  exact neg_log_mass_le_relEntropy (hP ρ' hρ') (hP ρ hρ).nonneg
    (fun x hx => hpos x (Set.mem_iUnion₂.mpr ⟨ρ', hρ', hx.ne'⟩)) hS

end EntropySupport

section TerminalCut

variable {Ω : Type*} [Fintype Ω]

/-- **Lemma 3.3 (terminal cut).** "Let `R ⊆ Ω_n^2`. If no probability law supported on `R`
satisfies (3.1), there are sets `S ⊆ Ω_n` and `E_0 ⊆ Ω_n^2` such that `μ(S) < 1/M`,
`μ^2(E_0) < 2^{-DN}`, and every pair in `R` either has an endpoint in `S` or belongs to
`E_0`."

Form. Abstract setting: any finite type `Ω` with a law `μ`, and any real numbers `M` (the
marginal cap) and `B` (the joint cap, the paper's `2^{DN}`). The two bounds are stated without
division: `M · μ(S) < 1` and `B · μ^2(E_0) < 1`. For `M > 0` and `B > 0`, as in the paper,
these are the paper's inequalities. No hole relation is involved.

No sign condition is put on `M` and `B`. For `M < 1` the statement is true for a trivial
reason (`S` the whole type and `E_0` empty), and likewise for `B < 1`; the content is in the
case `M ≥ 1`, `B ≥ 1`.

Not proved: `sorry`. -/
theorem exists_terminal_cut {μ : Ω → ℝ} (hμ : IsLaw μ) (M B : ℝ) (R : Set (Ω × Ω))
    (hR : ¬ ∃ σ : Ω × Ω → ℝ, IsLaw σ ∧ Function.support σ ⊆ R ∧ SatisfiesCaps μ M B σ) :
    ∃ (S : Set Ω) (E₀ : Set (Ω × Ω)),
      M * mass μ S < 1 ∧ B * mass (prodLaw μ μ) E₀ < 1 ∧
        ∀ z ∈ R, z.1 ∈ S ∨ z.2 ∈ S ∨ z ∈ E₀ := by
  sorry

end TerminalCut

end Hadwiger
