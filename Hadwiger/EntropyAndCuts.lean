module

public import Hadwiger.Defs.Law
public import Hadwiger.Defs.RelEntropy
public import Hadwiger.Sanity.Law
public import Hadwiger.Sanity.RelEntropy

@[expose] public section

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

**Lemma 3.3 is proved** (milestone M4, third slice), by the paper's proof, the residual-cut
argument for max-flow/min-cut with real capacities, with the statement unchanged. The sentences
of that proof are separate lemmas: seven in this file, under "Steps of the paper's proof of
Lemma 3.3", and three general ones about masses and marginals in `Hadwiger/Sanity/Law.lean`.
Blueprint entries `S-L3.3.*`. No definition was added: a flow is written out as a weight
function on pairs with the conditions it has to satisfy.

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

/-! ### Steps of the paper's proof of Lemma 3.3

The paper's network has a source `s`, a left copy and a right copy of `Ω`, and a sink `t`. The
edge from `s` to left `x` has capacity `M μ(x)`, the edge from right `y` to `t` has capacity
`M μ(y)`, and for `(x, y) ∈ R` the edge from left `x` to right `y` has capacity `B μ(x) μ(y)`.

How a flow is written here. Left `x` has one incoming edge and right `y` has one outgoing edge.
So flow conservation at these vertices says that the edge from `s` to left `x` carries
`∑_y f(x, y)` and the edge from right `y` to `t` carries `∑_x f(x, y)`, where `f(x, y)` is the
flow on the middle edge from left `x` to right `y`: a flow is determined by its values on the
middle edges. A flow is therefore a function `f : Ω × Ω → ℝ` such that

* `0 ≤ f z` for every pair `z`;
* `Function.support f ⊆ R`: there is no flow where there is no edge;
* `SatisfiesCaps μ M B f`: the three capacity constraints, `f_1 ≤ M μ` on the edges from the
  source, `f_2 ≤ M μ` on the edges to the sink, and `f ≤ B μ^2` on the middle edges.

Its value is `∑ z, f z`. No definition is introduced for any of this: the three conditions are
written out in each statement, the third with the signed-off `SatisfiesCaps`. Conservation is
built into this form and is not a separate hypothesis; the paper's "summing flow conservation
over `Z`" becomes a rearrangement of finite sums (`cut_capacity_eq_sum`).

The lemmas below are not statements of the paper; each is a sentence of its proof. Blueprint
entries `S-L3.3.value`, `S-L3.3.maximiser`, `S-L3.3.residual`, `S-L3.3.augment`, `S-L3.3.cut`,
`S-L3.3.sets`. -/

section Steps

open Filter Topology

/-- **Step (Lemma 3.3).** "A flow of value one is precisely a law satisfying the three caps. A
flow of larger value could be scaled down to value one, so the maximum value is less than one."

If no law supported on `R` satisfies the three caps, every flow has value less than one.

Proof, as in the paper. Suppose `v = ∑ f ≥ 1`. The scaled flow `f / v` has nonnegative values
that add up to `v / v = 1`, so it is a law. It vanishes wherever `f` does, so it is supported
on `R`. It satisfies the three caps: `f` and its two marginals are nonnegative and `v ≥ 1`, so
dividing by `v` does not increase any of them, and the caps of `f` carry over. That contradicts
`hR`.

Junk values. The division is by `v`, and `v ≥ 1`: it is not a division by zero.

Hypotheses. No sign condition on `M`, `B` or `μ` is needed: the caps of the scaled flow follow
from the caps of `f`, not from `0 ≤ M μ`. This is the one place in the proof of Lemma 3.3 where
`hR` is used. -/
theorem sum_lt_one_of_satisfiesCaps {μ : Ω → ℝ} {M B : ℝ} {R : Set (Ω × Ω)}
    (hR : ¬ ∃ σ : Ω × Ω → ℝ, IsLaw σ ∧ Function.support σ ⊆ R ∧ SatisfiesCaps μ M B σ)
    {f : Ω × Ω → ℝ} (hf0 : ∀ z, 0 ≤ f z) (hfR : Function.support f ⊆ R)
    (hcaps : SatisfiesCaps μ M B f) : ∑ z, f z < 1 := by
  by_contra hge
  rw [not_lt] at hge
  have hv : 0 < ∑ z, f z := lt_of_lt_of_le one_pos hge
  refine hR ⟨fun z => f z / ∑ w, f w, ⟨fun z => div_nonneg (hf0 z) hv.le, ?_⟩, ?_, ⟨?_, ?_, ?_⟩⟩
  · rw [← Finset.sum_div]
    exact div_self hv.ne'
  · intro z hz
    refine hfR fun h0 => hz ?_
    simp [h0]
  · intro x
    have h : marginalFst (fun z => f z / ∑ w, f w) x = marginalFst f x / ∑ w, f w := by
      simp only [marginalFst, Finset.sum_div]
    rw [h]
    exact (div_le_self (Finset.sum_nonneg fun y _ => hf0 _) hge).trans (hcaps.fst x)
  · intro y
    have h : marginalSnd (fun z => f z / ∑ w, f w) y = marginalSnd f y / ∑ w, f w := by
      simp only [marginalSnd, Finset.sum_div]
    rw [h]
    exact (div_le_self (Finset.sum_nonneg fun x _ => hf0 _) hge).trans (hcaps.snd y)
  · intro z
    exact (div_le_self (hf0 z) hge).trans (hcaps.joint z)

