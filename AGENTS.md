# AGENTS.md — binding RL research conveyor contract

## Purpose and authority

This repository, not conversation history or model memory, carries the mathematical research state.

The conveyor is:

`authoritative/` → one incoming RL session → verified freeze in `sessions/RL<N>/` + successor `authoritative/`

Authority order:

1. direct user instruction;
2. this file and any nested `AGENTS.md`;
3. current `authoritative/`;
4. current proof-state, correction/demotion, and verification records;
5. frozen `sessions/` and `Archive/`, only when needed;
6. generated/non-authoritative `knowledge/` material;
7. conversation or model memory.

`authoritative/` is the sole incoming mathematical state. Frozen sessions are history. Scratch work and conversation are never authority.

The initial scaffold contains no mathematical roadmap, no chosen attack, and no mathematical claim. Do not invent a global roadmap or long-horizon strategy unless the user explicitly asks for one in a later task. Research should be driven by the current authoritative session brief and direct user instruction.

## Mathematical integrity

Preserve the distinction between:

- proved analytic mathematics;
- exact finite certificate;
- externally inherited certificate;
- computational evidence;
- conjecture / candidate lemma;
- method barrier / dead route;
- repaired or demoted claim;
- open obligation.

Canonical definitions are in `docs/PROOF_STATE_CLASSIFICATIONS.md`.

Never promote evidence to theorem, incomplete coverage to exact certificate, a branch-local result to a global result, or a plausible argument to proof. Never silently strengthen, weaken, repair, demote, or reinterpret a recorded claim.

A contradiction, counterexample, failed verifier, or scope error is a result and must be preserved honestly.

## Programme continuity and recovery

This is a long research programme. A blocked work unit, failed candidate, or retired route does not terminate the programme. After recording a barrier, diagnose it and prepare one bounded repair, rework, or pivot assessment under `docs/RESEARCH_RECOVERY_PROTOCOL.md`.

Separate permission to investigate an input from permission to consume it as proved. Workers may formulate, test, and try to justify a new candidate input without requiring the user to supply an already proved theorem. Every candidate remains unpromoted until its exact proof/certificate and scope requirements are met. A stopped mechanism requires a recorded change addressing its particular obstruction before dependent work resumes.

Carry `authoritative/FAILURE_AND_LESSON_LEDGER.md` forward in every handover. Preserve the original error or failed expectation, evidence, first invalid or missing dependency, surviving valid scope, downstream effects, lesson, and conditions for revisiting it. Distinguish an actual mathematical error from a valid restricted result, inconclusive search, access defect, or process defect. Corrections append an explicit history; they never erase the original issue or rewrite frozen sessions.

Each blocked research checkpoint must identify the next concrete recovery task and its bounds. A work unit or RL may finish while the programme remains active. Do not repeat a failed attempt without a named change, manufacture progress, or replace the root by an easier variant. Integrity failures still freeze affected deductions; only repair or work independent of the failure may proceed after the applicable gate passes. User-directed pauses and `CLOSEOUT_LOCK` remain binding.

## Execution environments are peers

Shell workers and connector/cloud workers are both valid first-class workers.

A shell worker may use Git, local scripts, and ignored scratch files. A connector worker may use repository reads/writes, Git-object operations, and sandbox artifacts. Routine research or closeout must not require the user to migrate between environments.

Where a documented shell command cannot be run, perform the same underlying check with available tools and report the equivalent check actually performed.

## Start gate

Before mathematics:

- pin the live default-branch HEAD as `BASE_HEAD`;
- read `authoritative/START_HERE.md`;
- identify the unique incoming RL and the exact current session brief;
- read only the current authority files explicitly required for that session;
- record a compact identity/snapshot of the incoming `authoritative/` state sufficient to detect concurrent change;
- confirm there is no unresolved integrity failure in the current authority.

If the gate fails, enter stop-and-repair. Do not begin ordinary research and do not mutate authority merely to make the gate pass.

Connector workers should prefer exact current paths over recursive repository discovery. Historical sessions are cold provenance, not startup material.

## Interactive session convention

The ordinary command surface is:

1. **Kickoff** — usually `@GitHub continue with the next authoritative session`, optionally with a user-specified focus.
2. **Continue** — usually the bare message `continue`.
3. **Finish** — usually `finish up`.

Kickoff begins only the unique incoming authoritative RL.

