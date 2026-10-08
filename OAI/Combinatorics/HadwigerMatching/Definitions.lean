-- This file is from openai/math at commit fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb (Apache-2.0) and has been
-- modified: see docs/UPSTREAM_CHANGES.md in this repository.
module

public import Mathlib.Combinatorics.SimpleGraph.Clique

@[expose] public section

namespace OAI

namespace HadwigerMatching

universe u
variable {V : Type u}

/-- A finite matching whose edges are pairwise touching: each member is a
two-vertex clique, and distinct members are disjoint and joined by an edge. -/
def IsTouchingMatching (G : SimpleGraph V) (M : Finset (Finset V)) : Prop :=
  (∀ e ∈ M, e.card = 2 ∧ G.IsClique (e : Set V)) ∧
  (∀ e ∈ M, ∀ f ∈ M, e ≠ f → Disjoint e f) ∧
  (∀ e ∈ M, ∀ f ∈ M, e ≠ f →
    ∃ v ∈ e, ∃ w ∈ f, G.Adj v w)

/-- The supremum of the cardinalities of pairwise touching matchings.
For finite vertex types, this supremum is attained. -/
noncomputable def connectedMatchingNumber (G : SimpleGraph V) : ℕ :=
  sSup {n : ℕ | ∃ M : Finset (Finset V), IsTouchingMatching G M ∧ M.card = n}

end HadwigerMatching

end OAI
