# Start here

This repository is a **Lean 4 formalisation project**. Its single goal is to formalise,
with Mathlib, the paper

> "A counterexample to Hadwiger's conjecture", OpenAI, 23 September 2026
> <https://github.com/openai/math/blob/main/preprints/A-counterexample-to-Hadwigers-conjecture-September-23-2026/paper.pdf>

ending in a Lean theorem, free of `sorry` and of non-standard axioms, that says: there are
finite simple graphs of arbitrarily large order whose chromatic number exceeds their
Hadwiger number. Since 2026-10-08 that theorem is proved here, with the proof of the paper's
main theorem taken from the formalisation of the paper's authors.

The repository, not any conversation, carries the project state.

## Read in this order

1. `AGENTS.md` — the rules. Rewritten on 2026-10-08; short.
2. This page — where things stand and what is next.
3. `blueprint/BLUEPRINT.md` — the status of every statement; `python scripts/axiom_audit.py`
   checks it against the build.
4. `NOTICE` and `docs/UPSTREAM_CHANGES.md` — what in this repository is the upstream
   formalisation and what was changed in it.

Everything else under `blueprint/` and `docs/` is the record of the process that was used
until 2026-10-08 and is no longer maintained.

## Where things stand

**The final theorem is proved in this repository's build.** `lake build` is green with no
`sorry` anywhere, and the five main statements are `DONE`: no `sorry` beneath them and only
the axioms `propext`, `Classical.choice` and `Quot.sound` (`python scripts/axiom_audit.py`):

| Statement | Lean |
|---|---|
| Theorem 1.1 | `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` |
| Corollary 1.2, with `χ_f` | `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` |
| arbitrarily large graphs with `h(G) < χ(G)` | `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber` |
| Hadwiger's conjecture is false | `Hadwiger.not_hadwigerConjecture` |
| its fractional weakening is false | `Hadwiger.not_fractionalHadwigerConjecture` |

This is so since 2026-10-08, at Lean `v4.34.1` and Mathlib `d13f23b`. **It rests on the
upstream formalisation for Theorem 1.1**, as the next section says. A machine-checked proof
says that the Lean statements follow from the axioms; whether the statements say what the
paper and the conjecture say is argued in the doc comments and in `blueprint/FIDELITY.md`,
and is not machine-checked.

One statement was withdrawn and not proved: this project's own explicit form of Proposition
3.4 (blueprint P-3.4). Nothing uses it.

### Who proved what

- **Theorem 1.1** (arbitrarily large graphs with `α ≤ 2` and `cm < m/100`), which is almost
  the whole paper: proved by the formalisation of the paper's authors, `openai/math` at
  commit `fd4aeeb`, 288 files and about 38,700 lines, kept under `OAI/`. **That proof is
  not this project's work.** This project built it, checked its axioms, and wrote the
  comparison of definitions that carries it over to its own statement
  (`Hadwiger/UpstreamBridge.lean`).
- **This project's own work** (`Hadwiger/`): the definitions and statements; Proposition
  3.5; the bounds of Section 1; Corollary 1.2 from Theorem 1.1, including its
  fractional-chromatic form `χ_f(G) > h(G)`, which upstream's selected statement does not
  have; the final theorem and the negations of Hadwiger's conjecture and of its fractional
  weakening from Corollary 1.2; and Lemma 2.2, Lemma 3.2 and Lemma 3.3, which the final
  theorem does not use on this route.

### How this came about

Until 2026-10-08 the project was independent of upstream's Lean code and was proving the
paper from scratch; about a tenth of the estimated work was done. On 2026-10-08 the user
asked for the quickest route to a complete build that can be registered on the Palomar
registry, and chose to build on upstream's proof (`AGENTS.md` quotes the instruction).

## What is next

The build above is not yet in the form the Palomar registry accepts. Still to do, in order:

1. **Port every Lean file to Lean's module system**, upstream's 288 included
   (`scripts/port_to_modules.py` does the mechanical part). A module cannot import a
   non-module, and the registry requires modules throughout.
2. **Move to Lean `v4.35.0-rc2` or later** with the Mathlib commit of the same toolchain
   (the tag `v4.35.0-rc2`, 69 commits after the Mathlib this build uses), and repair what
   breaks. The registry's minimum is `v4.35.0-rc2`.