On kickoff and each bare `continue`, execute one coherent **bounded continuation work unit**. Pursue one line far enough to produce meaningful information. Prefer a theorem-sized or otherwise material checkpoint, but do not let one turn grow indefinitely when a durable frontier has already been established and another expensive branch would materially enlarge the failure domain.

Do not manufacture checkpoints from trivial algebra, routine lookups, or tiny mechanical changes.

Before expensive computation or a long connector sequence, record exact inputs, intended output, bounds, completed work, and the next operation. After a material intermediate result, refresh the resume state before starting another expensive branch.

At each user-facing research checkpoint:

- state what progressed and its proof-state classification;
- state what remains open or unpromoted;
- state the exact durable resume frontier when relevant;
- autonomously judge whether the current session should continue or close;
- for a blocked or failed route, record its lesson and the next bounded repair, rework, or pivot task; closing the RL does not by itself end the programme;
- end that recommendation with exactly one of:
  - `it makes sense to continue here`
  - `it makes sense to finish up here`

A recommendation to finish does not itself close the RL. Wait for `finish up` unless another integrity rule requires immediate closeout.

## Scratch work and interruption

Scratch work is non-authoritative. Shell workers use:

`.rl-work/RL<incoming>/`

Connector workers may use equivalent sandbox artifacts.

Checkpoint material work. Mark incomplete computation **NOT PROMOTED** and record the exact uncovered range or unresolved dependency.

During research:

- do not create a partial research-state commit on the default branch;
- do not move current authority into `sessions/` early;
- do not replace `authoritative/` early;
- do not push partial mathematical state as authoritative;
- do not amend published RL history;
- do not mix unrelated cleanup or infrastructure work into a numbered RL transition.

If interrupted, the last remotely committed authority remains truth. Report the last verified checkpoint and the unpromoted remainder.

See `docs/RL_RESEARCH_PROTOCOL.md` and `docs/CONNECTOR_WORKFLOW.md`.

## Stop-and-repair

Stop on any integrity failure, contradiction in a load-bearing dependency, scope error, failed required verifier/red team, invalidated exact certificate, incomplete work used as complete, or unexplained `BASE_HEAD` mismatch.

Freeze the last unquestionably valid frontier and identify the first invalid dependency.

Mechanical defects and mathematical defects are different. A path, packaging, catalogue, transport, or tooling defect does not by itself change mathematical proof classification.

Stop dependent work, rather than declaring the entire programme exhausted. Record the failure and apply the recovery protocol from the last valid frontier. Never use a pivot to bypass an unresolved start gate or to consume an invalid dependency.

## CLOSEOUT_LOCK

Enter `CLOSEOUT_LOCK` immediately when the user asks to finish, close, hand over, commit/push, end, or promote the current RL, or when delay materially risks an incomplete closeout.

Once locked, stop mathematics, route exploration, scans, historical audits, and optional improvements. Only deterministic closeout and the minimum repair needed to complete it are permitted.

See `docs/CLOSEOUT_LOCK.md`.

## Promotion

A completed numbered RL is one atomic research-state transition:

1. freeze the completed incoming generation under `sessions/RL<N>/`;
2. create the verified successor handover;
3. replace `authoritative/` with only that successor incoming state;
4. inspect the complete intended final path set/tree;
5. create one numbered RL transition commit;
6. advance/push the intended remote ref once;
7. read back the remote ref, frozen session, and successor `authoritative/START_HERE.md`.

A local-only or partially written transition is not completion. The invariant is:

> The remote commit contains the complete verified numbered transition, or the numbered transition does not exist.

Never combine multiple RL transitions into one numbered commit.

See `docs/VERIFICATION_AND_CLOSEOUT.md`.

## Portability

Every promoted handover must be sufficient for a new worker with no conversation history. Carry all load-bearing definitions, exact scope, proof classifications, dependencies, corrections/demotions, verifier instructions, open obligations, and the successor session brief in repository files.

Do not make phrases such as “as discussed above” load-bearing.

## Infrastructure changes

Repository architecture, conveyor rules, indexing, helper tooling, CI, and verification infrastructure are not mathematical RL progress. Make such changes only when explicitly tasked, use a separate non-RL commit, and do not silently alter mathematical authority while doing so. An explicitly authorized process amendment may update the current operational brief and navigation in that commit if its authorization, exact changes, and unchanged mathematical scopes are recorded. It must preserve the incoming RL number, frozen history, certificates, and source classifications; it cannot promote research results or count as a numbered transition.
