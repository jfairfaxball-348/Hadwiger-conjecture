module

public import Hadwiger.Defs.ConnectedMatching

@[expose] public section

/-!
# Sanity checks for connected matchings (not in the paper)

Nothing in this file is a statement of the paper. These lemmas pin the definitions
`Hadwiger.EdgesTouch`, `Hadwiger.IsConnectedMatching` and
`Hadwiger.connectedMatchingNumber` of `Hadwiger/Defs/ConnectedMatching.lean` from both
sides (milestone M0, `blueprint/MILESTONES.md`).

* from above: `two_mul_connectedMatchingNumber_le_card`, and the graph consisting of two
  disjoint edges with no edge between them, where the two edges form a matching that is
  not connected (`connectedMatchingNumber_two_disjoint_edges`);
* from below: `exists_isConnectedMatching_of_family` (any `k` pairwise disjoint, pairwise
  touching edges form a connected matching with `k` edges) and
  `connectedMatchingNumber_top` (`cm(K_n) = ⌊n/2⌋`);
* the supremum in `connectedMatchingNumber` is a maximum for a finite graph:
  `exists_isConnectedMatching_ncard_eq`.

Blueprint entries: `S-M0.cm-*`, in the section "Sanity checks (not in the paper)".

Since milestone M2 this file is imported by `Hadwiger/MatchingMinor.lean`, whose proof of
Proposition 3.5 uses `exists_isConnectedMatching_of_family` and
`IsConnectedMatching.ncard_le`. Nothing in this file became a statement of the paper by
being used.
-/

namespace Hadwiger

open SimpleGraph

variable {V : Type*}

/-! ### Matchings in a finite graph -/

/-- A matching in a finite graph has at most `|V|/2` edges, stated as `2 |E(M)| ≤ |V|`.
Proof: in the graph on `V` whose edges are those of `M`, every degree is at most `1`, and
the degrees sum to twice the number of edges. -/
theorem two_mul_ncard_edgeSet_le_card [Fintype V] {G : SimpleGraph V} {M : G.Subgraph}
    (hM : M.IsMatching) : 2 * M.edgeSet.ncard ≤ Fintype.card V := by
  classical
  have hdeg : ∀ v, M.spanningCoe.degree v ≤ 1 := by
    intro v
    rw [← card_neighborFinset_eq_degree, Finset.card_le_one]
    intro a ha b hb
    rw [mem_neighborFinset] at ha hb
    exact hM.eq_of_adj_left ha hb
  have hedge : M.edgeSet.ncard = M.spanningCoe.edgeFinset.card := by
    rw [← Subgraph.edgeSet_spanningCoe, ← coe_edgeFinset, Set.ncard_coe_finset]
  rw [hedge, ← sum_degrees_eq_twice_card_edges]
  calc ∑ v, M.spanningCoe.degree v ≤ ∑ _v : V, 1 := Finset.sum_le_sum fun v _ => hdeg v
    _ = Fintype.card V := by simp

/-! ### Building a connected matching from a list of edges -/

/-- `k` edges `a i – b i` of `G` that are pairwise vertex-disjoint and pairwise touching
form a connected matching with exactly `k` edges.

