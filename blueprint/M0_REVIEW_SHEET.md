# M0 review sheet — the statement layer, signed off by the user on 2026-10-07

Prepared on 2026-10-07 in the M0 session, on branch `m0-statement-layer`.

**What this is.** One item for each definition and each stated result of the statement
layer: the paper's own sentence, the Lean text, what is now machine-checked about it, and
every doubt found on re-reading. It exists so that the user can sign each item off.

**What this is not.** The sheet itself is not a review. The re-read behind it was done by
a worker (Claude), who is not independent of the earlier worker that wrote the definitions
and the fidelity notes. An item counts as reviewed only through the user's sign-off, which
is recorded on its sign-off line and copied into `blueprint/FIDELITY.md`.

**Sign-off.** After answering the seven questions below, the user was asked, on
2026-10-07:

```text
How should the sign-off of the 20 review-sheet items be recorded in FIDELITY.md?
```

and answered, from the options offered:

```text
Accept all 20 items
```

The option read: every fidelity note gets the line "Reviewed by John Fairfax-Ball,
2026-10-07", and M0 is then complete. The sign-off lines below were filled in on that
instruction. They cover each item as it stands at the commit that records the sign-off,
and nothing changed later.

**How the re-read was done.** Each note in `blueprint/FIDELITY.md` was compared with the
paper's TeX source (`build/sections/01-introduction.tex`, `02-geometry.tex`,
`03-distributions.tex`, at the commit pinned in `docs/PROVENANCE.md`; the local PDF's
sha256 was checked against the pin first) and with the Lean sources at this branch. Each
Mathlib definition quoted in a note was read in the Mathlib source at the pinned commit
`d13f23b`. Quotations of the paper below are verbatim from the TeX, with mathematics
transliterated and citation marks dropped. Lean text is copied from the sources with the
doc comments removed.

**Outcome in one paragraph.** No definition was found to disagree with the paper. Every
sanity lemma in the M0 list was proved as listed and none was false; they are in the
blueprint as `S-M0.*`, all `DONE`. The doubts below are of three kinds: differences in
form that are already recorded and need a human "yes" (most items); things the paper
leaves undefined, where fidelity is to the standard notion (R-3); and coverage gaps,
where a sentence of the paper has no Lean counterpart or a definition has no machine
check (the seven questions just below, since answered).

## The seven questions, and the user's decisions

The user answered on 2026-10-07, verbatim:

```text
q1 - accept, q2 - check it, q3 - accept, q4 - yes, q5 - state it, q6 - state it, q7 - that's fine.
```

| # | Item | The question | Decision | What was done |
|---|---|---|---|---|
| Q1 | R-3 | The paper never defines "minor". Is the branch-set definition accepted as the meaning of "`K_t` minor"? | accept | Recorded in F-MINOR. |
| Q2 | R-3 | `FIDELITY.md` cited "Diestel, *Graph Theory*, §1.7" from memory. Check it, or drop the section number? | check it | Checked against the author's free preview of the book. The section is right, and the book's own restatement of "minor" is the Lean definition clause for clause. Details under R-3 and in F-MINOR. |
| Q3 | R-10 | `HoleData` drops the paper's "finite-dimensional" and "finite". Accept the generalisation? | accept | Recorded in F-HOLE. |
| Q4 | R-10 | Nothing in Lean shows that `Hole` can ever hold. Should a non-vacuity lemma be added (it would belong to M3)? | yes | Entered in the blueprint as S-M3.hole-nonvacuous (`NOT_STATED`) and in the M3 task list. **Not proved in this session**: the question placed it in M3. Asked afterwards when it should be proved, the user chose "At M3, as recorded". |
| Q5 | R-17 | The second half of equation (2.3), `χ(G) ≥ ⌈m/2⌉`, has no Lean statement. State it? | state it | Stated: `HoleData.le_two_mul_chromaticNumber_positionGraph`. See R-17. |
| Q6 | R-19, R-20 | "The fractional weakening `χ_f(G) ≤ h(G)` is false" has no Lean statement. State it? | state it | A definition and its negation were added: `FractionalHadwigerConjecture`, `not_fractionalHadwigerConjecture`. The definition is new and has its own item, R-20. |
| Q7 | R-12 to R-14, R-17, R-19 | `FIDELITY.md` had no note for S-1.a, S-1.b, S-1.c, S-2.3 or T-NOT-HC. Notes were added, unreviewed. | that's fine | Read as: adding the notes is accepted. It was not read as the sign-off of those items; that came separately (see "Sign-off" above). |

