# Fidelity notes

One note per definition of the statement layer, arguing that the Lean definition means
what the paper means, and one per target statement, recording every difference in form.

**Review status.** Every note in the sections "Definitions" and "Target statements" was
signed off by the user, John Fairfax-Ball, on 2026-10-07, and carries its "Reviewed by"
line. The notes of the last section, "Milestone M4, first slice", were added on 2026-10-08.
Eleven of them were signed off by the user the same day and carry their "Reviewed by"
lines. **Two are not reviewed: F-BOUND and P-3.4**, the explicit bound and Proposition 3.4,
which the user held for a second reading. (Until 2026-10-08 this paragraph said that every
note below was signed off. That stopped being true when the M4 notes were added, and the
paragraph was changed for that reason only. No signed note was altered.)

How the sign-off of 2026-10-07 came about, so that its weight can be judged:

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
- Status update after the sign-off (M4 first slice, 2026-10-08): the sentence of §2.1 quoted
  above under "Consistent with" is now a Lean lemma for the graph on positions,
  `Hadwiger.HoleRel.not_edgesTouch_iff_conflict` (blueprint S-M4.touch), with "all four
  cross pairs are holes" as the new predicate `HoleRel.Conflict`. The definition of
  `EdgesTouch` was not changed. `Conflict` is new and unreviewed (note F-UNIT).

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
- Status update after the sign-off (M3, 2026-10-07): Lemma 2.2 is proved in full for the
  structure as it is defined here, that is, without assuming `X`, `V` finite-dimensional
  or `Ω` finite. No proof needed finiteness and no hypothesis was added.
- Status update after the sign-off (M3, 2026-10-07): the non-vacuity lemma of question Q4
  is proved, `Hadwiger.exists_holeData_hole` (blueprint S-M3.hole-nonvacuous), so Lean now
  does show that `Hole` can hold. Its data is the hand example of the review sheet,
  unchanged; it checked in Lean as written. It is a new statement, added after the
  sign-off: its exact form is in its blueprint row, was chosen by the worker, and is not
  covered by the sign-off above. By the standing decision that checks and helper lemmas
  get blueprint rows and no fidelity notes, it has no note of its own.
- Status update after the sign-off (M3, 2026-10-07, later): the user accepted the form of
  `Hadwiger.exists_holeData_hole` as stated. That acceptance is a separate act from the
  sign-off of this note; it is recorded in the blueprint row S-M3.hole-nonvacuous and
  quoted in `docs/SESSION_LOG.md`, M3 session.
- Status update after the sign-off (M4 first slice, 2026-10-08): the hole relation of this
  note is now also packaged as an instance of an abstract hole relation,
  `Hadwiger.HoleData.holeRel` (blueprint D-3.rel), whose three fields are the three parts
  of Lemma 2.2. `HoleData`, `r` and `Hole` were not changed. `HoleRel` and `holeRel` are
  new and unreviewed (note F-HOLEREL).

### F-POSGRAPH — the graph on positions (new) — D-2.G

- Paper: "Given any list `o_1, …, o_m ∈ Ω`, form a graph `G` on its *positions*: two
  distinct positions are adjacent when their elements have no hole. This gives a finite
  simple graph even when elements repeat" (§2.1).
- Lean: `positionGraph o`, for `o : Fin m → Ω`, has `Adj p q := p ≠ q ∧ ¬ Hole (o p) (o q)`.
- Argument: a literal transcription. Symmetry of adjacency uses the symmetry of `Hole`,
  which is proved (`Hole.symm`), so the definition depends on no `sorry`.
- Reviewed by John Fairfax-Ball, 2026-10-07 (sheet item R-11).
- Status update after the sign-off (M4 first slice, 2026-10-08): `positionGraph` was not
  changed. A second graph on positions, for an abstract hole relation, was added
  (`Hadwiger.HoleRel.positionGraph`, blueprint D-3.rel), and
  `D.holeRel.positionGraph o = D.positionGraph o` holds by `rfl`
  (`Hadwiger.HoleData.positionGraph_holeRel`, blueprint S-M4.rel). The new definition is
  unreviewed (note F-HOLEREL).

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
- Status update after the sign-off (M2, 2026-10-07): the first assertion is proved, with
  its statement unchanged, so both assertions and the entry P-3.5 are `DONE`. The proof
  does not use the hypothesis `[Nonempty V]`: the inequality `3·h ≤ m + 4·cm + 2` also
  holds for the graph with no vertices, where it reads `0 ≤ 2`. The hypothesis is the
  paper's "nonempty" and has been left in the statement.

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
- Status update after the sign-off (M2, 2026-10-07): Proposition 3.5 is proved. The
  corollary now rests on Theorem 1.1 alone and is still `PROVED_MODULO`.

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
- Status update after the sign-off (M2, 2026-10-07): since Proposition 3.5 is proved, the
  negation rests on Theorem 1.1 alone. It is still `PROVED_MODULO`.

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
- Status update after the sign-off (M3, 2026-10-07): `not_hole_self`, `not_hole_triangle`
  and the first half of equation (2.3) are proved, with their statements unchanged, so
  L-2.2 and S-2.3 are `DONE`. The second half of equation (2.3) became `DONE` with them;
  its statement and its proof were not changed. The fully elaborated statements before and
  after were compared by machine and are identical (`docs/SESSION_LOG.md`, M3 session).
  The proof of triangle-freeness is the paper's six-term sum. That computation does not
  use that the three elements are distinct, so it proves the form "without distinct"
  directly, and the argument above about a repeated element is not what the Lean proof
  uses.
- Status update after the sign-off (M4 first slice, 2026-10-08): the first half of the
  equation, `α(G) ≤ 2`, is now also proved for the graph on positions of an abstract hole
  relation, by the same proof (`Hadwiger.HoleRel.indepNum_positionGraph_le_two`, blueprint
  S-M4.support). The statements of this note were not changed.
- Status update after the sign-off (M4 first slice, 2026-10-08), about a number, not about
  a statement: in the paper's PDF the equation of this note, `eq:sample-independence`, is
  numbered **(2.2)**, not (2.3); (2.3) is the equation of the constants `C_0`, `g`, `D`,
  `M`. The signed text above, and this repository's records generally, call it "(2.3)".
  The Lean statements and the quoted sentences are those of `eq:sample-independence`, so
  only the label is wrong. Found at the M4 first slice and reported to the user; whether
  the records are to be corrected is the user's decision (`docs/SESSION_LOG.md`, M4
  first-slice session).

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

---

## Milestone M4, first slice

**Review status of this section.** Eleven of its thirteen notes were signed off by the user,
John Fairfax-Ball, on 2026-10-08, and carry their "Reviewed by" lines: F-HOLEREL, F-LAW,
F-MARG, F-CAPS, F-UNIT, F-CONFLPROB, F-SUP, F-KL, F-LIST, L-3.2 and L-3.3 (sheet items R-21
to R-31). **Two are not reviewed**: F-BOUND and P-3.4 (items R-32 and R-33), which the user
held for a second reading. The six questions of the sheet were answered the same day, all
as the worker had recommended; the answers are recorded as "Decision" lines in the notes
they concern. The question, the options and the answers are quoted on
`blueprint/M4_REVIEW_SHEET.md` and in `docs/SESSION_LOG.md` (M4 first-slice session).

How this sign-off came about, so that its weight can be judged. The notes were written on
2026-10-08 by the worker who wrote the definitions and statements they describe, in the
same session; nobody independent read them before the user. The user was shown the review
sheet and a summary, and signed the eleven items by choosing the option the worker had
marked as recommended. The sign-off covers each note, and the Lean text it describes, as
they stood at the commit that records it. A sign-off says that the Lean text says what the
paper says, in the abstract form decided; it does not say that a statement is true. Lemma
3.2 and Lemma 3.3 are signed off as statements and are **not proved**.

