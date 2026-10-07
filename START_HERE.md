# Start here

This repository is a **Lean 4 formalisation project**. Its single goal is to formalise,
with Mathlib, the paper

> "A counterexample to Hadwiger's conjecture", OpenAI, 23 September 2026
> <https://github.com/openai/math/blob/main/preprints/A-counterexample-to-Hadwigers-conjecture-September-23-2026/paper.pdf>

ending in a Lean theorem, free of `sorry` and of non-standard axioms, that says: there are
finite simple graphs of arbitrarily large order whose chromatic number exceeds their
Hadwiger number.

The repository, not any conversation, carries the project state.

## Read in this order

1. `AGENTS.md` — the binding rules.
2. `blueprint/BLUEPRINT.md` — the single source of truth: every definition and result of
   the paper, its Lean name and its status.
3. `blueprint/SORRY_AXIOM_LEDGER.md` — every open `sorry`; there are no axioms.
4. `blueprint/MILESTONES.md` — the plan and the single next task.
5. `blueprint/PAPER_ISSUES.md` — anything in the paper found unclear, incomplete or wrong.
6. `blueprint/FIDELITY.md` — why each Lean definition matches the paper's.
7. `docs/` — status definitions, the Lean workflow, provenance, the session log.

## Where things stand

Nothing of the paper is proved here yet. The statement layer exists: the definitions and
the target statements compile, with `sorry`. Run `python scripts/axiom_audit.py` for the
exact tally; the blueprint has the detail.

Sanity checks on the new definitions are proved (`Hadwiger/Sanity/`, blueprint section
"Sanity checks (not in the paper)"). They are checks on this repository's definitions and
are not results of the paper. The statement layer has **not** been reviewed: the sheet
prepared for the user's sign-off is `blueprint/M0_REVIEW_SHEET.md`.

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

### Corrections to the instruction's assumptions

The user asked to be corrected where the instruction was wrong.

- **Target statements:** correct as written. Theorem 1.1, Corollary 1.2, Theorem 3.1,
  Proposition 3.4 and Proposition 3.5 are numbered and stated as the instruction says.
- **The uncommitted RL70 log:** it was not in the working tree. The working tree was on
  `main`, and the change was in `stash@{0}` on `rl70-frontier-push`. It was restored and
  committed on that branch.
- **Existing formalisation:** one existed in part, as described above.