The disjointness hypothesis is stated for ordered pairs `i ≠ j`; applied to `(i, j)` and to
`(j, i)` it says that the four vertices `a i`, `b i`, `a j`, `b j` are such that neither of
`a i`, `b i` equals either of `a j`, `b j`. -/
theorem exists_isConnectedMatching_of_family {G : SimpleGraph V} {k : ℕ} (a b : Fin k → V)
    (hadj : ∀ i, G.Adj (a i) (b i))
    (hdisj : ∀ i j, i ≠ j → a i ≠ a j ∧ a i ≠ b j ∧ b i ≠ b j)
    (htouch : ∀ i j, i ≠ j → EdgesTouch G s(a i, b i) s(a j, b j)) :
    ∃ M : G.Subgraph, IsConnectedMatching M ∧ M.edgeSet.ncard = k := by
  have hedge : (⨆ i, G.subgraphOfAdj (hadj i)).edgeSet = Set.range fun i => s(a i, b i) := by
    ext e
    simp [eq_comm]
  have hinj : Function.Injective fun i => s(a i, b i) := by
    intro i j h
    by_contra hij
    obtain ⟨h1, h2, -⟩ := hdisj i j hij
    rcases Sym2.eq_iff.mp h with ⟨h, -⟩ | ⟨h, -⟩
    · exact h1 h
    · exact h2 h
  refine ⟨⨆ i, G.subgraphOfAdj (hadj i), ⟨?_, ?_⟩, ?_⟩
  · refine Subgraph.IsMatching.iSup (fun i => Subgraph.IsMatching.subgraphOfAdj (hadj i)) ?_
    intro i j hij
    obtain ⟨h1, h2, h3⟩ := hdisj i j hij
    obtain ⟨-, h2', -⟩ := hdisj j i (Ne.symm hij)
    rw [support_subgraphOfAdj, support_subgraphOfAdj, Set.disjoint_left]
    rintro x (rfl | rfl) (h | h)
    · exact h1 h
    · exact h2 h
    · exact h2' h.symm
    · exact h3 h
  · intro e he f hf hef
    rw [hedge] at he hf
    obtain ⟨i, rfl⟩ := he
    obtain ⟨j, rfl⟩ := hf
    exact htouch i j fun h => hef (by rw [h])
  · rw [hedge, Set.ncard_range_of_injective hinj]
    simp

/-! ### `connectedMatchingNumber` of a finite graph -/

/-- The empty subgraph is a connected matching, with no edges. -/
theorem isConnectedMatching_bot (G : SimpleGraph V) :
    IsConnectedMatching (⊥ : G.Subgraph) :=
  ⟨fun v hv => absurd hv (by simp), fun e he => absurd he (by simp)⟩

/-- For a finite graph the set of sizes of connected matchings is bounded, by `|V|`. -/
theorem bddAbove_setOf_connectedMatching [Fintype V] (G : SimpleGraph V) :
    BddAbove {k : ℕ | ∃ M : G.Subgraph, IsConnectedMatching M ∧ M.edgeSet.ncard = k} := by
  refine ⟨Fintype.card V, ?_⟩
  rintro k ⟨M, hM, rfl⟩
  have := two_mul_ncard_edgeSet_le_card hM.1
  omega

/-- **Sanity (M0).** The supremum defining `connectedMatchingNumber` is attained: a finite
graph has a connected matching with exactly `cm(G)` edges. -/
theorem exists_isConnectedMatching_ncard_eq [Fintype V] (G : SimpleGraph V) :
    ∃ M : G.Subgraph, IsConnectedMatching M ∧ M.edgeSet.ncard = connectedMatchingNumber G :=
  Nat.sSup_mem
    (s := {k : ℕ | ∃ M : G.Subgraph, IsConnectedMatching M ∧ M.edgeSet.ncard = k})
    ⟨0, ⊥, isConnectedMatching_bot G, by simp⟩ (bddAbove_setOf_connectedMatching G)

/-- Every connected matching of a finite graph has at most `cm(G)` edges. -/
theorem IsConnectedMatching.ncard_le [Fintype V] {G : SimpleGraph V} {M : G.Subgraph}
    (hM : IsConnectedMatching M) : M.edgeSet.ncard ≤ connectedMatchingNumber G :=
  le_csSup (bddAbove_setOf_connectedMatching G) ⟨M, hM, rfl⟩

/-- **Sanity (M0).** `2 cm(G) ≤ |V|` for a finite graph. -/
theorem two_mul_connectedMatchingNumber_le_card [Fintype V] (G : SimpleGraph V) :
    2 * connectedMatchingNumber G ≤ Fintype.card V := by
  obtain ⟨M, hM, h⟩ := exists_isConnectedMatching_ncard_eq G
  rw [← h]
  exact two_mul_ncard_edgeSet_le_card hM.1

/-! ### Two examples -/