This section was headed "notes awaiting review" until the sign-off was recorded; the text
of the notes was not changed when the lines were added.

The setting, decided by the user on 2026-10-07 (`blueprint/MILESTONES.md`, M4): Section 3 is
formalised for any finite type with a law and any symmetric, loopless, triangle-free
relation, not only for the paper's `Ω_n`, `μ_n` and hole relation. That is a
generalisation of the printed statements, approved as such. Every note below says where its
Lean text is more general than the paper's.

Where a note says "proved at M4", the lemma is in `Hadwiger/Sanity/` (or, for one lemma,
beside its definition), has a blueprint entry `S-M4.*`, and is `DONE` by
`scripts/axiom_audit.py`. The slice was "statements only"; the sanity lemmas were the one
exception the user made. They pin definitions. They are not evidence for Lemma 3.2, Lemma
3.3 or Proposition 3.4.

Equation numbers below are those of the paper's PDF: (3.1) is `eq:raw-law-caps`, (3.2)
`eq:fingerprint-length`, (3.3) `eq:container-count`, (3.4) `eq:pair-exception-bound`.

### F-HOLEREL — a hole relation in the abstract, and its graph on positions (new) — D-3.rel

- Paper: there is no such definition. Lemma 2.2: "The hole relation is symmetric, has no
  loops, and is triangle-free." Section 2.4, last paragraph: "By Lemma 2.2, their hole
  relation on `Ω_n` is symmetric, loopless, and triangle-free." Section 2.1: "Given any
  list `o_1, …, o_m ∈ Ω`, form a graph `G` on its *positions*: two distinct positions are
  adjacent when their elements have no hole."
- Lean: `HoleRel Ω` is a structure with a relation `Rel : Ω → Ω → Prop` and three proofs:
  `symm` (`Rel i j → Rel j i`), `irrefl` (`¬ Rel i i`), `triangle_free`
  (`Rel i j → Rel j k → Rel i k → False`). `HoleRel.positionGraph H o`, for
  `o : Fin m → Ω`, has `Adj p q := p ≠ q ∧ ¬ H.Rel (o p) (o q)`. `HoleData.holeRel D` is
  the `HoleRel` with `Rel := D.Hole` and the three parts of Lemma 2.2 as its proofs.
- Argument: the three fields are the three properties of Lemma 2.2, in the forms in which
  the Lean Lemma 2.2 has them (signed off, notes F-HOLE and "L-2.2 and S-2.3").
  Triangle-freeness is for any three elements, not assumed distinct; for a relation with no
  loops that is the same as for three distinct elements, since a repeated element would
  need a loop. The graph on positions is the signed-off `HoleData.positionGraph` with
  `H.Rel` in place of `D.Hole`, letter for letter.
- How the signed-off definition is an instance: `D.holeRel.positionGraph o = D.positionGraph o`
  holds by `rfl` (`HoleData.positionGraph_holeRel`, proved at M4, S-M4.rel).
  `HoleData.positionGraph` is not changed; the `pp.all` comparison of
  `docs/SESSION_LOG.md` (M4 first-slice session) confirms it.
- New. What Mathlib has: a symmetric relation with no loops is exactly a
  `SimpleGraph Ω`, and "no triangle" is `SimpleGraph.CliqueFree 3`. Not used, for three
  reasons. (1) The graph on positions makes positions adjacent when there is **no** hole,
  so a "hole graph" beside it would give two graphs with opposite meanings of adjacency.
  (2) The graph on positions is not a pullback of the complement: `Hᶜ.comap o` makes two
  positions with the same element non-adjacent, and the paper makes them adjacent. (3)
  `CliqueFree 3` speaks of three-element sets of pairwise adjacent vertices; that it is the
  same as the "any three elements" form would need a lemma and a review of its own. The
  bare structure is the paper's three words and nothing else. This is question Q3 of the
  review sheet.
- Difference from the paper: the relation is abstract (the user's decision). `Ω` is not
  assumed finite by the structure, as in `HoleData`; statements that need finiteness
  assume it.
- Degenerate cases. `Ω` empty: there is one hole relation, and nothing is said. No holes
  (`Rel` always false) is a legitimate `HoleRel`; then every graph on positions is complete
  (`HoleRel.positionGraph_eq_top`, proved at M4).
- Proved at M4: the instance and the `rfl` (S-M4.rel); the graph on positions has
  `α(G) ≤ 2`, by the proof of the first half of equation `eq:sample-independence`
  (blueprint S-2.3) word for word (`HoleRel.indepNum_positionGraph_le_two`, S-M4.support).
- Decision (user, 2026-10-08, question Q3): the abstract relation is the bare structure
  `HoleRel`, not a `SimpleGraph` with `CliqueFree 3`.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-21).

### F-LAW — laws on a finite type, and the mass of a set (new) — D-3.law

- Paper: "probability law", "probability measure", "law" and "distribution" are used
  without definition. Theorem 3.1: "every probability law `σ` on units"; "The inequalities
  in (3.1) are pointwise inequalities of measures on the finite raw spaces." Section 2.4:
  "Take the uniform distribution on this finite frame set … Let `Ω_n` be the raw vertex
  space and `μ = μ_n` this distribution." Section 3.1: "probability measures on a finite
  set", "`q` is a strictly positive probability measure". The mass of a set is written
  `μ(S)`, `μ^2(E_0)`, `ρ(S)`.
- Lean: `IsLaw p`, for `p : α → ℝ` on a `Fintype α`, is `(∀ x, 0 ≤ p x)` together with
  `∑ x, p x = 1`. `mass p S = ∑ x, S.indicator p x`, where Mathlib's `Set.indicator S p x`
  is `p x` for `x ∈ S` and `0` otherwise.
- Argument: a probability measure on a finite set is determined by its values at points,
  which are nonnegative and add up to one, and the measure of a set is the sum of the
  values at its points. That is the standard notion and the only one the paper can mean.
- **Representation. This is question Q1 of the review sheet.** What the pinned Mathlib has:
  - the set `stdSimplex ℝ α` of functions `α → ℝ`, with the same defining formula as
    `IsLaw`. At the pinned commit it is marked deprecated (since 2026-08-29), so it is not
    built on here;
  - its replacement `Convexity.StdSimplex ℝ α`, a bundled structure: finitely supported
    weights, nonnegative, with total one. Its weight functions are exactly the laws of
    this note (`isLaw_iff_exists_stdSimplex`, proved at M4);
  - `PMF α`: a function `α → ℝ≥0∞` with sum one;
  - `MeasureTheory.Measure α` and `ProbabilityMeasure α`, with values in `ℝ≥0∞`.
  Why real weight functions with a predicate. Lemma 3.2 is about a compact convex set of
  laws and compares entropies by a difference: with functions `α → ℝ`, Mathlib's `IsCompact`
  and `Convex ℝ` apply as they are, the segment `(1 − t)ρ + tρ'` is ordinary arithmetic, and
  real subtraction has no truncation. `PMF` has no topology and no convex structure in
  Mathlib. For measures both exist only through the weak topology and `ℝ≥0∞` arithmetic.
  Lemma 3.3 has real capacities. The list law is a finite product. The predicate is on
  bare functions, and not a structure that carries the function, because a set of laws has
  to be a subset of the vector space `α → ℝ` for "convex" to mean anything.
- Difference from the paper: none in content. Sums are finite sums over a `Fintype`.
- Degenerate cases. There is no law on an empty type, since the empty sum is `0`
  (`IsLaw.nonempty`, proved at M4). So a hypothesis "`μ` is a law" excludes the empty type,
  and that is the named hypothesis that excludes it in every statement below.
