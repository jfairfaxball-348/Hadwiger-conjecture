import Hadwiger.Defs.Minor
import Hadwiger.Defs.ConnectedMatching
import Hadwiger.ChromaticBounds

/-!
# The clique-minor bound from connected matchings (Proposition 3.5)

Paper, Section 3.3, Proposition 3.5 (`prop:matching-minor`):

"For every finite nonempty graph `G` of order `m`,
`h(G) ≤ (m + 4 cm(G) + 2)/3`.
In particular, if `α(G) ≤ 2` and `cm(G) < m/100`, then
`h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)` (`m ≥ 5`)."

Blueprint entries: `P-3.5` (two Lean statements). Milestone M2 (first assertion) and
M1 (second assertion).

The second assertion has had a complete proof body since milestone M1. It is the paper's
"final assertion" argument and it uses the first assertion, which is still `sorry`. So the
second assertion is `PROVED_MODULO`, and the entry `P-3.5` stays `STATED`.
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
`ℝ`, so no junk value of a cast can enter.

Proof, as in the paper: the first assertion with `cm(G) < m/100` gives the first inequality;
the second is arithmetic for `m ≥ 5`; and every colour class has at most two vertices
(`card_le_indepNum_mul_of_colorable`), which gives the third. The first assertion
(`three_mul_hadwigerNumber_le`) is still `sorry`, so this theorem is `PROVED_MODULO`. -/
theorem hadwigerNumber_lt_of_indepNum_le_two (G : SimpleGraph V)
    (hα : G.indepNum ≤ 2)
    (hcm : 100 * connectedMatchingNumber G < Fintype.card V)
    (hm : 5 ≤ Fintype.card V) :
    ∃ k : ℕ, G.chromaticNumber = k ∧
      (hadwigerNumber G : ℝ) < 26 * (Fintype.card V : ℝ) / 75 + 2 / 3 ∧
      26 * (Fintype.card V : ℝ) / 75 + 2 / 3 < (Fintype.card V : ℝ) / 2 ∧
      (Fintype.card V : ℝ) / 2 ≤ k := by
  have hne : Nonempty V := Fintype.card_pos_iff.mp (by omega)
  obtain ⟨k, hk⟩ := ENat.ne_top_iff_exists.mp
    (SimpleGraph.chromaticNumber_ne_top_iff_exists.mpr ⟨_, G.colorable_of_fintype⟩)
  have hcol : G.Colorable k := SimpleGraph.chromaticNumber_le_iff_colorable.mp hk.ge
  have hm' : (5 : ℝ) ≤ Fintype.card V := by exact_mod_cast hm
  refine ⟨k, hk.symm, ?_, ?_, ?_⟩
  · have h1 : (3 : ℝ) * hadwigerNumber G
        ≤ Fintype.card V + 4 * connectedMatchingNumber G + 2 := by
      exact_mod_cast three_mul_hadwigerNumber_le G
    have h2 : (100 : ℝ) * connectedMatchingNumber G < Fintype.card V := by
      exact_mod_cast hcm
    linarith
  · linarith
  · have h1 : Fintype.card V ≤ 2 * k :=
      (card_le_indepNum_mul_of_colorable G hcol).trans (Nat.mul_le_mul_right k hα)
    have h2 : (Fintype.card V : ℝ) ≤ 2 * k := by exact_mod_cast h1
    linarith

end Hadwiger
