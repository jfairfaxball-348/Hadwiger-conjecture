# Prompt for the next session

Written in the session of 2026-10-08 (M4, third slice), under the rule "Prompt for the next
session" in `AGENTS.md`. **It is a draft for the user.** The prompt the user actually sends
is the instruction; this file has no authority of its own.

**This is the unmerged form.** It was written in a commit of the working branch
`m4-lemma-3-3`, before that branch was merged into `main`. The lines marked `[MERGE]` depend
on the merge. If a closing commit follows the merge, it replaces this file by the final
form.

Still open with the user, and carried forward as open:

- sheet items **R-32 and R-33** (the explicit bound and Proposition 3.4) are held, not
  signed off. **They gate the next task**: the fourth slice of M4 is the first part of the
  proof of Proposition 3.4 and may not start before the user signs them off. The prompt
  below has a bracket for the user's answer and says what follows from each answer;
- whether to build upstream's code and audit its axioms (the worker recommended deciding
  it at the gate before M6);
- the wording of the conditions under which a merge "makes sense". The user's instruction
  of 2026-10-08 is one sentence; the conditions in `AGENTS.md` ("Unit of work") are the
  worker's reading of it and the user has not confirmed them;
- the form of the target of the fourth slice, the "container" statement in the prompt
  below, which is the worker's proposal.

---

