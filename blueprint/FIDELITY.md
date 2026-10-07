# Fidelity notes

One note per definition of the statement layer, arguing that the Lean definition means
what the paper means, and one per target statement, recording every difference in form.

**Review status: every note below was signed off by the user, John Fairfax-Ball, on
2026-10-07.** Each note carries its "Reviewed by" line.

How the sign-off came about, so that its weight can be judged:

- The notes were written by the worker who wrote the definitions. On 2026-10-07 another
  worker session (Claude) re-read every note against the paper's source and against the
  Mathlib source at the pinned commit, proved the sanity lemmas of milestone M0, and wrote
  `blueprint/M0_REVIEW_SHEET.md`: one item per note, with the paper's sentence, the Lean
  text, what is machine-checked, and every doubt found. That re-read was preparation, not
  review.
- The user answered the sheet's seven questions; the answers were carried out and are
  recorded in the notes they concern, marked "Decision".
- The user was then asked how the sign-off of the sheet's 20 items should be recorded, and
  chose "Accept all 20 items". The question and the answer are quoted on the sheet and in
  `docs/SESSION_LOG.md`. The "Reviewed by" lines below were written on that instruction.

What the sign-off covers: each note, and the Lean text it describes, as they stood on
2026-10-07 at the commit that records the sign-off. It does not cover later changes. A
definition or statement that is added or changed afterwards needs a new or amended note,
and that note is unreviewed until the user signs it off.

Lines that begin "Status update after the sign-off" were added later by a worker. They say
what has since been proved and nothing else. They change no definition, no statement and no
fidelity argument, they are not part of the signed text, and the sign-off does not cover
them. Where such a line and the signed text above it differ about what is proved, the line
is the later one; the blueprint is the authority either way.

Where a note says "proved at M0", the lemma is in `Hadwiger/Sanity/`, has a blueprint entry
`S-M0.*`, and is `DONE` by `scripts/axiom_audit.py`. That is a statement about the build.

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
- In Mathlib, read at M0: `IsIndepSet.card_le_indepNum` and `exists_isNIndepSet_indepNum`
  make "the supremum is the maximum size" a theorem for finite graphs.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-1).

### F-CHI — chromatic number (Mathlib) — D-1.chi

- Paper: "`χ(G)` … chromatic number" (§1 ¶1), the least number of colours in a proper
  vertex colouring.
- Lean: `SimpleGraph.chromaticNumber G : ℕ∞`, the infimum of the `n` with `G.Colorable n`,
  where `G.Colorable n` means there is a proper colouring with colours in `Fin n`.
- Argument: this is the standard definition. For a finite graph it is finite and at most
  `|V|` (`chromaticNumber_le_card`).
- Junk values: none in `ℕ∞` itself. Statements here never apply `.toNat`; they exhibit the
  value as a natural number `k` with `G.chromaticNumber = k`.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-2).

### F-MINOR — `K_t` minor (new) — D-1.minor

- Paper: uses "`G` contains a `K_t` minor" without defining it (§1 ¶1). The standard
  meaning: `K_t` can be obtained from a subgraph of `G` by contracting edges.
- Lean: `MinorModel H G` is a family of vertex sets `branch w` of `G`, one per vertex `w`
  of `H`, each inducing a connected subgraph, pairwise disjoint, with an edge of `G`
  between `branch w` and `branch w'` whenever `w`, `w'` are adjacent in `H`.
  `IsMinor H G` says a model exists. `HasCliqueMinor G t` is `IsMinor ⊤ G` for the complete
  graph `⊤` on `Fin t`.
- Argument: this is the standard branch-set characterisation of minors (Diestel, *Graph
  Theory*, §1.7 "Contraction and minors"; checked on 2026-10-07, see the next item): `H`
  is a minor of `G` exactly when `G` has disjoint
  connected vertex sets indexed by `V(H)` with an edge between the sets of every adjacent
  pair. Contracting each branch set and deleting the rest of `G` gives `H` plus possibly
  extra edges, which are then deleted. Vertices outside the branch sets are allowed, as
  are extra edges, which is what "subgraph" permits. For `H = K_t` the adjacency condition
  is "every two distinct branch sets are joined by an edge".
