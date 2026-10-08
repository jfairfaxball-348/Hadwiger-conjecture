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
   `blueprint/M4_REVIEW_SHEET.md` — the statement layer of Sections 3.1 and 3.2, signed
   off by the user on 2026-10-08 except for two items that are held.
5. `blueprint/PAPER_ISSUES.md` — anything in the paper found unclear, incomplete or wrong.
6. `blueprint/FIDELITY.md` — why each Lean definition matches the paper's.
7. `docs/` — status definitions, the Lean workflow, provenance, the session log, and
   `docs/NEXT_SESSION_PROMPT.md`, the draft prompt that the last session left for the
   next one (a draft for the user; it has no authority).

## Where things stand

**The final theorem is not proved.** It is derived in Lean from Theorem 1.1, and
Theorem 1.1, which is almost the whole paper, is `sorry`.

What is proved (2026-10-07), all of it elementary:

- Proposition 3.5, the clique-minor bound `3·h(G) ≤ m + 4·cm(G) + 2` and its consequence
  for graphs with `α ≤ 2` (milestones M1 and M2). It, Lemma 2.2 and Lemma 3.2, both below,
  are the three numbered results of the paper proved so far.
- Three unnumbered statements from Section 1: the colour-class bound `|V| ≤ α·χ`, its
  fractional form `|V| ≤ α·χ_f`, and `χ_f ≤ χ` (blueprint S-1.a, S-1.b, S-1.c; M1).
- Lemma 2.2, that the abstract hole relation of Section 2.1 is symmetric, has no loops and
  is triangle-free, and equation (2.2), that the graph on the positions of any list has
  `α ≤ 2` and `χ ≥ ⌈m/2⌉` (blueprint L-2.2, S-2.3; M3). This is about the abstract linear
  data of Section 2.1 only. The paper's actual construction (Sections 2.2 to 2.4) is not
  stated in Lean yet, so nothing here is yet about the paper's graphs.

Proved on 2026-10-08, in the second slice of milestone M4, and also elementary:

- Lemma 3.2, the information-projection lemma of Section 3.1, in its three assertions: a
  minimiser `ρ` of the relative entropy `D(·‖q)` on a convex set of laws on a finite set is
  positive wherever any law of the set is; `D(ρ'‖q) − D(ρ‖q) ≥ D(ρ'‖ρ)`; and
  `D(ρ'‖ρ) ≥ −log ρ(S)` when `ρ'` is supported on `S` (blueprint L-3.2, with the sentences
  of the paper's proof as the lemmas S-L3.2.*). The statements are the ones the user signed
  off; the proofs are the paper's. Nothing in Lean depends on it yet. It is one of the two
  lemmas that the proof of Proposition 3.4 will use, and it does not by itself bring the
  final theorem any closer.

What follows from Theorem 1.1 in Lean, and so has a complete proof body but is not proved:
Corollary 1.2, the final theorem, and the negations of Hadwiger's conjecture and of its
fractional weakening. Nothing else stands between Theorem 1.1 and the final theorem.

What is stated and **not proved** (stated on 2026-10-08, in the first slice of milestone
M4): Lemma 3.3 and Proposition 3.4, the last as an explicit bound on a failure probability,
for any finite set with a law and any symmetric, loopless, triangle-free relation. Each is
`sorry`. The user signed off the statement of Lemma 3.3 on 2026-10-08, so its proof may be
written; it is the next task. **The statement of Proposition 3.4 is not signed off**: the user held it, with its explicit bound, for a second
reading (`blueprint/M4_REVIEW_SHEET.md`, items R-32 and R-33), and by the user's decision no
proof of it is written before its sign-off. The bound in Proposition 3.4 is not in the
paper in that form: it was derived by hand from the paper's proof and has not been checked
by anyone else. Theorem 3.1 is not stated.

So there are three `sorry`s: Theorem 1.1 and those two. (There were six after the first
slice of M4; the three of Lemma 3.2 were replaced by proofs in the second.) The final
theorem rests on Theorem 1.1 alone; the other two are not beneath it, because Theorem 1.1
is not yet derived from Proposition 3.4 in Lean. The paper's construction (Sections 2.2 to 2.4), Theorem 3.1 and
everything from Section 4 onward are not yet stated in Lean.

Run `python scripts/axiom_audit.py` for the exact tally; the blueprint has the detail.

Sanity checks on the new definitions are proved (`Hadwiger/Sanity/`, blueprint section
"Sanity checks (not in the paper)"). They are checks on this repository's definitions and
are not results of the paper. The statement layer was signed off by the user on 2026-10-07
(`blueprint/M0_REVIEW_SHEET.md`; the "Reviewed by" lines are in `blueprint/FIDELITY.md`).
The sign-off covers the definitions and statements as they stood then; anything added or
changed later needs its own.

One sanity check was added at M3: that the hole relation of Section 2.1 can hold at
all (`Hadwiger.exists_holeData_hole`, blueprint S-M3.hole-nonvacuous). It is proved, and
the user accepted the form of its statement on 2026-10-07 (recorded in its blueprint row
and in `docs/SESSION_LOG.md`, M3 session).

The first slice of M4 (2026-10-08) added the statement layer of Sections 3.1 and 3.2.
The user signed off most of it the same day, by the sheet `blueprint/M4_REVIEW_SHEET.md`:
the definitions D-3.rel, D-3.law, D-3.marg, D-3.caps, D-3.unit, D-3.confl, D-3.sup, D-3.KL
and D-3.list, and the statements L-3.2 and L-3.3 (items R-21 to R-31). The "Reviewed by"
lines are in `blueprint/FIDELITY.md`.

**Awaiting review since 2026-10-08:** the explicit bound and Proposition 3.4 (blueprint
D-3.bound and P-3.4; sheet items R-32 and R-33), held by the user for a second reading.
Their fidelity notes, F-BOUND and P-3.4, carry no "Reviewed by" line.

The sanity lemmas proved in that slice (blueprint `S-M4.*`) are checks on the new
definitions; they are proved, and they are not evidence for the three results.

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
