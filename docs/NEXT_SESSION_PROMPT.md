# Prompt for the next session

Written at the close of the session of 2026-10-08 (M4, second slice), under the rule
"Prompt for the next session" in `AGENTS.md`. **It is a draft for the user.** The prompt
the user actually sends is the instruction; this file has no authority of its own.

This is the final form, written in the session's closing commit after the last merge. The
one thing it cannot contain is the hash of its own commit. Its parent is `c76d10d`. At the
next start gate `HEAD` of `main` should be the last commit that touched this file; check
with `git log -1 --format=%h -- docs/NEXT_SESSION_PROMPT.md` against
`git rev-parse --short HEAD`. Any commit in between is something to explain before going
on. The version given to the user in the closing message has the hash written out.

Still open with the user, and carried forward as open:

- sheet items **R-32 and R-33** (the explicit bound and Proposition 3.4) are held, not
  signed off;
- whether to build upstream's code and audit its axioms (the worker recommended deciding
  it at the gate before M6);
- the wording of the conditions under which a merge "makes sense". The user's instruction
  of 2026-10-08 is one sentence; the conditions in `AGENTS.md` ("Unit of work") are the
  worker's reading of it and the user has not confirmed them.

---

```text
Continue the Lean formalisation in this repository. AGENTS.md is binding; read it first.

START GATE
1. Pin HEAD. You should be on main, and main should equal origin/main. Expected: [the
commit that last touched docs/NEXT_SESSION_PROMPT.md; its parent is c76d10d] (M4 second
slice merged, 2026-10-08: Lemma 3.2 proved; the rule on merging changed in AGENTS.md; the
closing commit of that session). If main does not equal origin/main, or HEAD is something
else, stop and tell me before doing anything else.
2. Read START_HERE.md, AGENTS.md, blueprint/BLUEPRINT.md, blueprint/SORRY_AXIOM_LEDGER.md,
blueprint/MILESTONES.md (the single next task; under M4, "Mathlib gaps" and the states after
the first and the second slice), blueprint/FIDELITY.md (in particular the notes F-LAW,
F-MARG, F-CAPS and L-3.3), blueprint/PAPER_ISSUES.md (in particular PI-007 and the spot
check of Lemma 3.3), blueprint/M4_REVIEW_SHEET.md (items R-22, R-23, R-24 and R-31) and the
last session entry of docs/SESSION_LOG.md (the M4 second-slice session).
3. Run lake build, python scripts/check_ledger.py and python scripts/axiom_audit.py.
Expected: 3 sorry, 189 blueprint entries, 194 declarations audited. If any of them
fails, repair that first and do nothing else.
4. Upstream check (AGENTS.md, "Independence from the upstream Lean code"). Look only at
the commit list of openai/math and the file listing of the paper's folder, and compare
with docs/PROVENANCE.md (paper pinned at adc7f12; upstream main last seen at fd4aeeb, with
its Lean for this paper already recorded there). Do not open any Lean file there. If
upstream has commits after fd4aeeb, or the paper's folder has changed, stop and tell me
before doing anything else. If not, record in the session log that you looked and what
you saw.

A RECORD TO WRITE FIRST
None. The previous session's log is complete up to its closing commit, which was
fast-forwarded into main under the closing-commit rule of AGENTS.md ("Unit of work").

TASK: milestone M4, third slice: prove Lemma 3.3, as described in blueprint/MILESTONES.md.
* Create a working branch m4-lemma-3-3 from main.
* Before proving, re-read in the local TeX paper/build/sections/03-distributions.tex lines
71 to 108: Lemma 3.3 and its proof.
* Remove this sorry with a real proof, without changing the statement:
* L-3.3   Hadwiger.exists_terminal_cut
* Follow the paper's proof: the network with a source, a left and a right copy of Omega
and a sink, with capacities M mu(x), M mu(y), and B mu(x) mu(y) on the pairs of R; a flow
of value one is a law supported on R that satisfies the three caps, and a flow of larger
value scales down to one, so the maximum value is below one; a maximiser exists because
the feasible flows form a compact polytope; there is no residual path from the source to
the sink; Z is the set reachable from the source; every forward edge out of Z is
saturated and every forward edge into Z has zero flow; summing conservation over Z gives
cut capacity = value < 1; then S = L_0 union R_0 and E_0 = R intersected with the pairs
that avoid L_0 on the left and R_0 on the right. If a step of it does not go through as
written, that is a paper issue: record it exactly in blueprint/PAPER_ISSUES.md and tell
me. Do not patch it silently. A departure from the paper's argument is made only where a
step fails or Mathlib makes it far more expensive, and each one is recorded with its
reason. Hyperplane separation is the fallback named in blueprint/MILESTONES.md; do not
take it without recording why the paper's argument was given up.
* Cases. The statement has no sign condition on M and B. For M < 1, and for B < 1, it is
true for a trivial reason (note L-3.3), and the paper's network needs nonnegative
capacities, so the proof has to treat those cases apart. Tell me how each case is proved
and whether the hypothesis hR is used in it. Watch the points of mass zero (edges of
capacity zero), the empty R, and "a flow of larger value could be scaled down": the
scaled flow must still satisfy the caps and be supported on R.
* Junk values. The statement has none (no division, no logarithm). If the proof divides
(the scaling does), the divisor is shown nonzero by a proof, not by x / 0 = 0.
* New definitions. A definition (a flow, a network, a residual graph) needs a fidelity
note and my sign-off like any other. Prefer to write the objects out in the statements of
the helper lemmas, as the normalised restriction was written out at the second slice. If
the proof cannot reasonably be written without a new definition, stop before adding it
and tell me what it would be.
* Helper lemmas get blueprint rows of kind support in the section "Steps of the paper's
proofs, proved as separate lemmas", in a subsection for Lemma 3.3, and no fidelity notes.
Name them after the lemma, S-L3.3.<name>, as S-L3.2.* are, and tell me how many rows you
added and why. General lemmas about the definitions go in Hadwiger/Sanity/ and are
imported.
* Do not touch Lemma 3.2 (it is DONE), Proposition 3.4 or Theorem 1.1. Do not start the
fourth slice.
* R-32 and R-33 of blueprint/M4_REVIEW_SHEET.md (the explicit bound and Proposition 3.4)
are held, not signed off. Do not prove the bound, and do not change it or the statements
of Proposition 3.4. [Edit this line if you sign them off before the session.]
* If the statement turns out to be false or unprovable as stated, that is a result. Stop,
record exactly what failed in docs/SESSION_LOG.md, and tell me. Do not weaken or adjust
the statement without my say-so.
* If the proof is not finished in the session: leave Hadwiger.exists_terminal_cut as
sorry with its ledger row, commit the helper lemmas that are proved, each with its row,
and say exactly which step remains.
* Expected end state, to check against the audit: 2 sorry (Theorem 1.1, the bound of
Proposition 3.4). L-3.3 DONE. P-3.4 still STATED. C-1.2, T-FINAL, T-NOT-HC and S-1.d still
PROVED_MODULO, resting on Theorem 1.1 alone. Nothing that is DONE now changes. If you add
no rows: 189 entries, DONE 59, PROVED_MODULO 4, STATED 2, DEFINED 21, MATHLIB 2,
NOT_STATED 101. If you add rows, give the counts before and after and account for the
difference. If the audit shows anything else, find out why before going on.
* Check that no signed-off statement changed, by the pp.all comparison of the M4
second-slice session entry, with its three lists (the M3 list; that list with
Hadwiger.exists_holeData_hole; and the list that adds everything signed off on 2026-10-08
and the held items). Take the baseline at main before any change; the three outputs
should have the sha256 hashes recorded in that entry. The list files are under the
ignored .lake/audit/ and exist only on the machine that made them: if they are missing,
rebuild them from the items named in the session log. Tell me if any held item changed
(fingerprintLength, exceptionSize, sampleBound and the two statements of Proposition 3.4).
Run the reverse check: every declaration in the Lean sources is named in the blueprint.
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
* Signed off on 2026-10-08: sheet items R-21 to R-31. Held: R-32 and R-33.
* Lemma 3.2 is proved (2026-10-08). Its statements keep "compact" and "q has total mass
one", which its proofs do not need; that is recorded and is not to be reopened.
* The project is independent of upstream's Lean for this paper, also after upstream's
publication of 2026-10-08 ("Carry on independently").
* General lemmas stay in Hadwiger/Sanity/ and are imported where needed; nothing is moved.
* Helper lemmas and sanity checks get blueprint rows and no fidelity notes. New
definitions and new target statements get fidelity notes. The steps of a proof of the
paper are rows named after the result (S-L3.2.*), in the section on steps of proofs.
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
this slice is the fourth slice of M4, the fingerprint procedure. It belongs to the proof
of Proposition 3.4 and may not start before I sign off R-32 and R-33. Do not start it.
```
