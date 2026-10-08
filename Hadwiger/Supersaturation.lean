import Hadwiger.HoleRelation
import Hadwiger.Defs.Law
import Hadwiger.Defs.HoleRel

/-!
# The supersaturation hypothesis (Section 3, opening paragraph and Theorem 3.1)

Paper, Section 3 (`sec:distributions`):

"A *unit* is an ordered pair of raw vertices with no hole between its endpoints. The
endpoints of a unit may be dependent. When two units are sampled independently, their four
endpoints need not be independent within either unit. The event of interest is that all four
cross pairs have holes".

Theorem 3.1 (`thm:raw-supersaturation`): "… for all sufficiently large `n`, every probability
law `σ` on units satisfying `σ_1 ≤ M μ`, `σ_2 ≤ M μ`, `σ ≤ 2^{DN} μ^2` (3.1) has the following
property: two independent units drawn from `σ` have all four cross holes with probability at
least `2^{-100gN}`."

**Theorem 3.1 is not stated in this file.** What is here is its *conclusion*, as a property
`HoleRel.Supersaturated` of an abstract hole relation, a law and three real numbers. By the
user's decision of 2026-10-07, Proposition 3.4 assumes it in that abstract form. Theorem 3.1
itself needs the paper's construction and is left to milestone M5; its statement will be
`Supersaturated` for the paper's `Ω_n`, `μ_n`, `M = 2^1000`, `B = 2^{DN}` and
`ε = 2^{-100gN}`.

Also here: the hole relation of the linear data of Section 2.1 as an instance of the
abstract one (`HoleData.holeRel`), and the probability that two independent units conflict.

Everything here is **new**. Blueprint entries: `D-3.rel`, `D-3.confl`, `D-3.sup`. Milestone
M4, first slice. Fidelity notes: F-HOLEREL, F-CONFLPROB, F-SUP.
-/

namespace Hadwiger

namespace HoleData

variable {X V Ω : Type*} [AddCommGroup X] [Module (ZMod 2) X]
  [AddCommGroup V] [Module (ZMod 2) V]

/-- The hole relation of Definition 2.1 as an abstract hole relation. The three fields are
the three parts of Lemma 2.2, all proved (milestone M3): `Hole.symm`, `not_hole_self`,
`not_hole_triangle`.

This is how the signed-off Section 2.1 is an instance of the abstract setting of Section 3:
see `positionGraph_holeRel`. -/
def holeRel (D : HoleData X V Ω) : HoleRel Ω where
  Rel := D.Hole
  symm := Hole.symm
  irrefl := D.not_hole_self
  triangle_free := D.not_hole_triangle

/-- The graph on positions for the abstract relation `D.holeRel` is the signed-off graph on
positions `D.positionGraph` of Section 2.1. The two definitions unfold to the same thing. -/
theorem positionGraph_holeRel (D : HoleData X V Ω) {m : ℕ} (o : Fin m → Ω) :
    D.holeRel.positionGraph o = D.positionGraph o :=
  rfl

end HoleData

namespace HoleRel

variable {Ω : Type*} [Fintype Ω]

/-- **The probability that two independent units drawn from `σ` conflict**: the mass, under
the product `σ ⊗ σ` on pairs of ordered pairs, of the set of pairs `(u, v)` with all four
cross holes. That is `∑ σ(u) σ(v)` over the conflicting `(u, v)`.

Theorem 3.1: "two independent units drawn from `σ` have all four cross holes with
probability …". -/
noncomputable def conflictProb (H : HoleRel Ω) (σ : Ω × Ω → ℝ) : ℝ :=
  mass (prodLaw σ σ) {z : (Ω × Ω) × (Ω × Ω) | H.Conflict z.1 z.2}

/-- **The conclusion of Theorem 3.1, as a property.** `H.Supersaturated μ M B ε` says: every
law `σ` on units that satisfies the three caps `σ_1 ≤ M μ`, `σ_2 ≤ M μ`, `σ ≤ B μ^2` gives
two independent units all four cross holes with probability at least `ε`.

In the paper `H` is the hole relation on `Ω_n`, `μ = μ_n`, `M = 2^1000`, `B = 2^{DN}` and
`ε = 2^{-100gN}`. Here they are an arbitrary hole relation on a finite type, an arbitrary
weight function and arbitrary real numbers.

A "law on units" is read as a law on all ordered pairs that vanishes off the units: its
support, Mathlib's `Function.support σ = {u | σ u ≠ 0}`, is contained in the set of units
(`blueprint/PAPER_ISSUES.md`, PI-007).

The property can hold for an empty reason, when no law on units satisfies the caps: for
instance whenever `M < 1` (`Hadwiger.HoleRel.supersaturated_of_lt_one`). It holds trivially
when `ε ≤ 0` (`Hadwiger.HoleRel.supersaturated_of_nonpos`). -/
def Supersaturated (H : HoleRel Ω) (μ : Ω → ℝ) (M B ε : ℝ) : Prop :=
  ∀ σ : Ω × Ω → ℝ, IsLaw σ → Function.support σ ⊆ {u | H.IsUnit u} →
    SatisfiesCaps μ M B σ → ε ≤ H.conflictProb σ

end HoleRel

end Hadwiger
