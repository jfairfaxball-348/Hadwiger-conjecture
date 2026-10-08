module

public import Mathlib

@[expose] public section

/-!
# Fractional colourings and the fractional chromatic number

Paper, Section 1: "For a finite nonempty simple graph `G`, let `I(G)` be the family of its
independent vertex sets. A fractional coloring assigns a nonnegative real weight `w_I` to
every `I ∈ I(G)` such that `∑_{I ∋ v} w_I ≥ 1` for every vertex `v`. The ordinary fractional
chromatic number `χ_f(G)` is the minimum of `∑_I w_I` over these assignments."

Mathlib (at the pinned commit) has no fractional chromatic number, so everything in this
file is **new**. Independent sets are Mathlib's `SimpleGraph.IsIndepSet`.
Blueprint entries: `D-1.fcol`, `D-1.chif`.

Fidelity notes are in `blueprint/FIDELITY.md` (F-FCOL, F-CHIF).
-/

namespace Hadwiger

open Finset

variable {V : Type*} [Fintype V]

open Classical in
/-- A *fractional colouring* of a finite graph `G`: nonnegative real weights on vertex sets,
supported on independent sets, such that the sets containing any given vertex have total
weight at least `1`.

The paper puts a weight on each independent set. Here the weight is a function on all
finite vertex sets that is required to vanish off the independent ones; the two are the same
data (extend by zero). -/
structure FractionalColoring (G : SimpleGraph V) where
  /-- The weight of each vertex set. -/
  weight : Finset V → ℝ
  /-- Weights are nonnegative. -/
  nonneg : ∀ s, 0 ≤ weight s
  /-- Only independent sets carry weight. -/
  indep : ∀ s, weight s ≠ 0 → G.IsIndepSet (s : Set V)
  /-- The sets containing a given vertex have total weight at least `1`. -/
  cover : ∀ v, 1 ≤ ∑ s ∈ univ.filter (fun s : Finset V => v ∈ s), weight s

/-- The total weight `∑_I w_I` of a fractional colouring. -/
noncomputable def FractionalColoring.total {G : SimpleGraph V} (w : FractionalColoring G) : ℝ :=
  ∑ s, w.weight s

/-- The fractional chromatic number `χ_f(G)` of a finite graph: the infimum of the total
weights of its fractional colourings.

The paper says "minimum". The infimum is attained (the feasible region is a closed
polyhedron and the objective is bounded below on it), so the two agree; attainment is not
needed for any statement in this project and is not asserted here. -/
noncomputable def fractionalChromaticNumber (G : SimpleGraph V) : ℝ :=
  sInf (Set.range (FractionalColoring.total (G := G)))

end Hadwiger
