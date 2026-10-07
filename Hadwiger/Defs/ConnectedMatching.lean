import Mathlib

/-!
# Connected matchings

Paper, Section 1: "Two disjoint edges are *touching* if an edge joins their endpoint sets.
A *connected matching* is a matching whose edges are pairwise touching; write `cm(G)` for
its maximum size. The word connected in this definition requires adjacency of every pair of
matching edges."

"Matching" is Mathlib's `SimpleGraph.Subgraph.IsMatching`. The notions of touching edges,
connected matching and `cm(G)` are **new**. Blueprint entries: `D-1.touch`, `D-1.cm`.

Fidelity notes are in `blueprint/FIDELITY.md` (F-TOUCH, F-CM).
-/

namespace Hadwiger

variable {V : Type*}

/-- Two edges `e`, `f` (as unordered pairs of vertices) *touch* in `G` if some endpoint of
`e` is adjacent in `G` to some endpoint of `f`.

The paper applies the notion to two disjoint edges; this predicate is only ever used here
for two distinct edges of a matching, which are disjoint. -/
def EdgesTouch (G : SimpleGraph V) (e f : Sym2 V) : Prop :=
  ∃ x ∈ e, ∃ y ∈ f, G.Adj x y

/-- A *connected matching* of `G`: a matching (Mathlib's `Subgraph.IsMatching`) any two
distinct edges of which touch. -/
def IsConnectedMatching {G : SimpleGraph V} (M : G.Subgraph) : Prop :=
  M.IsMatching ∧ ∀ e ∈ M.edgeSet, ∀ f ∈ M.edgeSet, e ≠ f → EdgesTouch G e f

/-- `cm(G)`: the maximum number of edges of a connected matching of `G`.

It is defined as a supremum in `ℕ` of the edge counts (`Set.ncard`) of connected matchings.
For a graph on a finite vertex type this set contains `0` (the empty matching) and is
bounded by half the number of vertices, so the supremum is a maximum. Every statement in
this project that mentions `connectedMatchingNumber` is about a finite vertex type. -/
noncomputable def connectedMatchingNumber (G : SimpleGraph V) : ℕ :=
  sSup {k : ℕ | ∃ M : G.Subgraph, IsConnectedMatching M ∧ M.edgeSet.ncard = k}

end Hadwiger
