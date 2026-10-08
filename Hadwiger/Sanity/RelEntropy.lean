module

public import Hadwiger.Defs.RelEntropy
public import Hadwiger.Sanity.Law

@[expose] public section

/-!
# Relative entropy: sanity checks, and the general lemmas used by Lemma 3.2

This file has two parts, both about the definition `Hadwiger.relEntropy` of
`Hadwiger/Defs/RelEntropy.lean`.

**Sanity checks (not in the paper).** Added at milestone M4, first slice; blueprint entry
`S-M4.kl`. They pin the definition:

* `D(ρ‖ρ) = 0`;
* `D(δ_a‖q) = −log q(a)` for the point mass `δ_a`: points where the first argument is `0`
  contribute nothing (`0 log 0 = 0`), and the sign and the order of the two arguments are
  the paper's;
* in particular `D(δ_a‖uniform) = log n` on a type with `n` elements.

**General lemmas used by the proof of Lemma 3.2.** Added at milestone M4, second slice. Each
is a sentence of the paper's proof of Lemma 3.2 (Section 3.1), proved here for arbitrary
weight functions so that `Hadwiger/EntropyAndCuts.lean` can import it. They are marked
"Support (Lemma 3.2)" below, and their blueprint entries are in the section "Steps of the
paper's proofs, proved as separate lemmas":

* `S-L3.2.nonneg`: relative entropy is nonnegative, from `log t ≤ t − 1`
  (`sub_le_mul_log_div`, `relEntropy_nonneg`);
* `S-L3.2.identity`: the exact identity
  `D(ρ'‖q) − D(ρ‖q) = D(ρ'‖ρ) + ∑ (ρ' − ρ) log(ρ/q)` (`relEntropy_sub_relEntropy`);
* `S-L3.2.restrict`: comparison with the normalised restriction,
  `D(ρ'‖ρ) = D(ρ'‖ρ(·|S)) − log ρ(S) ≥ −log ρ(S)`
  (`relEntropy_eq_relEntropy_restrict_sub_log`, `neg_log_mass_le_relEntropy`).

Junk values. `relEntropy ρ σ` is the paper's `D(ρ‖σ)` only when `σ` is nonzero wherever `ρ`
is (`blueprint/PAPER_ISSUES.md`, PI-008). Every lemma of the second part has that as a
hypothesis, in the form it needs; none is true by a default value.

Not here: agreement with Mathlib's `InformationTheory.klDiv`; see blueprint entry
`S-M4.kl-mathlib`.
-/

namespace Hadwiger

variable {α : Type*} [Fintype α]

/-! ### Sanity checks (M4, first slice) -/

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

/-! ### General lemmas used by the proof of Lemma 3.2 (M4, second slice) -/

/-- **Support (Lemma 3.2).** One term of the nonnegativity of relative entropy:
`a − b ≤ a log(a/b)` for `a, b ≥ 0`, with `b > 0` when `a > 0`.

Paper, proof of Lemma 3.2: "nonnegativity of relative entropy follows from `log t ≤ t − 1`,
applied with `t = q(x)/ρ'(x)`". Here `a = ρ'(x)`, `b = q(x)` and `t = b/a`: for `a > 0`,
`a log(a/b) = −a log(b/a) ≥ −a (b/a − 1) = a − b`. For `a = 0` the right side is `0 log 0 = 0`
and the inequality reads `−b ≤ 0`.