- Nonemptiness: Mathlib's `Connected` includes `Nonempty`, so every branch set is nonempty.
- Citation checked on 2026-10-07, on the user's instruction (question Q2), against the
  author's free preview of the book (Chapter 1, pages 19 to 21; the author's page
  describes it as the sixth edition, 2025). There a graph `Y` has `X` as a minor when it
  contains, as a subgraph, a graph whose vertex set is partitioned into connected branch
  sets indexed by `V(X)`, with an edge between two branch sets exactly for the edges of
  `X`. The book then restates this: `X` is a minor of `Y` if and only if there is a map
  from a subset of `V(Y)` onto `V(X)` whose fibres are connected in `Y` and such that for
  every edge of `X` some edge of `Y` joins the fibres of its ends. With
  `branch w` the fibre of `w`, that is `MinorModel` clause for clause: fibres are disjoint;
  "onto" is nonemptiness, and the book's "connected" (§1.4) also means non-empty and is
  about the induced subgraph, as `(G.induce (branch w)).Connected` is. The equivalence with
  deleting vertices, deleting edges and contracting edges is Corollary 1.7.2 there, for
  finite graphs; transitivity is part of Proposition 1.7.1. Statement numbers differ
  between editions of the book, so they are given for this edition only. The preview
  chapter was read directly. For the first and second editions only the tables of contents
  were looked at, and at second hand (ProofWiki; the EMIS mirror of the book's site); both
  list 1.7 "Contraction and minors".
- The paper itself works with this notion: its proof of Proposition 3.5 starts from "a
  complete-minor model with `b` branch sets".
- Edge cases: `HasCliqueMinor G 0` always holds (no branch sets). `HasCliqueMinor G 1`
  holds exactly when `G` has a vertex. Both proved at M0 (S-M0.minor-zero-one).
- Proved at M0: a `K_t` minor needs `t ≤ |V|` (S-M0.minor-le-card); an edge is a `K_2`
  minor (S-M0.minor-edge); a model is carried along any injective graph homomorphism, so
  clique minors survive adding edges and isomorphism (S-M0.minor-support); a `K_{|V|}`
  minor forces the graph to be complete (S-M0.hadwiger-complete-iff).
- Not proved in Lean: the equivalence with a definition by edge contractions. Mathlib has
  no contraction of simple graphs, so there is nothing to compare with. The fidelity of
  this definition rests on the textbook equivalence. Also not proved: that `IsMinor` is
  transitive.
- Decision (user, 2026-10-07, question Q1): the branch-set definition is accepted as the
  meaning of "`K_t` minor".
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-3).

### F-HADWIGER — Hadwiger number (new) — D-1.h

- Paper: "`h(G)` is the largest `t` for which `G` contains a `K_t` minor" (§1 ¶1).
- Lean: `hadwigerNumber G = sSup {t : ℕ | HasCliqueMinor G t}`.
- Argument: for a finite vertex type the set contains `0` and is bounded by `|V|`, because
  the branch sets are nonempty and pairwise disjoint. A nonempty bounded set of naturals
  has a maximum and `sSup` returns it.
- Proved at M0: `HasCliqueMinor G t → t ≤ Fintype.card V` (S-M0.minor-le-card) and
  `HasCliqueMinor G (hadwigerNumber G)` (S-M0.hadwiger-attained). So for a finite graph
  "the supremum is a maximum" is a theorem. Also proved: `G` has a `K_t` minor exactly when
  `t ≤ hadwigerNumber G` (S-M0.hadwiger-largest); `h(K_n) = n`; the path on three vertices
  has `h = 2`; the 4-cycle has `h = 3`; monotonicity under adding edges; invariance under
  isomorphism; `h(G) = |V|` exactly when `G` is complete (S-M0.hadwiger-top, -path3,
  -cycle4, -mono, -iso, -complete-iff).
- Junk values: `sSup` of an unbounded set of naturals is `0`. That can happen only for an
  infinite graph; every statement here has a `Fintype`.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-4).

### F-HC — Hadwiger's conjecture (new) — D-1.HC

- Paper: "Hadwiger's conjecture … asserts that `h(G) ≥ χ(G)` for every finite nonempty
  simple graph `G`" (§1 ¶2).
- Lean: `HadwigerConjecture` is
  `∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V), G.chromaticNumber ≤ (hadwigerNumber G : ℕ∞)`.
- Argument: a literal transcription. Mathlib's `SimpleGraph` is a simple graph (symmetric,
  irreflexive adjacency). Quantifying over `V : Type` loses nothing: every finite graph is
  isomorphic to one on some `Fin m`, and both sides are isomorphism-invariant.
