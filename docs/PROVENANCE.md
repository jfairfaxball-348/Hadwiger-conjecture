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

## Upstream after the pin: a formalisation of this paper's main theorem (seen 2026-10-08)

**Upstream now publishes Lean for this paper well beyond what is described above.** This was
found on 2026-10-08 by the upstream check at the start of the M4 first-slice session. The
user was told before anything else was done, and decided the same day that the project
carries on independently (the question, the options and the answers are quoted in
`docs/SESSION_LOG.md`, M4 first-slice session). The rule in `AGENTS.md` stands: upstream's
Lean for this paper is not consulted and not copied.

What was looked at, on the user's instruction and then on the user's answer "Names and
catalogue only": the commit list of `openai/math`; the file listing of the paper's folder;
commit lists filtered by path; the file names and sizes of one new folder; and three
catalogue files that are not Lean (`lean/docs/157.md`, `lean/formalization.yaml`,
`CONTENTS.md`). **No Lean file of upstream was opened, at any commit.**

| | |
|---|---|
| `openai/math` `main` on 2026-10-08 | `fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb`, "Merge pull request #1 from openai/codex/update-10-7" (2026-10-08 05:20 UTC) |
| Its second parent | `301488868beec11bfd897168433b0a64f5258559`, "Update manuscripts and Lean formalizations" (2026-10-08 05:03 UTC); 324,499 lines added, 17,340 deleted, over the whole collection |
| The pin | `adc7f1241b42e322a6451854ab7e4b4c146bf78a`, unchanged. These three are all the commits there are. |

**The paper is unchanged.** Every file in the paper's folder has the same git blob at
`fd4aeeb` as at the pin: `README.md`, `paper.pdf` (blob `a443d538`), `build/main.tex`,
`build/preamble.tex`, the 16 files of `build/sections/` and `build/sources/references.bib`.
The commit list filtered to that folder shows only the initial commit. So the pinned version
is still upstream's current version, and the pin does not move.

**What is new, by name and size only:**

- A folder `lean/OAI/Combinatorics/HadwigerCounterexample/`, created by `3014888`: 276 Lean
  files, 1,633,876 bytes, no subfolders. It has a `Main.lean` (6,213 bytes). The file names
  run over the whole paper: for example `TerminalCut`, `EntropyContainers`,
  `FiniteGraphTransfer`, `GradientRealization`, `WeakProductComparison`,
  `ParameterExistence`, `FinalContradiction`. Names are not contents; nothing is claimed
  here about what any file proves.
- The older folder `lean/OAI/Combinatorics/HadwigerMatching/` (the partial formalisation
  described above) and `lean/OAI/Combinatorics/ListHadwiger/` were not touched by the new
  commits.

**What upstream's catalogue now says** (read in the three catalogue files; quoted or
paraphrased from them, not checked against any Lean):

- `lean/formalization.yaml`, whose header calls it a "Catalog of papers with a formalized
  main result", now lists this paper as a source, with the comparator entry: declaration
  `OAI.HadwigerCounterexample.not_hadwiger_conjecture`, file
  `OAI/Combinatorics/HadwigerCounterexample/Main.lean`, configuration
  `ComparatorChallenges/HadwigerCounterexample.json`. At the pin the file did not mention
  this paper.
- `lean/docs/157.md`, the scope page of the paper's family, now names this paper and says
  that the formalisation constructs arbitrarily large finite simple counterexamples with
  independence number at most two, and proves for a graph on `m` vertices
  `h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)`; that this disproves the ordinary chromatic form; and
  that the fractional-chromatic strengthening is outside the selected statement. It links a
  comparator statement `lean/ComparatorChallenges/HadwigerCounterexample.lean` (not opened).
- `CONTENTS.md` lists the paper as before.

**What this project knows and does not know.** Upstream claims a Lean formalisation of the
paper's main result in its ordinary-chromatic form, which is this project's final theorem
(T-FINAL) up to the form of the statement. This project has **not** built upstream's code,
has not run `#print axioms` on it, has not read its statement, and has not compared it with
T-FINAL. So nothing here says whether the claim is right, what the upstream statement is
exactly, or whether it uses `sorry`, extra axioms or `native_decide`. By size it is about
4.6 times the paper's TeX (1,633,876 against 356,412 bytes), inside the range of the
calibration table below. Upstream's catalogue does not claim the fractional form
(Corollary 1.2 with `χ_f`, blueprint C-1.2 and S-1.d), which this project states.

