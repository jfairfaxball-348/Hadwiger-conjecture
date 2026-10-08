import Mathlib

/-!
# Laws on a finite type

Section 3 of the paper speaks of probability laws on finite sets: the law `μ = μ_n` on the
raw vertices, laws `σ` on units with their marginals `σ_1`, `σ_2`, the product law `μ^2`,
laws `ρ`, `q` on an arbitrary finite set (Section 3.1), and the law of `m` independent raw
vertices (Section 2.4, last paragraph). The paper does not define "probability law on a
finite set"; it is the standard notion, a function with nonnegative values that add up to
one. "The inequalities in (3.1) are pointwise inequalities of measures on the finite raw
spaces" (Theorem 3.1).

Representation chosen here, **put to the user as question Q1 of
`blueprint/M4_REVIEW_SHEET.md` and not yet signed off**: a law on a finite type `α` is a
function `p : α → ℝ` satisfying the predicate `IsLaw`. Sums are finite sums over the type.
No measure theory is used.

Everything in this file is **new**. What Mathlib has, and why it is not used, is in
`blueprint/FIDELITY.md` (F-LAW). In short: Mathlib's set `stdSimplex ℝ α` has the same
defining formula as `IsLaw` but is deprecated at the pinned commit; its replacement
`Convexity.StdSimplex ℝ α` is a bundled structure whose weight functions are exactly the
laws in the sense of this file (proved: `Hadwiger.isLaw_iff_exists_stdSimplex`); `PMF` and
`MeasureTheory.Measure` take values in `ℝ≥0∞`.

Blueprint entries: `D-3.law`, `D-3.marg`, `D-3.caps`, `D-3.list`. Milestone M4, first slice.
Fidelity notes: F-LAW, F-MARG, F-CAPS, F-LIST.
-/

namespace Hadwiger

variable {α β : Type*}

/-- A **law** (probability law) on a finite type `α`: real weights `p x ≥ 0` with
`∑ x, p x = 1`.

The paper uses "probability law", "probability measure" and "law" for this notion without
defining it (Section 3). There is no law on an empty type, because the empty sum is `0`. -/
structure IsLaw [Fintype α] (p : α → ℝ) : Prop where
  /-- The weights are nonnegative. -/
  nonneg : ∀ x, 0 ≤ p x
  /-- The weights add up to one. -/
  sum_eq_one : ∑ x, p x = 1

/-- `mass p S` is `p(S) = ∑_{x ∈ S} p(x)`, the mass that the weight function `p` gives to the
set `S`. When `p` is a law this is the probability of the event `S`.

It is written as the sum over the whole type of Mathlib's `Set.indicator S p`, which is `p x`
for `x ∈ S` and `0` otherwise. The paper writes `μ(S)`, `μ^2(E_0)`, `ρ(S)`. -/
noncomputable def mass [Fintype α] (p : α → ℝ) (S : Set α) : ℝ :=
  ∑ x, S.indicator p x

/-- The first marginal `σ_1` of a weight function `σ` on pairs: `σ_1(x) = ∑_y σ(x, y)`. -/
def marginalFst [Fintype β] (σ : α × β → ℝ) (x : α) : ℝ :=
  ∑ y, σ (x, y)

/-- The second marginal `σ_2` of a weight function `σ` on pairs: `σ_2(y) = ∑_x σ(x, y)`. -/
def marginalSnd [Fintype α] (σ : α × β → ℝ) (y : β) : ℝ :=
  ∑ x, σ (x, y)

/-- The product of two weight functions: `(p ⊗ q)(x, y) = p(x) q(y)`. The paper's `μ^2` is
`prodLaw μ μ`; the law of two independent units drawn from `σ` is `prodLaw σ σ`. -/
def prodLaw (p : α → ℝ) (q : β → ℝ) : α × β → ℝ :=
  fun z => p z.1 * q z.2

/-- **The three caps of equation (3.1)** (`eq:raw-law-caps`):

`σ_1 ≤ M μ`,  `σ_2 ≤ M μ`,  `σ ≤ B μ^2`,

as pointwise inequalities of weights. `M` is the marginal cap (the paper's `M = 2^1000`) and
`B` is the joint cap (the paper's `2^{DN}`); both are arbitrary real numbers here.

The paper: "The inequalities in (3.1) are pointwise inequalities of measures on the finite
raw spaces." An inequality of measures on a finite set holds for all sets exactly when it
holds for all points. -/
structure SatisfiesCaps [Fintype α] (μ : α → ℝ) (M B : ℝ) (σ : α × α → ℝ) : Prop where
  /-- `σ_1 ≤ M μ`. -/
  fst : ∀ x, marginalFst σ x ≤ M * μ x
  /-- `σ_2 ≤ M μ`. -/
  snd : ∀ y, marginalSnd σ y ≤ M * μ y
  /-- `σ ≤ B μ^2`. -/
  joint : ∀ z, σ z ≤ B * prodLaw μ μ z

/-- **The law of a list of `m` independent `μ`-elements**: the list `o_1, …, o_m`, as a
function `o : Fin m → α`, has weight `∏_i μ(o_i)`.

Paper, Section 2.4, last paragraph: "Sample `m` raw vertices independently with law `μ_n`".
The probability of an event `E` about such a list is `mass (listLaw μ m) E`. -/
def listLaw (μ : α → ℝ) (m : ℕ) : (Fin m → α) → ℝ :=
  fun o => ∏ i, μ (o i)

end Hadwiger