- Junk values: none. No division, no logarithm, no natural subtraction.
- Proved at M4 (S-M4.law, S-M4.mass): the link with Mathlib's `StdSimplex`; a point mass
  and the uniform weights are laws; `mass` is `0` on the empty set, the total on the whole
  type, the weight on a singleton, monotone, and at most `1` for a law.
- Decision (user, 2026-10-08, question Q1): a law is a real weight function with the predicate
  `IsLaw`, with finite sums; not a bundled object, not `PMF`, not a measure.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-22).

### F-MARG — marginals and the product law (new) — D-3.marg

- Paper: equation (3.1) writes `σ_1`, `σ_2` and `μ^2` without defining them. They are the
  two marginals of a law `σ` on ordered pairs and the law of two independent `μ`-elements.
- Lean: `marginalFst σ x = ∑ y, σ (x, y)`; `marginalSnd σ y = ∑ x, σ (x, y)`;
  `prodLaw p q = fun z => p z.1 * q z.2`. The paper's `μ^2` is `prodLaw μ μ`.
- Argument: literal. `σ_1` is the law of the first endpoint.
- Difference in form: all three are defined for arbitrary weight functions, not only laws,
  and `prodLaw` for two functions on two types. Only `prodLaw μ μ` (for `μ^2`) and
  `prodLaw σ σ` (two independent units) are used.
- Which marginal is which is fixed by a proof: the first marginal of `p ⊗ q` is `p` and the
  second is `q` (S-M4.marg, proved at M4). Also proved: the product of two laws is a law,
  and both marginals of a law are laws.
- New. Mathlib's `Measure.fst`, `Measure.snd`, `Measure.prod` and `PMF.map` are for
  measures and `PMF`s, which are not used (F-LAW).
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-23).

### F-CAPS — the three caps of equation (3.1) (new) — D-3.caps

- Paper: "`σ_1 ≤ Mμ`, `σ_2 ≤ Mμ`, `σ ≤ 2^{DN} μ^2`" (equation (3.1)); "The inequalities in
  (3.1) are pointwise inequalities of measures on the finite raw spaces."
- Lean: `SatisfiesCaps μ M B σ` is a structure of three proofs: `fst`
  (`∀ x, marginalFst σ x ≤ M * μ x`), `snd` (`∀ y, marginalSnd σ y ≤ M * μ y`), `joint`
  (`∀ z, σ z ≤ B * prodLaw μ μ z`).
- Argument: an inequality `ν ≤ ν'` of measures on a finite set means `ν(A) ≤ ν'(A)` for
  every set `A`; taking `A` a point gives the pointwise inequality, and summing the
  pointwise inequality over `A` gives it back. So "pointwise" may be read either way and the
  Lean form is the inequality at each point.
- Difference in form: `M` and `B` are arbitrary real numbers, as the user asked: "one real
  number for the marginal cap `M` and one for the joint cap `2^{DN}`". In the paper
  `M = 2^1000` and `B = 2^{DN}`. `μ` is any weight function in the definition; every
  statement assumes it is a law.
- Degenerate cases, proved at M4 (S-M4.caps). If `μ` and `σ` are laws and the caps hold
  then `1 ≤ M` and `1 ≤ B`: so for `M < 1`, or `B < 1`, no law satisfies the caps. For
  `M = B = 1` the caps hold for `σ = μ^2`, for every law `μ`; that is the check the user
  named ("the uniform law on pairs satisfies the three caps with both caps equal to 1").
- Junk values: none.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-24).

### F-UNIT — units and conflicts (new) — D-3.unit

- Paper (Section 3, first paragraph): "A *unit* is an ordered pair of raw vertices with no
  hole between its endpoints. The endpoints of a unit may be dependent. When two units are
  sampled independently, their four endpoints need not be independent within either unit.
  The event of interest is that all four cross pairs have holes". Proof of Proposition 3.4:
  "Make a finite *conflict graph* whose vertices are raw units; two units are adjacent when
  they give all four cross holes. There are no loops, since a repeated unit would require a
  hole from a raw vertex to itself."
- Lean: `H.IsUnit u := ¬ H.Rel u.1 u.2`, for `u : Ω × Ω`.
  `H.Conflict u v := H.Rel u.1 v.1 ∧ H.Rel u.1 v.2 ∧ H.Rel u.2 v.1 ∧ H.Rel u.2 v.2`.
- Argument: literal. The cross pairs of two ordered pairs are the four pairs with one
  endpoint from each.
- Reading adopted (PI-007): the two endpoints of a unit may be the same element. `(x, x)`
  has no hole between its endpoints, because the relation has no loops, so it is a unit by
  the definition as written. The paper needs such units: two positions with the same
  element are adjacent ("Equal elements are adjacent"), an edge of a matching may join
  them, and its type is then `(x, x)`.
- "May be dependent" is a remark about a random unit: under a law `σ` on units the two
  endpoints need not be independent. It is not a property of a pair, and there is nothing
  to formalise beyond `σ` being an arbitrary law on pairs.
- Difference in form: `Conflict` is defined for any two ordered pairs, not only for units,
  as `EdgesTouch` is defined for any two unordered pairs (F-TOUCH). The relation is an
  abstract `HoleRel`; the paper's units are pairs of raw vertices.
- Degenerate cases. With no holes every ordered pair is a unit and no two pairs conflict.
- Proved at M4 (S-M4.unit, S-M4.conflict, S-M4.touch): `(x, x)` is a unit; being a unit
  does not depend on the order; in the example of S-M3.hole-nonvacuous `(0, 1)` is not a
  unit and `(0, 0)` is; conflict is symmetric; no ordered pair conflicts with itself (the
  paper's reason, no loops), and no unit conflicts with itself for a second reason that
  does not use the absence of loops; two units can conflict; and the paper's sentence "Two
  disjoint edges fail to touch precisely when all four cross pairs are holes" holds for
  `Conflict` and the signed-off `EdgesTouch` in the graph on positions.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-25).

### F-CONFLPROB — the conflict probability of a law (new) — D-3.confl

- Paper (Theorem 3.1): "two independent units drawn from `σ` have all four cross holes with
  probability at least `2^{-100gN}`". Proof of Proposition 3.4: "The average, under this law
  `ρ`, of `ρ(N_R(v))` is the conflict probability of two independent `ρ`-units".
- Lean: `H.conflictProb σ = mass (prodLaw σ σ) {z | H.Conflict z.1 z.2}`, where `z` ranges
  over pairs of ordered pairs.
- Argument: two independent units with law `σ` are a pair `(u, v)` with law `σ ⊗ σ`, and
  the probability of an event is its mass.
- Proved at M4 (S-M4.conflprob): it equals `∑_u ∑_v σ(u) σ(v)` over the conflicting
  `(u, v)`; it is nonnegative for nonnegative weights and at most `1` for a law. The sum
  includes `u = v`, which contributes nothing because no pair conflicts with itself.
- Difference in form: defined for any weight function `σ`.
- Junk values: none.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-26).

### F-SUP — the conclusion of Theorem 3.1 as a hypothesis (new) — D-3.sup

- Paper (Theorem 3.1): "For the construction parameters specified in Sections 2 and
  Appendix A, for all sufficiently large `n`, every probability law `σ` on units satisfying
  `σ_1 ≤ Mμ`, `σ_2 ≤ Mμ`, `σ ≤ 2^{DN} μ^2` has the following property: two independent
  units drawn from `σ` have all four cross holes with probability at least `2^{-100gN}`."
  Proposition 3.4: "Assume the conclusion of Theorem 3.1 at a given sufficiently large `n`."
- Lean:

  ```lean
  def Supersaturated (H : HoleRel Ω) (μ : Ω → ℝ) (M B ε : ℝ) : Prop :=
    ∀ σ : Ω × Ω → ℝ, IsLaw σ → Function.support σ ⊆ {u | H.IsUnit u} →
      SatisfiesCaps μ M B σ → ε ≤ H.conflictProb σ
  ```