3. **Package**: `Challenge.lean` (drafted), `Solution.lean`, `comparator.json`,
   `formalization.yaml`, a README with the account the registry asks for, and a CI job that
   runs `lake comparator`, the same check the registry runs.

Every change to an upstream file is listed in `docs/UPSTREAM_CHANGES.md`.

## What only the user can do

- **Authorisation to register.** Palomar asks the submitter to be a responsible author or
  maintainer of the substantive formalisation, or to have approval from one, and says that
  a fork or a port is not that. The substantive formalisation of Theorem 1.1 is
  `openai/math`. Registration therefore needs approval from a maintainer of `openai/math`.
- **Submitting.** The form at <https://submit.palomar-registry.org/>, with the repository,
  the full commit hash and the path of `comparator.json`.
- **Standing behind the metadata.** `formalization.yaml` lists human authors and
  responsible maintainers and describes how AI was used. The user's name goes there.

## The old programme

Until 2026-10-07 this repository pursued **HC7**: every finite simple graph with chromatic
number 7 has a K7 minor. **HC7 was retired, not solved.** The paper's counterexamples are
arbitrarily large graphs with independence number at most 2; they say nothing about
graphs of chromatic number 7. HC7 remains open as far as this repository knows.

The HC7 state is frozen, unaltered, in `frozen-hc7-programme/`, with the numbered
sessions in `sessions/` and older material in `Archive/`. None of it is current authority
and none of it is used by the formalisation.

## Authorisation

The reorganisation was ordered by the user in the message below, sent on 2026-10-07 while
main was at `0d17783` (RL69 closeout). The user asked for it to be copied here verbatim as
the authorisation. It is reproduced line for line as it was received. It arrived in
line-sized pieces, so any blank lines the original had between its parts are not
recoverable and none have been added.

```text
Reorganise this repository around a new central goal. This message is an explicit
user-authorised programme amendment under AGENTS.md, dated 2026-10-07. Copy this whole
message verbatim into the new START_HERE as its authorisation.
NEW ROOT
Formalise in Lean 4 (with Mathlib) the paper "A counterexample to Hadwiger's conjecture",
OpenAI, 23 September 2026:
https://github.com/openai/math/blob/main/preprints/A-counterexample-to-Hadwigers-conjecture-September-23-2026/paper.pdf
The old root (HC7: every 7-chromatic graph has a K7 minor) is RETIRED by this instruction.
It is not solved: the paper's counterexamples are arbitrarily large graphs with
independence number at most 2 and say nothing about chromatic number 7. Record that plainly.
TARGET STATEMENTS (as I understand them; re-read the paper and correct me if wrong)
* Theorem 1.1: for arbitrarily large m there is an m-vertex finite simple graph G with
alpha(G) <= 2 and cm(G) < m/100, where cm is the largest matching whose edges are
pairwise joined by an edge.
* Proposition 3.5: h(G) <= (|V(G)| + 4 cm(G) + 2)/3, h = Hadwiger number.
* Corollary 1.2: h(G) < 26m/75 + 2/3 < m/2 <= chi_f(G) <= chi(G).
* Final Lean theorem: there are finite simple graphs of arbitrarily large order whose
chromatic number exceeds their Hadwiger number.
The proof is non-constructive: Theorem 3.1 ("raw supersaturation", Sections 4-14 and
Appendix A) is the bulk; Proposition 3.4 turns it into a finite graph.
STEP 0 - BEFORE CHANGING ANYTHING
1. Pin main HEAD. Expected 0d17783 (RL69 closeout). There is an unpushed local branch
rl70-frontier-push holding abandoned RL70 work under work/RL70/, with one uncommitted
log file. RL70 was stopped without closeout; no RL70 result was certified.
2. Read the paper in full, plus the README and the build/ folder next to it. Record the
URL, the openai/math commit hash and the PDF's sha256. Check the licence before storing
the PDF or any source in this repo; if unclear, store only the hash and URL.
3. Check whether a formalisation of this paper already exists or is announced (the
openai/math repo, Mathlib, Lean Zulip, arXiv). If one exists, stop and tell me.
4. Check what is installed: elan, lean, lake, git. You may install elan and Lean 4 and
download the Mathlib cache. Ask before installing anything else.
REORGANISATION (one non-RL infrastructure commit series on a new branch; ask me before
pushing or merging to main)
* Preserve history. Do not rewrite or delete sessions/, Archive/ or the RL1-RL69 records.
Move the current authoritative/ HC7 state into a clearly labelled frozen location, and
commit the abandoned RL70 work to its branch and note it as abandoned, not promoted.
* Rewrite AGENTS.md and docs/ for a formalisation project. Keep the integrity rules, restated
for Lean: a statement is DONE only when it compiles with no sorry and its axiom audit
(#print axioms) shows only the standard axioms; every sorry, axiom or native_decide is
listed in a ledger; evidence and sketches are never reported as proof; a gap or error
found in the paper is a result, to be recorded exactly and reported to me, never patched
with an axiom or a silently changed statement.
* Create the Lean project: lakefile, lean-toolchain, pinned Mathlib, CI running lake build
plus a sorry/axiom check.
* Create a blueprint: one entry per definition, lemma, proposition and theorem of the paper,
with its paper location, dependencies, Lean name and status. This replaces the old
proof-state file as the single source of truth.
* Write the statement layer first: Lean definitions (graph minor and Hadwiger number,
independence number, connected matching, fractional chromatic number) and the target
statements, with sorry. Use Mathlib's definitions where they exist and say which are new.
Add a short fidelity note for each definition arguing it matches the paper's.
MILESTONES TO PROPOSE (do not start proving in this session beyond what is trivial)
M0 statement layer reviewed. M1 Corollary 1.2 from Theorem 1.1 and Proposition 3.5,
including chi_f >= |V|/alpha. M2 Proposition 3.5. M3 Section 2 (the triangle-free hole
relation gives alpha <= 2). M4 Proposition 3.4. M5 onward: Theorem 3.1, split section by
section. For each, estimate size and name the Mathlib gaps it depends on.
WORKING RULES
* Fanning out nine parallel subagents hit my usage limit twice in the last session. Work
inline; use at most two subagents at a time and only for independent, well-scoped tasks.
* Commit early and often. Save notes as you go.
* End the session with: what was reorganised, the blueprint and milestone plan, the list of
open sorries and axioms, anything in the paper you could not make sense of, and the
single next task.
```

