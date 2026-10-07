import Hadwiger.Defs.Minor
import Hadwiger.Defs.ConnectedMatching
import Hadwiger.Defs.FractionalColoring
import Hadwiger.ChromaticBounds
import Hadwiger.MatchingMinor

/-!
# The main statements

Paper, Section 1:

* Theorem 1.1 (`thm:main`): "There are arbitrarily large integers `m` for which an
  `m`-vertex finite simple graph `G` satisfies `α(G) ≤ 2` and `cm(G) < m/100`."
* Corollary 1.2 (`cor:hadwiger`): "There are finite nonempty simple graphs `G` of
  arbitrarily large order `m` for which `h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`.
  Thus Hadwiger's conjecture and its fractional-coloring weakening `χ_f(G) ≤ h(G)` are
  false."
* Hadwiger's conjecture, as the paper states it: "`h(G) ≥ χ(G)` for every finite nonempty
  simple graph `G`."

Blueprint entries: `T-1.1`, `C-1.2`, `D-1.HC`, `T-FINAL`, `T-NOT-HC`, `D-1.fHC`, `S-1.d`.

An `m`-vertex finite simple graph is a `SimpleGraph (Fin m)`. "Arbitrarily large `m`" is
`∀ N, ∃ m ≥ N`.
-/

namespace Hadwiger

/-- **Theorem 1.1.** There are arbitrarily large `m` for which some `m`-vertex graph `G` has
`α(G) ≤ 2` and `cm(G) < m/100`. The last inequality is stated as `100 cm(G) < m`. -/
theorem exists_indepNum_le_two_and_connectedMatchingNumber_lt :
    ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m),
      G.indepNum ≤ 2 ∧ 100 * connectedMatchingNumber G < m := by
  sorry

/-- **Corollary 1.2.** There are graphs `G` of arbitrarily large order `m` with
`h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`.

The chromatic number is Mathlib's `chromaticNumber : ℕ∞`; the statement exhibits it as a
natural number `k` and compares in `ℝ`. Nonemptiness of `G` is not a separate hypothesis:
the middle inequality fails for `m = 0`.

Proof, as in the paper: take a graph from Theorem 1.1 with `m ≥ 5`; the second assertion of
Proposition 3.5 gives the first two inequalities; `|V| ≤ α(G) · χ_f(G)` with `α(G) ≤ 2`
gives the third; and `χ_f(G) ≤ χ(G)` is the fourth. Theorem 1.1 is still `sorry`, so this
theorem is `PROVED_MODULO`. Nothing else beneath it is open since milestone M2. -/
theorem exists_hadwigerNumber_lt_fractionalChromaticNumber :
    ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), ∃ k : ℕ,
      G.chromaticNumber = k ∧
      (hadwigerNumber G : ℝ) < 26 * (m : ℝ) / 75 + 2 / 3 ∧
      26 * (m : ℝ) / 75 + 2 / 3 < (m : ℝ) / 2 ∧
      (m : ℝ) / 2 ≤ fractionalChromaticNumber G ∧
      fractionalChromaticNumber G ≤ k := by
  intro N
  obtain ⟨m, hm, G, hα, hcm⟩ := exists_indepNum_le_two_and_connectedMatchingNumber_lt (max N 5)
  obtain ⟨k, hk, h1, h2, -⟩ := hadwigerNumber_lt_of_indepNum_le_two G hα
    (by rw [Fintype.card_fin]; exact hcm)
    (by rw [Fintype.card_fin]; exact (le_max_right N 5).trans hm)
  rw [Fintype.card_fin] at h1 h2
  refine ⟨m, (le_max_left N 5).trans hm, G, k, hk, h1, h2, ?_,
    fractionalChromaticNumber_le_of_colorable G
      (SimpleGraph.chromaticNumber_le_iff_colorable.mp hk.le)⟩
  have hb := card_le_indepNum_mul_fractionalChromaticNumber G
  rw [Fintype.card_fin] at hb
  have hα' : (G.indepNum : ℝ) ≤ 2 := by exact_mod_cast hα
  have hmul := mul_le_mul_of_nonneg_right hα' (fractionalChromaticNumber_nonneg G)
  linarith

/-- **Final theorem.** There are finite simple graphs of arbitrarily large order whose
chromatic number exceeds their Hadwiger number.

The comparison is in `ℕ∞`, where Mathlib's chromatic number lives. Derived from
Corollary 1.2. -/
theorem exists_hadwigerNumber_lt_chromaticNumber :
    ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m),
      (hadwigerNumber G : ℕ∞) < G.chromaticNumber := by
  intro N
  obtain ⟨m, hm, G, k, hk, h1, h2, h3, h4⟩ :=
    exists_hadwigerNumber_lt_fractionalChromaticNumber N
  refine ⟨m, hm, G, ?_⟩
  have hreal : (hadwigerNumber G : ℝ) < (k : ℝ) := by linarith
  have hnat : hadwigerNumber G < k := by exact_mod_cast hreal
  rw [hk]
  exact_mod_cast hnat

/-- **Hadwiger's conjecture**, as stated in Section 1 of the paper: `h(G) ≥ χ(G)` for every
finite nonempty simple graph `G`. Vertex types range over `Type` (universe 0), which
contains every finite graph up to isomorphism. -/
def HadwigerConjecture : Prop :=
  ∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V),
    G.chromaticNumber ≤ (hadwigerNumber G : ℕ∞)

/-- **Hadwiger's conjecture is false.** Derived from the final theorem. -/
theorem not_hadwigerConjecture : ¬ HadwigerConjecture := by
  intro hHC
  obtain ⟨m, hm, G, hG⟩ := exists_hadwigerNumber_lt_chromaticNumber 1
  have : Nonempty (Fin m) := ⟨⟨0, by omega⟩⟩
  exact absurd (hHC (Fin m) G) (not_le.mpr hG)

/-- **The fractional-colouring weakening of Hadwiger's conjecture**, as named in the last
sentence of Corollary 1.2: `χ_f(G) ≤ h(G)`. The paper writes only the inequality; the
quantifier "for every finite nonempty simple graph `G`" is taken from its statement of
Hadwiger's conjecture, of which this is called the weakening. The comparison is in `ℝ`,
where `fractionalChromaticNumber` lives. Vertex types range over `Type`, as in
`HadwigerConjecture`.

Defined on the user's decision of 2026-10-07 (question Q6 of the M0 review sheet). -/
def FractionalHadwigerConjecture : Prop :=
  ∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V),
    fractionalChromaticNumber G ≤ (hadwigerNumber G : ℝ)

/-- **The fractional-colouring weakening of Hadwiger's conjecture is false** (Corollary 1.2,
last sentence). Derived from Corollary 1.2, which gives graphs with
`h(G) < m/2 ≤ χ_f(G)`. Corollary 1.2 rests on Theorem 1.1, which is still `sorry`, so this
theorem is `PROVED_MODULO`. -/
theorem not_fractionalHadwigerConjecture : ¬ FractionalHadwigerConjecture := by
  intro hF
  obtain ⟨m, hm, G, k, -, h1, h2, h3, -⟩ :=
    exists_hadwigerNumber_lt_fractionalChromaticNumber 1
  have : Nonempty (Fin m) := ⟨⟨0, by omega⟩⟩
  have h4 := hF (Fin m) G
  linarith

end Hadwiger