- Clause by clause. "every probability law `σ` on units": `IsLaw σ` and the support of `σ`
  lies in the units (PI-007: a law on units is a law on all ordered pairs that vanishes off
  the units; the caps compare `σ` with measures on `Ω` and on `Ω^2`, so `σ` has to be
  read there). "satisfying (3.1)": `SatisfiesCaps μ M B σ`. "two independent units drawn
  from `σ` have all four cross holes with probability at least `2^{-100gN}`":
  `ε ≤ H.conflictProb σ`.
- What is not in it: "For the construction parameters …, for all sufficiently large `n`".
  That is the quantification of Theorem 3.1 itself. **Theorem 3.1 is not stated.** Its
  statement at M5 is to be: for the parameter structure (PI-005) and all large `n`,
  `Supersaturated` for the hole relation of `Ω_n` (through `HoleData.holeRel`), `μ_n`,
  `M = 2^1000`, `B = 2^{DN}`, `ε = 2^{-100gN}`. The definition was written for that use: the
  three numbers are real, the relation is any `HoleRel`, and the law is any weight function.
- Difference from the paper: abstract, with real numbers `M`, `B`, `ε`.
- Degenerate cases, each proved at M4 unless marked (S-M4.sup):
  - `ε ≤ 0`: the property holds for every relation, law and caps
    (`supersaturated_of_nonpos`). So a statement that assumes it and wants a real conclusion
    must assume `0 < ε`.
  - marginal cap `M < 1`, or joint cap `B < 1` (with `μ` a law): the property holds for an
    empty reason, for every `ε` (`supersaturated_of_lt_one`,
    `supersaturated_of_jointCap_lt_one`).
  - `ε ≥ 1`: it can hold only for an empty reason. By hand, not in Lean: a law `σ` on units
    gives positive mass to some pair `(u, u)`, which does not conflict, so its conflict
    probability is below `1`.
  - empty type: there is no law, so the property holds for an empty reason.
  - no holes: every conflict probability is `0`. For `ε > 0` and a law `μ` the property then
    holds exactly when no law satisfies the caps, that is, when `M < 1` or `B < 1` (for
    `M ≥ 1` and `B ≥ 1` the law `μ^2` satisfies them). By hand, from S-M4.caps.
- It is not always empty: in an example on two elements it holds, with a law that satisfies
  the caps, exactly for `ε ≤ 1/2` (`exists_holeRel_supersaturated`, proved at M4). That is
  the check the user named, and it pins the property from both sides in that example.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-27).

### F-KL — relative entropy (new) — D-3.KL

- Paper (Section 3.1): "Relative entropy is taken with natural logarithms:
  `D(ρ‖q) = ∑_x ρ(x) log(ρ(x)/q(x))`. Here `q` is a strictly positive probability measure
  and `0 log 0 = 0`."
- Lean: `relEntropy ρ q = ∑ x, ρ x * Real.log (ρ x / q x)`, a real number, for
  `ρ q : α → ℝ` on a `Fintype α`.
- Argument: the paper's formula, with Mathlib's natural logarithm `Real.log`.
- Junk values, which decide what the definition means:
  - `0 log 0 = 0`: where `ρ x = 0` the term is `0 * Real.log 0`, which is `0` whatever
    `Real.log 0` is (it is `0`). So the paper's convention holds.
  - `q x = 0` and `ρ x > 0`: the honest value is `+∞`. Here the term is
    `ρ x * Real.log (ρ x / 0) = ρ x * Real.log 0 = 0`, a junk value. **So `relEntropy ρ q`
    is the paper's `D(ρ‖q)` only when `q` is positive wherever `ρ` is.** Each statement that
    uses it has to secure that: Lemma 3.2 assumes `q` strictly positive, and for `D(ρ'‖ρ)`
    it follows from the lemma's first assertion (PI-008; note L-3.2).
  - `Real.log` of a negative number is the logarithm of its absolute value. Laws are
    nonnegative, so this does not arise in the statements.
- New. What Mathlib has: `InformationTheory.klDiv μ ν`, for measures, with values in
  `ℝ≥0∞`, equal to `∞` when `μ` is not absolutely continuous with respect to `ν`; and the
  real functions `Real.negMulLog x = −x log x` and `InformationTheory.klFun x = x log x + 1 − x`.
  Why `klDiv` is not used: laws here are real weight functions, not measures (F-LAW), and
  Lemma 3.2 subtracts two entropies, which in `ℝ≥0∞` is truncated subtraction. For laws
  with `q` strictly positive the two should agree after `ENNReal.toReal`; that is **not
  proved** (blueprint S-M4.kl-mathlib, `NOT_STATED`, with what it would take).
- Difference from the paper: `relEntropy` is defined for all pairs of weight functions,
  with a junk value where the paper's `D` is infinite or undefined.
- Proved at M4 (S-M4.kl): `D(ρ‖ρ) = 0`; the relative entropy of the point mass at `a`
  against `q` is `−log q(a)`; against the uniform law on `n` points it is `log n`. The last
  two fix the sign, the order of the two arguments and the treatment of points of weight
  zero. Not proved here: `D ≥ 0`. The paper proves it within the proof of Lemma 3.2.
- Decision (user, 2026-10-08, question Q4): relative entropy is a real number given by the
  paper's finite sum, with the junk value described above; statements guard against it.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-28).

### F-LIST — the law of a list of independent elements (new) — D-3.list

- Paper (Section 2.4, last paragraph): "Sample `m` raw vertices independently with law
  `μ_n`, and form the graph on their positions as above." Proposition 3.4: "the sampled
  graph defined in Section 2 satisfies … with probability `1 − exp(−Ω(m))`."
- Lean: `listLaw μ m = fun o : Fin m → α => ∏ i, μ (o i)`. The probability of an event `E`
  about the list is `mass (listLaw μ m) E`.
- Argument: `m` elements are independent, each with law `μ`, exactly when the list
  `(o_1, …, o_m)` has probability `∏ μ(o_i)`. A list is a function on `Fin m`, as in the
  signed-off graph on positions (F-POSGRAPH).
- New. Mathlib's `Measure.pi` is for measures (F-LAW).
- Difference from the paper: `μ` is any weight function and the type any finite type;
  the paper's is `μ_n` on `Ω_n`. The graph is not part of this definition.
- Degenerate cases. `m = 0`: there is one list and it has weight `1` (`listLaw_zero`).
- Proved at M4 (S-M4.list): if `μ` is a law then `listLaw μ m` is a law, that is, it has
  total mass `1`; the probability that all `m` elements lie in `S` is `μ(S)^m`.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-29).

### L-3.2 — Lemma 3.2

- Paper: "Let `P` be a nonempty compact convex set of probability measures on a finite set,
  and let `ρ` minimize `D(·‖q)` on `P`. Then `ρ` is positive on the union of the supports
  of measures in `P`. For every `ρ' ∈ P`, `D(ρ'‖q) − D(ρ‖q) ≥ D(ρ'‖ρ)`. If `ρ'` is
  supported on a set `S`, the right side is at least `−log ρ(S)`." Before it: "`q` is a
  strictly positive probability measure".
- Lean: three theorems with the same hypotheses,

  ```lean
  {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p) (hconv : Convex ℝ P) (hcomp : IsCompact P)
  {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
  {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q)
  ```

  and the conclusions, abridged here to the name, the further hypotheses and the
  conclusion of each (the three statements are in full in the source and on the review
  sheet, item R-30)

  ```lean
  relEntropy_minimizer_pos :  ∀ x ∈ ⋃ ρ' ∈ P, Function.support ρ', 0 < ρ x
  relEntropy_le_sub_of_minimizer (hρ' : ρ' ∈ P) :
      relEntropy ρ' ρ ≤ relEntropy ρ' q - relEntropy ρ q
  neg_log_mass_le_relEntropy_of_minimizer (hρ' : ρ' ∈ P) (hS : Function.support ρ' ⊆ S) :
      -Real.log (mass ρ S) ≤ relEntropy ρ' ρ
  ```
