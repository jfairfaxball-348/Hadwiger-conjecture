import Hadwiger.Defs.FractionalColoring

/-!
# Lower bounds on the (fractional) chromatic number from the independence number

Paper, Section 1 (text before Corollary 1.2, and the first half of its proof):

* "Every color class has size at most `α(G)`, so `χ(G) ≥ |V(G)|/α(G)`."
* "Summing the vertex constraints of any fractional coloring gives
  `|V(G)| ≤ ∑_I |I| w_I ≤ α(G) ∑_I w_I`. Hence `χ_f(G) ≥ |V(G)|/α(G)`."
* "An ordinary coloring gives a fractional coloring with unit weights on its color classes,
  so `χ_f(G) ≤ χ(G)`."

Blueprint entries: `S-1.a`, `S-1.b`, `S-1.c`. Milestone M1.

All three are stated without division: `|V| ≤ α · χ` instead of `χ ≥ |V|/α`. The two forms
are equivalent whenever `α(G) > 0`, which holds for every nonempty graph.
-/

namespace Hadwiger

variable {V : Type*} [Fintype V]

/-- **Section 1, colour-class bound.** In a proper colouring with `k` colours every colour
class is independent, so `|V| ≤ α(G) · k`. Taking `k = χ(G)` gives `χ(G) ≥ |V|/α(G)`. -/
theorem card_le_indepNum_mul_of_colorable (G : SimpleGraph V) {k : ℕ} (h : G.Colorable k) :
    Fintype.card V ≤ G.indepNum * k := by
  sorry

/-- **Section 1, fractional bound** (first half of the proof of Corollary 1.2):
`|V| ≤ α(G) · χ_f(G)`, that is `χ_f(G) ≥ |V|/α(G)`. -/
theorem card_le_indepNum_mul_fractionalChromaticNumber (G : SimpleGraph V) :
    (Fintype.card V : ℝ) ≤ G.indepNum * fractionalChromaticNumber G := by
  sorry

/-- **Section 1, `χ_f ≤ χ`.** A proper colouring with `k` colours gives a fractional
colouring of total weight at most `k`. Taking `k = χ(G)` gives `χ_f(G) ≤ χ(G)`. -/
theorem fractionalChromaticNumber_le_of_colorable (G : SimpleGraph V) {k : ℕ}
    (h : G.Colorable k) : fractionalChromaticNumber G ≤ k := by
  sorry

end Hadwiger