- Proved at M0: invariance of `hadwigerNumber` under graph isomorphism (S-M0.hadwiger-iso).
  Not proved: that the statement over `V : Type` is equivalent to the statement over all
  universes. The project needs only the negation, which is proved from a graph on `Fin m`;
  refuting the conjecture for the graphs on `Type` refutes it for any larger class.
- Note: this is the statement the paper refutes. It is a different statement from HC7.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-5).

### F-TOUCH — touching edges (new) — D-1.touch

- Paper: "Two disjoint edges are *touching* if an edge joins their endpoint sets" (§1 ¶3).
- Lean: `EdgesTouch G e f` for `e f : Sym2 V` is `∃ x ∈ e, ∃ y ∈ f, G.Adj x y`.
- Argument: the endpoint set of `e` is `{x | x ∈ e}`, and "an edge joins" two sets when
  some vertex of one is adjacent to some vertex of the other.
- Difference in form: the paper defines touching only for disjoint edges; the predicate is
  defined for any two unordered pairs. It is only used for two distinct edges of a
  matching, which are disjoint, so the extra generality is never exercised.
- Consistent with §2.1, last paragraph: "Two disjoint edges fail to touch precisely when
  all four cross pairs are holes", holes being the non-edges there.
- Proved at M0: on the graph with only the edges `0–1` and `2–3` the two edges do not
  touch, and that is why `cm = 1` there (S-M0.cm-two-disjoint-edges).
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-6).

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
- "Size" is read as the number of edges. The paper does not say edges or vertices; its
  proof of Proposition 3.5 counts edges (`c ≥ e + ⌊s/2⌋`).
- For a finite vertex type the set of sizes contains `0` (the empty subgraph) and is
  bounded by `|V|/2`, so the supremum is a maximum.
- Proved at M0: `2·cm(G) ≤ |V|` (S-M0.cm-le-half); the supremum is attained
  (S-M0.cm-attained); `cm(K_n) = ⌊n/2⌋` (S-M0.cm-top); `cm = 1` for two disjoint edges with
  no edge between them (S-M0.cm-two-disjoint-edges); any `k` pairwise disjoint, pairwise
  touching edges form a connected matching with exactly `k` edges (S-M0.cm-support).
- Junk values: `Set.ncard` of an infinite set is `0`, and `sSup` of an unbounded set is
  `0`. Both need an infinite graph.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-7).

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
- Proved at M0: nonnegative weights on any finite family of independent sets that cover
  every vertex give a `FractionalColoring` with the same total (S-M0.chif-support).
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-8).

### F-CHIF — fractional chromatic number (new) — D-1.chif

- Paper: "The ordinary fractional chromatic number `χ_f(G)` is the minimum of `∑_I w_I`
  over these assignments."
- Lean: `fractionalChromaticNumber G = sInf (Set.range FractionalColoring.total)`, a real
  number, where `total w = ∑ s, w.weight s`.
- Argument: the set of totals is nonempty (weight `1` on every singleton is a fractional
  colouring) and bounded below by `0`, so `sInf` is its infimum. The paper's minimum exists
  and equals the infimum, because the feasible set is a closed polyhedron on which the
  objective is bounded below.
- Difference in form: infimum instead of minimum. The definition does not assert
  attainment, and Corollary 1.2 does not need it: it uses only a lower bound on every total
  (S-1.b) and an upper bound by one particular total (S-1.c).
- Proved at M0: the set of totals is nonempty and bounded below by `0` (S-M0.chif-totals),
  so the `sInf` is never the junk value `sInf ∅ = 0`; **the infimum is attained**
  (S-M0.chif-attained), so it equals the paper's minimum by a Lean proof and no longer by
  the remark about polyhedra above; `χ_f(K_n) = n` (S-M0.chif-top); `χ_f(C_5) = 5/2`
  (S-M0.chif-cycle5).
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-9).

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
- No M0 sanity lemma covers these definitions; the M0 list has none for them. In
  particular nothing in Lean shows that `Hole` can hold at all. A hand example, which is
  not a proof in Lean, is on the review sheet.
- Decision (user, 2026-10-07, question Q3): dropping "finite-dimensional" and "finite"
  is accepted.
- Decision (user, 2026-10-07, question Q4): a non-vacuity lemma is to be added. It is in
  the blueprint as S-M3.hole-nonvacuous, `NOT_STATED`, and in the M3 task list.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-10).