- Clause by clause. "a … set of probability measures on a finite set": `P : Set (α → ℝ)`
  with `hP`. "compact": `IsCompact P`, in the product topology of `α → ℝ`, which for a
  finite type is the usual topology of `ℝ^α`. "convex": Mathlib's `Convex ℝ P`. "nonempty":
  not a separate hypothesis; it follows from `hρ`. "`ρ` minimize[s] `D(·‖q)` on `P`": `hρ`
  and `hmin`. "`q` is a strictly positive probability measure": `hq` and `hqpos`. "the union
  of the supports of measures in `P`": `⋃ ρ' ∈ P, Function.support ρ'`, with Mathlib's
  `Function.support ρ' = {x | ρ' x ≠ 0}`. "`ρ'` is supported on a set `S`":
  `Function.support ρ' ⊆ S`. "`ρ(S)`": `mass ρ S`.
- Differences in form.
  1. One theorem for each assertion, each repeating the hypotheses.
  2. The minimiser is spelled out. Mathlib's `IsMinOn (fun σ => relEntropy σ q) P ρ`
     unfolds to `hmin`; the explicit form is used so that it can be read without Mathlib.
  3. The second assertion is written with the smaller side on the left. The subtraction is
     real subtraction.
  4. In the third assertion "the right side" is `D(ρ'‖ρ)`, and `ρ'` is the `ρ' ∈ P` of the
     second assertion. That is how the paper's sentence reads and how its proof uses it.
- Hypotheses kept though the argument may not use them. Compactness serves to make a
  minimiser exist, and the lemma is handed one. That `q` has total mass one is not used by
  the paper's proof of the three assertions as far as the worker can see. Both are the
  paper's words and are kept. If the Lean proofs do not use them, that will be recorded,
  as it was for `[Nonempty V]` in Proposition 3.5. Whether to drop them is question Q6.
- Junk values. `relEntropy ρ q` and `relEntropy ρ' q` are honest: `q` is strictly positive.
  `relEntropy ρ' ρ` has a second argument that may vanish (PI-008). It is honest all the
  same: by the first assertion `ρ` is positive wherever `ρ'` is, so no term has `ρ' x > 0`
  and `ρ x = 0`. `Real.log (mass ρ S)` is an honest logarithm: `ρ'` is a law, so its support
  has a point; the point is in `S`; `ρ` is positive there; so `mass ρ S > 0`.
- Degenerate cases, checked by hand.
  - Empty type: there is no law, so `hP` and `hρ` cannot both hold. Excluded by `hρ`
    with `hP`.
  - `P` empty: excluded by `hρ`.
  - `P` a single law `{ρ}`: the assertions read "`ρ` is positive on its own support",
    `0 ≤ 0`, and `−log ρ(S) ≤ 0` for `S` containing the support of `ρ`, where `ρ(S) = 1`.
    True.
  - `q` with a zero: excluded by `hqpos`.
  - `S` the whole type: `−log 1 = 0 ≤ D(ρ'‖ρ)`, which is the nonnegativity of relative
    entropy. `S` empty: impossible for the support of a law. Excluded by `hS` with `hP`.
  - The length `m`, the conflict bound, the caps and the hole relation do not occur.
- Checked by hand, **which is not a proof**: the paper's argument for the three assertions
  (the derivative of the entropy along `(1 − t)ρ + tρ'` at `t = 0`; the exact identity
  `D(ρ'‖q) − D(ρ‖q) = D(ρ'‖ρ) + ∑ (ρ' − ρ) log(ρ/q)`; comparison with the normalised
  restriction of `ρ` to `S`) was followed at the first reading and again for this slice,
  with Lean's conventions for the terms where `ρ` vanishes. Nothing was found.
- Not proved: all three are `sorry`. Status `STATED`.
- Decision (user, 2026-10-08, question Q6): the paper's hypotheses are kept as printed
  ("compact"; `q` a probability measure). Whether the proofs use them is to be recorded
  when they are written.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-30).

### L-3.3 — Lemma 3.3

- Paper: "Let `R ⊆ Ω_n^2`. If no probability law supported on `R` satisfies (3.1), there
  are sets `S ⊆ Ω_n` and `E_0 ⊆ Ω_n^2` such that `μ(S) < 1/M`, `μ^2(E_0) < 2^{-DN}`, and
  every pair in `R` either has an endpoint in `S` or belongs to `E_0`."
- Lean:

  ```lean
  theorem exists_terminal_cut {μ : Ω → ℝ} (hμ : IsLaw μ) (M B : ℝ) (R : Set (Ω × Ω))
      (hR : ¬ ∃ σ : Ω × Ω → ℝ, IsLaw σ ∧ Function.support σ ⊆ R ∧ SatisfiesCaps μ M B σ) :
      ∃ (S : Set Ω) (E₀ : Set (Ω × Ω)),
        M * mass μ S < 1 ∧ B * mass (prodLaw μ μ) E₀ < 1 ∧
          ∀ z ∈ R, z.1 ∈ S ∨ z.2 ∈ S ∨ z ∈ E₀
  ```
- Clause by clause. "`R ⊆ Ω_n^2`": `R : Set (Ω × Ω)`. "no probability law supported on `R`
  satisfies (3.1)": `hR`. "sets `S ⊆ Ω_n` and `E_0 ⊆ Ω_n^2`": `S`, `E₀`.
  "`μ(S) < 1/M`": `M * mass μ S < 1`. "`μ^2(E_0) < 2^{-DN}`":
  `B * mass (prodLaw μ μ) E₀ < 1`. "every pair in `R` either has an endpoint in `S` or
  belongs to `E_0`": the last clause, with an inclusive "or".
- Differences in form.
  1. Abstract: any finite type with a law `μ`, in place of `Ω_n` with `μ_n`; real numbers
     `M` and `B` in place of `2^1000` and `2^{DN}`. No hole relation occurs: `R` is any set
     of ordered pairs, as in the paper.
  2. No division, as the user asked. For `M > 0` and `B > 0`, `M·μ(S) < 1` is `μ(S) < 1/M`
     and `B·μ^2(E_0) < 1` is `μ^2(E_0) < 1/B`.
- Hypotheses. `hμ` is the paper's (its `μ_n` is a law). There is no sign condition on `M`
  and `B`: the statement is claimed for all real numbers.
- Degenerate cases, checked by hand.
  - Empty type: no law; excluded by `hμ`.
  - `M < 1` (zero and negative values included): take `S` the whole type and `E_0` empty;
    `M·μ(S) = M < 1` and `B·0 = 0 < 1`. True for a trivial reason, whether or not `hR`
    holds.
  - `B < 1`: take `S` empty and `E_0` everything; `M·0 = 0 < 1` and `B·μ^2(Ω^2) = B < 1`.
    True for a trivial reason.
  - `M ≥ 1` and `B ≥ 1`: the content of the lemma. The paper's network has capacities
    `M μ(x)`, `M μ(y)` and `B μ(x) μ(y)`, which are nonnegative, as max-flow/min-cut needs.
  - `M = 1`: a law satisfies the marginal caps only if both its marginals are `μ`. Nothing
    special happens to the statement.
  - `R` empty: no law is supported on the empty set, so `hR` holds; `S` and `E_0` empty
    serve.
  - `R` everything, `M ≥ 1`, `B ≥ 1`: `μ^2` satisfies the caps, so `hR` fails and nothing
    is claimed.
  - The length `m`, the conflict bound and the hole relation do not occur.
