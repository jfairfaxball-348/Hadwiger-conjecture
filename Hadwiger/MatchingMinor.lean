import Hadwiger.Defs.Minor
import Hadwiger.Defs.ConnectedMatching

/-!
# The clique-minor bound from connected matchings (Proposition 3.5)

Paper, Section 3.3, Proposition 3.5 (`prop:matching-minor`):

"For every finite nonempty graph `G` of order `m`,
`h(G) ≤ (m + 4 cm(G) + 2)/3`.
In particular, if `α(G) ≤ 2` and `cm(G) < m/100`, then
`h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)` (`m ≥ 5`)."

Blueprint entries: `P-3.5` (two Lean statements). Milestone M2 (first assertion) and
M1 (second assertion).
-/

namespace Hadwiger

variable {V : Type*} [Fintype V]

/-- **Proposition 3.5, first assertion.** `h(G) ≤ (m + 4 cm(G) + 2)/3`, stated without
division as `3 h(G) ≤ m + 4 cm(G) + 2`. For natural numbers `h`, `m`, `c` the inequality
`h ≤ (m + 4c + 2)/3` over the reals is equivalent to `3h ≤ m + 4c + 2` over the naturals. -/
theorem three_mul_hadwigerNumber_le [Nonempty V] (G : SimpleGraph V) :
    3 * hadwigerNumber G ≤ Fintype.card V + 4 * connectedMatchingNumber G + 2 := by
  sorry

/-- **Proposition 3.5, second assertion.** If `α(G) ≤ 2`, `cm(G) < m/100` and `m ≥ 5`, then
`h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)`.

`cm(G) < m/100` is stated as `100 cm(G) < m`. The chromatic number is Mathlib's
`chromaticNumber : ℕ∞`; the statement exhibits it as a natural number `k` and compares in
`ℝ`, so no junk value of a cast can enter. -/
theorem hadwigerNumber_lt_of_indepNum_le_two (G : SimpleGraph V)
    (hα : G.indepNum ≤ 2)
    (hcm : 100 * connectedMatchingNumber G < Fintype.card V)
    (hm : 5 ≤ Fintype.card V) :
    ∃ k : ℕ, G.chromaticNumber = k ∧
      (hadwigerNumber G : ℝ) < 26 * (Fintype.card V : ℝ) / 75 + 2 / 3 ∧
      26 * (Fintype.card V : ℝ) / 75 + 2 / 3 < (Fintype.card V : ℝ) / 2 ∧
      (Fintype.card V : ℝ) / 2 ≤ k := by
  sorry

end Hadwiger