On Q5 and Q6: each new theorem was given its complete proof body rather than a `sorry`,
because each follows in a few lines from results already stated. Both rest on results
that are still `sorry`, so both are `PROVED_MODULO` and neither is proved. No `sorry` was
added and none was removed; the count is still 10.

**Nothing is open on this sheet.** The seven questions are answered and all 20 items are
signed off, including R-20 (new after the questions were answered) and R-17 with its added
Lean statement. One thing the sheet led to is still to be done, at M3 and not before: the
lemma S-M3.hole-nonvacuous.

---

## Definitions

### R-1 — independence number `α(G)` — D-1.alpha, note F-ALPHA

- **Paper** (§1 ¶1): "For a finite graph `G`, write `α(G)`, `χ(G)`, and `h(G)` for its
  independence number, chromatic number, and Hadwiger number." The paper does not define
  the independence number further.
- **Lean** (Mathlib, unchanged):
  `SimpleGraph.indepNum G : ℕ := sSup {n | ∃ s, G.IsNIndepSet n s}`, where
  `IsNIndepSet n s` for `s : Finset α` is `G.IsIndepSet s ∧ s.card = n`, and
  `IsIndepSet s := s.Pairwise (fun v w ↦ ¬G.Adj v w)`.
- **Machine-checked** (Mathlib, not this repository): `IsIndepSet.card_le_indepNum` (every
  independent set of a finite graph has at most `indepNum` vertices) and
  `exists_isNIndepSet_indepNum` (an independent set of that size exists).
- **Doubts:** none. Junk value `0` only for an infinite graph with unbounded independent
  sets; every use here is on `Fin m` or a `Fintype`.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-2 — chromatic number `χ(G)` — D-1.chi, note F-CHI

- **Paper** (§1 ¶1): the sentence quoted under R-1. Not defined further.
- **Lean** (Mathlib, unchanged):
  `SimpleGraph.chromaticNumber G : ℕ∞ := ⨅ n ∈ Set.ofPred G.Colorable, (n : ℕ∞)`,
  `Colorable n := Nonempty (G.Coloring (Fin n))`,
  `Coloring α := G →g completeGraph α` (a map to colours that sends adjacent vertices to
  different colours).
- **Machine-checked** (Mathlib): `chromaticNumber_le_card` (finite for a finite graph);
  `chromaticNumber_top` (`χ(K_n) = n`).
- **Doubts:** none. The value lives in `ℕ∞`; no statement here applies `.toNat`. Each
  exhibits the value as `∃ k : ℕ, G.chromaticNumber = k ∧ …`.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-3 — `K_t` minor — D-1.minor, note F-MINOR

- **Paper** (§1 ¶1): "Thus `h(G)` is the largest `t` for which `G` contains a `K_t`
  minor." "Minor" is not defined. The proof of Proposition 3.5 (§3.3) begins: "Consider a
  complete-minor model with `b` branch sets."
- **Lean** (`Hadwiger/Defs/Minor.lean`, new):

  ```lean
  structure MinorModel (H : SimpleGraph W) (G : SimpleGraph V) where
    branch : W → Set V
    connected : ∀ w, (G.induce (branch w)).Connected
    disjoint : ∀ w w', w ≠ w' → Disjoint (branch w) (branch w')
    adj : ∀ w w', H.Adj w w' → ∃ x ∈ branch w, ∃ y ∈ branch w', G.Adj x y

  def IsMinor (H : SimpleGraph W) (G : SimpleGraph V) : Prop := Nonempty (MinorModel H G)

  def HasCliqueMinor (G : SimpleGraph V) (t : ℕ) : Prop := IsMinor (⊤ : SimpleGraph (Fin t)) G
  ```

  Mathlib's `Connected` is `Preconnected` together with `Nonempty`, so every branch set is
  nonempty (read in the source: `structure Connected` has the fields `preconnected` and
  `nonempty`).
- **Machine-checked here:** S-M0.minor-le-card (`t ≤ |V|`); S-M0.minor-zero-one (`K_0`
  always, `K_1` exactly for a nonempty graph — the two edge cases the note asserts);
  S-M0.minor-edge (an edge is a `K_2` minor); S-M0.minor-support (a model is carried along
  any injective homomorphism, so clique minors survive adding edges, passing to a
  supergraph, and isomorphism; an injective homomorphism is itself a model);
  S-M0.hadwiger-complete-iff (a `K_{|V|}` minor forces `G` to be complete);
  S-M0.hadwiger-cycle4 (a model with a two-vertex branch set, so contraction of an edge is
  exercised).