- Junk values: none. No division or logarithm appears.
- Checked by hand, **which is not a proof**: the paper's cut-capacity inequality
  `Mμ(L_0) + Mμ(R_0) + B·μ^2(R ∩ ((Ω∖L_0) × (Ω∖R_0))) < 1` gives both bounds with
  `S = L_0 ∪ R_0`, for `M ≥ 0` and `B ≥ 0`, and the covering claim (recorded since the
  first reading in `blueprint/PAPER_ISSUES.md`, spot checks).
- Not proved: `sorry`. Status `STATED`.
- Reviewed by John Fairfax-Ball, 2026-10-08 (sheet item R-31).

### F-BOUND — the explicit bound of Proposition 3.4 (new) — D-3.bound

- Paper (proof of Proposition 3.4): equation (3.2),
  `L_N = 1 + ⌈ DN log 2 / (−log(1 − ε_N)) ⌉`; "The number of possible fingerprints, and
  hence terminal sets, is at most `(|Ω_n|^2 + 1)^{L_N}`"; "Let `k = ⌈m/200⌉`. The
  probability that at least `k` sampled positions have raw type in `S` is at most
  `C(m, k) μ(S)^k ≤ (em/(kM))^k ≤ (200e/M)^k`"; "It lies entirely in `E_0` with probability
  at most `2^{-kDN}`. There are at most `m^{2k}` such collections, so the probability that
  one exists is at most `m^{2k} 2^{-kDN}`" (equation (3.4)); "Union over the `exp(o(m))`
  terminal sets".
- Lean:

  ```lean
  noncomputable def fingerprintLength (B ε : ℝ) : ℕ :=
    1 + ⌈Real.log B / (-Real.log (1 - ε))⌉₊

  noncomputable def exceptionSize (m : ℕ) : ℕ :=
    ⌈(m : ℝ) / 200⌉₊

  noncomputable def sampleBound (n : ℕ) (M B ε : ℝ) (m : ℕ) : ℝ :=
    ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε *
      ((m.choose (exceptionSize m) : ℝ) / M ^ exceptionSize m
        + (m : ℝ) ^ (2 * exceptionSize m) / B ^ exceptionSize m)
  ```

  In words, with `n = |Ω|`, `L = fingerprintLength B ε`, `k = exceptionSize m`:
  `(n^2 + 1)^L · ( C(m, k)/M^k + m^{2k}/B^k )`.
- `fingerprintLength` is equation (3.2) with `B` for `2^{DN}` (so `log B` for `DN log 2`)
  and `ε` for `ε_N`. `exceptionSize` is the paper's `k`. `⌈·⌉₊` is Mathlib's `Nat.ceil`.
- **The exact form of the bound is question Q2 of the review sheet.** The form above stops
  at the first expression the paper writes for each exception probability. The
  alternatives are listed in note P-3.4 below.

**Hand derivation. This is not a proof.** It is the paper's proof of Proposition 3.4 with
`B`, `ε` and a general law in place of `2^{DN}`, `ε_N` and `μ_n`, written out so that each
factor of the bound can be traced. Nothing in it is machine-checked except where a Lean name
is given.

Setting: a finite type `Ω` with `n` elements, a law `μ`, a hole relation `H`, real numbers
`0 < M`, `0 < B`, `0 < ε < 1`, a number `m`, and the hypothesis `H.Supersaturated μ M B ε`.
Write `δ = −log(1 − ε) > 0`, `L = 1 + ⌈log B / δ⌉`, `k = ⌈m/200⌉`. For a set `R` of units, a
*feasible law on `R`* is a law on `Ω^2` with support in `R` that satisfies the three caps.

0. *A reduction that is not in the paper.* The paper's `μ_n` is uniform, so `q = μ^2` is
   strictly positive, as the definition of `D(·‖q)` requires. A general law may vanish
   somewhere. This costs nothing: lists that use an element of weight `0` have probability
   `0`; laws that satisfy the joint cap vanish where `μ^2` does; so everything may be
   restricted to the elements of positive weight, or `q` may be replaced off the support
   of `μ^2` by any positive values and rescaled, which shifts every entropy by one
   constant. The count below only improves when `n` decreases. Either way this is an
   addition to the paper's argument, and when the proof is written it will be a recorded
   departure. From here on `q = μ^2` is taken strictly positive.
1. *The procedure* (paper: "Entropy-controlled fingerprints"). Call two units adjacent when
   they conflict; no unit conflicts with itself (`HoleRel.not_conflict_self`). Given a set
   `I` of units no two of which conflict, start with `R` the set of all units. While some
   feasible law on `R` exists: let `ρ` be the feasible law on `R` of least `D(·‖q)` (the
   feasible laws form a compact convex set and the entropy is continuous on it); the
   `ρ`-average of `ρ(N_R(v))`, with `N_R(v)` the units of `R` that conflict with `v`, is
   the conflict probability of `ρ`, which is at least `ε` by the hypothesis; choose
   `v ∈ R` with `ρ(N_R(v))` largest, by a fixed rule, so `ρ(N_R(v)) ≥ ε > 0`; if `v ∈ I`,
   record `v` and remove `N_R(v)` from `R`; otherwise remove `v`. Both keep `I ⊆ R`. Each
   step removes a unit (`N_R(v)` is not empty, having positive mass; this uses `ε > 0`), so
   the procedure stops, at a *terminal set* `T(I) ⊇ I` on which no feasible law exists.
2. *The length of the fingerprint* (paper: equation (3.2)). Let `e(R)` be the least entropy
   of a feasible law on `R`. Then `0 ≤ e(R) ≤ log B`: the lower bound is the nonnegativity
   of relative entropy, and the upper bound holds because a feasible law has `σ ≤ Bq`.
   `e` does not decrease when `R` shrinks. Suppose `v` is recorded at `R` and a feasible
   law still exists on `R' = R ∖ N_R(v)`, with least-entropy law `ρ'`. Lemma 3.2, applied
   to the feasible laws on `R`, their minimiser `ρ`, the law `ρ'` and the set `S = R'`,
   gives `e(R') − e(R) ≥ D(ρ'‖ρ) ≥ −log ρ(R')`. Here `ρ(R') = 1 − ρ(N_R(v)) ≤ 1 − ε`, and
   `ρ(R') > 0` by the first assertion of the lemma, so `e(R') − e(R) ≥ δ`. If `ℓ` units
   are recorded, each of the first `ℓ − 1` recordings leaves a feasible law, so
   `(ℓ − 1) δ ≤ log B` and `ℓ ≤ 1 + ⌊log B / δ⌋ ≤ L`. (If `B < 1` no feasible law exists
   at all, `ℓ = 0`, and `L = 1`.) The paper writes the ceiling where the floor would do;
   the paper's form is kept.
3. *The number of terminal sets* (paper: "The fingerprint determines the terminal set").
   The run for `I` is reproduced from the set `F` of recorded units alone: replay the
   procedure, recording a selected unit exactly when it is in `F`. A selected unit is in
   `I` exactly when it is in `F`, so every step agrees. Hence `T(I)` is a function of `F`,
   a set of at most `L` units. There are at most `n^2` units, and a set with at most `n^2`
   elements has at most `(n^2 + 1)^L` subsets with at most `L` elements. So there are at
   most `(n^2 + 1)^L` terminal sets, over all `I`.
4. *The cuts.* For each terminal set `T`, Lemma 3.3 with `R = T` gives `S_T ⊆ Ω` and
   `E_T ⊆ Ω^2` with `M·μ(S_T) < 1`, `B·μ^2(E_T) < 1`, and every pair in `T` has an endpoint
   in `S_T` or lies in `E_T`. Fix them. They do not depend on the list.