### F-POSGRAPH — the graph on positions (new) — D-2.G

- Paper: "Given any list `o_1, …, o_m ∈ Ω`, form a graph `G` on its *positions*: two
  distinct positions are adjacent when their elements have no hole. This gives a finite
  simple graph even when elements repeat" (§2.1).
- Lean: `positionGraph o`, for `o : Fin m → Ω`, has `Adj p q := p ≠ q ∧ ¬ Hole (o p) (o q)`.
- Argument: a literal transcription. Symmetry of adjacency uses the symmetry of `Hole`,
  which is proved (`Hole.symm`), so the definition depends on no `sorry`.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-11).

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
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-15).

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
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-16).
- Status update after the sign-off (M1, 2026-10-07): the second assertion now has a
  complete proof body, with its statement unchanged. It rests on the first assertion,
  which is still `sorry`, so it is `PROVED_MODULO` and the entry P-3.5 is still `STATED`.

### C-1.2 — Corollary 1.2

- Paper: "There are finite nonempty simple graphs `G` of arbitrarily large order `m` for
  which `h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`."
- Lean: `∀ N, ∃ m, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), ∃ k : ℕ, G.chromaticNumber = k ∧ …`
  with the four inequalities in `ℝ`, the last being `fractionalChromaticNumber G ≤ k`.
- Form: as for T-1.1 and P-3.5. Nonemptiness is not a separate hypothesis because
  `26m/75 + 2/3 < m/2` is false at `m = 0`.
- The corollary's last clause, that the fractional weakening `χ_f(G) ≤ h(G)` is false, is
  stated separately since 2026-10-07 (S-1.d; note F-FHC below).
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-18).
- Status update after the sign-off (M1, 2026-10-07): the corollary now has a complete
  proof body, with its statement unchanged. It rests on Theorem 1.1 and on the first
  assertion of Proposition 3.5, both still `sorry`, so it is `PROVED_MODULO`.

### T-FINAL — the final theorem

- User's target: "there are finite simple graphs of arbitrarily large order whose chromatic
  number exceeds their Hadwiger number."
- Lean: `∀ N, ∃ m, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), (hadwigerNumber G : ℕ∞) < G.chromaticNumber`.
- Form: the comparison is made in `ℕ∞`. The chromatic number of a finite graph is finite,
  so the inequality cannot hold through an infinite right-hand side.
- Proved at M0, from Mathlib's `chromaticNumber_le_card`: for a finite graph the inequality
  holds exactly when `χ(G)` is a natural number `k` with `h(G) < k` (S-M0.final-finite).
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-19).

### T-NOT-HC — Hadwiger's conjecture is false

Note added at M0; before that the form was recorded only in the Lean doc comment.

- Paper: "Thus Hadwiger's conjecture and its fractional-coloring weakening
  `χ_f(G) ≤ h(G)` are false" (Corollary 1.2, last sentence).
- Lean: `not_hadwigerConjecture : ¬ HadwigerConjecture`, with `HadwigerConjecture` as in
  F-HC.
- Form: this is the first half of the sentence. The second half is
  `not_fractionalHadwigerConjecture` (S-1.d; note F-FHC below).
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-19).

### F-FHC — the fractional weakening and its negation (new) — D-1.fHC, S-1.d

Note added on 2026-10-07, when the definition and the statement were added on the user's
decision (question Q6).

- Paper: "Thus Hadwiger's conjecture and its fractional-coloring weakening
  `χ_f(G) ≤ h(G)` are false" (Corollary 1.2, last sentence).
- Lean: `FractionalHadwigerConjecture` is
  `∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V), fractionalChromaticNumber G ≤ (hadwigerNumber G : ℝ)`,
  and `not_fractionalHadwigerConjecture : ¬ FractionalHadwigerConjecture`.
- Reading adopted: the paper writes only the inequality. The quantifier "for every finite
  nonempty simple graph `G`" is supplied from the paper's statement of Hadwiger's
  conjecture, of which this is called the weakening. No other quantifier makes sense of
  "are false": the paper refutes it by exhibiting graphs.
- Form: the comparison is in `ℝ`, with `h(G)` cast from `ℕ`. Vertex types range over
  `Type`, as in F-HC, and for the same reason this cannot weaken the negation.
- Not stated: that this really is a weakening, that is, that `HadwigerConjecture` implies
  `FractionalHadwigerConjecture`. That is `χ_f ≤ χ` (S-1.c, still `sorry`) and nothing
  here depends on it.
