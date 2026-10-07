import Hadwiger.Defs.Minor
import Hadwiger.Defs.ConnectedMatching
import Hadwiger.ChromaticBounds
import Hadwiger.Sanity.Minor
import Hadwiger.Sanity.ConnectedMatching

/-!
# The clique-minor bound from connected matchings (Proposition 3.5)

Paper, Section 3.3, Proposition 3.5 (`prop:matching-minor`):

"For every finite nonempty graph `G` of order `m`,
`h(G) ≤ (m + 4 cm(G) + 2)/3`.
In particular, if `α(G) ≤ 2` and `cm(G) < m/100`, then
`h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)` (`m ≥ 5`)."

Blueprint entries: `P-3.5` (two Lean statements). Milestone M2 (first assertion) and
M1 (second assertion).

Both assertions are proved: the second since milestone M1 (it uses the first), the first
since milestone M2. The proof of the first assertion is the paper's, step by step; the steps
are the support lemmas below (blueprint `S-M2.*`).

The general lemmas about minor models and connected matchings that were proved at milestone
M0 (`hasCliqueMinor_hadwigerNumber`, `exists_isConnectedMatching_of_family`,
`IsConnectedMatching.ncard_le`) live in `Hadwiger/Sanity/`; those two files are imported
here for them, by the choice recorded in `docs/SESSION_LOG.md` (M1 session).
-/

namespace Hadwiger

/-! ### Support lemmas for the first assertion

These are the steps of the paper's proof of Proposition 3.5, one lemma for each. They are
not separate statements of the paper. Blueprint entries `S-M2.*`.

Throughout, `s` is the number of singleton branch sets of a `K_t` model, `e` the number of
two-vertex branch sets, and `c = cm(G)`.
-/

section Support

variable {V W : Type*}

/-- "Each two-vertex branch is an edge": two distinct vertices that induce a connected
subgraph are adjacent. A walk from `x` to `y` inside `{x, y}` has a first step, which leaves
`x` and so ends at `y`. -/
theorem adj_of_connected_induce_pair {G : SimpleGraph V} {x y : V} (hne : x ≠ y)
    (h : (G.induce ({x, y} : Set V)).Connected) : G.Adj x y := by
  obtain ⟨p⟩ :=
    h.preconnected ⟨x, Set.mem_insert x {y}⟩ ⟨y, Set.mem_insert_of_mem x rfl⟩
  obtain ⟨⟨w, hw⟩, hadj, _, _⟩ :=
    p.exists_eq_cons_of_ne fun h' => hne (congrArg Subtype.val h')
  have hxw : G.Adj x w := hadj
  rcases hw with hw | hw
  · exact absurd (hw ▸ hxw) (G.irrefl)
  · exact hw ▸ hxw

/-- Every branch set of a minor model is nonempty. -/
theorem MinorModel.branch_nonempty {H : SimpleGraph W} {G : SimpleGraph V}
    (M : MinorModel H G) (w : W) : (M.branch w).Nonempty :=
  Set.nonempty_coe_sort.mp (M.connected w).nonempty