/-- **Sanity (M0).** `cm(K_n) = ⌊n/2⌋`. The edges `{2i, 2i+1}` for `i < ⌊n/2⌋` form a
matching, and in a complete graph any two disjoint edges touch. -/
theorem connectedMatchingNumber_top (n : ℕ) :
    connectedMatchingNumber (⊤ : SimpleGraph (Fin n)) = n / 2 := by
  apply le_antisymm
  · have := two_mul_connectedMatchingNumber_le_card (⊤ : SimpleGraph (Fin n))
    simp only [Fintype.card_fin] at this
    omega
  · obtain ⟨M, hM, hcard⟩ := exists_isConnectedMatching_of_family (G := (⊤ : SimpleGraph (Fin n)))
      (k := n / 2) (fun i => ⟨2 * i.val, by have := i.isLt; omega⟩)
      (fun i => ⟨2 * i.val + 1, by have := i.isLt; omega⟩)
      (fun i => by simp [Fin.ext_iff])
      (fun i j hij => by
        have : i.val ≠ j.val := fun h => hij (Fin.ext h)
        simp only [ne_eq, Fin.mk.injEq]
        omega)
      (fun i j hij => by
        have : i.val ≠ j.val := fun h => hij (Fin.ext h)
        refine ⟨_, Sym2.mem_mk_left _ _, _, Sym2.mem_mk_left _ _, ?_⟩
        simp only [top_adj, ne_eq, Fin.mk.injEq]
        omega)
    rw [← hcard]
    exact hM.ncard_le

/-- **Sanity (M0).** Two disjoint edges with no edge between them: the graph on `Fin 4`
whose only edges are `0–1` and `2–3` has `cm = 1`. The two edges form a matching, but they
do not touch, so that matching is not connected. -/
theorem connectedMatchingNumber_two_disjoint_edges :
    connectedMatchingNumber (fromEdgeSet {s(0, 1), s(2, 3)} : SimpleGraph (Fin 4)) = 1 := by
  set G : SimpleGraph (Fin 4) := fromEdgeSet {s(0, 1), s(2, 3)} with hG
  have h01 : G.Adj 0 1 := by simp [hG]
  apply le_antisymm
  · -- a connected matching with two edges would consist of the two edges, which do not touch
    by_contra hlt
    have h2 : connectedMatchingNumber G = 2 := by
      have := two_mul_connectedMatchingNumber_le_card G
      simp only [Fintype.card_fin] at this
      omega
    obtain ⟨M, hM, hcard⟩ := exists_isConnectedMatching_ncard_eq G
    rw [h2] at hcard
    obtain ⟨e, f, hef, hMef⟩ := Set.ncard_eq_two.mp hcard
    have he : e ∈ M.edgeSet := by rw [hMef]; simp
    have hf : f ∈ M.edgeSet := by rw [hMef]; simp
    have hedges : ∀ e' ∈ M.edgeSet, e' = s(0, 1) ∨ e' = s(2, 3) := by
      intro e' he'
      have := M.edgeSet_subset he'
      rw [hG, edgeSet_fromEdgeSet] at this
      simpa using this.1
    have hno : ¬ EdgesTouch G s(0, 1) s(2, 3) := by
      rintro ⟨x, hx, y, hy, hxy⟩
      rw [Sym2.mem_iff] at hx hy
      rw [hG, fromEdgeSet_adj] at hxy
      rcases hx with rfl | rfl <;> rcases hy with rfl | rfl <;>
        exact absurd hxy.1 (by decide)
    have hno' : ¬ EdgesTouch G s(2, 3) s(0, 1) := by
      rintro ⟨x, hx, y, hy, hxy⟩
      exact hno ⟨y, hy, x, hx, hxy.symm⟩
    have ht := hM.2 e he f hf hef
    rcases hedges e he with rfl | rfl <;> rcases hedges f hf with rfl | rfl
    · exact hef rfl
    · exact hno ht
    · exact hno' ht
    · exact hef rfl
  · obtain ⟨M, hM, hcard⟩ := exists_isConnectedMatching_of_family (G := G) (k := 1)
      (fun _ => 0) (fun _ => 1) (fun _ => h01)
      (fun i j hij => absurd (Subsingleton.elim i j) hij)
      (fun i j hij => absurd (Subsingleton.elim i j) hij)
    rw [← hcard]
    exact hM.ncard_le

end Hadwiger
