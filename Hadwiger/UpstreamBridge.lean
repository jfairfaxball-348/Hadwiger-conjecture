import Hadwiger.Defs.ConnectedMatching
import Hadwiger.Sanity.ConnectedMatching
import OAI.Combinatorics.HadwigerMatching.BasicMatching

/-!
# Bridge to the upstream formalisation

Theorem 1.1 of the paper is not proved in this project's own development. It is taken from
the formalisation published by the paper's authors, `openai/math` at commit
`fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb` (Apache-2.0), whose files are copied byte for byte
under `OAI/` (see `NOTICE`). Upstream states its theorems with its own definition of the
connected matching number, `OAI.HadwigerMatching.connectedMatchingNumber`: the supremum of
the sizes of finite sets of two-element cliques that are pairwise disjoint and pairwise
touching. This project's definition, `Hadwiger.connectedMatchingNumber`, is the supremum of
the edge counts of Mathlib matchings (`Subgraph.IsMatching`) whose edges pairwise touch.

This file proves the one comparison that is needed to carry upstream's theorem over to this
project's statement: on a finite vertex type this project's number is at most upstream's.
The independence number is Mathlib's `SimpleGraph.indepNum` on both sides, so nothing has to
be compared there.

By the user's decision of 2026-10-08 the project builds on upstream's proof; until then it
was independent of it.
-/

namespace Hadwiger

variable {V : Type*}

/-- A connected matching in this project's sense gives a touching matching in upstream's
sense with the same number of edges: the set of the edges, each as a two-element set of
vertices. -/
theorem IsConnectedMatching.exists_isTouchingMatching [Fintype V] {G : SimpleGraph V}
    {M : G.Subgraph} (hM : IsConnectedMatching M) :
    ∃ F : Finset (Finset V), OAI.HadwigerMatching.IsTouchingMatching G F ∧
      F.card = M.edgeSet.ncard := by
  classical
  have hfin : M.edgeSet.Finite := Set.toFinite _
  have hinj : Function.Injective (Sym2.toFinset : Sym2 V → Finset V) := fun a b h =>
    Sym2.ext fun x => by rw [← Sym2.mem_toFinset, h, Sym2.mem_toFinset]
  refine ⟨hfin.toFinset.image Sym2.toFinset, ⟨?_, ?_, ?_⟩, ?_⟩
  · -- every member is a two-element clique
    intro e' he'
    obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp he'
    have heG : e ∈ G.edgeSet := M.edgeSet_subset (hfin.mem_toFinset.mp he)
    refine ⟨Sym2.card_toFinset_of_not_isDiag e (G.not_isDiag_of_mem_edgeSet heG), ?_⟩
    intro x hx y hy hxy
    have hx' : x ∈ e := Sym2.mem_toFinset.mp hx
    have hy' : y ∈ e := Sym2.mem_toFinset.mp hy
    rw [(Sym2.mem_and_mem_iff hxy).mp ⟨hx', hy'⟩] at heG
    exact heG
  · -- distinct members are disjoint: the edges of a matching share no vertex
    intro e' he' f' hf' hne
    obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp he'
    obtain ⟨f, hf, rfl⟩ := Finset.mem_image.mp hf'
    rw [Finset.disjoint_left]
    intro v hve hvf
    obtain ⟨w, rfl⟩ := Sym2.mem_iff_exists.mp (Sym2.mem_toFinset.mp hve)
    obtain ⟨w', rfl⟩ := Sym2.mem_iff_exists.mp (Sym2.mem_toFinset.mp hvf)
    have h1 : M.Adj v w := hfin.mem_toFinset.mp he
    have h2 : M.Adj v w' := hfin.mem_toFinset.mp hf
    have hww : w = w' := (hM.1 (M.edge_vert h1)).unique h1 h2
    exact hne (by rw [hww])
  · -- distinct members touch
    intro e' he' f' hf' hne
    obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp he'
    obtain ⟨f, hf, rfl⟩ := Finset.mem_image.mp hf'
    have hef : e ≠ f := fun h => hne (by rw [h])
    obtain ⟨x, hx, y, hy, hxy⟩ :=
      hM.2 e (hfin.mem_toFinset.mp he) f (hfin.mem_toFinset.mp hf) hef
    exact ⟨x, Sym2.mem_toFinset.mpr hx, y, Sym2.mem_toFinset.mpr hy, hxy⟩
  · rw [Finset.card_image_of_injective _ hinj, Set.ncard_eq_toFinset_card _ hfin]

/-- On a finite vertex type, the connected matching number of this project is at most the
connected matching number of the upstream formalisation.

(The two are equal; only this direction is needed, and only it is proved.) -/
theorem connectedMatchingNumber_le_upstream [Fintype V] (G : SimpleGraph V) :
    connectedMatchingNumber G ≤ OAI.HadwigerMatching.connectedMatchingNumber G := by
  obtain ⟨M, hM, hcard⟩ := exists_isConnectedMatching_ncard_eq G
  obtain ⟨F, hF, hFcard⟩ := hM.exists_isTouchingMatching
  rw [← hcard, ← hFcard]
  exact OAI.HadwigerMatching.matching_card_le_number hF

end Hadwiger
