import Hadwiger.Defs.Minor
import Hadwiger.Defs.ConnectedMatching
import Hadwiger.Defs.FractionalColoring

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

Blueprint entries: `T-1.1`, `C-1.2`, `D-1.HC`, `T-FINAL`, `T-NOT-HC`.

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
the middle inequality fails for `m = 0`. -/
theorem exists_hadwigerNumber_lt_fractionalChromaticNumber :
    ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), ∃ k : ℕ,
      G.chromaticNumber = k ∧
      (hadwigerNumber G : ℝ) < 26 * (m : ℝ) / 75 + 2 / 3 ∧
      26 * (m : ℝ) / 75 + 2 / 3 < (m : ℝ) / 2 ∧
      (m : ℝ) / 2 ≤ fractionalChromaticNumber G ∧
      fractionalChromaticNumber G ≤ k := by
  sorry

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

end Hadwiger
