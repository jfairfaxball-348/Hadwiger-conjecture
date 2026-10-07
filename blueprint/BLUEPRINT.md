# Blueprint — single source of truth

Paper: "A counterexample to Hadwiger's conjecture", OpenAI, 23 September 2026
(provenance, hash and licence in `docs/PROVENANCE.md`).

This file has one entry for every definition, lemma, proposition, theorem and corollary of
the paper, plus the unnumbered claims that the main results rely on. For each entry it
records where it is in the paper, what it depends on, its Lean name, and its status.

**It replaces the old proof-state file. If this file and anything else disagree about what
is stated or proved, this file is wrong and must be fixed; nothing else is authority.**
`python scripts/axiom_audit.py` checks every status in it against the actual build.

## How to read an entry

| Column | Meaning |
|---|---|
| ID | `T-` theorem, `P-` proposition, `L-` lemma, `C-` corollary, `D-` definition or construction, `S-` unnumbered statement made in running text. Numbers follow the paper (`L-2.2` is Lemma 2.2). |
| Kind | What the paper calls it. |
| Paper location | Section, number, and the TeX label in the paper's source. |
| Statement | A short paraphrase. The paper is the authority for the exact statement. |
| Depends on | Blueprint IDs used in the paper's proof (or in the definition). |
| Lean | Fully qualified Lean name(s) in backticks, or `—`. |
| Status | See below. |

Statuses (full definitions in `docs/STATUS_CLASSIFICATIONS.md`):

| Status | Meaning |
|---|---|
| `NOT_STATED` | No Lean statement or definition yet. |
| `MATHLIB` | Definition: Mathlib's own definition is used unchanged. |
| `DEFINED` | Definition: new Lean definition in this repository, with a fidelity note. |
| `STATED` | Result: the Lean statement compiles; its proof is `sorry`. |
| `PROVED_MODULO` | Result: the proof body is complete, but something it depends on is still `sorry`. |
| `DONE` | Result: compiles, no `sorry` anywhere beneath it, and `#print axioms` shows only `propext`, `Classical.choice`, `Quot.sound`. |

An entry with several Lean names has the weakest status among them.

Paper-side problems (gaps, errors, ambiguities) are not statuses. They are recorded in
`blueprint/PAPER_ISSUES.md` and cited in the entry's Statement column as `[PI-n]`.

---

