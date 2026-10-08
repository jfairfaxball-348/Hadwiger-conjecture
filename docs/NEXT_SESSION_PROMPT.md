# Prompt for the next session

Written at the close of the session of 2026-10-08 (M4, first slice), under the rule
"Prompt for the next session" in `AGENTS.md`. **It is a draft for the user.** The prompt
the user actually sends is the instruction; this file has no authority of its own.

What this file could not know when it was written:

- the hash of its own commit. Its parent is `80c603e`. At the next start gate `HEAD` of
  `main` should be the last commit that touched this file; check with
  `git log -1 --format=%h -- docs/NEXT_SESSION_PROMPT.md` against `git rev-parse --short HEAD`.
  Any commit in between is something to explain before going on;
- whether, and when, the commit containing it was merged into `main`, and the CI runs on
  it. Those belong under "A RECORD TO WRITE FIRST" and are marked there.

The complete version, with the actual hash and that record, was given to the user in the
closing message of the session.

Still open with the user, and carried forward as open: sheet items **R-32 and R-33** (the
explicit bound and Proposition 3.4) are held, not signed off; and whether to build
upstream's code and audit its axioms (the worker recommended deciding it at the gate
before M6).

---

```text
Continue the Lean formalisation in this repository. AGENTS.md is binding; read it first.

START GATE
1. Pin HEAD. You should be on main, and main should equal origin/main. Expected: [the
commit that last touched docs/NEXT_SESSION_PROMPT.md; its parent is 80c603e] (M4 first
slice merged with its follow-ups, 2026-10-08, and the next-session-prompt rule added to
AGENTS.md). If main does not equal origin/main, or HEAD is something else, stop and tell
me before doing anything else.
2. Read START_HERE.md, AGENTS.md, blueprint/BLUEPRINT.md, blueprint/SORRY_AXIOM_LEDGER.md,
blueprint/MILESTONES.md (the single next task, and the state of M4 after its first slice),
blueprint/FIDELITY.md (in particular the notes F-LAW, F-KL and L-3.2), blueprint/PAPER_ISSUES.md
(in particular PI-008), blueprint/M4_REVIEW_SHEET.md (items R-22, R-28 and R-30, and
questions Q1, Q4 and Q6 with my decisions) and the last session entry of
docs/SESSION_LOG.md (the M4 first-slice session, with its addenda).
3. Run lake build, python scripts/check_ledger.py and python scripts/axiom_audit.py.
Expected: 6 sorry, 181 blueprint entries, 179 declarations audited. If any of them
fails, repair that first and do nothing else.
4. Upstream check (AGENTS.md, "Independence from the upstream Lean code"). Look only at
the commit list of openai/math and the file listing of the paper's folder, and compare
with docs/PROVENANCE.md (paper pinned at adc7f12; upstream main last seen at fd4aeeb, with
its Lean for this paper already recorded there). Do not open any Lean file there. If
upstream has commits after fd4aeeb, or the paper's folder has changed, stop and tell me
before doing anything else. If not, record in the session log that you looked and what
you saw.

A RECORD TO WRITE FIRST
[To be completed from the closing message of the previous session: the merge into main of
the commit that added the next-session-prompt rule, the result of git ls-remote, and the
CI runs. Put it at the head of your own session entry, verbatim.]

TASK: milestone M4, second slice: prove Lemma 3.2, as described in blueprint/MILESTONES.md.
* Create a working branch m4-lemma-3-2 from main.
* Before proving, re-read in the local TeX paper/build/sections/03-distributions.tex lines
21 to 69: the definition of relative entropy, Lemma 3.2 and its proof.
* Remove these three sorries with real proofs, without changing any statement:
* L-3.2, first assertion    Hadwiger.relEntropy_minimizer_pos
* L-3.2, second assertion   Hadwiger.relEntropy_le_sub_of_minimizer
* L-3.2, third assertion    Hadwiger.neg_log_mass_le_relEntropy_of_minimizer
* Follow the paper's proof: for the support assertion, the right derivative at zero of the
entropy along (1-t) rho + t rho'; for the second, the first-order condition at the
minimiser and the exact identity D(rho'||q) - D(rho||q) = D(rho'||rho) + sum (rho' - rho)
log(rho/q); for the third, comparison with the normalised restriction rho(.|S), and the
nonnegativity of relative entropy from log t <= t - 1. If a step of it does not go through
as written, that is a paper issue: record it exactly in blueprint/PAPER_ISSUES.md and tell
me. Do not patch it silently. A departure from the paper's argument is made only where a
step fails or Mathlib makes it far more expensive, and each one is recorded with its
reason.
* Junk values. Real.log 0 = 0 and x / 0 = 0. relEntropy rho' rho has a second argument
that may vanish (PI-008): every use of it must be shown honest by a proof, from the first
assertion, and not by a default. The same for Real.log (mass rho S).
* Hypotheses (my decision on Q6: kept as printed). Do not remove "compact" or "q has total
mass one" from the statements. Record whether each proof uses them.
* Helper lemmas (for example nonnegativity of relative entropy, the exact identity, facts
about the derivative) get blueprint rows of kind support in the section "Steps of the
paper's proofs, proved as separate lemmas", and no fidelity notes. Give them IDs that
cannot be confused with the sanity rows S-M4.*, and tell me how many rows you added and
why. General lemmas about the definitions go in Hadwiger/Sanity/ and are imported.
* Do not touch Lemma 3.3, Proposition 3.4 or Theorem 1.1. Do not start the third slice.
* R-32 and R-33 of blueprint/M4_REVIEW_SHEET.md (the explicit bound and Proposition 3.4)
are held, not signed off. Do not prove the bound, and do not change it or the statements
of Proposition 3.4. [Edit this line if you sign them off before the session.]
* If a statement turns out to be false or unprovable as stated, that is a result. Stop,
record exactly what failed in docs/SESSION_LOG.md, and tell me. Do not weaken or adjust
the statement without my say-so.
* Expected end state, to check against the audit: 3 sorry (Theorem 1.1, Lemma 3.3, the
bound of Proposition 3.4). L-3.2 DONE. L-3.3 and P-3.4 still STATED. C-1.2, T-FINAL,
T-NOT-HC and S-1.d still PROVED_MODULO, resting on Theorem 1.1 alone. Nothing that is DONE
now changes. If you add no rows: 181 entries, DONE 50, PROVED_MODULO 4, STATED 3, DEFINED
21, MATHLIB 2, NOT_STATED 101. If you add rows, give the counts before and after and
account for the difference. If the audit shows anything else, find out why before going
on.
* Check that no signed-off statement changed, by the pp.all comparison of the M3 and M4
session entries: the M3 list, Hadwiger.exists_holeData_hole, and now also everything
signed off on 2026-10-08 (the definitions of items R-21 to R-29, with their bodies, and
the four statements of R-30 and R-31). Take the baseline at main before any change. Include
the held items (fingerprintLength, exceptionSize, sampleBound and the two statements of
Proposition 3.4) and tell me if any of them changed. Run the reverse check: every
declaration in the Lean sources is named in the blueprint.
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
* The project is independent of upstream's Lean for this paper, also after upstream's
publication of 2026-10-08 ("Carry on independently").
* General lemmas stay in Hadwiger/Sanity/ and are imported where needed; nothing is moved.
* Helper lemmas and sanity checks get blueprint rows and no fidelity notes. New
definitions and new target statements get fidelity notes.
* Signed fidelity notes are not rewritten. Add a line "Status update after the sign-off".
* blueprint/M0_REVIEW_SHEET.md is not edited. The signed items of
blueprint/M4_REVIEW_SHEET.md are not rewritten either.
* The paper's equation eq:sample-independence is (2.2). The blueprint ID S-2.3 is kept as
an identifier.

WORKING RULES
* Work inline; at most two subagents at a time, only for independent, well-scoped tasks.
* Commit early and often on the working branch. Push it without asking (standing rule in
AGENTS.md). Run pushes with GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0; if a push fails
because it would need a sign-in, stop and tell me instead of opening a window. After
each push, check git ls-remote against HEAD.
* Ask me before merging into main.
* Do not ask me things one at a time. Carry on with everything that does not depend on my
answer, and put all open questions, including the merge, in one prompt at the end.
* Do not consult the upstream openai/math Lean code for this paper.
* End with the checkpoint report that AGENTS.md asks for, the single next task, and the
prompt for the next session (AGENTS.md, "Prompt for the next session"). The task after
this slice is the third slice of M4, Lemma 3.3. Do not start it.
```