- **Doubts:**
  1. Q1 above (decided: accept). The definition is faithful to the standard notion by a
     textbook equivalence that is not formalised. Not proved here either: that `IsMinor`
     is transitive.
  2. Q2 above (decided: check it; done). In the author's free preview of Diestel's
     *Graph Theory* (Chapter 1, pages 19 to 21; the author's page calls it the sixth
     edition, 2025), §1.7 is "Contraction and minors". It defines a minor through a
     subgraph whose vertices are partitioned into connected branch sets, and then
     restates it: `X` is a minor of `Y` if and only if there is a map from a subset of
     `V(Y)` onto `V(X)` whose fibres are connected in `Y`, with an edge of `Y` between
     the fibres of the ends of every edge of `X`. That is `MinorModel` with `branch` the
     fibre map: disjointness is automatic for fibres, "onto" is nonemptiness, and the
     book's "connected" (§1.4) means the induced subgraph is connected and non-empty.
     The equivalence with deletions and contractions is Corollary 1.7.2 there, for
     finite graphs. What was checked is the book's text; the equivalence itself remains
     unformalised.
  3. A model may leave vertices of `G` outside every branch set and may ignore extra
     edges. That is what "minor" (as opposed to "contraction") requires. Stated so that it
     is seen, not as a problem.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-4 — Hadwiger number `h(G)` — D-1.h, note F-HADWIGER

- **Paper** (§1 ¶1): "Thus `h(G)` is the largest `t` for which `G` contains a `K_t`
  minor."
- **Lean** (new):
  `noncomputable def hadwigerNumber (G : SimpleGraph V) : ℕ := sSup {t : ℕ | HasCliqueMinor G t}`
- **Machine-checked here:** S-M0.hadwiger-attained (for a finite graph the supremum is
  attained); S-M0.hadwiger-largest (`G` has a `K_t` minor exactly when `t ≤ h(G)`, which is
  "the largest `t`" word for word); S-M0.hadwiger-top (`h(K_n) = n`); S-M0.hadwiger-path3
  (`2`); S-M0.hadwiger-cycle4 (`3`); S-M0.hadwiger-mono; S-M0.hadwiger-iso;
  S-M0.hadwiger-complete-iff (`h(G) = |V|` exactly for complete `G`).
- **Doubts:** none for finite graphs. `sSup` of an unbounded set of naturals is `0`, which
  can happen only for an infinite graph; every statement here has a `Fintype`. For the
  graph with no vertices, `h = 0`.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-5 — Hadwiger's conjecture — D-1.HC, note F-HC

- **Paper** (§1 ¶2): "Hadwiger's conjecture, formulated in 1943, asserts that
  `h(G) ≥ χ(G)` for every finite nonempty simple graph `G`."
- **Lean** (`Hadwiger/Main.lean`, new):

  ```lean
  def HadwigerConjecture : Prop :=
    ∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V),
      G.chromaticNumber ≤ (hadwigerNumber G : ℕ∞)
  ```
- **Machine-checked here:** S-M0.hadwiger-iso (so `h` does not depend on how the vertices
  are named).
- **Doubts:**
  1. The quantifier is over `V : Type` (universe 0) only. This cannot make the project's
     result wrong: the project proves the *negation*, from a graph on `Fin m`, and
     refuting the statement for fewer graphs refutes it for more. That the restricted
     statement is *equivalent* to the unrestricted one (every finite graph is isomorphic
     to one on some `Fin m`) is argued in the note and not formalised.
  2. This is the conjecture the paper refutes. It is not HC7.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-6 — touching edges — D-1.touch, note F-TOUCH

- **Paper** (§1 ¶3): "Two disjoint edges are *touching* if an edge joins their endpoint
  sets."
- **Lean** (`Hadwiger/Defs/ConnectedMatching.lean`, new):

  ```lean
  def EdgesTouch (G : SimpleGraph V) (e f : Sym2 V) : Prop :=
    ∃ x ∈ e, ∃ y ∈ f, G.Adj x y
  ```
- **Machine-checked here:** S-M0.cm-two-disjoint-edges (two disjoint edges with no edge
  between them do not touch, and that is what makes `cm = 1` there); S-M0.cm-top (in a
  complete graph any two disjoint edges touch).