```text
Continue the Lean formalisation in this repository. AGENTS.md is binding; read it first.

START GATE
1. Pin HEAD. You should be on main, and main should equal origin/main. [MERGE] Expected:
the commit that last touched docs/NEXT_SESSION_PROMPT.md, once the branch m4-lemma-3-3 is
in main (M4 third slice, 2026-10-08: Lemma 3.3 proved). If the branch is not in main, if
main does not equal origin/main, or if HEAD is something else, stop and tell me before
doing anything else.
2. Read START_HERE.md, AGENTS.md, blueprint/BLUEPRINT.md, blueprint/SORRY_AXIOM_LEDGER.md,
blueprint/MILESTONES.md (the single next task; under M4, "Mathlib gaps" and the states after
the first, the second and the third slice), blueprint/FIDELITY.md (in particular the notes
F-BOUND and P-3.4, and F-UNIT, F-CONFLPROB, F-SUP, F-KL, L-3.2 and L-3.3),
blueprint/PAPER_ISSUES.md (in particular PI-007, PI-008, PI-009 and the spot check of
Proposition 3.4), blueprint/M4_REVIEW_SHEET.md (items R-32 and R-33, and questions Q2 and Q5
with my decisions) and the last session entry of docs/SESSION_LOG.md (the M4 third-slice
session).
3. Run lake build, python scripts/check_ledger.py and python scripts/axiom_audit.py.
Expected: 2 sorry, 195 blueprint entries, 204 declarations audited. If any of them
fails, repair that first and do nothing else.
4. Upstream check (AGENTS.md, "Independence from the upstream Lean code"). Look only at
the commit list of openai/math and the file listing of the paper's folder, and compare
with docs/PROVENANCE.md (paper pinned at adc7f12; upstream main last seen at fd4aeeb, with
its Lean for this paper already recorded there). Do not open any Lean file there. If
upstream has commits after fd4aeeb, or the paper's folder has changed, stop and tell me
before doing anything else. If not, record in the session log that you looked and what
you saw.

A RECORD TO WRITE FIRST
[MERGE] If m4-lemma-3-3 was merged into main after its last commit, the merge is not in
the log yet: write its record first (the hashes, the three commands on main, git ls-remote,
the CI runs). If the log already has it, none.

THE GATE ON THE TASK: R-32 AND R-33
The task below is the first part of the proof of Proposition 3.4. By my decision of
2026-10-07 no proof is written before its statement is signed off, and on 2026-10-08 I held
items R-32 (the explicit bound) and R-33 (Proposition 3.4) of blueprint/M4_REVIEW_SHEET.md
for a second reading. My answer:
[FILL IN BEFORE SENDING, one of: (a) "I sign off R-32 and R-33 as they stand." (b) "I sign
off R-32 and R-33 with these changes: ..." (c) leave this bracket as it is: still held.]
* If (a): before any proof, in a commit of its own on the working branch, record the
sign-off with my words quoted: the sign-off lines of items R-32 and R-33 on the sheet,
"Reviewed by" lines under the notes F-BOUND and P-3.4, the blueprint rows D-3.bound and
P-3.4, the ledger row of the bound, and the status remarks that say "held" or "unreviewed"
(START_HERE.md, README.md, blueprint/MILESTONES.md, the layout table of
docs/LEAN_WORKFLOW.md, the doc comments of Hadwiger/RandomSample.lean). Change no
definition and no statement in it. Then go on to the task.
* If (b): that changes held definitions or statements. Make the change first, in a commit
of its own, with the fidelity notes, the sanity lemmas of S-M4.bound and S-M4.eps-needed
that it affects, and the pp.all list; show me the new Lean text and stop. Write no proof
until I have signed the new text off.
* If (c), or if the bracket is not filled in: do not start the task. Do the start gate,
record in the session log that the gate on the task was not passed, tell me, and stop.

TASK: milestone M4, fourth slice: the fingerprint procedure of the proof of Proposition
3.4, as described in blueprint/MILESTONES.md.
* Create a working branch m4-fingerprints from main.
* Before proving, re-read in the local TeX paper/build/sections/03-distributions.tex lines
110 to 170 (the opening of Section 3.2, Proposition 3.4, and its proof up to equation
eq:container-count), and in blueprint/FIDELITY.md the hand derivation of note F-BOUND,
steps 0 to 3. That derivation is not a proof. If a step of it is wrong, that is a result.
* What the slice proves: the part of the proof that does not involve the random list.
Under the hypotheses of Hadwiger.mass_listLaw_le_sampleBound (a finite type with a law mu,
a hole relation H, 0 < M, 0 < B, 0 < eps < 1, H.Supersaturated mu M B eps) there is a family
of at most (|Omega|^2 + 1)^(fingerprintLength B eps) sets T of ordered pairs such that no
law supported on T satisfies the three caps (the hypothesis hR of Lemma 3.3 with R = T),
and every set I of units no two of which conflict is contained in one of them. [This
"container" form is the worker's proposal for the target of the slice, written so as to
need no new definition. Edit it if you want another target.]
* Follow the paper's proof: the conflict graph on units, without loops; for a set I of
pairwise non-conflicting units, the residual set R, starting from all units; while a
feasible law on R exists, its relative-entropy minimiser rho with respect to mu^2, which
exists because the feasible laws form a compact convex set and the entropy is continuous
on it; the rho-average of rho(N_R(v)) is the conflict probability, at least eps; a unit v
of R with the largest neighbourhood mass, by a fixed rule; if v is in I record it and
delete N_R(v), otherwise delete v; both keep I inside R and remove at least one unit, so
the procedure stops at a set with no feasible law; a recording that leaves a feasible
residual raises the minimum entropy by at least -log(1 - eps), by Lemma 3.2 (its second
and third assertions, with S the new residual set); other deletions do not lower it; every
feasible law has entropy between 0 and log B; so at most fingerprintLength B eps units are
recorded; the set of recorded units determines the terminal set, by replaying the
procedure; hence the count. If a step does not go through as written, that is a paper
issue: record it exactly in blueprint/PAPER_ISSUES.md and tell me. Do not patch it
silently. A departure from the paper's argument is made only where a step fails or Mathlib
makes it far more expensive, and each one is recorded with its reason.
* Step 0 of F-BOUND. mu may vanish somewhere (my decision on Q5), and then mu^2 is not
strictly positive, as the paper's definition of relative entropy requires. The extra step
this needs is a departure from the paper's argument that I accepted in advance; record it
as one, with the form it takes.
* Junk values. relEntropy against a second argument that vanishes somewhere (PI-008);
Real.log B and -Real.log (1 - eps), which the hypotheses make honest; the division and the
natural-number ceiling inside fingerprintLength (the ceiling of a negative number is 0,
which happens for 0 < B < 1); any natural-number subtraction in the counting. Every use is
shown honest by a proof, not by a default.
* New definitions. The procedure, the fingerprint and the terminal set are not defined in
Lean. A definition needs a fidelity note and my sign-off like any other. Prefer statements
that need none, as the flows of Lemma 3.3 were written out at the third slice. If the
proof cannot reasonably be written without a new definition, stop before adding it and
tell me what it would be.
* Hadwiger.mass_listLaw_le_sampleBound stays sorry in this slice, with its ledger row. Its
proof is completed in the fifth slice (the cuts from Lemma 3.3, the two exception
probabilities, the union bound and the deterministic step: steps 4 to 7 of F-BOUND). Do
not start the fifth slice.
* Helper lemmas get blueprint rows of kind support in the section "Steps of the paper's
proofs, proved as separate lemmas", in a subsection for Proposition 3.4, and no fidelity
notes. Name them after the result, S-P3.4.<name>, as S-L3.2.* and S-L3.3.* are, and tell me
how many rows you added and why. General lemmas about the definitions go in
Hadwiger/Sanity/ and are imported.
* Do not touch Lemma 3.2 or Lemma 3.3 (both DONE) or Theorem 1.1. Do not change the three
definitions of the bound or the two statements of Proposition 3.4, except as the gate
above says.
* If the bound of Proposition 3.4, or the target of this slice, turns out to be false or
unprovable as stated, that is a result. Stop, record exactly what failed in
docs/SESSION_LOG.md, and tell me. Do not weaken or adjust a statement without my say-so.
* If the slice is not finished in the session: commit the helper lemmas that are proved,
each with its row, and say exactly which step remains.
* Expected end state, to check against the audit: still 2 sorry (Theorem 1.1, the bound of
Proposition 3.4). P-3.4 still STATED. L-3.2 and L-3.3 DONE. C-1.2, T-FINAL, T-NOT-HC and
S-1.d still PROVED_MODULO, resting on Theorem 1.1 alone. Nothing that is DONE now changes.
Before any change: 195 entries, DONE 65, PROVED_MODULO 4, STATED 2, DEFINED 21, MATHLIB 2,
NOT_STATED 101. The slice adds rows; give the counts before and after and account for the
difference. If the audit shows anything else, find out why before going on.
* Check that no signed-off statement changed, by the pp.all comparison of the M4
third-slice session entry, with its three lists (the M3 list; that list with
Hadwiger.exists_holeData_hole; and the list that adds everything signed off on 2026-10-08
and the held items). Take the baseline at main before any change; the three outputs
should have the sha256 hashes recorded in that entry. The list files are under the
ignored .lake/audit/ and exist only on the machine that made them: if they are missing,
rebuild them from the items named in the session log. Tell me if any item of R-32 or R-33
changed (fingerprintLength, exceptionSize, sampleBound and the two statements of
Proposition 3.4). Run the reverse check: every declaration in the Lean sources is named
in the blueprint.
* Keep the blueprint and the ledger in step with the Lean in the same commit. A result
counts only when the axiom audit shows it. Bring every status remark into step as well:
START_HERE.md, README.md, blueprint/PAPER_ISSUES.md, blueprint/MILESTONES.md, the layout
table of docs/LEAN_WORKFLOW.md, and doc comments in the Lean files.

STANDING DECISIONS (already made; do not reopen, do not ask)
* M4, decided 2026-10-07: Proposition 3.4 is stated abstractly and does not wait for M5;
it is an explicit bound with existence as a corollary; statements are signed off before
proofs; proofs follow the paper's arguments, with every departure recorded.
* M4, decided 2026-10-08 (questions Q1 to Q6 of blueprint/M4_REVIEW_SHEET.md): a law is a
real weight function with the predicate IsLaw; the bound has the form (A); the abstract
relation is the bare structure HoleRel; relative entropy is a real number with a junk
value where the second argument vanishes; Proposition 3.4 does not assume mu positive;
Lemma 3.2 keeps the paper's hypotheses as printed.
* Signed off on 2026-10-08: sheet items R-21 to R-31. R-32 and R-33: as the gate above
says.
* Lemma 3.2 is proved (2026-10-08). Its statements keep "compact" and "q has total mass
one", which its proofs do not need; that is recorded and is not to be reopened.
* Lemma 3.3 is proved (2026-10-08), by the paper's max-flow/min-cut argument. Its
statement keeps "mu is a law", of which the proof uses only that the weights are
nonnegative. The proof splits the cases at zero (M < 0; B < 0; both nonnegative). Both are
recorded. [Say so here if you want the split at one instead; it is a few lines.]
* The project is independent of upstream's Lean for this paper, also after upstream's
publication of 2026-10-08 ("Carry on independently").
* General lemmas stay in Hadwiger/Sanity/ and are imported where needed; nothing is moved.
* Helper lemmas and sanity checks get blueprint rows and no fidelity notes. New
definitions and new target statements get fidelity notes. The steps of a proof of the
paper are rows named after the result (S-L3.2.*, S-L3.3.*), in the section on steps of
proofs.
* Signed fidelity notes are not rewritten. Add a line "Status update after the sign-off".
* blueprint/M0_REVIEW_SHEET.md is not edited. The signed items of
blueprint/M4_REVIEW_SHEET.md are not rewritten either.
* The paper's equation eq:sample-independence is (2.2). The blueprint ID S-2.3 is kept as
an identifier.
* Merging, decided 2026-10-08: "Always merge if it makes sense, you dont need to asl". The
rule and its conditions are in AGENTS.md ("Unit of work"). [Edit AGENTS.md, or say so
here, if you want the conditions changed.]

WORKING RULES
* Work inline; at most two subagents at a time, only for independent, well-scoped tasks.
* Commit early and often on the working branch. Push it without asking (standing rule in
AGENTS.md). Run pushes with GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0; if a push fails
because it would need a sign-in, stop and tell me instead of opening a window. After
each push, check git ls-remote against HEAD.
* Merge into main without asking when the merge makes sense, that is, when every
condition of AGENTS.md ("Unit of work") holds. If one of them fails, or you are in doubt,
ask me once. After each merge the closing commit follows, on the terms of AGENTS.md and no
others. Tell me in the final message what was merged, with the hashes.
* Do not ask me things one at a time. Carry on with everything that does not depend on my
answer, and put all open questions in one prompt at the end.
* Do not consult the upstream openai/math Lean code for this paper.
* End with the checkpoint report that AGENTS.md asks for, the single next task, and the
prompt for the next session (AGENTS.md, "Prompt for the next session"). The task after
this slice is the fifth slice of M4: the cuts, the two exception probabilities, the union
bound and the deterministic step, which complete the proof of Proposition 3.4. Do not
start it.
```
