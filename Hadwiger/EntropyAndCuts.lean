import Hadwiger.Defs.Law
import Hadwiger.Defs.RelEntropy

/-!
# Entropy minimizers and terminal cuts (Section 3.1)

Paper, Section 3.1 ("Entropy minimizers and terminal cuts"): Lemma 3.2
(`lem:entropy-support`), the information-projection lemma, and Lemma 3.3
(`lem:terminal-cut`), the max-flow/min-cut lemma for the three caps of equation (3.1).

**Both lemmas are stated here and neither is proved**: each proof is `sorry` (milestone M4,
first slice, statements only). By the user's decision of 2026-10-07 no proof is written
before the statements are signed off. The user signed off both statements on 2026-10-08
(`blueprint/M4_REVIEW_SHEET.md`, items R-30 and R-31), so the proofs are the next slices.

Lemma 3.3 is stated in the abstract setting: any finite type with a law, in place of the
paper's `Ω_n` with `μ_n`, and real numbers `M`, `B` in place of `M = 2^1000` and `2^{DN}`.

Blueprint entries: `L-3.2`, `L-3.3`. Fidelity notes: `blueprint/FIDELITY.md`, L-3.2 and
L-3.3.
-/

namespace Hadwiger

section EntropySupport

variable {α : Type*} [Fintype α]

/-- **Lemma 3.2, first assertion.** "Let `P` be a nonempty compact convex set of probability
measures on a finite set, and let `ρ` minimize `D(·‖q)` on `P`. Then `ρ` is positive on the
union of the supports of measures in `P`." Here `q` is a strictly positive probability
measure (Section 3.1).

Form. A probability measure on the finite type `α` is a function `α → ℝ` with `IsLaw`; `P` is
a set of such functions, compact and convex in `α → ℝ`. "Nonempty" is not a separate
hypothesis: it follows from `ρ ∈ P`. "`ρ` minimizes" is `ρ ∈ P` together with
`relEntropy ρ q ≤ relEntropy ρ' q` for every `ρ' ∈ P`. The support of `ρ'` is Mathlib's
`Function.support ρ' = {x | ρ' x ≠ 0}`.

Not proved: `sorry`. -/
theorem relEntropy_minimizer_pos {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
    (hconv : Convex ℝ P) (hcomp : IsCompact P)
    {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
    {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q) :
    ∀ x ∈ ⋃ ρ' ∈ P, Function.support ρ', 0 < ρ x := by
  sorry

/-- **Lemma 3.2, second assertion.** With `P`, `q` and the minimizer `ρ` as in the first
assertion: "For every `ρ' ∈ P`, `D(ρ'‖q) − D(ρ‖q) ≥ D(ρ'‖ρ)`."

Form. The paper defines `D(·‖q)` for strictly positive `q`, and `ρ` need not be strictly
positive. By the first assertion `ρ` is positive wherever `ρ'` is, so every term of
`relEntropy ρ' ρ` with `ρ' x > 0` has `ρ x > 0`, and `relEntropy ρ' ρ` is the honest value of
`D(ρ'‖ρ)`, not a junk value (`blueprint/PAPER_ISSUES.md`, PI-008).

Not proved: `sorry`. -/
theorem relEntropy_le_sub_of_minimizer {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
    (hconv : Convex ℝ P) (hcomp : IsCompact P)
    {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
    {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q)
    {ρ' : α → ℝ} (hρ' : ρ' ∈ P) :
    relEntropy ρ' ρ ≤ relEntropy ρ' q - relEntropy ρ q := by
  sorry

/-- **Lemma 3.2, third assertion.** With `P`, `q`, the minimizer `ρ` and `ρ' ∈ P` as in the
second assertion: "If `ρ'` is supported on a set `S`, the right side is at least
`−log ρ(S)`." The right side is `D(ρ'‖ρ)`.

Form. "`ρ'` is supported on `S`" is `Function.support ρ' ⊆ S`. `ρ(S)` is `mass ρ S`. It is
positive: `ρ'` is a law, so its support has a point, that point is in `S`, and `ρ` is
positive there by the first assertion. So `Real.log (mass ρ S)` is an honest logarithm, not
the junk value `Real.log 0 = 0`.

Not proved: `sorry`. -/
theorem neg_log_mass_le_relEntropy_of_minimizer {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
    (hconv : Convex ℝ P) (hcomp : IsCompact P)
    {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
    {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q)
    {ρ' : α → ℝ} (hρ' : ρ' ∈ P) {S : Set α} (hS : Function.support ρ' ⊆ S) :
    -Real.log (mass ρ S) ≤ relEntropy ρ' ρ := by
  sorry

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