/-- **Step (Lemma 3.3).** "The feasible flows form a compact polytope, hence the flow value has
a maximizer `f`."

For nonnegative `μ`, `M` and `B` there is a flow whose value is at least the value of every
flow.

Proof. The set of flows is closed in `Ω × Ω → ℝ`: it is cut out by finitely many equations and
non-strict inequalities between continuous functions. It lies in the box `∏_z [0, B μ^2(z)]`,
which is compact. So it is compact. It is not empty: the zero flow is a flow, because the
capacities `M μ(x)`, `M μ(y)` and `B μ(x) μ(y)` are nonnegative. The value `∑ f` is continuous
in `f`. So the value has a maximiser.

Hypotheses. `0 ≤ μ`, `0 ≤ M` and `0 ≤ B` are used for the zero flow, and for nothing else here.
Without them the set of flows can be empty, and then there is no maximiser. -/
theorem exists_max_flow {μ : Ω → ℝ} (hμ : ∀ x, 0 ≤ μ x) {M B : ℝ} (hM : 0 ≤ M) (hB : 0 ≤ B)
    (R : Set (Ω × Ω)) :
    ∃ f : Ω × Ω → ℝ, (∀ z, 0 ≤ f z) ∧ Function.support f ⊆ R ∧ SatisfiesCaps μ M B f ∧
      ∀ g : Ω × Ω → ℝ, (∀ z, 0 ≤ g z) → Function.support g ⊆ R → SatisfiesCaps μ M B g →
        ∑ z, g z ≤ ∑ z, f z := by
  have h1 : IsClosed {f : Ω × Ω → ℝ | ∀ z, 0 ≤ f z} := by
    simp only [Set.ofPred_forall]
    exact isClosed_iInter fun z => isClosed_le continuous_const (continuous_apply z)
  have h2 : IsClosed {f : Ω × Ω → ℝ | Function.support f ⊆ R} := by
    simp only [Function.support_subset_iff', Set.ofPred_forall]
    exact isClosed_iInter fun z => isClosed_iInter fun _ =>
      isClosed_eq (continuous_apply z) continuous_const
  have h3 : IsClosed {f : Ω × Ω → ℝ | SatisfiesCaps μ M B f} := by
    have h : {f : Ω × Ω → ℝ | SatisfiesCaps μ M B f}
        = {f | ∀ x, marginalFst f x ≤ M * μ x} ∩ ({f | ∀ y, marginalSnd f y ≤ M * μ y}
          ∩ {f | ∀ z, f z ≤ B * prodLaw μ μ z}) := by
      ext f
      exact ⟨fun h => ⟨h.fst, h.snd, h.joint⟩, fun h => ⟨h.1, h.2.1, h.2.2⟩⟩
    rw [h]
    simp only [Set.ofPred_forall]
    refine (isClosed_iInter fun x => isClosed_le ?_ continuous_const).inter
      ((isClosed_iInter fun y => isClosed_le ?_ continuous_const).inter
        (isClosed_iInter fun z => isClosed_le (continuous_apply z) continuous_const))
    · exact continuous_finsetSum _ fun y _ => continuous_apply (x, y)
    · exact continuous_finsetSum _ fun x _ => continuous_apply (x, y)
  -- the set of flows is a closed subset of a compact box
  have hK : IsCompact ({f : Ω × Ω → ℝ | ∀ z, 0 ≤ f z}
      ∩ ({f | Function.support f ⊆ R} ∩ {f | SatisfiesCaps μ M B f})) := by
    refine IsCompact.of_isClosed_subset
      (isCompact_univ_pi fun z : Ω × Ω => isCompact_Icc (a := (0 : ℝ)) (b := B * prodLaw μ μ z))
      (h1.inter (h2.inter h3)) ?_
    rintro f ⟨hf0, -, hf⟩ z -
    exact ⟨hf0 z, hf.joint z⟩
  -- the zero flow
  have hne : ({f : Ω × Ω → ℝ | ∀ z, 0 ≤ f z}
      ∩ ({f | Function.support f ⊆ R} ∩ {f | SatisfiesCaps μ M B f})).Nonempty := by
    refine ⟨0, fun z => le_rfl, by simp, ⟨fun x => ?_, fun y => ?_, fun z => ?_⟩⟩
    · simpa [marginalFst] using mul_nonneg hM (hμ x)
    · simpa [marginalSnd] using mul_nonneg hM (hμ y)
    · exact mul_nonneg hB (mul_nonneg (hμ z.1) (hμ z.2))
  obtain ⟨f, ⟨hf0, hfR, hf⟩, hmax⟩ := hK.exists_isMaxOn hne
    (continuous_finsetSum Finset.univ fun z _ => continuous_apply z).continuousOn
  exact ⟨f, hf0, hfR, hf, fun g hg0 hgR hg => hmax ⟨hg0, hgR, hg⟩⟩

/-- **Step (Lemma 3.3), the residual network.** "In its residual network, include a forward
edge whenever its capacity exceeds its flow and a reverse edge whenever its flow is positive."

The vertices of the relation `r` are the left and the right copy of `Ω`, written `Sum.inl x`
and `Sum.inr y`. A forward residual edge goes from left `x` to right `y` when `(x, y) ∈ R` and
`f(x, y) < B μ(x) μ(y)`; a reverse residual edge goes from right `y` to left `x` when
`0 < f(x, y)`. The hypothesis `hr` says that every edge of `r` is one of these. The source and
the sink are not vertices of `r`. The residual edge from the source to left `x₀` and the
residual edge from right `y` to the sink are hypotheses of the lemma that uses this one
(`exists_sum_lt_sum_of_direction`): `marginalFst f x₀ < M * μ x₀` and
`marginalSnd f y < M * μ y`.

The statement. Along a residual path from left `x₀` to a vertex `v` the flow can be changed in
a *direction* `d`, a function on the middle edges: `d z` is the number of times the path uses
the edge `z` forward, less the number of times it uses it backward. Then

* `d` is positive only on edges of `R` that are not saturated, and negative only on edges that
  carry flow, so that `f + ε d` stays between `0` and the capacities for small `ε > 0`;
* the first marginal of `d` is `1` at `x₀`, less `1` at `v` when `v` is a left vertex, and the
  second marginal of `d` is `1` at `v` when `v` is a right vertex, and both are `0` elsewhere:
  `f + ε d` carries `ε` more from left `x₀` to `v` and is conserved at every other vertex.

Proof, by induction along the path. For the empty path `d = 0`. A forward edge from left `x`
to right `y` adds one unit on `(x, y)`. A reverse edge from right `y` to left `x` takes one
unit off `(x, y)`.

The path is what Mathlib's `Relation.ReflTransGen` provides. It need not be simple: it may use
an edge several times, and in both directions. -/
theorem exists_augmenting_direction [DecidableEq Ω] {μ : Ω → ℝ} {B : ℝ} {R : Set (Ω × Ω)}
    {f : Ω × Ω → ℝ} {r : Ω ⊕ Ω → Ω ⊕ Ω → Prop}
    (hr : ∀ u v, r u v → ∃ x y,
      (u = Sum.inl x ∧ v = Sum.inr y ∧ (x, y) ∈ R ∧ f (x, y) < B * prodLaw μ μ (x, y)) ∨
      (u = Sum.inr y ∧ v = Sum.inl x ∧ 0 < f (x, y)))
    {x₀ : Ω} {v : Ω ⊕ Ω} (hv : Relation.ReflTransGen r (Sum.inl x₀) v) :
    ∃ d : Ω × Ω → ℝ,
      (∀ z, 0 < d z → z ∈ R ∧ f z < B * prodLaw μ μ z) ∧
      (∀ z, d z < 0 → 0 < f z) ∧
      (∀ x, marginalFst d x = (if x = x₀ then 1 else 0) - if Sum.inl x = v then 1 else 0) ∧
      (∀ y, marginalSnd d y = if Sum.inr y = v then 1 else 0) := by
  induction hv with
  | refl => exact ⟨0, by simp, by simp, by simp [marginalFst], by simp [marginalSnd]⟩
  | tail _ hbc ih =>
    obtain ⟨d, hpos, hneg, h1, h2⟩ := ih
    obtain ⟨x, y, ⟨rfl, rfl, hxy, hlt⟩ | ⟨rfl, rfl, hlt⟩⟩ := hr _ _ hbc
    · -- a forward edge from left `x` to right `y`: one more unit on `(x, y)`
      refine ⟨fun z => d z + if z = (x, y) then 1 else 0, fun z hz => ?_, fun z hz => ?_,
        fun x' => ?_, fun y' => ?_⟩
      · by_cases hzz : z = (x, y)
        · rw [hzz]
          exact ⟨hxy, hlt⟩
        · exact hpos z (by simpa [hzz] using hz)
      · refine hneg z ?_
        have h : (0 : ℝ) ≤ if z = (x, y) then 1 else 0 := by split_ifs <;> norm_num
        linarith
      · have h : marginalFst (fun z => d z + if z = (x, y) then 1 else 0) x'
            = marginalFst d x' + if x' = x then 1 else 0 := by
          rw [← marginalFst_ite_eq x y 1 x']
          exact Finset.sum_add_distrib
        rw [h, h1]
        simp
      · have h : marginalSnd (fun z => d z + if z = (x, y) then 1 else 0) y'
            = marginalSnd d y' + if y' = y then 1 else 0 := by
          rw [← marginalSnd_ite_eq x y 1 y']
          exact Finset.sum_add_distrib
        rw [h, h2]
        simp
    · -- a reverse edge from right `y` to left `x`: one unit less on `(x, y)`
      refine ⟨fun z => d z - if z = (x, y) then 1 else 0, fun z hz => ?_, fun z hz => ?_,
        fun x' => ?_, fun y' => ?_⟩
      · refine hpos z ?_
        have h : (0 : ℝ) ≤ if z = (x, y) then 1 else 0 := by split_ifs <;> norm_num
        linarith
      · by_cases hzz : z = (x, y)
        · rw [hzz]
          exact hlt
        · exact hneg z (by simpa [hzz] using hz)
      · have h : marginalFst (fun z => d z - if z = (x, y) then 1 else 0) x'
            = marginalFst d x' - if x' = x then 1 else 0 := by
          rw [← marginalFst_ite_eq x y 1 x']
          exact Finset.sum_sub_distrib _ _
        rw [h, h1]
        simp
      · have h : marginalSnd (fun z => d z - if z = (x, y) then 1 else 0) y'
            = marginalSnd d y' - if y' = y then 1 else 0 := by
          rw [← marginalSnd_ite_eq x y 1 y']
          exact Finset.sum_sub_distrib _ _
        rw [h, h2]
        simp

/-- **Step (Lemma 3.3).** For real numbers `a` and `b ≥ 0` such that `b > 0` whenever `a > 0`:
`ε a ≤ b` for all small enough `ε > 0`.

This is the place of the paper's "smallest positive residual capacity". The amount `ε` by
which a flow is augmented has to satisfy finitely many inequalities of this form, one for each
edge, with `b` a residual capacity. -/
theorem eventually_mul_le {a b : ℝ} (hb : 0 ≤ b) (hab : 0 < a → 0 < b) :
    ∀ᶠ ε in 𝓝[>] (0 : ℝ), ε * a ≤ b := by
  by_cases ha : 0 < a
  · have h : Tendsto (fun ε : ℝ => ε * a) (𝓝[>] 0) (𝓝 0) := by
      have h0 : Tendsto (fun ε : ℝ => ε * a) (𝓝 0) (𝓝 (0 * a)) :=
        (continuous_id.mul continuous_const).tendsto 0
      rw [zero_mul] at h0
      exact h0.mono_left nhdsWithin_le_nhds
    exact (h.eventually_lt_const (hab ha)).mono fun ε h => h.le
  · filter_upwards [self_mem_nhdsWithin] with ε hε
    exact (mul_nonpos_of_nonneg_of_nonpos (le_of_lt hε) (not_lt.mp ha)).trans hb

/-- **Step (Lemma 3.3), augmentation.** "There is no residual path from `s` to `t`: augmenting
by the smallest positive residual capacity on such a path would increase the value."

Let `f` be a flow and `d` a direction as `exists_augmenting_direction` gives it for a residual
path from left `x₀` to right `y₀`: positive only on unsaturated edges of `R`, negative only on
edges that carry flow, with first marginal `1` at `x₀` and second marginal `1` at `y₀` and both
`0` elsewhere. Suppose the edge from the source to left `x₀` and the edge from right `y₀` to the
sink are not saturated (`hx₀`, `hy₀`). Then some flow has a larger value than `f`.

Proof. The flow is `f + ε d` for a small enough `ε > 0`. Its value is `∑ f + ε`, because
`∑ d = 1`. It is a flow as soon as `ε·(−d z) ≤ f z` and `ε·d z ≤ B μ^2(z) − f z` for every pair
`z`, and `ε ≤ M μ(x₀) − f_1(x₀)` and `ε ≤ M μ(y₀) − f_2(y₀)`. Every right side is nonnegative,
and positive whenever the coefficient of `ε` is positive, by the sign conditions on `d` and by
`hx₀`, `hy₀`; so all of these hold for small `ε > 0` (`eventually_mul_le`). Off `R` both `f`
and `d` vanish.

Difference from the paper's wording. The paper augments by "the smallest positive residual
capacity" on the path. That amount is right for a path that uses no edge twice. Here the path
may use an edge `k` times, which changes the flow on it by `k ε`, so `ε` is taken small enough
and is not that minimum. -/
theorem exists_sum_lt_sum_of_direction [DecidableEq Ω] {μ : Ω → ℝ} {M B : ℝ}
    {R : Set (Ω × Ω)} {f d : Ω × Ω → ℝ}
    (hf0 : ∀ z, 0 ≤ f z) (hfR : Function.support f ⊆ R) (hcaps : SatisfiesCaps μ M B f)
    (hpos : ∀ z, 0 < d z → z ∈ R ∧ f z < B * prodLaw μ μ z)
    (hneg : ∀ z, d z < 0 → 0 < f z)
    {x₀ y₀ : Ω} (hx₀ : marginalFst f x₀ < M * μ x₀) (hy₀ : marginalSnd f y₀ < M * μ y₀)
    (h1 : ∀ x, marginalFst d x = if x = x₀ then 1 else 0)
    (h2 : ∀ y, marginalSnd d y = if y = y₀ then 1 else 0) :
    ∃ g : Ω × Ω → ℝ, (∀ z, 0 ≤ g z) ∧ Function.support g ⊆ R ∧ SatisfiesCaps μ M B g ∧
      ∑ z, f z < ∑ z, g z := by
  -- the finitely many conditions on `ε`, each true for all small `ε > 0`
  have e1 : ∀ᶠ ε in 𝓝[>] (0 : ℝ), ∀ z, ε * (-d z) ≤ f z :=
    eventually_all.mpr fun z => eventually_mul_le (hf0 z) fun h => hneg z (neg_pos.mp h)
  have e2 : ∀ᶠ ε in 𝓝[>] (0 : ℝ), ∀ z, ε * d z ≤ B * prodLaw μ μ z - f z :=
    eventually_all.mpr fun z => eventually_mul_le (sub_nonneg.mpr (hcaps.joint z))
      fun h => sub_pos.mpr (hpos z h).2
  have e3 : ∀ᶠ ε in 𝓝[>] (0 : ℝ), ε * 1 ≤ M * μ x₀ - marginalFst f x₀ :=
    eventually_mul_le (sub_pos.mpr hx₀).le fun _ => sub_pos.mpr hx₀
  have e4 : ∀ᶠ ε in 𝓝[>] (0 : ℝ), ε * 1 ≤ M * μ y₀ - marginalSnd f y₀ :=
    eventually_mul_le (sub_pos.mpr hy₀).le fun _ => sub_pos.mpr hy₀
  obtain ⟨ε, ⟨⟨⟨he1, he2⟩, he3⟩, he4⟩, hε⟩ :=
    ((((e1.and e2).and e3).and e4).and self_mem_nhdsWithin).exists
  have hε : 0 < ε := hε
  have hF : ∀ x, marginalFst (fun z => f z + ε * d z) x
      = marginalFst f x + ε * marginalFst d x := fun x => by
    simp only [marginalFst, Finset.sum_add_distrib, Finset.mul_sum]
  have hS : ∀ y, marginalSnd (fun z => f z + ε * d z) y
      = marginalSnd f y + ε * marginalSnd d y := fun y => by
    simp only [marginalSnd, Finset.sum_add_distrib, Finset.mul_sum]
  refine ⟨fun z => f z + ε * d z, fun z => ?_, fun z hz => ?_,
    ⟨fun x => ?_, fun y => ?_, fun z => ?_⟩, ?_⟩
  · have h := he1 z
    rw [mul_neg] at h
    linarith
  · by_contra hzR
    have hfz : f z = 0 := by
      by_contra h
      exact hzR (hfR h)
    have hdz : d z = 0 := by
      rcases lt_trichotomy (d z) 0 with h | h | h
      · exact absurd (hneg z h) (by rw [hfz]; exact lt_irrefl 0)
      · exact h
      · exact absurd (hpos z h).1 hzR
    exact hz (by simp [hfz, hdz])
  · rw [hF, h1]
    by_cases h : x = x₀
    · simp only [h, ↓reduceIte]
      linarith
    · simp only [h, ↓reduceIte, mul_zero, add_zero]
      exact hcaps.fst x
  · rw [hS, h2]
    by_cases h : y = y₀
    · simp only [h, ↓reduceIte]
      linarith
    · simp only [h, ↓reduceIte, mul_zero, add_zero]
      exact hcaps.snd y
  · have h := he2 z
    linarith
  · have hd : ∑ z, d z = 1 := by
      rw [Fintype.sum_prod_type]
      have h : ∀ x, ∑ y, d (x, y) = if x = x₀ then 1 else 0 := h1
      simp [h]
    rw [Finset.sum_add_distrib, ← Finset.mul_sum, hd, mul_one]
    linarith

/-- **Step (Lemma 3.3), the cut.** "Every forward edge across `Z` to its complement is
saturated, and every forward edge in the opposite direction has zero flow, since otherwise its
reverse residual edge would leave `Z`. Summing flow conservation over `Z` shows that the
capacity of this cut equals the value of `f`".

`L₀` is the set of the `x` whose left copy is outside `Z`, and `R₀` the set of the `y` whose
right copy is in `Z`, as in the paper. The source is in `Z` and the sink is not. So the edges
from `Z` to its complement are: from the source to left `x`, for `x ∈ L₀`; from right `y` to
the sink, for `y ∈ R₀`; and from left `x` to right `y`, for `(x, y) ∈ R` with `x ∉ L₀` and
`y ∉ R₀`. The hypotheses `hL`, `hR₀` and `hsat` say that these are saturated. The edges from the
complement of `Z` into `Z` are the edges from left `x` to right `y` with `x ∈ L₀` and `y ∈ R₀`;
`hzero` says that they carry no flow. The conclusion is that the capacity of the cut, written
as on the left of the paper's displayed inequality,

`M μ(L_0) + M μ(R_0) + B μ^2(R ∩ ((Ω ∖ L_0) × (Ω ∖ R_0)))`,

equals the value `∑ f`.

Proof. Each of the three terms is a sum of `f` over pairs: over the pairs `(x, y)` with
`x ∈ L₀`, by `hL`; over those with `y ∈ R₀`, by `hR₀`; over those of the third set, by `hsat`.
A pair with `x ∈ L₀` and `y ∈ R₀` is counted twice, and has `f = 0` by `hzero`. A pair with
`x ∉ L₀` and `y ∉ R₀` is in the third set, or it is off `R` and has `f = 0`. Every other pair is
counted once.

The lemma is about any two sets with these four properties. That they come from the vertices
reachable from the source is what proves the four properties, in
`exists_terminal_cut_of_nonneg`; it is not used here. No sign condition is needed, and `f` need
not be nonnegative. -/
theorem cut_capacity_eq_sum {μ : Ω → ℝ} {M B : ℝ} {R : Set (Ω × Ω)} {f : Ω × Ω → ℝ}
    (hfR : Function.support f ⊆ R) {L₀ R₀ : Set Ω}
    (hL : ∀ x ∈ L₀, marginalFst f x = M * μ x)
    (hR₀ : ∀ y ∈ R₀, marginalSnd f y = M * μ y)
    (hsat : ∀ z ∈ R, z.1 ∉ L₀ → z.2 ∉ R₀ → f z = B * prodLaw μ μ z)
    (hzero : ∀ z, z.1 ∈ L₀ → z.2 ∈ R₀ → f z = 0) :
    M * mass μ L₀ + M * mass μ R₀
        + B * mass (prodLaw μ μ) (R ∩ {z | z.1 ∉ L₀ ∧ z.2 ∉ R₀})
      = ∑ z, f z := by
  classical
  have h1 : M * mass μ L₀ = ∑ x, ∑ y, if x ∈ L₀ then f (x, y) else 0 := by
    rw [mass, Finset.mul_sum]
    refine Finset.sum_congr rfl fun x _ => ?_
    by_cases hx : x ∈ L₀
    · simp only [Set.indicator_of_mem hx, hx, ↓reduceIte]
      exact (hL x hx).symm
    · simp [hx]
  have h2 : M * mass μ R₀ = ∑ x, ∑ y, if y ∈ R₀ then f (x, y) else 0 := by
    rw [mass, Finset.mul_sum, Finset.sum_comm]
    refine Finset.sum_congr rfl fun y _ => ?_
    by_cases hy : y ∈ R₀
    · simp only [Set.indicator_of_mem hy, hy, ↓reduceIte]
      exact (hR₀ y hy).symm
    · simp [hy]
  have h3 : B * mass (prodLaw μ μ) (R ∩ {z | z.1 ∉ L₀ ∧ z.2 ∉ R₀})
      = ∑ x, ∑ y, if (x, y) ∈ R ∩ {z | z.1 ∉ L₀ ∧ z.2 ∉ R₀} then f (x, y) else 0 := by
    rw [mass, Finset.mul_sum, Fintype.sum_prod_type]
    refine Finset.sum_congr rfl fun x _ => Finset.sum_congr rfl fun y _ => ?_
    by_cases hz : (x, y) ∈ R ∩ {z | z.1 ∉ L₀ ∧ z.2 ∉ R₀}
    · simp only [Set.indicator_of_mem hz, hz, ↓reduceIte]
      exact (hsat _ hz.1 hz.2.1 hz.2.2).symm
    · simp only [Set.indicator_of_notMem hz, hz, ↓reduceIte, mul_zero]
  rw [h1, h2, h3, Fintype.sum_prod_type, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun x _ => ?_
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun y _ => ?_
  by_cases hx : x ∈ L₀ <;> by_cases hy : y ∈ R₀
  · simp [hx, hy, hzero (x, y) hx hy]
  · simp [hx, hy]
  · simp [hx, hy]
  · by_cases hz : (x, y) ∈ R
    · simp [hx, hy, hz]
    · have h0 : f (x, y) = 0 := by
        by_contra h
        exact hz (hfR h)
      simp [hx, hy, hz, h0]

/-- **Step (Lemma 3.3): the lemma for nonnegative caps.** Lemma 3.3 when `0 ≤ M` and `0 ≤ B`,
the case in which the paper's network has nonnegative capacities. This is the paper's proof,
assembled from the steps above.

1. Take a flow `f` of maximum value (`exists_max_flow`). Its value is less than one
   (`sum_lt_one_of_satisfiesCaps`).
2. The residual network of `f` is the relation `r` on the two copies of `Ω`: a forward edge from
   left `x` to right `y` when `(x, y) ∈ R` and `f(x, y) < B μ(x) μ(y)`, a reverse edge from right
   `y` to left `x` when `0 < f(x, y)`.
3. "Let `Z` be the vertices reachable from `s`": a vertex is in `Z` when a residual path leads
   to it from some left `x₀` whose edge from the source is not saturated. The source and the
   sink are not vertices of `r`; the source is counted in `Z` and the sink is not.
4. "There is no residual path from `s` to `t`": if right `y` is in `Z`, its edge to the sink is
   saturated, for otherwise a flow of larger value would exist
   (`exists_augmenting_direction`, `exists_sum_lt_sum_of_direction`). This is the one place
   where the maximality of `f` is used.
5. With `L₀` the `x` whose left copy is outside `Z` and `R₀` the `y` whose right copy is in `Z`,
   every edge from `Z` to its complement is saturated and every edge from the complement into
   `Z` carries no flow, because `Z` is closed under residual edges. So the capacity of the cut
   is the value of `f` (`cut_capacity_eq_sum`), which is less than one.
6. "Take `S = L_0 ∪ R_0` and take `E_0` to be the pair set in the last summand." The three terms
   of the capacity are nonnegative, so `M μ(S) ≤ M μ(L_0) + M μ(R_0) < 1` (`mass_union_le`) and
   `B μ^2(E_0) < 1`. "A pair in `R` with neither endpoint in `S` necessarily belongs to `E_0`."

Hypotheses. `μ` need only have nonnegative weights; that they add up to `1` is not used.
`0 ≤ M` and `0 ≤ B` are used in step 1, for the zero flow, and in step 6. `hR` is used in step
1 only. -/
theorem exists_terminal_cut_of_nonneg {μ : Ω → ℝ} (hμ : ∀ x, 0 ≤ μ x) {M B : ℝ} (hM : 0 ≤ M)
    (hB : 0 ≤ B) (R : Set (Ω × Ω))
    (hR : ¬ ∃ σ : Ω × Ω → ℝ, IsLaw σ ∧ Function.support σ ⊆ R ∧ SatisfiesCaps μ M B σ) :
    ∃ (S : Set Ω) (E₀ : Set (Ω × Ω)),
      M * mass μ S < 1 ∧ B * mass (prodLaw μ μ) E₀ < 1 ∧
        ∀ z ∈ R, z.1 ∈ S ∨ z.2 ∈ S ∨ z ∈ E₀ := by
  classical
  -- a flow of maximum value; its value is less than one
  obtain ⟨f, hf0, hfR, hcaps, hmax⟩ := exists_max_flow hμ hM hB R
  have hval : ∑ z, f z < 1 := sum_lt_one_of_satisfiesCaps hR hf0 hfR hcaps
  -- the residual network, on the left and the right copy of `Ω`
  let r : Ω ⊕ Ω → Ω ⊕ Ω → Prop := fun u v => ∃ x y,
    (u = Sum.inl x ∧ v = Sum.inr y ∧ (x, y) ∈ R ∧ f (x, y) < B * prodLaw μ μ (x, y)) ∨
    (u = Sum.inr y ∧ v = Sum.inl x ∧ 0 < f (x, y))
  -- `Z`: the vertices reachable from the source
  let Z : Set (Ω ⊕ Ω) :=
    {v | ∃ x₀, marginalFst f x₀ < M * μ x₀ ∧ Relation.ReflTransGen r (Sum.inl x₀) v}
  let L₀ : Set Ω := {x | Sum.inl x ∉ Z}
  let R₀ : Set Ω := {y | Sum.inr y ∈ Z}
  -- the edges from the source to the left vertices outside `Z` are saturated
  have hL : ∀ x ∈ L₀, marginalFst f x = M * μ x := fun x hx =>
    le_antisymm (hcaps.fst x) (not_lt.mp fun h => hx ⟨x, h, Relation.ReflTransGen.refl⟩)
  -- no residual path to the sink: the edges from the right vertices in `Z` are saturated
  have hR₀ : ∀ y ∈ R₀, marginalSnd f y = M * μ y := by
    rintro y ⟨x₀, hx₀, hpath⟩
    refine le_antisymm (hcaps.snd y) (not_lt.mp fun hy => ?_)
    obtain ⟨d, hpos, hneg, h1, h2⟩ :=
      exists_augmenting_direction (μ := μ) (B := B) (R := R) (f := f) (r := r)
        (fun u v h => h) hpath
    obtain ⟨g, hg0, hgR, hg, hlt⟩ := exists_sum_lt_sum_of_direction hf0 hfR hcaps hpos hneg
      hx₀ hy (fun x => by simpa using h1 x) (fun y' => by simpa using h2 y')
    exact absurd (hmax g hg0 hgR hg) (not_le.mpr hlt)
  -- the middle edges from `Z` to its complement are saturated
  have hsat : ∀ z ∈ R, z.1 ∉ L₀ → z.2 ∉ R₀ → f z = B * prodLaw μ μ z := by
    rintro ⟨x, y⟩ hz hx hy
    refine le_antisymm (hcaps.joint _) (not_lt.mp fun h => hy ?_)
    obtain ⟨x₀, hx₀, hpath⟩ := not_not.mp hx
    exact ⟨x₀, hx₀, hpath.tail ⟨x, y, Or.inl ⟨rfl, rfl, hz, h⟩⟩⟩
  -- the middle edges from the complement of `Z` into `Z` carry no flow
  have hzero : ∀ z, z.1 ∈ L₀ → z.2 ∈ R₀ → f z = 0 := by
    rintro ⟨x, y⟩ hx ⟨x₀, hx₀, hpath⟩
    exact le_antisymm
      (not_lt.mp fun h => hx ⟨x₀, hx₀, hpath.tail ⟨x, y, Or.inr ⟨rfl, rfl, h⟩⟩⟩) (hf0 _)
  -- the capacity of the cut is the value of the flow
  have hcut := cut_capacity_eq_sum hfR hL hR₀ hsat hzero
  have hE : 0 ≤ B * mass (prodLaw μ μ) (R ∩ {z | z.1 ∉ L₀ ∧ z.2 ∉ R₀}) :=
    mul_nonneg hB (mass_nonneg (p := prodLaw μ μ) (fun z => mul_nonneg (hμ z.1) (hμ z.2)) _)
  have hL0 : 0 ≤ M * mass μ L₀ := mul_nonneg hM (mass_nonneg hμ _)
  have hR0 : 0 ≤ M * mass μ R₀ := mul_nonneg hM (mass_nonneg hμ _)
  refine ⟨L₀ ∪ R₀, R ∩ {z | z.1 ∉ L₀ ∧ z.2 ∉ R₀}, ?_, ?_, fun z hz => ?_⟩
  · have h := mul_le_mul_of_nonneg_left (mass_union_le hμ L₀ R₀) hM
    rw [mul_add] at h
    linarith
  · linarith
  · by_cases h1 : z.1 ∈ L₀
    · exact Or.inl (Or.inl h1)
    by_cases h2 : z.2 ∈ R₀
    · exact Or.inr (Or.inl (Or.inr h2))
    exact Or.inr (Or.inr ⟨hz, h1, h2⟩)

end Steps

/-! ### Lemma 3.3 -/

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

Proved at milestone M4, third slice, by the paper's proof, the residual-cut argument for
max-flow/min-cut (`exists_terminal_cut_of_nonneg` and the steps before it).

Cases. The paper's network needs nonnegative capacities, so the proof splits at zero. For
`M < 0`: `S` the whole type and `E_0` empty. For `0 ≤ M` and `B < 0`: `S` empty and `E_0` the
set of all pairs. In these two cases `hR` is not used. For `0 ≤ M` and `0 ≤ B`: the paper's
proof, in which `hR` is used once, to show that every flow has value less than one. The values
`0 ≤ M < 1` and `0 ≤ B < 1`, for which the trivial choice of the paragraph above would also
serve, are not treated apart: they go through the paper's proof.

Hypotheses. Of `hμ` the proof uses only that the weights of `μ` are nonnegative. That they add
up to `1` is not used in any of the three cases.

Junk values. The statement has no division and no logarithm. The proof divides once, in
`sum_lt_one_of_satisfiesCaps`, by a number that is at least `1`. -/
theorem exists_terminal_cut {μ : Ω → ℝ} (hμ : IsLaw μ) (M B : ℝ) (R : Set (Ω × Ω))
    (hR : ¬ ∃ σ : Ω × Ω → ℝ, IsLaw σ ∧ Function.support σ ⊆ R ∧ SatisfiesCaps μ M B σ) :
    ∃ (S : Set Ω) (E₀ : Set (Ω × Ω)),
      M * mass μ S < 1 ∧ B * mass (prodLaw μ μ) E₀ < 1 ∧
        ∀ z ∈ R, z.1 ∈ S ∨ z.2 ∈ S ∨ z ∈ E₀ := by
  -- negative marginal cap: `S` everything, `E₀` empty
  rcases lt_or_ge M 0 with hM | hM
  · refine ⟨Set.univ, ∅, ?_, ?_, fun z _ => Or.inl (Set.mem_univ _)⟩
    · have h := mul_nonpos_of_nonpos_of_nonneg hM.le (mass_nonneg hμ.nonneg Set.univ)
      linarith
    · rw [mass_empty, mul_zero]
      exact one_pos
  -- negative joint cap: `S` empty, `E₀` everything
  rcases lt_or_ge B 0 with hB | hB
  · refine ⟨∅, Set.univ, ?_, ?_, fun z _ => Or.inr (Or.inr (Set.mem_univ _))⟩
    · rw [mass_empty, mul_zero]
      exact one_pos
    · have h := mul_nonpos_of_nonpos_of_nonneg hB.le (mass_nonneg (p := prodLaw μ μ)
        (fun z => mul_nonneg (hμ.nonneg z.1) (hμ.nonneg z.2)) Set.univ)
      linarith
  -- nonnegative caps: the paper's proof
  exact exists_terminal_cut_of_nonneg hμ.nonneg hM hB R hR

end TerminalCut

end Hadwiger