- The negation has a complete proof body from Corollary 1.2 (`h(G) < m/2 ≤ χ_f(G)`), so
  it is `PROVED_MODULO`.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-20).
- Status update after the sign-off (M1, 2026-10-07): S-1.c is no longer `sorry`; it is
  `DONE`. That `HadwigerConjecture` implies `FractionalHadwigerConjecture` is still not
  stated. The negation is still `PROVED_MODULO`: Corollary 1.2 now has a proof body, which
  rests on Theorem 1.1 and on the first assertion of Proposition 3.5.

### S-1.a, S-1.b, S-1.c — the three bounds of Section 1

Note added at M0; before that the forms were recorded only in the Lean doc comments.

- Paper: "Every color class has size at most `α(G)`, so `χ(G) ≥ |V(G)|/α(G)`"; "Hence
  `χ_f(G) ≥ |V(G)|/α(G)`"; "An ordinary coloring gives a fractional coloring with unit
  weights on its color classes, so `χ_f(G) ≤ χ(G)`."
- Lean: `G.Colorable k → Fintype.card V ≤ G.indepNum * k`;
  `(Fintype.card V : ℝ) ≤ G.indepNum * fractionalChromaticNumber G`;
  `G.Colorable k → fractionalChromaticNumber G ≤ k`.
- Form: no division (`|V| ≤ α · χ` instead of `χ ≥ |V|/α`; the two agree when `α(G) > 0`,
  that is, for a nonempty graph, and the Lean forms are also true for the graph with no
  vertices). S-1.a and S-1.c are stated for every proper `k`-colouring; `k = χ(G)` gives
  the paper's inequalities.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet items R-12, R-13, R-14).
- Status update after the sign-off (M1, 2026-10-07): all three are `DONE`, with their
  statements unchanged. The fully elaborated statements before and after were compared by
  machine and are identical (`docs/SESSION_LOG.md`, M1 session).

### L-2.2 and S-2.3 — Lemma 2.2 and equation (2.3)

Note added at M0. The difference in form of L-2.2 is also in F-HOLE.

- Paper: "The hole relation is symmetric, has no loops, and is triangle-free"; "Hence
  `α(G) ≤ 2`, `χ(G) ≥ ⌈m/2⌉`" for the graph on positions.
- Lean: `Hole.symm`, `not_hole_self`, `not_hole_triangle` (three elements, not assumed
  distinct), `(D.positionGraph o).indepNum ≤ 2`, and, since 2026-10-07 on the user's
  decision (question Q5),
  `∃ k : ℕ, (D.positionGraph o).chromaticNumber = k ∧ m ≤ 2 * k`.
- Form: triangle-freeness without "distinct". In the second half of equation (2.3) the
  chromatic number is exhibited as a natural number `k`, and `k ≥ ⌈m/2⌉` is written
  `m ≤ 2k`; for a natural number `k` the two are the same, and no division or ceiling
  appears. Its proof body is complete and rests on the first half and on S-1.a, both
  still `sorry`. It is not used later in the paper.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-17).
- Status update after the sign-off (M1, 2026-10-07): S-1.a is `DONE`. The first half of
  equation (2.3) is still `sorry`, so the second half is still `PROVED_MODULO`.

### The fidelity question that matters most

The final theorem is only as meaningful as `hadwigerNumber`. If the definition were too
small — for instance, if a typo made `HasCliqueMinor` unsatisfiable for `t ≥ 2` — the final
theorem would be true and worthless. M0 was therefore to prove sanity lemmas that pin the
definitions from both sides, at least: `hadwigerNumber (⊤ : SimpleGraph (Fin n)) = n`;
`hadwigerNumber` of a path on three vertices is `2`; `hadwigerNumber` of the 4-cycle is
`3` (contracting one edge gives a triangle); monotonicity under adding edges; and the
analogous small checks for `connectedMatchingNumber` and `fractionalChromaticNumber`
(for example `χ_f` of the 5-cycle is `5/2`).

All of these were proved on 2026-10-07 and are `DONE` in the blueprint section "Sanity
checks (not in the paper)". None was false. What they show is limited: the definitions
give the known answers on those checks. They do not show that the definitions are the
standard ones in general; that remains the argument of the notes above, and it is what the
user's sign-off on `blueprint/M0_REVIEW_SHEET.md` is for.
