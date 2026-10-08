# A counterexample to Hadwiger's conjecture — Lean 4

A Lean 4 (Mathlib) development of the result of the manuscript

> OpenAI, *A counterexample to Hadwiger's conjecture*, 23 September 2026
> (<https://github.com/openai/math>, `preprints/A-counterexample-to-Hadwigers-conjecture-September-23-2026/paper.pdf`).

**Read this first.** The proof of the manuscript's main theorem that this repository builds
is **not this repository's work**. It is the Lean formalisation published by the manuscript's
authors, kept under `OAI/` and ported to this toolchain. This repository adds an independent
statement of the result, with its own definitions, its own proofs of the elementary parts,
the fractional-chromatic form of the conclusion, and the comparison that connects the two.
`NOTICE` and `docs/UPSTREAM_CHANGES.md` have the details.

## What is proved

`Challenge.lean` states the results and everything needed to read them; it imports Mathlib
only. With `h(G)` the Hadwiger number (the largest `t` such that the complete graph `K_t` is
a minor of `G`), `χ` the chromatic number, `χ_f` the fractional chromatic number, `α` the
independence number and `cm(G)` the largest number of edges in a matching whose edges are
pairwise joined by an edge:

| | Statement | Lean name (namespace `Hadwiger`) |
|---|---|---|
| Theorem 1.1 | for arbitrarily large `m` there is a graph on `m` vertices with `α(G) ≤ 2` and `cm(G) < m/100` | `exists_indepNum_le_two_and_connectedMatchingNumber_lt` |
| Corollary 1.2 | for such graphs `h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)` | `exists_hadwigerNumber_lt_fractionalChromaticNumber` |
| | there are finite graphs of arbitrarily large order with `h(G) < χ(G)` | `exists_hadwigerNumber_lt_chromaticNumber` |
| | Hadwiger's conjecture is false | `not_hadwigerConjecture` |
| | its weakening `χ_f(G) ≤ h(G)` is false | `not_fractionalHadwigerConjecture` |

All five compile with no `sorry` and depend only on the axioms `propext`,
`Classical.choice` and `Quot.sound`.

## Comparison with the standard conjecture

Hadwiger's conjecture (Hadwiger, 1943) says that every graph that cannot be coloured with
`t − 1` colours has `K_t` as a minor; equivalently `h(G) ≥ χ(G)` for every finite graph.

- **Graphs.** `SimpleGraph` in Mathlib: no loops, no multiple edges. The counterexamples are
  graphs on the vertex set `Fin m`. The conjecture is stated here for every finite nonempty
  graph on a type of the lowest universe; every finite graph is isomorphic to one of these.
- **Chromatic number.** Mathlib's `SimpleGraph.chromaticNumber`, the least number of colours
  of a proper vertex colouring, with values in the extended natural numbers; for the graphs
  in the statements it is finite, and Corollary 1.2 exhibits it as a natural number.
- **Minors.** `K_t` is a minor of `G` when `G` has `t` pairwise disjoint vertex sets, each
  inducing a connected (so nonempty) subgraph, with an edge of `G` between every two of
  them. This is the usual description of a minor by branch sets (for instance Diestel,
  *Graph Theory*, Section 1.7). Its equivalence with "obtained from a subgraph by
  contracting edges" is a textbook fact and is **not** proved in Lean here; Mathlib has no
  contraction of simple graphs to compare with.
- **Hadwiger number.** The supremum of the `t` with a `K_t` minor. For a finite graph it is
  a maximum and at most the number of vertices; sanity lemmas check it on complete graphs,
  the path on three vertices and the 4-cycle.
- **Fractional chromatic number.** The infimum of the total weight of nonnegative weights
  on independent sets that cover every vertex with weight at least `1`; attained for finite
  graphs, and checked to be `n` on `K_n` and `5/2` on the 5-cycle.

What a reader has to trust is the text of `Challenge.lean` and Lean's kernel. That the
definitions there mean what the words above say is a judgement, not a theorem.

## Sources and earlier work

A short account, not a survey.

- The conjecture: H. Hadwiger, *Über eine Klassifikation der Streckenkomplexe*,
  Vierteljschr. Naturforsch. Ges. Zürich 88 (1943). It holds for `t ≤ 4` (Hadwiger; Dirac);
  for `t = 5` it is equivalent to the four colour theorem (Wagner, 1937); for `t = 6` it
  was proved by Robertson, Seymour and Thomas (1993), using the four colour theorem. P.
  Seymour's survey *Hadwiger's conjecture* (2016) describes the state of the problem before
  the manuscript.
- Graphs with independence number 2, where `χ(G) ≥ m/2`, were long regarded as a natural
  place to look for a counterexample. Duchet and Meyniel (1982) proved
  `h(G) ≥ m/(2α(G) − 1)`, which is `m/3` here; the conjecture would need `m/2`. Connected
  matchings in such graphs were studied by Plummer, Stiebitz and Toft (2003) and by Füredi,
  Gyárfás and Simonyi (2005).
- The fractional weakening: Reed and Seymour, *Fractional colouring and Hadwiger's
  conjecture* (1998).
- The result itself is from the manuscript named at the top. It is attributed to OpenAI and
  is machine-generated. **This project does not know of a refereed version, and makes no
  claim about how the mathematical community has received it.** What this repository
  contributes to that question is only that the formal statements in `Challenge.lean` are
  derivable in Lean.

## Who did what

- **The authors' formalisation** (`OAI/`, about 38,700 lines in 288 files): from
  `openai/math` at commit `fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb`, Apache-2.0. It proves
  Theorem 1.1 in the authors' own formulation
  (`OAI.HadwigerCounterexample.exists_counterexamples`). It was first built here unmodified,
  at its own Lean and Mathlib versions, with no error and with the three standard axioms
  only. `docs/UPSTREAM_CHANGES.md` lists every change made to it since; no statement of
  theirs was changed.
- **This repository's own development** (`Hadwiger/`): the definitions and statements; the
  clique-minor bound `3 h(G) ≤ m + 4 cm(G) + 2` (Proposition 3.5 of the manuscript); the
  bounds `|V| ≤ α(G) χ(G)`, `|V| ≤ α(G) χ_f(G)` and `χ_f(G) ≤ χ(G)`; Corollary 1.2 and the
  three statements after it, deduced from Theorem 1.1; the comparison of this repository's
  connected-matching number with the authors' (`Hadwiger/UpstreamBridge.lean`); and Lemmas
  2.2, 3.2 and 3.3 of the manuscript, which the final statements do not use.
- **What is new relative to the authors' Lean**: the fractional-chromatic part of Corollary
  1.2 and the refutation of the fractional weakening, which their selected statement leaves
  out; a second, independently written set of definitions; and the port.
- **Not done here**: an independent proof of Theorem 1.1. Until 8 October 2026 this project
  was writing one and had covered about a tenth of the manuscript; it then turned to the
  authors' formalisation.

## How it was produced

All Lean and all documentation in `Hadwiger/`, the port of the files under `OAI/`, and the
metadata were written by an AI coding agent (Anthropic's Claude, through Claude Code) in
sessions directed by the maintainer, John Fairfax-Ball, who set the goals and took the
decisions recorded in `AGENTS.md`, `START_HERE.md` and `docs/SESSION_LOG.md`. No human has
checked the proofs line by line; their correctness rests on Lean's kernel. The statements
and definitions were compared with the manuscript clause by clause in notes written by the
agent (`blueprint/FIDELITY.md`) and accepted by the maintainer. The authors' formalisation
was produced by OpenAI; this project knows nothing about how beyond what `openai/math` says.

## Build and check

```bash
lake exe cache get
```

```bash
lake build
```

```bash
python scripts/check_ledger.py
```

```bash
python scripts/axiom_audit.py
```

The first check confirms that no `sorry`, `axiom` or `native_decide` occurs in `Hadwiger/`
or `OAI/`. The second runs `#print axioms` on every declaration named in
`blueprint/BLUEPRINT.md`. `scripts/check-lean-sources.py` checks the registry's source
requirements, and `scripts/verify-comparator.sh` runs `lake comparator` on
`comparator.json` (Linux, with bubblewrap); CI runs all of them.

## Registry

The repository is laid out for the Palomar registry (<https://palomar-registry.org/>;
submissions at <https://submit.palomar-registry.org/>): `Challenge.lean`, `Solution.lean`,
`comparator.json`, `formalization.yaml`. Whether and when it is submitted is the
maintainer's decision. The registry requires the submitter to be a responsible author or
maintainer of the substantive formalisation or to have approval from one, and for Theorem
1.1 that formalisation is the authors'.

## Licence

Apache License 2.0; see `LICENSE` and `NOTICE`. The files under `OAI/` come from
`openai/math`, also Apache-2.0. The manuscript is not stored here.

Start with `START_HERE.md` for the current state. The rules for working in this repository
are in `AGENTS.md`.