## Section 1 — Introduction

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-1.alpha | definition | §1 ¶1 | Independence number `α(G)`. | — | `SimpleGraph.indepNum` | MATHLIB |
| D-1.chi | definition | §1 ¶1 | Chromatic number `χ(G)`. | — | `SimpleGraph.chromaticNumber` | MATHLIB |
| D-1.minor | definition | §1 ¶1 (used, not spelled out) | `G` contains a `K_t` minor. Formalised through minor models (branch sets). | — | `Hadwiger.MinorModel`, `Hadwiger.IsMinor`, `Hadwiger.HasCliqueMinor` | DEFINED |
| D-1.h | definition | §1 ¶1 | Hadwiger number `h(G)`: the largest `t` with a `K_t` minor. | D-1.minor | `Hadwiger.hadwigerNumber` | DEFINED |
| D-1.HC | definition | §1 ¶2 | Hadwiger's conjecture: `h(G) ≥ χ(G)` for every finite nonempty simple graph. | D-1.h, D-1.chi | `Hadwiger.HadwigerConjecture` | DEFINED |
| D-1.touch | definition | §1 ¶3 | Two disjoint edges touch if an edge joins their endpoint sets. | — | `Hadwiger.EdgesTouch` | DEFINED |
| D-1.cm | definition | §1 ¶3 | Connected matching: a matching whose edges pairwise touch. `cm(G)` is its maximum size. | D-1.touch | `Hadwiger.IsConnectedMatching`, `Hadwiger.connectedMatchingNumber` | DEFINED |
| T-1.1 | theorem | §1, Theorem 1.1 (`thm:main`) | For arbitrarily large `m` there is an `m`-vertex graph with `α(G) ≤ 2` and `cm(G) < m/100`. The paper gives no separate proof block: it is Proposition 3.4 applied at every large `n`, with `m = 2^{C_0 g N}`. | P-3.4, T-3.1 | `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` | STATED |
| S-1.a | statement | §1, after Theorem 1.1 | Every colour class has size at most `α(G)`, so `χ(G) ≥ \|V\|/α(G)`. | D-1.alpha, D-1.chi | `Hadwiger.card_le_indepNum_mul_of_colorable` | STATED |
| D-1.fcol | definition | §1, after Theorem 1.1 | Fractional colouring: nonnegative weights on independent sets covering every vertex with total at least 1. | D-1.alpha | `Hadwiger.FractionalColoring`, `Hadwiger.FractionalColoring.total` | DEFINED |
| D-1.chif | definition | §1, after Theorem 1.1 | Fractional chromatic number `χ_f(G)`: least total weight of a fractional colouring. | D-1.fcol | `Hadwiger.fractionalChromaticNumber` | DEFINED |
| S-1.c | statement | §1, after Theorem 1.1 | `χ_f(G) ≤ χ(G)`: a proper colouring is a fractional colouring with unit weights. | D-1.chif, D-1.chi | `Hadwiger.fractionalChromaticNumber_le_of_colorable` | STATED |
| S-1.b | statement | §1, proof of Corollary 1.2 | `χ_f(G) ≥ \|V\|/α(G)`, by summing the vertex constraints. | D-1.chif, D-1.alpha | `Hadwiger.card_le_indepNum_mul_fractionalChromaticNumber` | STATED |
| C-1.2 | corollary | §1, Corollary 1.2 (`cor:hadwiger`) | Graphs of arbitrarily large order `m` with `h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`. | T-1.1, P-3.5, S-1.b, S-1.c | `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` | STATED |
| T-FINAL | theorem | abstract; §1, Corollary 1.2 | Finite simple graphs of arbitrarily large order whose chromatic number exceeds their Hadwiger number. This is the project's final theorem. | C-1.2 | `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber` | PROVED_MODULO |
| T-NOT-HC | theorem | §1, Corollary 1.2, last sentence | Hadwiger's conjecture is false. | T-FINAL, D-1.HC | `Hadwiger.not_hadwigerConjecture` | PROVED_MODULO |
| S-1.d | statement | §1, Corollary 1.2, last sentence | The fractional weakening `χ_f(G) ≤ h(G)` is false. Immediate from C-1.2. | C-1.2 | — | NOT_STATED |
| S-1.e | statement | §1, after Corollary 1.2 | Reed and Seymour's convention (rational weights, coverage exactly one, total at most `p`) gives colourings admissible in D-1.fcol, so their prediction fails with `p = h(G)`. Commentary on the literature; not a formalisation target unless the user asks. | C-1.2 | — | NOT_STATED |

## Section 2 — The hole relation and its tensor realization

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-2.0 | definition | §2.1 ¶1 | Linear data: `F_2`-spaces `X`, `V`; functional `a`; symmetric bilinear `T`; `r(x) = a + T(x,·)`; for each `i ∈ Ω` an injective `U_i : X → V` and a functional `u_i` on `V`. | — | `Hadwiger.HoleData`, `Hadwiger.HoleData.r` | DEFINED |
| D-2.1 | definition | §2.1, Definition 2.1 (`def:hole`) | Hole between `i` and `j`: witnesses `λ_i, λ_j` with `U_i λ_i = U_j λ_j`, `u_j U_i = r(λ_i)`, `u_i U_j = r(λ_j)`, `a(λ_i) + a(λ_j) = 1`. | D-2.0 | `Hadwiger.HoleData.Hole` | DEFINED |
| L-2.2 | lemma | §2.1, Lemma 2.2 (`lem:hole-triangle-free`) | The hole relation is symmetric, has no loops, and is triangle-free. Symmetry is proved; the other two parts are `sorry`. | D-2.1 | `Hadwiger.HoleData.Hole.symm`, `Hadwiger.HoleData.not_hole_self`, `Hadwiger.HoleData.not_hole_triangle` | STATED |
| D-2.G | definition | §2.1, after Lemma 2.2 | Graph on the positions of a list `o_1, …, o_m`: distinct positions are adjacent when their elements have no hole. | D-2.1 | `Hadwiger.HoleData.positionGraph` | DEFINED |
| S-2.3 | statement | §2.1, equation `eq:sample-independence` | For the graph on positions, `α(G) ≤ 2` and `χ(G) ≥ ⌈m/2⌉`. The Lean statement is the first half; the second half is the first half combined with S-1.a. | L-2.2, D-2.G, S-1.a | `Hadwiger.HoleData.indepNum_positionGraph_le_two` | STATED |
