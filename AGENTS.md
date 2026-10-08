# AGENTS.md — binding rules for the formalisation project

## Purpose and authority

This repository formalises one paper in Lean 4. The repository, not conversation history
or model memory, carries the project state.

Authority order:

1. direct user instruction;
2. this file;
3. `blueprint/BLUEPRINT.md`, `blueprint/SORRY_AXIOM_LEDGER.md`, `blueprint/PAPER_ISSUES.md`;
4. the Lean sources as they build at HEAD;
5. the other files under `blueprint/` and `docs/`;
6. frozen history (`frozen-hc7-programme/`, `sessions/`, `Archive/`, `knowledge/`), as
   history only;
7. conversation or model memory, never.

Where the blueprint and the build disagree, the build is the fact and the blueprint is a
defect to repair before anything else.

## Programme root

By explicit user-authorised programme amendment dated 2026-10-07 (quoted in full in
`START_HERE.md`), the sole root is:

> Formalise in Lean 4, with Mathlib, the paper "A counterexample to Hadwiger's
> conjecture" (OpenAI, 23 September 2026), ending in a `DONE` Lean theorem stating that
> there are finite simple graphs of arbitrarily large order whose chromatic number
> exceeds their Hadwiger number.

The paper is pinned by URL, upstream commit and sha256 in `docs/PROVENANCE.md`. That
pinned version is the object being formalised.

The former root, HC7 (every finite simple graph with chromatic number 7 has a K7 minor),
is **retired, not solved**. Nothing in this project bears on it.

Do not change the root, or the pinned version of the paper, without explicit user
authorisation.

## Integrity rules

These are the rules of the old programme, restated for Lean. They are not negotiable.

### What counts as proved

- A statement is `DONE` only when it compiles with no `sorry` anywhere beneath it **and**
  `#print axioms` on it shows only `propext`, `Classical.choice` and `Quot.sound`.
- Nothing else is called proved, established, verified or done. `STATED` means only that
  a statement type-checks. `PROVED_MODULO` means a dependency is still open.
- Evidence and sketches are never reported as proof. An informal argument, a proof
  outline, a partially filled proof, a passing example, a `decide` on small cases, a
  plausibility check, or "the paper says so" is reported as exactly that.
- Never promote a special case to the general statement, a statement about one
  definition to a statement about another, or `PROVED_MODULO` to `DONE`.

### The ledger

- Every `sorry`, `admit`, `axiom` and `native_decide` in the Lean sources is listed in
  `blueprint/SORRY_AXIOM_LEDGER.md`. `scripts/check_ledger.py` enforces this.
- An `axiom` or a `native_decide` may be introduced only with the user's explicit
  approval. A declaration that depends on one is never `DONE`.
- Do not hide an obligation: no `unsafe`, `implemented_by`, `extern` or `opaque` used to
  avoid a proof, no hypothesis added to a statement to make it vacuous, no weakening a
  statement so that it becomes provable.

### The paper

- A gap or an error found in the paper is a **result**. Record it exactly in
  `blueprint/PAPER_ISSUES.md` — where it is, what is claimed, what fails or is missing,
  what was tried — and report it to the user.
- Never patch a gap or an error with an axiom, with an unexplained extra hypothesis, or
  with a silently changed statement.
- If the paper is merely unclear, record that too, with the reading adopted and why.

### Statements and definitions

- A Lean statement must say what the paper's statement says. Every definition has a
  fidelity note in `blueprint/FIDELITY.md` arguing that it matches the paper's.
- Never silently strengthen, weaken, repair, generalise or reinterpret a recorded
  statement or definition. Any difference from the paper — including an equivalent
  reformulation such as clearing a denominator, and including a harmless generalisation —
  is written down in the fidelity note or the declaration's doc comment.
- A change that alters mathematical content, rather than form, needs the user's approval.
- Watch for junk values. `sSup`, `sInf`, `Set.ncard`, `ENat.toNat`, natural subtraction
  and division all return a default when the honest answer does not exist. A theorem that
  is true only because of such a default is not the paper's theorem. This is the standard
  way a formalisation is correct and proves the wrong thing.
- A statement in this repository found to be false, or unprovable as stated, is a result:
  record it in `docs/SESSION_LOG.md`, report it, and correct it by an explicit recorded
  change. Do not quietly edit it.

### Failed attempts

A failed proof attempt, an abandoned approach, or a Mathlib gap that blocked progress is
recorded in `docs/SESSION_LOG.md` with the obstruction. Do not repeat a failed attempt
without a named change. A blocked entry does not end the project: record the block and the
next bounded task.