The hypothesis `0 < a → 0 < b` is needed: for `a > 0 = b` the right side is the junk value
`a * Real.log (a / 0) = 0`, and `a − 0 ≤ 0` is false. -/
theorem sub_le_mul_log_div {a b : ℝ} (ha : 0 ≤ a) (hb : 0 ≤ b) (h : 0 < a → 0 < b) :
    a - b ≤ a * Real.log (a / b) := by
  rcases ha.eq_or_lt with rfl | ha
  · simpa using hb
  · have hb' := h ha
    have h1 : Real.log (b / a) ≤ b / a - 1 := Real.log_le_sub_one_of_pos (div_pos hb' ha)
    have h2 : Real.log (a / b) = -Real.log (b / a) := by
      rw [← Real.log_inv, inv_div]
    have h3 : a * (b / a - 1) = b - a := by
      field_simp
    have h4 := mul_le_mul_of_nonneg_left h1 ha.le
    rw [h2]
    linarith

/-- **Support (Lemma 3.2).** Relative entropy is nonnegative: `D(ρ‖σ) ≥ 0` for laws `ρ`, `σ`
with `σ` positive wherever `ρ` is.

Paper, proof of Lemma 3.2: "For completeness, nonnegativity of relative entropy follows from
`log t ≤ t − 1`, applied with `t = q(x)/ρ'(x)` and summed over the positive support of `ρ'`."

Form. The paper sums over the positive support of the first argument and then uses that the
second has total mass at most one. Here the inequality of `sub_le_mul_log_div` is summed over
the whole type; at a point off the support of `ρ` it reads `−σ(x) ≤ 0`. Both give
`D(ρ‖σ) ≥ ∑ ρ − ∑ σ = 0`.

Junk values. The hypothesis `h` says that `relEntropy ρ σ` is the honest `D(ρ‖σ)`. Without
it the statement is false: on two points, with `ρ = (1/2, 1/2)` and `σ = (1, 0)`,
`relEntropy ρ σ = (1/2) log(1/2) + 0 < 0`, the second term being a junk value (checked by
hand, not in Lean). -/
theorem relEntropy_nonneg {ρ σ : α → ℝ} (hρ : IsLaw ρ) (hσ : IsLaw σ)
    (h : ∀ x, 0 < ρ x → 0 < σ x) : 0 ≤ relEntropy ρ σ := by
  have key : ∑ x, (ρ x - σ x) ≤ relEntropy ρ σ :=
    Finset.sum_le_sum fun x _ => sub_le_mul_log_div (hρ.nonneg x) (hσ.nonneg x) (h x)
  rwa [Finset.sum_sub_distrib, hρ.sum_eq_one, hσ.sum_eq_one, sub_self] at key

/-- **Support (Lemma 3.2).** "The exact identity"
`D(ρ'‖q) − D(ρ‖q) = D(ρ'‖ρ) + ∑_x (ρ'(x) − ρ(x)) log(ρ(x)/q(x))` of the paper's proof of
Lemma 3.2.

It holds term by term. Where `ρ' x = 0` both sides are `−ρ x log(ρ x/q x)`. Where
`ρ' x ≠ 0`, the hypotheses give `ρ x ≠ 0` and `q x ≠ 0`, and
`log(ρ'/q) = log(ρ'/ρ) + log(ρ/q)`.

Junk values. `h` says that `ρ` is nonzero wherever `ρ'` is, so `relEntropy ρ' ρ` is the honest
`D(ρ'‖ρ)` (PI-008); in Lemma 3.2 it comes from the first assertion. `hq` makes the two
entropies against `q` honest. In the sum on the right, a point with `ρ x = 0` has `ρ' x = 0`
by `h`, so its term is `(0 − 0) * Real.log 0 = 0`: the sum is the paper's sum over the points
where `ρ > 0`. -/
theorem relEntropy_sub_relEntropy {ρ' ρ q : α → ℝ} (hq : ∀ x, q x ≠ 0)
    (h : ∀ x, ρ' x ≠ 0 → ρ x ≠ 0) :
    relEntropy ρ' q - relEntropy ρ q
      = relEntropy ρ' ρ + ∑ x, (ρ' x - ρ x) * Real.log (ρ x / q x) := by
  simp only [relEntropy, ← Finset.sum_sub_distrib, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun x _ => ?_
  by_cases h' : ρ' x = 0
  · rw [h']
    ring
  · rw [Real.log_div h' (hq x), Real.log_div h' (h x h'), Real.log_div (h x h') (hq x)]
    ring

/-- **Support (Lemma 3.2).** Comparison with the normalised restriction:
`D(ρ'‖ρ) = D(ρ'‖ρ(·|S)) − log ρ(S)` when `ρ'` is supported on `S`.

Paper, proof of Lemma 3.2: "if `ρ'` is supported on `S`, comparison with the normalized
restriction `ρ(·|S)` gives `D(ρ'‖ρ) = D(ρ'‖ρ(·|S)) − log ρ(S)`". The normalised restriction is
written out: `fun x => S.indicator ρ x / mass ρ S`, which is `ρ x / ρ(S)` on `S` and `0` off
it (`isLaw_restrict`).

It holds term by term: where `ρ' x ≠ 0` the point is in `S` and
`log(ρ'/(ρ/ρ(S))) = log(ρ'/ρ) + log ρ(S)`; then `∑ ρ' = 1`.

Junk values. `h` makes `relEntropy ρ' ρ` honest (PI-008), and then `ρ(·|S)` is nonzero
wherever `ρ'` is, too. `hm` makes `Real.log (mass ρ S)` and the division by `mass ρ S`
honest. -/
theorem relEntropy_eq_relEntropy_restrict_sub_log {ρ' ρ : α → ℝ} (hρ' : ∑ x, ρ' x = 1)
    (h : ∀ x, ρ' x ≠ 0 → ρ x ≠ 0) {S : Set α} (hS : Function.support ρ' ⊆ S)
    (hm : mass ρ S ≠ 0) :
    relEntropy ρ' ρ
      = relEntropy ρ' (fun x => S.indicator ρ x / mass ρ S) - Real.log (mass ρ S) := by
  have key : ∀ x, ρ' x * Real.log (ρ' x / ρ x)
      = ρ' x * Real.log (ρ' x / (S.indicator ρ x / mass ρ S))
        - ρ' x * Real.log (mass ρ S) := by
    intro x
    by_cases h' : ρ' x = 0
    · rw [h']
      ring
    · have hx : x ∈ S := hS (Function.mem_support.mpr h')
      rw [Set.indicator_of_mem hx, div_div_eq_mul_div,
        Real.log_div (mul_ne_zero h' hm) (h x h'), Real.log_mul h' hm,
        Real.log_div h' (h x h')]
      ring
  unfold relEntropy
  rw [Finset.sum_congr rfl fun x _ => key x, Finset.sum_sub_distrib, ← Finset.sum_mul, hρ',
    one_mul]

/-- **Support (Lemma 3.2).** The last step of the paper's proof of Lemma 3.2, for any law `ρ'`
and any nonnegative weights `ρ` that are positive wherever `ρ'` is: if `ρ'` is supported on
`S` then `−log ρ(S) ≤ D(ρ'‖ρ)`.

Paper: "`D(ρ'‖ρ) = D(ρ'‖ρ(·|S)) − log ρ(S) ≥ −log ρ(S)`", the inequality being the
nonnegativity of `D(ρ'‖ρ(·|S))`.

The third assertion of Lemma 3.2 is this lemma for a minimiser `ρ` and `ρ' ∈ P`, where the
hypothesis `h` is the first assertion. This lemma is more general than the paper's sentence:
`ρ'` need not belong to a set `P` and `ρ` need not be a minimiser or have total mass `1`.

Junk values. `mass ρ S > 0` is proved, not assumed: the law `ρ'` has a point of positive
weight, the point is in `S`, and `ρ` is positive there. So `Real.log (mass ρ S)` is an honest
logarithm. `relEntropy ρ' ρ` is honest by `h` (PI-008). -/
theorem neg_log_mass_le_relEntropy {ρ' ρ : α → ℝ} (hρ' : IsLaw ρ') (hρ : ∀ x, 0 ≤ ρ x)
    (h : ∀ x, 0 < ρ' x → 0 < ρ x) {S : Set α} (hS : Function.support ρ' ⊆ S) :
    -Real.log (mass ρ S) ≤ relEntropy ρ' ρ := by
  obtain ⟨a, ha⟩ := hρ'.exists_pos
  have hm : 0 < mass ρ S := mass_pos hρ (hS (Function.mem_support.mpr ha.ne')) (h a ha)
  have hne : ∀ x, ρ' x ≠ 0 → ρ x ≠ 0 := fun x hx =>
    (h x (lt_of_le_of_ne (hρ'.nonneg x) (Ne.symm hx))).ne'
  have hnn : 0 ≤ relEntropy ρ' (fun x => S.indicator ρ x / mass ρ S) := by
    refine relEntropy_nonneg hρ' (isLaw_restrict hρ hm) fun x hx => ?_
    rw [Set.indicator_of_mem (hS (Function.mem_support.mpr hx.ne'))]
    exact div_pos (h x hx) hm
  rw [relEntropy_eq_relEntropy_restrict_sub_log hρ'.sum_eq_one hne hS hm.ne']
  linarith

end Hadwiger
