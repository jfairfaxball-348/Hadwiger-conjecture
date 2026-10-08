# AGENTS.md — rules for this repository

Rewritten on 2026-10-08 on the user's instruction (quoted below). The earlier, much longer
rules are in git history (`git show 4c48aad:AGENTS.md`).

## What this repository is for

The root is unchanged since the programme amendment of 2026-10-07 (`START_HERE.md`):

> Formalise in Lean 4, with Mathlib, the paper "A counterexample to Hadwiger's
> conjecture" (OpenAI, 23 September 2026), ending in a `DONE` Lean theorem stating that
> there are finite simple graphs of arbitrarily large order whose chromatic number
> exceeds their Hadwiger number.

The route changed on 2026-10-08. The user's instruction, verbatim:

> Yes, revamp the whole repo and process based on your suggestions here. I just want the
> best, and quickest route to a full green lake lean build run that I can then commit and
> register on the palomar register. There is a serious time sensitive nature to this so I
> dont actually care at all about book keeping or sign off etc. I just want to leave the
> work to you and you tell me when we are done.

and the user's three answers the same day: route, "Build on OpenAI's proof"; deadline,
"Within a few days"; licence, "Apache-2.0".

So, in order:

1. **A build with no `sorry`, in which the final theorem is `DONE`.** The proof of Theorem
   1.1 comes from the formalisation published by the paper's authors, `openai/math`, copied
   under `OAI/`. The rule that this project is independent of that code is withdrawn.
2. **A snapshot that meets the Palomar registry's submission standard**, which the user
   submits. The requirements are summarised under "Palomar" below.

The worker runs the work without sign-offs, and tells the user when a goal is reached and
when something is needed that only the user can do.

## What does not change

These are not bookkeeping, and the instruction above does not waive them.

- **What counts as proved.** A statement is `DONE` only when it compiles with no `sorry`
  anywhere beneath it and `#print axioms` shows only `propext`, `Classical.choice` and
  `Quot.sound`. `python scripts/check_ledger.py` and `python scripts/axiom_audit.py` check
  this against `blueprint/SORRY_AXIOM_LEDGER.md` and `blueprint/BLUEPRINT.md`; CI runs them.
  Nothing else is called proved.
- **No `axiom`, no `native_decide`,** no `unsafe`, `implemented_by`, `extern` or `opaque`
  used to avoid a proof, no hypothesis added to make a statement vacuous.
- **The final statements are not changed quietly.** They are
  `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` (Theorem 1.1),
  `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` (Corollary 1.2),
  `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber` (the final theorem),
  `Hadwiger.not_hadwigerConjecture` and `Hadwiger.not_fractionalHadwigerConjecture`, with
  the definitions they use. If one has to change, tell the user what changed and why.
- **Honest provenance.** What upstream proved is upstream's. `OAI/` holds upstream's files;
  `NOTICE` says where they come from; `docs/UPSTREAM_CHANGES.md` lists every change made to
  them. No README, metadata file or message describes upstream's proof as this project's.
- **A gap or an error** found in the paper or in upstream's code is reported to the user. It
  is never closed with an axiom or a changed statement.
- **Only the user submits to Palomar.** The registry asks the submitter whether they are a
  responsible author or maintainer of the substantive formalisation or have approval from
  one, and calls a false answer a material misrepresentation. The substantive formalisation
  of Theorem 1.1 is `openai/math`. The worker prepares the snapshot and the metadata; it
  does not submit, does not answer that question, and does not write metadata that would
  answer it falsely.
- Frozen history (`frozen-hc7-programme/`, `sessions/`, `Archive/`, `knowledge/`) is not
  edited, and the branch `rl70-frontier-push` is not merged. `main` is never force-pushed.
  The paper's PDF and TeX are not stored in the repository.

## What was dropped on 2026-10-08

Sign-offs and review sheets; fidelity notes for new definitions; the per-session log entry;
the prompt for the next session; closing commits; the `pp.all` comparison; the slice plan of
milestone M4 and the milestones M5 to M17; independence from upstream's Lean code.

The files of that process stay in the repository as history and are no longer maintained:
`blueprint/FIDELITY.md`, the two review sheets, `blueprint/PAPER_ISSUES.md`,
`blueprint/MILESTONES.md`, `docs/SESSION_LOG.md`, `docs/NEXT_SESSION_PROMPT.md`. Where they
disagree with `START_HERE.md`, the blueprint or the build, they are out of date.

## Working method

- **State lives in two places.** `START_HERE.md` says where things stand and what is next,
  on one page. `blueprint/BLUEPRINT.md` has the status of each statement, because the audit
  script reads it. Keep both true; nothing else needs updating.
- **Before a commit:** `lake build`, `python scripts/check_ledger.py` and
  `python scripts/axiom_audit.py` pass.
- **Branches and `main`.** Work on a branch and push it without asking. Fast-forward `main`
  to it when the three commands pass and CI has passed on the commit. Never force-push.
- **Pins.** The Lean toolchain and the Mathlib commit may be changed when the registry's
  standard requires it. The commit message gives the old and the new pin.
- **Upstream's files.** Change them only as far as a port needs (module system, a newer
  Lean and Mathlib). Do not change a statement of theirs. Record every changed file in
  `docs/UPSTREAM_CHANGES.md`.
- Work inline; at most two subagents at a time, for independent, well-scoped tasks.
- Pushes run with `GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0`; a push that would need a
  sign-in is reported, not retried through a window.
- **At the end of a session** tell the user: what is done, what is next, and what only the
  user can do.

## Palomar

The submission standard is
<https://github.com/PalomarRegistry/PalomarPolicy/blob/main/CONTRIBUTING.md>; read it again
before the snapshot is called ready, because it changes. As read on 2026-10-08:

- a public GitHub repository at one commit; root files `lean-toolchain`, a Lakefile,
  `lake-manifest.json`, `formalization.yaml`, `Challenge.lean`, `Solution.lean`,
  `comparator.json` and exactly one licence file; checkout at most 500 MiB;
- **every `.lean` file in the repository uses Lean's module system** and has at most 10,000
  lines. A module cannot import a non-module, so upstream's files have to be ported too;
- the toolchain is a Lean release no older than the minimum in `toolchains.json` of
  `PalomarRegistry/PalomarSubmission` (`v4.35.0-rc2` on 2026-10-08), and it must be exactly
  the toolchain of the pinned Mathlib commit;
- `Challenge.lean` imports Mathlib only, states the results with deliberate `sorry`, and is
  short (300 lines preferred, 1,000 the limit); `Solution.lean` has declarations of the
  same names and types; `comparator.json` names them and permits only the three axioms;
- `formalization.yaml` (format v0.4): human authors and responsible maintainers, licence,
  arXiv and MSC classification, automation methods, review status, `sources` with their
  relationship, `related_formalizations`, and an informal account that says what is
  original, what is adapted, what the limitations are, and how AI was used;
- a purported solution of a famous open problem needs a careful comparison with the
  standard conjecture, a literature account and an honest statement of any gap; "lightly
  repackaged work without useful provenance" is not indexed.