## Independence from the upstream Lean code

`openai/math` contains a partial Lean formalisation of this paper (see
`docs/PROVENANCE.md`). By the user's decision of 2026-10-07 this project is independent
of it:

- Do not copy upstream's Lean definitions or proofs for this paper into this repository.
- Do not consult upstream's proofs for this paper while proving here.
- Comparing a finished statement here with upstream's statement is allowed. Record the
  comparison in `docs/PROVENANCE.md`.
- If upstream later publishes more of this paper in Lean, tell the user before doing
  anything about it.

## Working method

### Start gate

Before any work:

- pin HEAD and the branch;
- read `START_HERE.md`, the blueprint, the ledger and `blueprint/MILESTONES.md`;
- run `lake build`, `python scripts/check_ledger.py` and `python scripts/axiom_audit.py`.

If the build or either check fails at HEAD, repair that first and do nothing else. Do not
edit the blueprint or the ledger merely to make a check pass; find out which side is
wrong.

### Unit of work

- Work on one blueprint entry or one milestone slice at a time, the one named as the next
  task in `blueprint/MILESTONES.md` unless the user says otherwise.
- A Lean change and the blueprint and ledger changes it implies go in the same commit.
- Before a commit: `lake build` and both checks pass.
- Commit early and often, on a working branch. Save notes in `docs/SESSION_LOG.md` as you
  go, not at the end.
- Working branches may be pushed to `origin` without asking. This is the user's standing
  permission of 2026-10-07, quoted in `docs/SESSION_LOG.md`; before that date every push
  needed asking. It covers ordinary pushes of working branches only: never force-push, and
  never push `main` except to publish a merge made under the next rule.
- **Merging into `main`: without asking, when the merge makes sense.** Until 2026-10-08
  every merge needed the user's approval, one merge at a time. On 2026-10-08, asked whether
  to merge a finished slice, the user answered: "Always merge if it makes sense, you dont
  need to asl". The question and the answer are quoted in `docs/SESSION_LOG.md` (M4
  second-slice session, "The user's answer"). That is a standing permission. What "makes
  sense" means is not spelled out in the user's words; the conditions below are the
  worker's reading of them, written narrowly, and the user may widen or narrow them. A
  worker may fast-forward `main` to a working branch without asking when **all** of these
  hold:
  - the branch carries the task the user set for the session, or a follow-up of it, and
    the work is complete as a unit: the records describe nothing as done that is not;
  - `lake build` and both checks pass on the commit to be merged, CI has passed on that
    commit, and the three commands pass on `main` before `main` is pushed;
  - it is a fast-forward. `main` is never force-pushed;
  - the audit shows the end state the instruction expected, or the session log accounts for
    every difference;
  - no signed-off definition or statement has changed;
  - nothing in the branch waits on a decision that is the user's. In particular the branch
    does not contain, undecided: a statement found false or unprovable; a paper issue of
    kind `ERROR` or `GAP` found in the session; an `axiom` or a `native_decide`; a change of
    mathematical content; a change of the root, of the pinned paper, of the toolchain or of
    the Mathlib commit;
  - a change to these rules is merged without asking only when it writes down an
    instruction the user gave, with the user's words quoted. Any other change to the rules
    is asked first.
  If one of these fails, or the worker is in doubt, ask the user, once, as before. Every
  merge is reported in the session's final message with its hashes and recorded in the
  log. **The permission is about merging and nothing else.** It signs nothing off: a new
  definition or statement may reach `main` marked unreviewed, and it stays unreviewed until
  the user reviews it; held items stay held. It does not cover the branch
  `rl70-frontier-push`, which is never merged.
- The **closing commit**. This is the user's standing permission of
  2026-10-08, quoted in `docs/SESSION_LOG.md` (M4 first-slice session, third addendum).
  After a merge has been carried out, whether the user approved it by name or it was made
  under the rule above, a single further commit may be fast-forwarded into `main` without
  asking again, on these conditions and no others:
  - it changes only `docs/SESSION_LOG.md` and `docs/NEXT_SESSION_PROMPT.md`;
  - in the log it records that merge and nothing new: the hashes, the result of the three
    commands on `main`, the result of `git ls-remote`, the CI runs, and the user's answers
    that authorised the merge, if they are not in the log yet;
  - it brings the prompt for the next session to its final form;
  - CI has passed on it, and the three commands pass on `main` with it, before `main` is
    pushed;
  - there is one closing commit for each merge, or one for the last of several merges made
    in a row, if the log already records the earlier ones. It never carries a Lean file, a
    blueprint table, a ledger row, a fidelity note, a review sheet, a status remark or a
    change to these rules. Anything of that kind is a merge of its own, under the rule
    above.
  The closing commit cannot record its own arrival in `main`. The log says so in it: if
  `main` contains the closing commit, it was fast-forwarded there under this rule.
