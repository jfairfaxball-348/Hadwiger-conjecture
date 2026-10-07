import Hadwiger.Defs.FractionalColoring
import Hadwiger.Sanity.FractionalColoring

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

All three were proved at milestone M1, following the paper's sentences quoted above. The
proofs of `S-1.b` and `S-1.c` use general lemmas about fractional colourings that were
proved at milestone M0 and live in `Hadwiger/Sanity/FractionalColoring.lean`
(`FractionalColoring.card_le_mul_total`, `exists_fractionalColoring_of_family`,
`fractionalChromaticNumber_le_total`, `le_fractionalChromaticNumber`,
`range_total_nonempty`); that file is imported here for them. The reason for importing
instead of moving them is recorded in `docs/SESSION_LOG.md` (M1 session).
-/

namespace Hadwiger

variable {V : Type*} [Fintype V]

/-- **Section 1, colour-class bound.** In a proper colouring with `k` colours every colour
class is independent, so `|V| ≤ α(G) · k`. Taking `k = χ(G)` gives `χ(G) ≥ |V|/α(G)`. -/
theorem card_le_indepNum_mul_of_colorable (G : SimpleGraph V) {k : ℕ} (h : G.Colorable k) :
    Fintype.card V ≤ G.indepNum * k := by
  classical
  obtain ⟨C⟩ := h
  have hclass : ∀ c : Fin k, (Finset.univ.filter fun v => C v = c).card ≤ G.indepNum := fun c =>
    SimpleGraph.IsIndepSet.card_le_indepNum fun v hv w hw _ =>
      C.not_adj_of_mem_colorClass (c := c) (Finset.mem_filter.mp (Finset.mem_coe.mp hv)).2
        (Finset.mem_filter.mp (Finset.mem_coe.mp hw)).2
  calc Fintype.card V = ∑ c : Fin k, (Finset.univ.filter fun v => C v = c).card := by
        rw [← Finset.card_univ]
        exact Finset.card_eq_sum_card_fiberwise fun v _ => Finset.mem_univ (C v)
    _ ≤ ∑ _c : Fin k, G.indepNum := Finset.sum_le_sum fun c _ => hclass c
    _ = G.indepNum * k := by simp [mul_comm]

/-- **Section 1, fractional bound** (first half of the proof of Corollary 1.2):
`|V| ≤ α(G) · χ_f(G)`, that is `χ_f(G) ≥ |V|/α(G)`. -/
theorem card_le_indepNum_mul_fractionalChromaticNumber (G : SimpleGraph V) :
    (Fintype.card V : ℝ) ≤ G.indepNum * fractionalChromaticNumber G := by
  have key : ∀ w : FractionalColoring G, (Fintype.card V : ℝ) ≤ G.indepNum * w.total :=
    fun w => w.card_le_mul_total G.indepNum fun _ hs => hs.card_le_indepNum
  rcases Nat.eq_zero_or_pos G.indepNum with h0 | hpos
  · obtain ⟨_, w, rfl⟩ := range_total_nonempty G
    have hw := key w
    rw [h0] at hw ⊢
    simpa using hw
  · have hpos' : (0 : ℝ) < G.indepNum := by exact_mod_cast hpos
    exact (div_le_iff₀' hpos').mp
      (le_fractionalChromaticNumber fun w => (div_le_iff₀' hpos').mpr (key w))

/-- **Section 1, `χ_f ≤ χ`.** A proper colouring with `k` colours gives a fractional
colouring of total weight at most `k`. Taking `k = χ(G)` gives `χ_f(G) ≤ χ(G)`. -/
theorem fractionalChromaticNumber_le_of_colorable (G : SimpleGraph V) {k : ℕ}
    (h : G.Colorable k) : fractionalChromaticNumber G ≤ k := by
  classical
  obtain ⟨C⟩ := h
  obtain ⟨w, hw⟩ := exists_fractionalColoring_of_family (G := G)
    (fun c : Fin k => Finset.univ.filter fun v => C v = c) (fun _ => (1 : ℝ)) (fun _ => zero_le_one)
    (fun c v hv w hw _ =>
      C.not_adj_of_mem_colorClass (c := c) (Finset.mem_filter.mp (Finset.mem_coe.mp hv)).2
        (Finset.mem_filter.mp (Finset.mem_coe.mp hw)).2)
    (fun v => by simp)
  calc fractionalChromaticNumber G ≤ w.total := fractionalChromaticNumber_le_total w
    _ = k := by rw [hw]; simp

end Hadwiger
