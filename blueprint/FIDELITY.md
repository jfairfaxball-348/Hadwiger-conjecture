# Fidelity notes

One note per definition of the statement layer, arguing that the Lean definition means
what the paper means, and one per target statement, recording every difference in form.

**Review status: none of these notes has been reviewed.** They were written by the same
worker who wrote the definitions. Milestone M0 is the review; its outcome is to be recorded
here, note by note. Until then every argument below is a claim, and each "to prove at M0"
item is an open obligation, not a fact.

"New" means not in Mathlib at the pinned commit. "Mathlib" means Mathlib's definition is
used unchanged.

---

## Definitions

### F-ALPHA — independence number (Mathlib) — D-1.alpha

- Paper: "`α(G)` … independence number" (§1 ¶1), the standard notion: the largest size of
  a set of pairwise non-adjacent vertices.
- Lean: `SimpleGraph.indepNum G = sSup {n | ∃ s : Finset V, G.IsNIndepSet n s}`, where
  `IsNIndepSet n s` says `s` is independent and has `n` elements.
- Argument: for a finite vertex type the set is nonempty (`n = 0`) and bounded by `|V|`, so
  the supremum is the maximum size of an independent set.
- Junk values: for an infinite graph with unbounded independent sets it is `0`. All uses
  here are on `Fin m` or a `Fintype`.

### F-CHI — chromatic number (Mathlib) — D-1.chi

- Paper: "`χ(G)` … chromatic number" (§1 ¶1), the least number of colours in a proper
  vertex colouring.
- Lean: `SimpleGraph.chromaticNumber G : ℕ∞`, the infimum of the `n` with `G.Colorable n`,
  where `G.Colorable n` means there is a proper colouring with colours in `Fin n`.
- Argument: this is the standard definition. For a finite graph it is finite and at most
  `|V|` (`chromaticNumber_le_card`).
- Junk values: none in `ℕ∞` itself. Statements here never apply `.toNat`; they exhibit the
  value as a natural number `k` with `G.chromaticNumber = k`.

### F-MINOR — `K_t` minor (new) — D-1.minor

- Paper: uses "`G` contains a `K_t` minor" without defining it (§1 ¶1). The standard
  meaning: `K_t` can be obtained from a subgraph of `G` by contracting edges.
- Lean: `MinorModel H G` is a family of vertex sets `branch w` of `G`, one per vertex `w`
  of `H`, each inducing a connected subgraph, pairwise disjoint, with an edge of `G`
  between `branch w` and `branch w'` whenever `w`, `w'` are adjacent in `H`.
  `IsMinor H G` says a model exists. `HasCliqueMinor G t` is `IsMinor ⊤ G` for the complete
  graph `⊤` on `Fin t`.
- Argument: this is the standard branch-set characterisation of minors (for example
  Diestel, *Graph Theory*, §1.7): `H` is a minor of `G` exactly when `G` has disjoint
  connected vertex sets indexed by `V(H)` with an edge between the sets of every adjacent
  pair. Contracting each branch set and deleting the rest of `G` gives `H` plus possibly
  extra edges, which are then deleted. Vertices outside the branch sets are allowed, as
  are extra edges, which is what "subgraph" permits. For `H = K_t` the adjacency condition
  is "every two distinct branch sets are joined by an edge".
- Nonemptiness: Mathlib's `Connected` includes `Nonempty`, so every branch set is nonempty.
- Edge cases: `HasCliqueMinor G 0` always holds (no branch sets). `HasCliqueMinor G 1`
  holds exactly when `G` has a vertex.
- Not proved in Lean: the equivalence with a definition by edge contractions. Mathlib has
  no contraction of simple graphs, so there is nothing to compare with. The fidelity of
  this definition rests on the textbook equivalence.

### F-HADWIGER — Hadwiger number (new) — D-1.h

- Paper: "`h(G)` is the largest `t` for which `G` contains a `K_t` minor" (§1 ¶1).
- Lean: `hadwigerNumber G = sSup {t : ℕ | HasCliqueMinor G t}`.
- Argument: for a finite vertex type the set contains `0` and is bounded by `|V|`, because
  the branch sets are nonempty and pairwise disjoint. A nonempty bounded set of naturals
  has a maximum and `sSup` returns it.
- To prove at M0: `HasCliqueMinor G t → t ≤ Fintype.card V`, and
  `HasCliqueMinor G (hadwigerNumber G)`. Until these are proved, "the supremum is a
  maximum" is an argument, not a theorem.
- Junk values: `sSup` of an unbounded set of naturals is `0`. That can happen only for an
  infinite graph; every statement here has a `Fintype`.

### F-HC — Hadwiger's conjecture (new) — D-1.HC

- Paper: "Hadwiger's conjecture … asserts that `h(G) ≥ χ(G)` for every finite nonempty
  simple graph `G`" (§1 ¶2).
- Lean: `HadwigerConjecture` is
  `∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V), G.chromaticNumber ≤ (hadwigerNumber G : ℕ∞)`.