/-- Vertices in the branch sets of two different vertices of `H` are different. -/
theorem MinorModel.ne_of_mem_branch {H : SimpleGraph W} {G : SimpleGraph V}
    (M : MinorModel H G) {w w' : W} (hww' : w ≠ w') {u u' : V} (hu : u ∈ M.branch w)
    (hu' : u' ∈ M.branch w') : u ≠ u' :=
  fun h => Set.disjoint_left.mp (M.disjoint w w' hww') hu (h ▸ hu')

/-- The branch sets of a minor model are pairwise disjoint, so their sizes add up to at most
`|V|`. -/
theorem MinorModel.sum_ncard_branch_le [Fintype V] [Fintype W] {H : SimpleGraph W}
    {G : SimpleGraph V} (M : MinorModel H G) :
    ∑ w, (M.branch w).ncard ≤ Fintype.card V := by
  classical
  calc ∑ w, (M.branch w).ncard = ∑ w, (M.branch w).toFinset.card :=
        Finset.sum_congr rfl fun w _ => Set.ncard_eq_toFinset_card' _
    _ = (Finset.univ.biUnion fun w => (M.branch w).toFinset).card :=
        (Finset.card_biUnion fun w _ w' _ hww' =>
          Set.disjoint_toFinset.mpr (M.disjoint w w' hww')).symm
    _ ≤ Fintype.card V := Finset.card_le_univ _

/-- The counting step of Proposition 3.5: "every remaining branch has at least three
vertices, whence `m ≥ s + 2e + 3(b − s − e) = 3b − 2s − e`". Stated without subtraction,
as `3b ≤ m + 2s + e`, for a minor model of any graph `H` on `b` vertices.

Each branch set has at least `3` vertices, or `1` and is counted in `s`, or `2` and is
counted in `e`; so `3 ≤ |B| + 2·[|B| = 1] + [|B| = 2]` for every branch set `B`. -/
theorem MinorModel.three_mul_card_le [Fintype V] [Fintype W] {H : SimpleGraph W}
    {G : SimpleGraph V} (M : MinorModel H G) :
    3 * Fintype.card W ≤ Fintype.card V
      + 2 * (Finset.univ.filter fun w => (M.branch w).ncard = 1).card
      + (Finset.univ.filter fun w => (M.branch w).ncard = 2).card := by
  have hpt : ∀ w, 3 ≤ (M.branch w).ncard + 2 * (if (M.branch w).ncard = 1 then 1 else 0)
      + (if (M.branch w).ncard = 2 then 1 else 0) := by
    intro w
    have hpos : 0 < (M.branch w).ncard :=
      (Set.ncard_pos (Set.toFinite _)).mpr (M.branch_nonempty w)
    split_ifs <;> omega
  have hsum := Finset.sum_le_sum (s := Finset.univ) fun w _ => hpt w
  simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul, Finset.sum_add_distrib,
    ← Finset.mul_sum, ← Finset.card_filter] at hsum
  have hle := M.sum_ncard_branch_le
  omega

/-- `exists_isConnectedMatching_of_family` for a family indexed by any finite type: edges
`a i – b i` of `G` that are pairwise vertex-disjoint and pairwise touching form a connected
matching with one edge for each index. -/
theorem exists_isConnectedMatching_of_fintype_family {G : SimpleGraph V} {ι : Type*}
    [Fintype ι] (a b : ι → V) (hadj : ∀ i, G.Adj (a i) (b i))
    (hdisj : ∀ i j, i ≠ j → a i ≠ a j ∧ a i ≠ b j ∧ b i ≠ b j)
    (htouch : ∀ i j, i ≠ j → EdgesTouch G s(a i, b i) s(a j, b j)) :
    ∃ M : G.Subgraph, IsConnectedMatching M ∧ M.edgeSet.ncard = Fintype.card ι :=
  exists_isConnectedMatching_of_family (fun i => a ((Fintype.equivFin ι).symm i))
    (fun i => b ((Fintype.equivFin ι).symm i)) (fun _ => hadj _)
    (fun _ _ hij => hdisj _ _ ((Fintype.equivFin ι).symm.injective.ne hij))
    (fun _ _ hij => htouch _ _ ((Fintype.equivFin ι).symm.injective.ne hij))

/-- "All these edges together form one touching matching: their vertex sets are disjoint,
and adjacency of the original branches guarantees every required contact."

Edges `a κ – b κ` of `G` are read off a `K_t` model: `a κ` lies in the branch set of
`p κ`, `b κ` in that of `q κ`, and the branch set of `p κ` has no vertex other than `a κ`
and `b κ`. If different edges use different branch sets, the edges form a connected
matching. Disjointness comes from the disjointness of branch sets; two edges touch because
the branch sets of `p κ` and `p κ'` are joined by an edge of `G`. -/
theorem MinorModel.exists_isConnectedMatching {G : SimpleGraph V} {t : ℕ}
    (M : MinorModel (⊤ : SimpleGraph (Fin t)) G) {ι : Type*} [Fintype ι]
    (a b : ι → V) (p q : ι → Fin t) (hadj : ∀ κ, G.Adj (a κ) (b κ))
    (ha : ∀ κ, a κ ∈ M.branch (p κ)) (hb : ∀ κ, b κ ∈ M.branch (q κ))
    (hp : ∀ κ, M.branch (p κ) ⊆ {a κ, b κ})
    (hpq : ∀ κ κ', κ ≠ κ' → p κ ≠ p κ' ∧ p κ ≠ q κ' ∧ q κ ≠ q κ') :
    ∃ N : G.Subgraph, IsConnectedMatching N ∧ N.edgeSet.ncard = Fintype.card ι := by
  refine exists_isConnectedMatching_of_fintype_family a b hadj (fun κ κ' h => ?_)
    (fun κ κ' h => ?_)
  · obtain ⟨h1, h2, h3⟩ := hpq κ κ' h
    exact ⟨M.ne_of_mem_branch h1 (ha κ) (ha κ'), M.ne_of_mem_branch h2 (ha κ) (hb κ'),
      M.ne_of_mem_branch h3 (hb κ) (hb κ')⟩
  · obtain ⟨u, hu, u', hu', huu'⟩ :=
      M.adj (p κ) (p κ') ((SimpleGraph.top_adj _ _).mpr (hpq κ κ' h).1)
    exact ⟨u, Sym2.mem_iff.mpr (hp κ hu), u', Sym2.mem_iff.mpr (hp κ' hu'), huu'⟩

/-- The matching step of Proposition 3.5: `c ≥ e + ⌊s/2⌋`.

"Each two-vertex branch is an edge. The singleton vertices form a clique, so pairing them
gives `⌊s/2⌋` more edges. All these edges together form one touching matching."

The division is natural-number division, which is the floor. The singleton branch sets are
listed in some order as `σ 0, …, σ (s − 1)` and the `j`-th pair is `σ (2j), σ (2j + 1)`
for `j < ⌊s/2⌋`. -/
theorem MinorModel.card_two_add_card_one_div_two_le [Fintype V] {G : SimpleGraph V} {t : ℕ}
    (M : MinorModel (⊤ : SimpleGraph (Fin t)) G) :
    (Finset.univ.filter fun i => (M.branch i).ncard = 2).card
      + (Finset.univ.filter fun i => (M.branch i).ncard = 1).card / 2
      ≤ connectedMatchingNumber G := by
  classical
  -- a vertex of every branch set; it is the whole branch set when that is a singleton
  have hv : ∀ i, ∃ v, v ∈ M.branch i ∧ ((M.branch i).ncard = 1 → M.branch i = {v}) := by
    intro i
    by_cases h : (M.branch i).ncard = 1
    · obtain ⟨v, hv⟩ := Set.ncard_eq_one.mp h
      exact ⟨v, hv ▸ Set.mem_singleton v, fun _ => hv⟩
    · obtain ⟨v, hv⟩ := M.branch_nonempty i
      exact ⟨v, hv, fun h' => absurd h' h⟩
  choose v hv_mem hv_eq using hv
  -- two vertices of every branch set; they are all of it, and adjacent, when it has two
  have hxy : ∀ i, ∃ x y, x ∈ M.branch i ∧ y ∈ M.branch i ∧
      ((M.branch i).ncard = 2 → M.branch i = {x, y} ∧ G.Adj x y) := by
    intro i
    by_cases h : (M.branch i).ncard = 2
    · obtain ⟨x, y, hne, hB⟩ := Set.ncard_eq_two.mp h
      refine ⟨x, y, hB ▸ Set.mem_insert x {y}, hB ▸ Set.mem_insert_of_mem x rfl,
        fun _ => ⟨hB, adj_of_connected_induce_pair hne ?_⟩⟩
      rw [← hB]
      exact M.connected i
    · exact ⟨v i, v i, hv_mem i, hv_mem i, fun h' => absurd h' h⟩
  choose x y hx_mem hy_mem hxy using hxy
  set S₁ : Finset (Fin t) := Finset.univ.filter fun i => (M.branch i).ncard = 1 with hS₁
  set S₂ : Finset (Fin t) := Finset.univ.filter fun i => (M.branch i).ncard = 2 with hS₂
  have hmem₁ : ∀ i ∈ S₁, (M.branch i).ncard = 1 := fun i hi => (Finset.mem_filter.mp hi).2
  have hmem₂ : ∀ i ∈ S₂, (M.branch i).ncard = 2 := fun i hi => (Finset.mem_filter.mp hi).2
  have hsingle : ∀ i ∈ S₁, ∀ u ∈ M.branch i, u = v i := fun i hi u hu => by
    rw [hv_eq i (hmem₁ i hi)] at hu
    exact hu
  have hS : ∀ i ∈ S₂, ∀ i' ∈ S₁, i ≠ i' := fun i hi i' hi' h => by
    have h2 := hmem₂ i hi
    have h1 := hmem₁ i' hi'
    rw [h] at h2
    omega
  -- the singleton branch sets, listed in some order
  let σ : Fin S₁.card → Fin t := fun j => (S₁.equivFin.symm j : Fin t)
  have hσ_mem : ∀ j, σ j ∈ S₁ := fun j => (S₁.equivFin.symm j).2
  have hσ_inj : Function.Injective σ := fun j j' h =>
    S₁.equivFin.symm.injective (Subtype.ext h)
  have hlt0 : ∀ j : Fin (S₁.card / 2), 2 * (j : ℕ) < S₁.card := fun j => by
    have := j.isLt
    omega
  have hlt1 : ∀ j : Fin (S₁.card / 2), 2 * (j : ℕ) + 1 < S₁.card := fun j => by
    have := j.isLt
    omega
  have hσ_ne : ∀ (k k' : Fin S₁.card), (k : ℕ) ≠ k' → σ k ≠ σ k' := fun k k' h h' =>
    h (congrArg Fin.val (hσ_inj h'))
  -- one edge for each two-vertex branch set, and one for each pair of singletons
  let p : {i // i ∈ S₂} ⊕ Fin (S₁.card / 2) → Fin t :=
    Sum.elim (fun i => i.1) (fun j => σ ⟨2 * j, hlt0 j⟩)
  let q : {i // i ∈ S₂} ⊕ Fin (S₁.card / 2) → Fin t :=
    Sum.elim (fun i => i.1) (fun j => σ ⟨2 * j + 1, hlt1 j⟩)
  let a : {i // i ∈ S₂} ⊕ Fin (S₁.card / 2) → V :=
    Sum.elim (fun i => x i.1) (fun j => v (σ ⟨2 * j, hlt0 j⟩))
  let b : {i // i ∈ S₂} ⊕ Fin (S₁.card / 2) → V :=
    Sum.elim (fun i => y i.1) (fun j => v (σ ⟨2 * j + 1, hlt1 j⟩))
  have hadj : ∀ κ, G.Adj (a κ) (b κ) := by
    rintro (⟨i, hi⟩ | j)
    · exact (hxy i (hmem₂ i hi)).2
    · -- two different singleton branch sets are joined by an edge
      obtain ⟨u, hu, u', hu', huu'⟩ :=
        M.adj (σ ⟨2 * j, hlt0 j⟩) (σ ⟨2 * j + 1, hlt1 j⟩)
          ((SimpleGraph.top_adj _ _).mpr (hσ_ne _ _ (by simp)))
      obtain rfl := hsingle _ (hσ_mem _) u hu
      obtain rfl := hsingle _ (hσ_mem _) u' hu'
      exact huu'
  have ha : ∀ κ, a κ ∈ M.branch (p κ) := by
    rintro (⟨i, hi⟩ | j)
    · exact hx_mem i
    · exact hv_mem _
  have hb : ∀ κ, b κ ∈ M.branch (q κ) := by
    rintro (⟨i, hi⟩ | j)
    · exact hy_mem i
    · exact hv_mem _
  have hp : ∀ κ, M.branch (p κ) ⊆ {a κ, b κ} := by
    rintro (⟨i, hi⟩ | j)
    · exact (hxy i (hmem₂ i hi)).1.subset
    · exact fun u hu => Or.inl (hsingle _ (hσ_mem _) u hu)
  have hpq : ∀ κ κ', κ ≠ κ' → p κ ≠ p κ' ∧ p κ ≠ q κ' ∧ q κ ≠ q κ' := by
    rintro (⟨i, hi⟩ | j) (⟨i', hi'⟩ | j') h
    · have hii' : i ≠ i' := fun h' => h (by subst h'; rfl)
      exact ⟨hii', hii', hii'⟩
    · exact ⟨hS i hi _ (hσ_mem _), hS i hi _ (hσ_mem _), hS i hi _ (hσ_mem _)⟩
    · exact ⟨(hS i' hi' _ (hσ_mem _)).symm, (hS i' hi' _ (hσ_mem _)).symm,
        (hS i' hi' _ (hσ_mem _)).symm⟩
    · have hjj' : (j : ℕ) ≠ j' := fun h' => h (by rw [Fin.ext h'])
      exact ⟨hσ_ne _ _ (by simp; omega), hσ_ne _ _ (by simp; omega),
        hσ_ne _ _ (by simp; omega)⟩
  obtain ⟨N, hN, hcard⟩ := M.exists_isConnectedMatching a b p q hadj ha hb hp hpq
  have hle := hN.ncard_le
  rw [hcard] at hle
  simpa using hle

end Support

variable {V : Type*} [Fintype V]

/-- **Proposition 3.5, first assertion.** `h(G) ≤ (m + 4 cm(G) + 2)/3`, stated without
division as `3 h(G) ≤ m + 4 cm(G) + 2`. For natural numbers `h`, `m`, `c` the inequality
`h ≤ (m + 4c + 2)/3` over the reals is equivalent to `3h ≤ m + 4c + 2` over the naturals.

Proof, as in the paper. Take a `K_b` model with `b = h(G)` (the supremum is attained:
`hasCliqueMinor_hadwigerNumber`); this is the paper's "maximize over all complete-minor
models". With `s` singleton and `e` two-vertex branch sets, counting vertices gives
`3b ≤ m + 2s + e` (`MinorModel.three_mul_card_le`) and the matching gives
`e + ⌊s/2⌋ ≤ cm(G)` (`MinorModel.card_two_add_card_one_div_two_le`). The paper's last line,
`3b ≤ m + 2s + e ≤ m + 4c − 3e + 2 ≤ m + 4c + 2`, is then linear arithmetic.

The hypothesis `[Nonempty V]` is the paper's "nonempty". The proof does not use it: the
inequality also holds for the graph with no vertices, where it reads `0 ≤ 2`. -/
theorem three_mul_hadwigerNumber_le [Nonempty V] (G : SimpleGraph V) :
    3 * hadwigerNumber G ≤ Fintype.card V + 4 * connectedMatchingNumber G + 2 := by
  obtain ⟨M⟩ := hasCliqueMinor_hadwigerNumber G
  have h1 := M.three_mul_card_le
  have h2 := M.card_two_add_card_one_div_two_le
  rw [Fintype.card_fin] at h1
  omega

/-- **Proposition 3.5, second assertion.** If `α(G) ≤ 2`, `cm(G) < m/100` and `m ≥ 5`, then
`h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)`.

`cm(G) < m/100` is stated as `100 cm(G) < m`. The chromatic number is Mathlib's
`chromaticNumber : ℕ∞`; the statement exhibits it as a natural number `k` and compares in
`ℝ`, so no junk value of a cast can enter.

Proof, as in the paper: the first assertion with `cm(G) < m/100` gives the first inequality;
the second is arithmetic for `m ≥ 5`; and every colour class has at most two vertices
(`card_le_indepNum_mul_of_colorable`), which gives the third. -/
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