**Consequences recorded, not decided here.**

- The statements above under "Was the paper already formalised?" and "The partial upstream
  formalisation" describe the pin `adc7f12` and are still true of it. They are no longer a
  description of upstream's current state.
- The sentence in `blueprint/MILESTONES.md`, "Order and gates", that the upstream authors
  "have not published a formalisation of this theorem" was true on 2026-10-07 and is not
  true of upstream's catalogue on 2026-10-08; it is corrected there.
- A statement-level comparison of T-FINAL with upstream's `not_hadwiger_conjecture` is
  allowed by `AGENTS.md` ("Comparing a finished statement here with upstream's statement is
  allowed"). When this section was first written it had not been made. It was made later
  the same day and is the next section. Whether to build upstream's code to check its
  axioms is still a question for the user.

### Upstream's comparator statement, compared with this project's (2026-10-08)

Made on 2026-10-08, after the statement layer of M4's first slice had been committed,
pushed and merged, as a follow-up the user left to the worker's recommendation
(`docs/SESSION_LOG.md`, M4 first-slice session, addendum). `AGENTS.md` allows comparing a
finished statement here with upstream's; T-FINAL, T-NOT-HC, C-1.2 and T-1.1 are finished
statements, signed off on 2026-10-07.

**What was opened, and nothing else.** One upstream Lean file,
`lean/ComparatorChallenges/HadwigerCounterexample.lean` at `fd4aeeb` (56 lines, 1,765
bytes), and its configuration `HadwigerCounterexample.json` (15 lines). Before the Lean
file was read, its outline was listed by declaration keyword and name, to make sure it held
statements only. It does: it imports Mathlib, defines four notions of Section 1, and
states two theorems whose proofs are `sorry`, as a challenge file does. It contains nothing
of the construction, of Section 3, or of any proof. This is the first upstream Lean file
for this paper opened since Step 0. **No file of
`lean/OAI/Combinatorics/HadwigerCounterexample/` was opened**, and nothing was built. The
file was fetched into the session's scratch folder and is not stored in this repository.

Its four definitions are the notions already compared in the table above, which were read
at Step 0: a touching matching as a finite set of two-element cliques, pairwise disjoint and
pairwise touching; `connectedMatchingNumber` as the supremum of their sizes; `HasCliqueMinor`
by branch sets indexed by `Fin t`, for a vertex type in `Type`; `hadwigerNumber` as the
supremum. The configuration names two theorems,
`OAI.HadwigerCounterexample.exists_counterexamples` and
`OAI.HadwigerCounterexample.not_hadwiger_conjecture`, the solution module
`OAI.Combinatorics.HadwigerCounterexample.Main`, and as permitted axioms `propext`,
`Quot.sound` and `Classical.choice`.

**The two upstream statements, in words.**

1. `exists_counterexamples`: for every `M` there are `m ≥ max(M, 5)` and a graph `G` on
   `Fin m` with: `α(G) ≤ 2`; `cm(G) < m/100`; `h(G) < 26m/75 + 2/3`;
   `26m/75 + 2/3 < m/2`; `m/2 ≤ χ(G)`; `h(G) < χ(G)`; and `χ(G)` finite. The comparisons
   are in `ℚ`, and `χ(G)` enters as `chromaticNumber.toNat`, with two further clauses
   saying that the chromatic number is not `⊤` and equals its `toNat`.
2. `not_hadwiger_conjecture`: it is not the case that every graph on every `Fin m` has
   `χ(G) ≤ h(G)`, compared in `ℕ∞`.

**Comparison.** None of the relations below has been proved in Lean, here or (as far as
this project knows) anywhere. "Expected" means: it follows if upstream's and this
project's definitions of `cm` and `h` agree on finite graphs, which the table above
expects and nobody has proved.

| This project | Upstream's comparator statement | Relation |
|---|---|---|
| T-1.1 `exists_indepNum_le_two_and_connectedMatchingNumber_lt`: for every `N` some `m ≥ N` and `G` on `Fin m` with `α(G) ≤ 2`, `100·cm(G) < m` | the first two clauses of statement 1 | Expected equivalent in content: `cm < m/100` in `ℚ` is `100·cm < m` in `ℕ`; upstream also demands `m ≥ 5`, which is harmless for "arbitrarily large". The two definitions of `cm` differ in form. **So upstream's main statement contains this project's Theorem 1.1, the one `sorry` beneath the final theorem.** |
| C-1.2 `exists_hadwigerNumber_lt_fractionalChromaticNumber`: `h < 26m/75 + 2/3 < m/2 ≤ χ_f ≤ χ` | clauses three to five of statement 1: `h < 26m/75 + 2/3 < m/2 ≤ χ` | Upstream's is the ordinary-chromatic chain only. This project's has `χ_f` in the middle and is the stronger statement. Here in `ℝ`, with `χ` exhibited as a natural number; upstream in `ℚ`, with `toNat` and the two finiteness clauses, which amount to the same thing. |
| T-FINAL `exists_hadwigerNumber_lt_chromaticNumber`: for every `N` some `m ≥ N` and `G` on `Fin m` with `(h(G) : ℕ∞) < χ(G)` | the clause `h < χ.toNat` of statement 1, with the finiteness clauses | Expected equivalent in content: for a finite chromatic number the `ℕ∞` inequality is the inequality of naturals (S-M0.final-finite proves that reading here). |
| T-NOT-HC `not_hadwigerConjecture`: `¬ HadwigerConjecture`, the conjecture being over every finite nonempty vertex type in `Type` | statement 2: the negation of the conjecture over the graphs on `Fin m`, every `m`, the empty graph included | Upstream negates the conjecture for a smaller class of graphs, so its statement implies this project's form directly (a counterexample on `Fin m` has `m ≥ 1`, since on `Fin 0` both sides are `0`). The converse needs invariance under relabelling the vertices, which is true and not proved here. Both are obtained from a graph on `Fin m`. |
| S-1.d `not_fractionalHadwigerConjecture` | none | Not in upstream's selected statement, as its catalogue says. |

**What this does and does not show.** It shows that what upstream claims to have formalised
is, in content, Theorem 1.1 together with the ordinary-chromatic half of Corollary 1.2 and
the final theorem; and that this project's statements say the same things in a different
form, with the fractional chain in addition. It does not show that upstream's claim is
right: whether `Main.lean` compiles, whether it is free of `sorry`, and which axioms it
uses, are not known here. Finding that out means building upstream's code, which was not
done and needs the user's go-ahead.

**A consequence worth stating plainly.** If upstream's first statement is proved there, then
the only thing between this project's final theorem and a complete proof is a result that
upstream has, in another form, already machine-checked. Under the independence rule that
changes nothing in what this project may use. It is recorded because it bears on the
decision at the gate before M6.

## Calibration used for effort estimates

To estimate how much Lean a full formalisation needs, the size of the Lean source was
compared with the size of the paper's TeX source for combinatorics papers that upstream
formalised in full. Sizes are of the paper's `build/sections/*.tex` and of the named
directory under `lean/OAI/Combinatorics/` at the pinned commit. A directory is a proxy for
a formalisation: imports from other directories are not counted.

| Paper (upstream folder name, abbreviated) | Lean directory | TeX bytes | Lean bytes | Ratio |
|---|---|---|---|---|
| A linear list-coloring bound in terms of the Hadwiger number | `ListHadwiger` | 134,492 | 902,720 | 6.7 |
| A Logarithmic Independence Bound for Clique-Free Graphs | `CliqueFree` | 53,824 | 229,474 | 4.3 |
| A counterexample to Sidorenko's conjecture | `Sidorenko` | 163,656 | 1,216,768 | 7.4 |
| A Sharp Threshold Bound for Monotone Graph Properties | `SharpThreshold` | 23,929 | 313,943 | 13.1 |
| A linear cycle and edge decomposition of every graph | `CycleDecomposition` | 92,017 | 998,368 | 10.8 |
| This paper, the part upstream did (Proposition 3.5 and Corollary 1.2's arithmetic) | `HadwigerMatching` | about 3,200 | 26,958 | about 8 |

This paper's TeX is 356,412 bytes. The estimates built on these ratios are in
`blueprint/MILESTONES.md`.

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