- Argument: a literal transcription. Mathlib's `SimpleGraph` is a simple graph (symmetric,
  irreflexive adjacency). Quantifying over `V : Type` loses nothing: every finite graph is
  isomorphic to one on some `Fin m`, and both sides are isomorphism-invariant.
- To prove at M0, if wanted: invariance of `hadwigerNumber` under graph isomorphism.
- Note: this is the statement the paper refutes. It is a different statement from HC7.

### F-TOUCH — touching edges (new) — D-1.touch

- Paper: "Two disjoint edges are *touching* if an edge joins their endpoint sets" (§1 ¶3).
- Lean: `EdgesTouch G e f` for `e f : Sym2 V` is `∃ x ∈ e, ∃ y ∈ f, G.Adj x y`.
- Argument: the endpoint set of `e` is `{x | x ∈ e}`, and "an edge joins" two sets when
  some vertex of one is adjacent to some vertex of the other.
- Difference in form: the paper defines touching only for disjoint edges; the predicate is
  defined for any two unordered pairs. It is only used for two distinct edges of a
  matching, which are disjoint, so the extra generality is never exercised.

### F-CM — connected matching and `cm(G)` (new, on Mathlib's matching) — D-1.cm

- Paper: "A *connected matching* is a matching whose edges are pairwise touching; write
  `cm(G)` for its maximum size. The word connected in this definition requires adjacency of
  every pair of matching edges" (§1 ¶3).
- Lean: `IsConnectedMatching M`, for a subgraph `M` of `G`, is `M.IsMatching` together with
  `EdgesTouch G e f` for all distinct `e f ∈ M.edgeSet`.
  `connectedMatchingNumber G = sSup {k | ∃ M, IsConnectedMatching M ∧ M.edgeSet.ncard = k}`.
- Argument: Mathlib's `Subgraph.IsMatching M` says every vertex of `M` has exactly one
  neighbour in `M`; the edge sets of such subgraphs are exactly the sets of pairwise
  disjoint edges of `G`, and `M` is determined by its edge set. "Size" is the number of
  edges, `M.edgeSet.ncard`. The touching edge must be an edge of `G`, not of `M`, as in the
  paper.
- For a finite vertex type the set of sizes contains `0` (the empty subgraph) and is
  bounded by `|V|/2`, so the supremum is a maximum.
- To prove at M0: that boundedness, and that the supremum is attained.
- Junk values: `Set.ncard` of an infinite set is `0`, and `sSup` of an unbounded set is
  `0`. Both need an infinite graph.

### F-FCOL — fractional colouring (new) — D-1.fcol

- Paper: "let `I(G)` be the family of its independent vertex sets. A fractional coloring
  assigns a nonnegative real weight `w_I` to every `I ∈ I(G)` such that
  `∑_{I ∋ v} w_I ≥ 1` for every vertex `v`" (§1, after Theorem 1.1).
- Lean: `FractionalColoring G` has `weight : Finset V → ℝ`, with `nonneg`, with `indep`
  (a set of nonzero weight is independent), and with `cover`
  (`1 ≤ ∑ s ∈ univ.filter (v ∈ ·), weight s` for every `v`).
- Argument: a weight function on independent sets is the same thing as a weight function
  on all vertex sets that vanishes off the independent ones. The covering sum then ranges
  over the same nonzero terms.
- Difference in form: the paper restricts to finite nonempty graphs. The structure
  requires `Fintype V` and allows the empty graph, where the unique fractional colouring up
  to the weight of `∅` has total at least `0`.
- The decidability of `v ∈ s` used by the filter is classical; this affects nothing
  mathematically.

### F-CHIF — fractional chromatic number (new) — D-1.chif

- Paper: "The ordinary fractional chromatic number `χ_f(G)` is the minimum of `∑_I w_I`
  over these assignments."
- Lean: `fractionalChromaticNumber G = sInf (Set.range FractionalColoring.total)`, a real
  number, where `total w = ∑ s, w.weight s`.
- Argument: the set of totals is nonempty (weight `1` on every singleton is a fractional
  colouring) and bounded below by `0`, so `sInf` is its infimum. The paper's minimum exists
  and equals the infimum, because the feasible set is a closed polyhedron on which the
  objective is bounded below.
- Difference in form: infimum instead of minimum. Attainment is not asserted and is not
  needed: Corollary 1.2 uses only a lower bound on every total (S-1.b) and an upper bound
  by one particular total (S-1.c).
- To prove at M0 or M1: the set of totals is nonempty and bounded below. Without
  nonemptiness, `sInf ∅ = 0` in `ℝ` would make lower bounds on `χ_f` false.

### F-HOLE — linear data and the hole relation (new) — D-2.0, D-2.1

- Paper: §2.1 ¶1 and Definition 2.1, quoted at the head of `Hadwiger/HoleRelation.lean`.
- Lean: `HoleData X V Ω` bundles `a`, `T` with `T_symm`, `U` with `U_injective`, and `u`,
  over `ZMod 2`. `r x = a + T x`. `Hole i j` is the existence of `li lj : X` with
  `U i li = U j lj`, `(u j).comp (U i) = r li`, `(u i).comp (U j) = r lj`,
  `a li + a lj = 1`.