- After a push, check `git ls-remote --heads origin <branch>` against `git rev-parse HEAD`.
  The push summary can name an older commit (see `docs/SESSION_LOG.md`, 2026-10-07).

### Limits

- Work inline. Use at most two subagents at a time, and only for independent, well-scoped
  tasks. (Fanning out nine exhausted the user's usage limit twice.)
- `elan`, Lean 4 and the Mathlib build cache may be installed or downloaded. Ask before
  installing anything else.
- The Lean toolchain and the Mathlib commit are pinned. Changing either is a deliberate
  step in its own commit, with the reason recorded.
- Do not store the paper's PDF or TeX source in the repository (see
  `docs/PROVENANCE.md`); a local copy under the ignored `paper/` folder is fine.

### Checkpoint report

At the end of a session, or when asked, report: which blueprint entries changed and to
what status; the open `sorry` count and any axioms; every paper issue found; anything
attempted that failed; every merge into `main` made in the session, with its hashes and
whether it was asked for or made under the standing permission; and the single next task.

### Prompt for the next session

Every session closes with a ready-to-paste prompt for the next one. This is the user's
instruction of 2026-10-08, quoted in `docs/SESSION_LOG.md` (M4 first-slice session, second
addendum).

- **Where.** In the session's final message, in one fenced block, written after everything
  else is done, so after any merge, with the actual hashes, counts and CI run numbers. And
  in `docs/NEXT_SESSION_PROMPT.md`, replacing the previous version, in the last commit of
  the session.
- **The two versions.** The one in the final message is the complete one. The file is
  brought to its final form in the closing commit (see "Unit of work"), after the merge it
  closes, so the two differ in one thing only: the file cannot contain the hash of its own
  commit. It names its parent commit and says that `HEAD` at the next start gate must be
  the last commit that touched the file. When a session ends without a merge,
  there is no closing commit: the file is then written in the last commit of the working
  branch, says that the branch is unmerged, and marks the lines that the user's later
  answers may change.
- **Form.** That of the user's own session prompts, which are quoted in
  `docs/SESSION_LOG.md` under "The instruction":
  - START GATE: the expected `HEAD` of `main`; what to read; the three commands with the
    expected counts; the upstream check, against what `docs/PROVENANCE.md` last recorded;
  - A RECORD TO WRITE FIRST: anything that happened after the last commit and is therefore
    missing from the log (a merge, CI runs, the user's answers), as text to copy verbatim.
    After a closing commit there is normally nothing, and the prompt says "none";
  - TASK: the single next task of `blueprint/MILESTONES.md`, and nothing beyond it: the
    branch name, what to re-read in the paper, the exact declarations, what not to touch,
    the expected end state to check against the audit, and the checks to run;
  - STANDING DECISIONS, carried over and brought up to date;
  - WORKING RULES, carried over.
- **Status.** The prompt is a draft for the user, who may change it. The prompt the user
  actually sends is the instruction, and it is copied into the session log as before. The
  file has no authority: where it disagrees with this file, the blueprint, the ledger or
  the build, the file is wrong.
- **What it must not do.** It must not decide for the user anything that is the user's:
  it carries open sign-offs and open questions forward as open, and names them.

## Frozen history

`frozen-hc7-programme/`, `sessions/`, `Archive/` and `knowledge/` are the record of the
HC7 programme. Do not edit, rewrite, renumber or delete anything in them. The branch
`rl70-frontier-push` holds abandoned, unpromoted RL70 work and is not to be merged.
The RL session numbering, the conveyor, the closeout lock and the tenth-session audit
belong to that programme and no longer apply.

## Portability

Everything a new worker needs must be in the repository: definitions, exact statements,
statuses, dependencies, paper issues, the plan and the next task. Phrases such as "as
discussed above" must never be load-bearing.

## Infrastructure changes

Changes to these rules, the scripts, CI, the toolchain pin or the repository layout are
made in their own commits, separate from Lean progress, with the reason stated. They never
change a status in the blueprint.