### The Step 0.3 stop, and the user's decision

Step 0.3 fired. The paper's own repository, `openai/math`, already contained a partial Lean
formalisation of this paper: Proposition 3.5 and the Corollary 1.2 chain for the ordinary
chromatic number, about 1% of the effort of the whole paper. Work stopped before anything
was changed and the user was told. The options put to the user were:

1. Proceed, reusing upstream's definitions and porting its proof of Proposition 3.5.
2. Proceed fully independently: re-prove everything from our own definitions.
3. Do not proceed.

The user's decision, verbatim, 2026-10-07:

```text
Okay cool well if its just 1% lets just redo it all. I choose your option 2
```

So this project is **independent of the upstream Lean code**. The rule that follows from
that is in `AGENTS.md`; what was found upstream, and what was read of it, is in
`docs/PROVENANCE.md`.

### Upstream since then (2026-10-08)

On 2026-10-08 `openai/math` moved past the pinned commit. The paper is unchanged there. A
new folder of 276 Lean files and upstream's catalogue now claim a formalisation of the
paper's main result in its ordinary-chromatic form. The start gate of the session that
found this stopped and the user was told. The user's decision, by choosing the option so
labelled, 2026-10-08:

```text
Carry on independently
```

The option's description, the other options and the rest of the exchange are quoted in
`docs/SESSION_LOG.md` (M4 first-slice session); what was seen upstream, and that none of it
was opened, built or checked, is in `docs/PROVENANCE.md` ("Upstream after the pin"). So the
project is still independent of the upstream Lean code, and the rule in `AGENTS.md` stands.

### Corrections to the instruction's assumptions

The user asked to be corrected where the instruction was wrong.

- **Target statements:** correct as written. Theorem 1.1, Corollary 1.2, Theorem 3.1,
  Proposition 3.4 and Proposition 3.5 are numbered and stated as the instruction says.
- **The uncommitted RL70 log:** it was not in the working tree. The working tree was on
  `main`, and the change was in `stash@{0}` on `rl70-frontier-push`. It was restored and
  committed on that branch.
- **Existing formalisation:** one existed in part, as described above.
