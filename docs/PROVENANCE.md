# Provenance

All facts below were established on 2026-10-07 (Step 0 of the programme amendment).

## The paper

| | |
|---|---|
| Title | A counterexample to Hadwiger's conjecture |
| Author, date | OpenAI, 23 September 2026 |
| URL | <https://github.com/openai/math/blob/main/preprints/A-counterexample-to-Hadwigers-conjecture-September-23-2026/paper.pdf> |
| Repository commit | `openai/math` at `adc7f1241b42e322a6451854ab7e4b4c146bf78a` ("Initial commit", 2026-10-06; the only commit at the time) |
| `paper.pdf` sha256 | `a97293542586d3518b9355dcea732012b09d4ce809126da73d285ba0d3906128` |
| `paper.pdf` size, git blob | 956,260 bytes; blob `a443d538f0b57dbdcfac6450510ed7849ab02faf` |
| Length | 104 pages |
| TeX source | beside the PDF, under `build/`: `main.tex`, `preamble.tex`, `sections/*.tex` (16 files, 356,412 bytes), `sources/references.bib` |

This pinned version is what the project formalises. The blueprint cites the TeX labels of
that source. If upstream revises the paper, the pin does not move without the user's
authorisation.

The upstream README says of the whole collection: results are "at different stages of
verification", "some of the unformalized results could have issues", and Lean
formalisations will be added "as we obtain them". The paper is machine-generated and, as
far as this project knows, unrefereed.

## Licence, and what is stored here

- The `openai/math` repository root carries an unmodified Apache License 2.0 (`LICENSE`,
  11,357 bytes). GitHub reports the repository as Apache-2.0, and the Lean catalogue file
  states `license: "Apache-2.0"` for the formalisations.
- There is no separate licence statement for the preprints, no `NOTICE` file, and the
  paper's own folder says nothing about licensing beyond a citation block.

Reading: redistribution of the PDF and source is permitted under the repository licence,
with the licence text and attribution. It is not stated paper by paper.

**Decision: the repository stores only the URL, the commit and the hash.** The PDF and the
TeX source are not committed. That is the conservative reading of the user's instruction,
and nothing is lost, because the pinned commit makes the exact file retrievable and the
hash makes it checkable (commands in `docs/LEAN_WORKFLOW.md`). A local working copy lives
in the ignored `paper/` folder.

Short quotations of the paper's definitions and statements appear, attributed, in Lean doc
comments and in `blueprint/FIDELITY.md`, so that each formal statement can be compared
with its source.

## Was the paper already formalised?

Checked on 2026-10-07:

| Place | Method | Finding |
|---|---|---|
| `openai/math`, `lean/` | Complete file listing of the Lean library (121,734 files, 1.57 GB), searched by file name; GitHub code search by content for the paper's key notions | **Partial formalisation found** — see below. Nothing else related to this paper. |
| `openai/math` catalogue | `lean/formalization.yaml`, `lean/docs/157.md`, `CONTENTS.md` | The paper is not listed as formalised. Its family (157) has a Lean scope page covering only the companion list-colouring paper. |
| GitHub, all repositories | Code search for `connectedMatchingNumber`, `hadwigerNumber`; repository search | No other formalisation. |
| Mathlib | Source at the pinned commit; pull requests | No graph minors or Hadwiger number. Pull request `leanprover-community/mathlib4#36210` (graph contraction and minor) was open. |
| arXiv, web | Web search | No formalisation, and no announcement of one for this paper. |
| Lean Zulip | Not searchable without an account; web search surfaced nothing | **Not checked directly.** |

Some press coverage describes family 157 as having "Lean scope". The primary source shows
that scope to be the list-colouring paper only.

### The partial upstream formalisation

`lean/OAI/Combinatorics/HadwigerMatching/` in `openai/math` at the pinned commit: 10 files,
682 lines, 26,958 bytes. It cites this paper by name. It is not imported by the library's
root file and not listed in the catalogue.

What it proves:

- Proposition 3.5, as `3 * h ≤ |V| + 4 * cm + 2` (`hadwiger_matching_bound`).
- The Corollary 1.2 chain `h < 26m/75 + 2/3 < m/2 ≤ χ`, assuming `α ≤ 2`, `cm < m/100`
  and `m ≥ 5` (`full_matching_minor_proposition`). Ordinary chromatic number only.

What it does not contain: Theorem 1.1, the fractional chromatic number, Section 2,
Lemmas 3.2 and 3.3, Proposition 3.4, Theorem 3.1.

Verified here: the 10 files, with the two upstream files they import
(`ListHadwiger/Model.lean`, `ListHadwiger/Basic.lean`), were built unmodified in a scratch
project with Lean v4.34.1 and Mathlib `d13f23b`. They compile. `#print axioms` on both
theorems above shows `[propext, Classical.choice, Quot.sound]`. The scratch project has
been deleted.

By size this is about 1% of the effort of formalising the whole paper (estimate and its
basis in `blueprint/MILESTONES.md`).

### Independence

The user decided on 2026-10-07 that this project re-proves everything independently
(`START_HERE.md`). For the record, this is what was read of the upstream Lean code for
this paper before that decision, during Step 0:

- read in full: `Definitions.lean`, `Main.lean`, `ChromaticBound.lean`, `MinorBound.lean`,
  and the definitions `HasCliqueMinor` and `hadwigerNumber` in `ListHadwiger/Model.lean`;
- declaration names only, not proofs: the other six files.

The definitions in this repository were written from the paper and from Mathlib's idioms,
not copied. No upstream proof has been used; nothing was proved here beyond trivial glue.

### Statement-level comparison with upstream

Recorded for later use. None of the equivalences below has been proved.

| Notion | Upstream | Here | Expected relation |
|---|---|---|---|
| `K_t` minor | `Fin t → Set V` branch sets: connected, pairwise disjoint, pairwise joined | A general `MinorModel H G`, specialised to `H = ⊤` on `Fin t` | Same condition. |
| Hadwiger number | `sSup` of `{t \| HasCliqueMinor G t}`, for `V : Type` | The same `sSup`, universe-polymorphic | Equal. |
| Connected matching | A `Finset (Finset V)` of two-element cliques, pairwise disjoint and pairwise touching | A `G.Subgraph` that is a Mathlib matching with pairwise touching edges | Equal for finite graphs. |
| `cm(G)` | `sSup` of the cardinalities | `sSup` of `edgeSet.ncard` | Equal for finite graphs. |
| `χ` in statements | `chromaticNumber.toNat` | `∃ k : ℕ, chromaticNumber = k ∧ …` | Equal for finite graphs. |
| `χ_f` | absent | `fractionalChromaticNumber` | — |

## Toolchain pins

- Lean `v4.34.1`, the version upstream pins and the one already installed locally.
- Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, the commit upstream pins for that
  toolchain. Using the same commit means any later comparison with upstream is made under
  identical library definitions. It is not a tagged Mathlib release.

## Mathlib coverage at the pinned commit

Present: `SimpleGraph.indepNum`, `chromaticNumber`, `Colorable`, `IsIndepSet`,
`CliqueFree`, `Subgraph.IsMatching`, `Connected`, `induce`; `InformationTheory.klDiv`
(measure-theoretic Kullback–Leibler divergence); `PMF`; compactness of the standard
simplex; bilinear forms, tensor products, matrix rank; `ZMod 2`; additive characters and
finite Fourier analysis; Szemerédi regularity for graphs; the union bound; binomial
estimates.

Absent: graph minors and the Hadwiger number for `SimpleGraph` (only matroid minors);
fractional chromatic number; connected matchings; max-flow/min-cut; the information
projection (Csiszár) lemma; Kleitman–Winston fingerprints or any container lemma; weak
(Frieze–Kannan) regularity.

This was checked by searching the Mathlib source for names and phrases, not exhaustively.