5. *The two exception probabilities, for one `T`* (paper: "Terminal exceptions in the
   sample"). Let `A_T` be the set of lists with at least `k` positions whose element is in
   `S_T`. For a fixed set of `k` positions the probability that all their elements are in
   `S_T` is `μ(S_T)^k` (as in `mass_listLaw_forall_mem`), and there are `C(m, k)` such
   sets, so `P(A_T) ≤ C(m, k) μ(S_T)^k ≤ C(m, k)/M^k`. Let `B_T` be the set of lists for
   which some `k` pairwise disjoint ordered pairs of distinct positions all have their
   pair of elements in `E_T`. A fixed such collection uses `2k` distinct positions, so its
   pairs of elements are independent with law `μ^2` and it lies in `E_T` with probability
   `μ^2(E_T)^k ≤ 1/B^k`; there are at most `m^{2k}` collections; so
   `P(B_T) ≤ m^{2k}/B^k`.
6. *The union bound.* The probability that the list lies in some `A_T` or some `B_T` is at
   most `(n^2 + 1)^L · ( C(m, k)/M^k + m^{2k}/B^k )`, which is `sampleBound n M B ε m`.
7. *The deterministic step* (paper: "Suppose on this event that `G` has a touching
   matching of size at least `m/100`"). Let `o` be a list in no `A_T` and no `B_T`, and
   suppose `m ≤ 100c` with `c = cm(G)`. If `m = 0` then `k = 0` and every list is in every
   `A_T`; so `m ≥ 1` and `c ≥ 1`. Take a connected matching with `c` edges. Orient each
   edge `{p, q}` as `(p, q)`; its type `(o_p, o_q)` is a unit, since adjacent positions
   have no hole. Let `I` be the set of types. No two of them conflict: two different edges
   touch, so some cross pair of positions is adjacent, so some cross pair of elements has
   no hole (this is `HoleRel.not_edgesTouch_iff_conflict`); and a unit does not conflict
   with itself. Let `T = T(I)`. Every edge has its type in `T`, so it has an endpoint whose
   element is in `S_T`, or its type is in `E_T`. The edges of the first kind are disjoint
   and each contains a position with element in `S_T`; there are fewer than `k` such
   positions; so there are at most `k − 1` such edges. The others are disjoint ordered
   pairs of distinct positions with types in `E_T`, so there are at most `k − 1` of them.
   Hence `c ≤ 2(k − 1)` and `100c ≤ 200(k − 1) < m` (`mul_exceptionSize_lt`), a
   contradiction. So every list with `m ≤ 100·cm(G)` lies in some `A_T` or `B_T`, and its
   probability is at most the bound of step 6.

What the derivation uses of the hole relation: its symmetry, in step 7 and in the graph on
positions. It does not seem to use that the relation has no loops (no unit conflicts with
itself by the definition of a unit, `HoleRel.IsUnit.not_conflict_self`) or that it is
triangle-free. Triangle-freeness is what gives `α(G) ≤ 2`, which is not part of the bound.
The statement is nevertheless made for a `HoleRel`, which is the form the user decided.

Where the paper goes further, and this bound does not: it estimates
`C(m, k) μ(S)^k ≤ (em/(kM))^k ≤ (200e/M)^k`; it uses `m = 2^{C_0 g N}` and `D = 4C_0 g` to
write `m^{2k} 2^{-kDN} = 2^{-2C_0 g N k}`; and it takes logarithms, with
`log |Ω_n| = O(N^2)`, to get `exp(−Ω(m))` for large `n`. Those steps are about the paper's
parameters and are left to M17 by the user's decision.

- Junk values in the three definitions.
  - `Real.log B`: honest for `B > 0`.
  - `-Real.log (1 - ε)`: for `0 < ε < 1` it is the positive number `δ`. At `ε = 0` it is
    `0`, the quotient is Lean's `x / 0 = 0`, and the length comes out as `1`; that is a
    junk value, and with it the bound of Proposition 3.4 would be false
    (`exists_mass_listLaw_gt_sampleBound_of_zero`, proved at M4). For `ε ≥ 1` the
    logarithm is of a number that is not positive. Proposition 3.4 assumes `0 < ε < 1`.
  - `⌈·⌉₊` of a negative number is `0`. This happens for `0 < B < 1`, where the length is
    `1`. Step 2 shows that is harmless.
  - `(m : ℝ) / 200`: division by a nonzero number.
  - `/ M ^ k` and `/ B ^ k`: honest for `M > 0`, `B > 0`. With `M = 0` and `k ≥ 1` Lean
    gives `0` and the bound would be false (by hand: one element, no holes, `M = 0`,
    `B = 256`, `ε = 3/4`, `m = 2` give the bound `2^5 · 4/256 = 1/2`, the hypothesis holds
    for an empty reason, and the event has probability `1`). Proposition 3.4 assumes
    `0 < M` and `0 < B`.
  - `(m : ℝ) ^ (2 * k)` at `m = 0`, `k = 0` is `0^0 = 1`, and `C(0, 0) = 1`.
  - Casts: `n`, `m` and `C(m, k)` are cast from `ℕ` to `ℝ`; nothing is cast back, and
    there is no natural subtraction.
- Proved at M4 (S-M4.bound, S-M4.eps-needed): `m ≤ 200k < m + 200`, so `k` is the ceiling;
  `k = 1` for `1 ≤ m ≤ 200` and `k ≤ m`; the length is at least `1`, is `1` for `B = 1` and
  is `3` for `B = 4`, `ε = 1/2`; the bound is `2(n^2 + 1)^L` at `m = 0`, is
  `(n^2 + 1)^L (m/M + m^2/B)` for `1 ≤ m ≤ 200`, and is at least `1` for `0 < M ≤ 1` and
  for `0 < B ≤ 1`; and the counterexample at `ε = 0`. **None of these is evidence that the
  bound is right.**
- Decision (user, 2026-10-08, question Q2): the form of the bound is (A), the form stated
  here.
- **Not reviewed.** The user held this note's item (R-32) on 2026-10-08 for a second
  reading: the bound is a hand derivation and is not in the paper in this form. The
  decision on Q2 fixes which form is proposed; it is not a sign-off of the derivation
  or of the definitions.

### P-3.4 — Proposition 3.4

- Paper: "Assume the conclusion of Theorem 3.1 at a given sufficiently large `n`. For
  `m = 2^{C_0 g N}`, the sampled graph defined in Section 2 satisfies `α(G) ≤ 2`,
  `cm(G) < m/100` with probability `1 − exp(−Ω(m))`. The implied positive constant is
  independent of `n`."
- Form decided by the user on 2026-10-07 (`blueprint/MILESTONES.md`, M4): abstract; an
  explicit upper bound on the probability that the graph on positions of the random list
  has `cm ≥ m/100`, stated as `100 cm ≥ m`; existence as a corollary when the bound is
  below `1`.
- Lean:

  ```lean
  theorem mass_listLaw_le_sampleBound (H : HoleRel Ω) {μ : Ω → ℝ} (hμ : IsLaw μ)
      {M B ε : ℝ} (hM : 0 < M) (hB : 0 < B) (hε : 0 < ε) (hε1 : ε < 1) (m : ℕ)
      (hsup : H.Supersaturated μ M B ε) :
      mass (listLaw μ m) {o | m ≤ 100 * connectedMatchingNumber (H.positionGraph o)}
        ≤ sampleBound (Fintype.card Ω) M B ε m

  theorem exists_list_indepNum_le_two_and_connectedMatchingNumber_lt (H : HoleRel Ω)
      {μ : Ω → ℝ} (hμ : IsLaw μ) {M B ε : ℝ} (hM : 0 < M) (hB : 0 < B) (hε : 0 < ε)
      (hε1 : ε < 1) (m : ℕ) (hsup : H.Supersaturated μ M B ε)
      (hlt : sampleBound (Fintype.card Ω) M B ε m < 1) :
      ∃ o : Fin m → Ω, (H.positionGraph o).indepNum ≤ 2 ∧
        100 * connectedMatchingNumber (H.positionGraph o) < m
  ```
- Clause by clause. "Assume the conclusion of Theorem 3.1 at a given … `n`": `hsup`, for an
  abstract relation and numbers (F-SUP). "the sampled graph": `H.positionGraph o` for a
  list `o` with law `listLaw μ m` (F-LIST, F-HOLEREL). "`cm(G) < m/100`":
  `100 * connectedMatchingNumber … < m` in the corollary; its failure,
  `m ≤ 100 * connectedMatchingNumber …`, is the event of the bound. "`α(G) ≤ 2`": in the
  corollary; it holds for every list. "with probability `1 − exp(−Ω(m))`": replaced by "the
  failure probability is at most `sampleBound …`". "For `m = 2^{C_0 g N}`" and "sufficiently
  large `n`": gone; the bound is claimed for every `m`, and whether it is small is a matter
  of the numbers.
- Differences from the paper, all of them the user's decision of 2026-10-07 or its direct
  consequences.
  1. Abstract setting: any finite type, law and hole relation; real numbers `M`, `B`, `ε`.
  2. An explicit bound in place of `1 − exp(−Ω(m))` with a constant independent of `n`
     (PI-009). That the bound is `exp(−Ω(m))` uniformly in `n` for the paper's parameters is
     a separate statement, left to M17.
  3. Two statements: the bound, and existence. The paper states one probability for both
     properties; `α(G) ≤ 2` is deterministic there too ("holds deterministically by
     Lemma 2.2").
  4. `cm(G) ≥ m/100` is written `m ≤ 100·cm(G)` in `ℕ`. For natural numbers `c`, `m` the
     real inequality `c ≥ m/100` is `100c ≥ m`.
- **Hypotheses on the numbers, and where each comes from.**

  | Hypothesis | Whose | Why it is there |
  |---|---|---|
  | `hμ : IsLaw μ` | the paper's (`μ_n` is "the uniform distribution", Section 2.4). The Lean one is weaker: any law, not only a uniform one | the list law must be a law; and it excludes the empty type |
  | `hM : 0 < M` | the paper's (`M = 2^1000`, equation (2.3) of the PDF, `eq:early-constants`) | the bound divides by `M^k`; with `M = 0` it would be false (F-BOUND) |
  | `hB : 0 < B` | the paper's (`B = 2^{DN}`) | the bound divides by `B^k` and takes `log B` |
  | `hε : 0 < ε` | the paper's (`ε_N = 2^{-100gN}`) | with `ε ≤ 0` the hypothesis `hsup` is empty and the bound is false (`exists_mass_listLaw_gt_sampleBound_of_zero`) |
  | `hε1 : ε < 1` | the paper's (`ε_N = 2^{-100gN} < 1` as `N ≥ 1`) | so that `−log(1 − ε)` is a positive number and not a junk value |
  | `hsup` | the paper's ("Assume the conclusion of Theorem 3.1") | — |
  | none on `m` | the paper has `m = 2^{C_0 g N}` | the derivation does not use the value of `m`; for small `m` the bound is at least `1` unless `M` and `B` are large |
  | none that `μ` is positive or uniform | the paper's `μ_n` is uniform | the derivation needs positivity only through step 0 of F-BOUND, which removes it. **Added generality, part of the abstract form.** Whether to assume positivity instead is question Q5 |

  No hypothesis was added that the paper does not have. Two of the paper's are weakened
  (`μ` any law; `m` any number).
- **Alternatives for the form of the bound (question Q2).** With `n = |Ω|`,
  `δ = −log(1 − ε)`:
  - (A) the form stated: `(n^2 + 1)^{1 + ⌈log B/δ⌉} · ( C(m,k)/M^k + m^{2k}/B^k )`. Each
    factor is the first expression the paper writes. Recommended.
  - (B) the paper's further estimates: `(n^2 + 1)^L · ( (200e/M)^k + (m^2/B)^k )`. Weaker
    than (A) and follows from it by `C(m,k) ≤ (em/k)^k`; it brings `Real.exp 1` into the
    statement and adds a step to the proof. For the paper's `M = 2^1000` the estimate
    `C(m,k) ≤ 2^m` already makes the first term of (A) at most `2^{-4m}`, so (B) is not
    needed later either.
  - (C) a length without `log(1 − ε)`: `1 + ⌈log B / ε⌉`, using `−log(1 − ε) ≥ ε`, which is
    the estimate behind the paper's `L_N = O(1 + DN 2^{100gN})`. Weaker than (A); it would
    make the hypothesis `ε < 1` unnecessary.
  - (D) a sharper count: the floor in place of the ceiling, and the number of sets of at
    most `L` units in place of `(n^2 + 1)^L`. Stronger than (A) and further from the
    paper's formulas.
  - (E) no division at all: multiply through by `M^k B^k`. Equivalent to (A) for positive
    `M`, `B`, and much harder to read.
- **Degenerate cases, checked by hand.**
  - Empty type: no law; excluded by `hμ`.
  - `m = 0`: the only list has the graph on no vertices, `cm = 0`, and the event `0 ≤ 0`
    has probability `1`. The bound is `2(n^2 + 1)^L ≥ 2` (`sampleBound_zero`). The bound
    holds and says nothing. The existence statement is empty, since its hypothesis fails
    (`one_lt_sampleBound_zero`); rightly, as no graph has `100·cm < 0`.
  - `1 ≤ m ≤ 200`: `k = 1` and the bound is `(n^2 + 1)^L (m/M + m^2/B)`. The event is that
    `G` has an edge when `m ≤ 100`, and that `cm(G) ≥ 2` when `101 ≤ m ≤ 200`. The
    derivation covers this case and it is not excluded.
  - conflict bound `ε ≤ 0` or `ε ≥ 1`: excluded by `hε`, `hε1`.
  - marginal cap `M ≤ 0`: excluded by `hM`. `0 < M ≤ 1`: the bound is at least `1`
    (`one_le_sampleBound_of_le_one`), so the inequality holds trivially; and for `M < 1`
    the hypothesis `hsup` is empty, so this is the only way it could hold.
  - joint cap `B ≤ 0`: excluded by `hB`. `0 < B ≤ 1`: the bound is at least `1`
    (`one_le_sampleBound_of_jointCap_le_one`), likewise.
  - no holes: every graph on positions is complete, `cm = ⌊m/2⌋`, and the event has
    probability `1` for `m ≠ 1`. With `ε > 0` the hypothesis `hsup` then forces `M < 1` or
    `B < 1` (F-SUP), where the bound is at least `1`. So the statement is true and empty
    of content, as it should be.
  - In no case is the statement false or left without a named hypothesis to exclude it.
- Machine-checked: the existence statement follows from the bound (its proof body), with
  `isLaw_listLaw`, `IsLaw.exists_notMem_of_mass_lt_one` and
  `HoleRel.indepNum_positionGraph_le_two`. So the kernel ties the two statements together,
  and the bound gives what Theorem 1.1 needs once it is below `1`. It rests on the bound,
  which is `sorry`: it is `PROVED_MODULO`, not proved.
- Not proved: the bound is `sorry`. Status of the entry: `STATED`.
- Not done, and not part of this slice: Theorem 1.1 is not derived from the existence
  statement. That needs Theorem 3.1 and the construction, and the check that
  `sampleBound < 1` for the paper's parameters (M17).
- Decision (user, 2026-10-08, question Q5): `μ` is any law; no hypothesis that it is positive
  is added. The extra step this costs the proof (F-BOUND, step 0) will be recorded as a
  departure from the paper's argument when the proof is written.
- **Not reviewed.** The user held this note's item (R-33) on 2026-10-08 for a second
  reading, together with R-32. Until it is signed off the two statements of
  Proposition 3.4 are a proposal, and no proof of the bound is to be written.