- **Doubts:**
  1. The paper defines touching for two *disjoint edges*. The predicate is defined for any
     two unordered pairs, which need be neither disjoint nor edges. For two edges of `G`
     sharing a vertex it is automatically true. It is only ever applied to two distinct
     edges of a matching, which are disjoint edges, so the extra cases are never used.
  2. Consistency check with a later sentence of the paper (§2.1, last paragraph): "Two
     disjoint edges fail to touch precisely when all four cross pairs are holes [that is,
     non-edges]." This agrees with the predicate: four cross pairs, none adjacent.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-7 — connected matching and `cm(G)` — D-1.cm, note F-CM

- **Paper** (§1 ¶3): "A *connected matching* is a matching whose edges are pairwise
  touching; write `cm(G)` for its maximum size. The word connected in this definition
  requires adjacency of every pair of matching edges."
- **Lean** (new, on Mathlib's `Subgraph.IsMatching`):

  ```lean
  def IsConnectedMatching {G : SimpleGraph V} (M : G.Subgraph) : Prop :=
    M.IsMatching ∧ ∀ e ∈ M.edgeSet, ∀ f ∈ M.edgeSet, e ≠ f → EdgesTouch G e f

  noncomputable def connectedMatchingNumber (G : SimpleGraph V) : ℕ :=
    sSup {k : ℕ | ∃ M : G.Subgraph, IsConnectedMatching M ∧ M.edgeSet.ncard = k}
  ```

  Mathlib: `IsMatching M := ∀ ⦃v⦄, v ∈ M.verts → ∃! w, M.Adj v w`.
- **Machine-checked here:** S-M0.cm-le-half (`2·cm(G) ≤ |V|`); S-M0.cm-attained (the
  supremum is attained for a finite graph); S-M0.cm-top (`cm(K_n) = ⌊n/2⌋`);
  S-M0.cm-two-disjoint-edges (`cm = 1`); S-M0.cm-support (any `k` pairwise disjoint,
  pairwise touching edges form a connected matching with exactly `k` edges). In Mathlib:
  `IsMatching.injOn_edgeSet` (a matching is determined by its edge set).
- **Doubts:**
  1. "Size" is read as the number of edges (`M.edgeSet.ncard`), not of vertices. The paper
     does not say which, but its proof of Proposition 3.5 counts edges
     ("`c ≥ e + ⌊s/2⌋`"), and Theorem 1.1's bound `cm(G) < m/100` is used that way.
  2. The touching edge must be an edge of `G`, not of `M`; the definition says `G`.
  3. A matching is a `G.Subgraph`, not a set of edges. One direction of the dictionary is
     proved here (a family of disjoint edges gives a matching with those edges); the other
     (every matching is such a family) is not, and is not needed.
  4. Junk values: `Set.ncard` of an infinite set and `sSup` of an unbounded set are `0`;
     both need an infinite graph.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-8 — fractional colouring — D-1.fcol, note F-FCOL

- **Paper** (§1, after Theorem 1.1): "For a finite nonempty simple graph `G`, let `I(G)`
  be the family of its independent vertex sets. A fractional coloring assigns a
  nonnegative real weight `w_I` to every `I ∈ I(G)` such that `∑_{I ∋ v} w_I ≥ 1` for
  every vertex `v`."
- **Lean** (`Hadwiger/Defs/FractionalColoring.lean`, new; `V` is a `Fintype`):

  ```lean
  structure FractionalColoring (G : SimpleGraph V) where
    weight : Finset V → ℝ
    nonneg : ∀ s, 0 ≤ weight s
    indep : ∀ s, weight s ≠ 0 → G.IsIndepSet (s : Set V)
    cover : ∀ v, 1 ≤ ∑ s ∈ univ.filter (fun s : Finset V => v ∈ s), weight s

  noncomputable def FractionalColoring.total {G : SimpleGraph V} (w : FractionalColoring G) : ℝ :=
    ∑ s, w.weight s
  ```
- **Machine-checked here:** S-M0.chif-support (weights on any finite family of independent
  sets that cover every vertex give a `FractionalColoring` with the same total; so the
  colourings one writes down by hand are instances of the structure).
- **Doubts:**
  1. The paper puts a weight on each independent set. The structure puts a weight on every
     vertex set and requires it to vanish off the independent ones. Same data.
  2. The empty set is independent, and may carry weight in both versions. Such weight
     covers nothing and only raises the total, so it does not affect `χ_f`.
  3. The paper says "finite nonempty". The structure allows the graph with no vertices,
     where `χ_f = 0` (this is the case `n = 0` of S-M0.chif-top).
  4. The membership test in `cover` uses a classical decidability instance. This is
     invisible mathematically; it costs a line in some proofs.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-9 — fractional chromatic number `χ_f(G)` — D-1.chif, note F-CHIF

- **Paper** (§1, after Theorem 1.1): "The ordinary fractional chromatic number `χ_f(G)` is
  the minimum of `∑_I w_I` over these assignments."
- **Lean** (new):
  `noncomputable def fractionalChromaticNumber (G : SimpleGraph V) : ℝ := sInf (Set.range (FractionalColoring.total (G := G)))`
- **Machine-checked here:** S-M0.chif-totals (the set of totals is nonempty and bounded
  below by `0`, so the `sInf` is a real infimum and never the junk value `sInf ∅ = 0`);
  S-M0.chif-attained (the infimum is attained, so it **is** the paper's minimum);
  S-M0.chif-top (`χ_f(K_n) = n`); S-M0.chif-cycle5 (`χ_f(C_5) = 5/2`); S-M0.chif-support
  (`0 ≤ χ_f ≤ |V|`).
- **Doubts:** none remaining. Before this session the difference "infimum, where the paper
  says minimum" rested on an unproved remark about polyhedra; S-M0.chif-attained replaces
  the remark with a proof.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-10 — linear data and the hole relation — D-2.0, D-2.1, note F-HOLE

- **Paper** (§2.1 ¶1): "Let `X` and `V` be finite-dimensional vector spaces over `F_2`.
  Fix a linear functional `a ∈ X*` and a symmetric bilinear form `T` on `X`, and write
  `r(x) = a + T(x, ·) ∈ X*`. Let `Ω` be a finite set. For each `i ∈ Ω`, suppose we have an
  injective linear map `U_i : X → V` and a linear functional `u_i ∈ V*`."
- **Paper** (Definition 2.1): "Two elements `i, j ∈ Ω` have a *hole* between them if there
  exist `λ_i, λ_j ∈ X` such that `U_i λ_i = U_j λ_j`, `u_j U_i = r(λ_i)`,
  `u_i U_j = r(λ_j)`, `a(λ_i) + a(λ_j) = 1`. The middle two identities are identities of
  linear functionals on the whole space `X`."
- **Lean** (`Hadwiger/HoleRelation.lean`, new):

  ```lean
  structure HoleData (X V Ω : Type*) [AddCommGroup X] [Module (ZMod 2) X]
      [AddCommGroup V] [Module (ZMod 2) V] where
    a : X →ₗ[ZMod 2] ZMod 2
    T : X →ₗ[ZMod 2] X →ₗ[ZMod 2] ZMod 2
    T_symm : ∀ x y, T x y = T y x
    U : Ω → X →ₗ[ZMod 2] V
    U_injective : ∀ i, Function.Injective (U i)
    u : Ω → V →ₗ[ZMod 2] ZMod 2

  def r (D : HoleData X V Ω) (x : X) : X →ₗ[ZMod 2] ZMod 2 := D.a + D.T x

  def Hole (D : HoleData X V Ω) (i j : Ω) : Prop :=
    ∃ li lj : X,
      D.U i li = D.U j lj ∧
      (D.u j).comp (D.U i) = D.r li ∧
      (D.u i).comp (D.U j) = D.r lj ∧
      D.a li + D.a lj = 1
  ```
- **Machine-checked here:** only `Hole.symm` (from the reorganisation session). The other
  two parts of Lemma 2.2 are `sorry` (milestone M3). There is no M0 sanity lemma for these
  definitions; the M0 list has none.
- **Compared clause by clause:** the sharing equation, the two functional identities with
  the indices in the paper's order (`u_j U_i` with `λ_i`, `u_i U_j` with `λ_j`), and the
  parity equation all match. The functional identities are equalities of linear maps
  `X → ZMod 2`, so they hold "on the whole space `X`".
- **Doubts:**
  1. Q3 above (decided: accept): "finite-dimensional" and "finite" are dropped. Definition 2.1 and the proof
     of Lemma 2.2 do not use them, so the Lean lemma would be about a larger class and
     would imply the paper's.
  2. Q4 above (decided: yes; planned as S-M3.hole-nonvacuous, not yet stated): non-vacuity
     is not checked in Lean. Hand example, **not a Lean proof**:
     `X = V = F_2^2`, `a(x) = x_1`, `T = 0`, `Ω = {0, 1}`, `U_0 = id`,
     `U_1 = (x_1, x_2) ↦ (x_2, x_1)`, `u_0(y) = y_2`, `u_1(y) = y_1`. Take
     `λ_0 = (1, 0)`, `λ_1 = (0, 1)`. Then `U_0 λ_0 = (1, 0) = U_1 λ_1`;
     `u_1 U_0 = (x ↦ x_1) = a = r(λ_0)`; `u_0 U_1 = (x ↦ x_1) = a = r(λ_1)`;
     `a(λ_0) + a(λ_1) = 1 + 0 = 1`. So `0` and `1` have a hole.
  3. Lemma 2.2's triangle-freeness is stated in Lean for any three elements with holes on
     all three pairs, without the paper's word "distinct". With a repeated element one of
     the three holes is a loop, which the lemma also excludes, so the Lean form follows
     from the paper's lemma and implies it.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-11 — the graph on positions — D-2.G, note F-POSGRAPH

- **Paper** (§2.1, after Lemma 2.2): "Given any list `o_1, …, o_m ∈ Ω`, form a graph `G` on
  its *positions*: two distinct positions are adjacent when their elements have no hole.
  This gives a finite simple graph even when elements repeat."
- **Lean** (new):

  ```lean
  def positionGraph (D : HoleData X V Ω) {m : ℕ} (o : Fin m → Ω) : SimpleGraph (Fin m) where
    Adj p q := p ≠ q ∧ ¬ D.Hole (o p) (o q)
    symm := ⟨fun _ _ h => ⟨h.1.symm, fun h' => h.2 h'.symm⟩⟩
    loopless := ⟨fun _ h => h.1 rfl⟩
  ```
- **Machine-checked here:** that it is a simple graph (the two proof fields), using only
  `Hole.symm`. No `sorry` is beneath the definition.
- **Doubts:** none. Positions are `Fin m`, numbered from `0`; the paper numbers from `1`.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

---

## Stated results

Each of these compiles with `sorry` (status `STATED`), except R-18 and R-19, which are
`PROVED_MODULO`. The question for sign-off is only whether the Lean statement says what the
paper says.

### R-12 — colour-class bound — S-1.a

- **Paper** (§1): "Every color class has size at most `α(G)`, so `χ(G) ≥ |V(G)|/α(G)`."
- **Lean** (`Hadwiger/ChromaticBounds.lean`):
  `theorem card_le_indepNum_mul_of_colorable (G : SimpleGraph V) {k : ℕ} (h : G.Colorable k) : Fintype.card V ≤ G.indepNum * k`
- **Differences in form:** no division; stated for every proper `k`-colouring rather than
  for `k = χ(G)`. Taking `k = χ(G)` gives the paper's inequality when `α(G) > 0`, that is,
  for a nonempty graph.
- **Doubts:** none. For the graph with no vertices it reads `0 ≤ 0`.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-13 — fractional bound — S-1.b

- **Paper** (proof of Corollary 1.2): "Summing the vertex constraints of any fractional
  coloring gives `|V(G)| ≤ ∑_I |I| w_I ≤ α(G) ∑_I w_I`. Hence `χ_f(G) ≥ |V(G)|/α(G)`."
- **Lean:**
  `theorem card_le_indepNum_mul_fractionalChromaticNumber (G : SimpleGraph V) : (Fintype.card V : ℝ) ≤ G.indepNum * fractionalChromaticNumber G`
- **Differences in form:** no division; the natural number `α(G)` is cast to `ℝ`.
- **Doubts:** none. Related, and **not** a proof of this statement: the sanity lemma
  `FractionalColoring.card_le_mul_total` proves the paper's displayed chain for any bound
  `k` on the sizes of independent sets. S-1.b itself is still `sorry`.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-14 — `χ_f ≤ χ` — S-1.c

- **Paper** (§1): "An ordinary coloring gives a fractional coloring with unit weights on
  its color classes, so `χ_f(G) ≤ χ(G)`."
- **Lean:**
  `theorem fractionalChromaticNumber_le_of_colorable (G : SimpleGraph V) {k : ℕ} (h : G.Colorable k) : fractionalChromaticNumber G ≤ k`
- **Differences in form:** stated for every proper `k`-colouring; `k = χ(G)` gives the
  paper's inequality.
- **Doubts:** none.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-15 — Theorem 1.1 — T-1.1

- **Paper** (Theorem 1.1): "There are arbitrarily large integers `m` for which an
  `m`-vertex finite simple graph `G` satisfies `α(G) ≤ 2` and `cm(G) < m/100`."
- **Lean** (`Hadwiger/Main.lean`):

  ```lean
  theorem exists_indepNum_le_two_and_connectedMatchingNumber_lt :
      ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m),
        G.indepNum ≤ 2 ∧ 100 * connectedMatchingNumber G < m
  ```
- **Differences in form:** "arbitrarily large" is `∀ N, ∃ m ≥ N`; an `m`-vertex graph is a
  graph on `Fin m`; `cm < m/100` over the reals is `100·cm < m` over the naturals.
- **Doubts:** none.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-16 — Proposition 3.5 — P-3.5

- **Paper** (Proposition 3.5): "For every finite nonempty graph `G` of order `m`,
  `h(G) ≤ (m + 4 cm(G) + 2)/3`. In particular, if `α(G) ≤ 2` and `cm(G) < m/100`, then
  `h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)` (`m ≥ 5`)."
- **Lean** (`Hadwiger/MatchingMinor.lean`):

  ```lean
  theorem three_mul_hadwigerNumber_le [Nonempty V] (G : SimpleGraph V) :
      3 * hadwigerNumber G ≤ Fintype.card V + 4 * connectedMatchingNumber G + 2

  theorem hadwigerNumber_lt_of_indepNum_le_two (G : SimpleGraph V)
      (hα : G.indepNum ≤ 2)
      (hcm : 100 * connectedMatchingNumber G < Fintype.card V)
      (hm : 5 ≤ Fintype.card V) :
      ∃ k : ℕ, G.chromaticNumber = k ∧
        (hadwigerNumber G : ℝ) < 26 * (Fintype.card V : ℝ) / 75 + 2 / 3 ∧
        26 * (Fintype.card V : ℝ) / 75 + 2 / 3 < (Fintype.card V : ℝ) / 2 ∧
        (Fintype.card V : ℝ) / 2 ≤ k
  ```
- **Differences in form:** the first assertion has its denominator cleared (for naturals
  `h`, `m`, `c`, `h ≤ (m + 4c + 2)/3` over the reals is `3h ≤ m + 4c + 2`). In the second,
  `χ(G)` is exhibited as a natural number `k`; "`m ≥ 5`" is a hypothesis; the second
  assertion is for any `Fintype` and `5 ≤ |V|` makes it nonempty.
- **Doubts:** none.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-17 — equation (2.3) and Lemma 2.2 — S-2.3, L-2.2

- **Paper** (Lemma 2.2): "The hole relation is symmetric, has no loops, and is
  triangle-free." (After it:) "An independent triple of positions would therefore give
  three distinct elements forming a hole triangle. Hence `α(G) ≤ 2`, `χ(G) ≥ ⌈m/2⌉`."
- **Lean** (`Hadwiger/HoleRelation.lean`):

  ```lean
  theorem Hole.symm {D : HoleData X V Ω} {i j : Ω} (h : D.Hole i j) : D.Hole j i
  theorem not_hole_self (D : HoleData X V Ω) (i : Ω) : ¬ D.Hole i i
  theorem not_hole_triangle (D : HoleData X V Ω) {i j k : Ω}
      (hij : D.Hole i j) (hjk : D.Hole j k) (hik : D.Hole i k) : False
  theorem indepNum_positionGraph_le_two (D : HoleData X V Ω) {m : ℕ} (o : Fin m → Ω) :
      (D.positionGraph o).indepNum ≤ 2
  theorem le_two_mul_chromaticNumber_positionGraph (D : HoleData X V Ω) {m : ℕ}
      (o : Fin m → Ω) :
      ∃ k : ℕ, (D.positionGraph o).chromaticNumber = k ∧ m ≤ 2 * k
  ```
  The last one was added on 2026-10-07 on the user's decision (Q5).
- **Differences in form:** triangle-freeness without "distinct" (see R-10, doubt 3). In
  the second half of equation (2.3), `χ(G)` is exhibited as a natural number `k` and
  `k ≥ ⌈m/2⌉` is written `m ≤ 2k`. For a natural number `k` these are the same statement:
  `⌈m/2⌉` is the least integer that is at least `m/2`, so `k ≥ ⌈m/2⌉` exactly when
  `k ≥ m/2`, that is, `2k ≥ m`.
- **Doubts:** none on the form. On status: the new theorem has a complete proof body from
  the first half and from S-1.a, which are both `sorry`; it is `PROVED_MODULO`, and the
  blueprint entry S-2.3 stays `STATED` because its first half is.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-18 — Corollary 1.2 — C-1.2

- **Paper** (Corollary 1.2): "There are finite nonempty simple graphs `G` of arbitrarily
  large order `m` for which `h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`. Thus Hadwiger's
  conjecture and its fractional-coloring weakening `χ_f(G) ≤ h(G)` are false."
- **Lean** (`Hadwiger/Main.lean`):

  ```lean
  theorem exists_hadwigerNumber_lt_fractionalChromaticNumber :
      ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), ∃ k : ℕ,
        G.chromaticNumber = k ∧
        (hadwigerNumber G : ℝ) < 26 * (m : ℝ) / 75 + 2 / 3 ∧
        26 * (m : ℝ) / 75 + 2 / 3 < (m : ℝ) / 2 ∧
        (m : ℝ) / 2 ≤ fractionalChromaticNumber G ∧
        fractionalChromaticNumber G ≤ k
  ```
- **Differences in form:** as for R-15 and R-16. "Nonempty" is not a separate clause: the
  middle inequality is false at `m = 0` (it holds exactly for `m ≥ 5`).
- **Doubts:** none. The corollary's first sentence is this statement. Its second sentence
  is covered by R-19 (Hadwiger's conjecture) and, since the decision on Q6, by R-20 (the
  fractional weakening).
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-19 — the final theorem and the negation of Hadwiger's conjecture — T-FINAL, T-NOT-HC

- **Source** (the user's target, `START_HERE.md`): "there are finite simple graphs of
  arbitrarily large order whose chromatic number exceeds their Hadwiger number." **Paper**
  (abstract): "We disprove Hadwiger's conjecture by constructing arbitrarily large graphs
  whose chromatic number exceeds their Hadwiger number."
- **Lean** (`Hadwiger/Main.lean`):

  ```lean
  theorem exists_hadwigerNumber_lt_chromaticNumber :
      ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m),
        (hadwigerNumber G : ℕ∞) < G.chromaticNumber

  theorem not_hadwigerConjecture : ¬ HadwigerConjecture
  ```
- **Machine-checked here:** S-M0.final-finite (for a finite graph the `ℕ∞` inequality
  holds exactly when `χ(G)` is a natural number above `h(G)`; it cannot hold through
  `χ(G) = ⊤`). Both theorems have complete proof bodies and rest on Corollary 1.2
  (`PROVED_MODULO`).
- **Doubts:** none. The fractional half of the paper's sentence is now R-20.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

### R-20 — the fractional weakening of Hadwiger's conjecture, and its negation — D-1.fHC, S-1.d, note F-FHC

Added on 2026-10-07 on the user's decision (Q6). New definition: it was not on the sheet
when the questions were answered. It was on the sheet, as this item, when the user signed
off all 20 items.

- **Paper** (Corollary 1.2, last sentence): "Thus Hadwiger's conjecture and its
  fractional-coloring weakening `χ_f(G) ≤ h(G)` are false."
- **Lean** (`Hadwiger/Main.lean`, new):

  ```lean
  def FractionalHadwigerConjecture : Prop :=
    ∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V),
      fractionalChromaticNumber G ≤ (hadwigerNumber G : ℝ)

  theorem not_fractionalHadwigerConjecture : ¬ FractionalHadwigerConjecture
  ```
- **Machine-checked here:** the negation has a complete proof body from Corollary 1.2
  (which gives graphs with `h(G) < m/2 ≤ χ_f(G)`). Corollary 1.2 is `sorry`, so this is
  `PROVED_MODULO`, not proved.
- **Differences in form:** the comparison is in `ℝ`, with `h(G)` cast from `ℕ`.
- **Doubts:**
  1. The paper writes only the inequality `χ_f(G) ≤ h(G)`. The quantifier "for every finite
     nonempty simple graph `G`" is supplied here, from the paper's own statement of
     Hadwiger's conjecture, of which this is called the weakening. This is a reading, and
     the only one under which "are false" can be shown by exhibiting graphs.
  2. That it is a *weakening* (Hadwiger's conjecture implies it) is `χ_f ≤ χ`, blueprint
     S-1.c, still `sorry`. It is not stated as a Lean theorem and nothing depends on it.
  3. `V : Type` only, as in R-5; for the same reason this cannot weaken the negation.
  4. The paragraph of the paper after Corollary 1.2, on Reed and Seymour's convention
     (blueprint S-1.e), is still not stated. It was not part of Q6.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-07

---

## What the sanity lemmas do and do not establish

They establish that the three new definitions behave correctly on the checks listed in
the blueprint section "Sanity checks (not in the paper)": the suprema and the infimum are
attained and are not junk values for finite graphs; the values on `K_n`, on the path with
three vertices, on the 4-cycle, on two disjoint edges and on the 5-cycle are the known
ones; the Hadwiger number is monotone and isomorphism-invariant.

They do not establish that the definitions are the standard ones in general. That rests
on the arguments in `blueprint/FIDELITY.md` and on the user's judgement, which is what the
sign-off lines record. They say nothing about any result of the paper.