- Argument: a literal transcription. `F_2` is `ZMod 2`. A bilinear form is a linear map
  into linear maps, so `T x` is the functional `T(x, ·)`. The middle identities are
  equalities of linear maps `X → ZMod 2`, that is, of functionals on all of `X`.
- Difference in form: the paper takes `X`, `V` finite-dimensional and `Ω` finite. The
  structure does not. Definition 2.1 and Lemma 2.2 do not use these hypotheses, so the
  Lean statements are about a larger class and imply the paper's. If a later proof turns
  out to need finiteness, it will be added as an explicit hypothesis and recorded here.
- Difference in form: Lemma 2.2's triangle-freeness is stated for any three elements with
  holes on all three pairs, without "distinct". A repeated element would give a loop,
  which the lemma also excludes, so this is the same assertion.

### F-POSGRAPH — the graph on positions (new) — D-2.G

- Paper: "Given any list `o_1, …, o_m ∈ Ω`, form a graph `G` on its *positions*: two
  distinct positions are adjacent when their elements have no hole. This gives a finite
  simple graph even when elements repeat" (§2.1).
- Lean: `positionGraph o`, for `o : Fin m → Ω`, has `Adj p q := p ≠ q ∧ ¬ Hole (o p) (o q)`.
- Argument: a literal transcription. Symmetry of adjacency uses the symmetry of `Hole`,
  which is proved (`Hole.symm`), so the definition depends on no `sorry`.

---

## Target statements

Each differs from the paper only in form. The differences are listed so that a reviewer can
check each one.

### T-1.1 — Theorem 1.1

- Paper: "There are arbitrarily large integers `m` for which an `m`-vertex finite simple
  graph `G` satisfies `α(G) ≤ 2` and `cm(G) < m/100`."
- Lean: `∀ N, ∃ m, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), G.indepNum ≤ 2 ∧ 100 * connectedMatchingNumber G < m`.
- Form: "arbitrarily large" is `∀ N, ∃ m ≥ N`. An `m`-vertex graph is a graph on `Fin m`.
  `cm < m/100` over the reals is `100 · cm < m` over the naturals.

### P-3.5 — Proposition 3.5

- Paper: "For every finite nonempty graph `G` of order `m`,
  `h(G) ≤ (m + 4 cm(G) + 2)/3`. In particular, if `α(G) ≤ 2` and `cm(G) < m/100`, then
  `h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)` (`m ≥ 5`)."
- Lean, first assertion: `3 * hadwigerNumber G ≤ Fintype.card V + 4 * connectedMatchingNumber G + 2`
  for `[Fintype V] [Nonempty V]`.
- Lean, second assertion: under `G.indepNum ≤ 2`, `100 * cm < |V|`, `5 ≤ |V|`, there is
  `k : ℕ` with `G.chromaticNumber = k` and the three inequalities, in `ℝ`.
- Form: the first assertion is cleared of its denominator. In the second, `χ(G)` is
  exhibited as a natural number. The second assertion is stated for any `Fintype`; the
  hypothesis `5 ≤ |V|` makes it nonempty.

### C-1.2 — Corollary 1.2

- Paper: "There are finite nonempty simple graphs `G` of arbitrarily large order `m` for
  which `h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`."
- Lean: `∀ N, ∃ m, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), ∃ k : ℕ, G.chromaticNumber = k ∧ …`
  with the four inequalities in `ℝ`, the last being `fractionalChromaticNumber G ≤ k`.
- Form: as for T-1.1 and P-3.5. Nonemptiness is not a separate hypothesis because
  `26m/75 + 2/3 < m/2` is false at `m = 0`.

### T-FINAL — the final theorem

- User's target: "there are finite simple graphs of arbitrarily large order whose chromatic
  number exceeds their Hadwiger number."
- Lean: `∀ N, ∃ m, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), (hadwigerNumber G : ℕ∞) < G.chromaticNumber`.
- Form: the comparison is made in `ℕ∞`. The chromatic number of a finite graph is finite,
  so the inequality cannot hold through an infinite right-hand side.
- To prove at M0, to make that last sentence a theorem rather than a remark: nothing new is
  needed; it is Mathlib's `chromaticNumber_le_card`.

### The fidelity question that matters most

The final theorem is only as meaningful as `hadwigerNumber`. If the definition were too
small — for instance, if a typo made `HasCliqueMinor` unsatisfiable for `t ≥ 2` — the final
theorem would be true and worthless. M0 must therefore prove sanity lemmas that pin the
definitions from both sides, at least: `hadwigerNumber (⊤ : SimpleGraph (Fin n)) = n`;
`hadwigerNumber` of a path on three vertices is `2`; `hadwigerNumber` of the 4-cycle is
`3` (contracting one edge gives a triangle); monotonicity under adding edges; and the
analogous small checks for `connectedMatchingNumber` and `fractionalChromaticNumber`
(for example `χ_f` of the 5-cycle is `5/2`).
