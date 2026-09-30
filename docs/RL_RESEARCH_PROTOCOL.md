# RL research protocol

`AGENTS.md` is the binding contract. This document expands the research phase.

## Conveyor

`authoritative/` → one incoming RL → verified freeze in `sessions/RL<N>/` + successor `authoritative/`

Frozen sessions and `Archive/` are provenance. Conversation history and scratch work are non-authoritative.

## Working area

Shell workers use `.rl-work/RL<incoming>/`. Connector workers keep equivalent compact sandbox state.

Useful checkpoint material includes:

- `BASE_HEAD` and authoritative snapshot/tree identity;
- incoming RL and current session brief;
- exact files needed by the live line of attack;
- last fully verified mathematical checkpoint;
- new results with classifications and exact scope;
- failed routes, counterexamples, and barriers;
- incomplete computations marked **NOT PROMOTED**;
- artifacts/hashes when useful;
- exact next intended operation;
- things explicitly not to recompute;
- whether stop-and-repair is active;
- active failure/lesson IDs, recovery mode, changed premise or mechanism, bounded next task, and retry conditions.

## Bounded continuation work units

Kickoff and each bare `continue` should execute one coherent bounded research work unit.

Prefer a meaningful endpoint: a proved lemma, useful exact certificate, decisive counterexample, repaired claim, clear barrier, new invariant, or another result that materially changes the live research state.

Do not stop at trivial micro-steps merely to create a checkpoint. Conversely, once substantial useful work is durable and the next meaningful endpoint requires another expensive branch or long tool chain, checkpoint the exact frontier and return control.

The next `continue` should resume from that frontier without reconstructing completed work.

## Exact computation

Use computation aggressively but reproducibly.

For any claim promoted as exact finite work:

- state the complete claimed domain/range;
- ensure coverage is gap-free;
- retain deterministic inputs and method;
- provide a verifier or independently checkable witness when practical;
- preserve precise missing ranges when a run is partial;
- never promote a partial computation as complete.

## Route discipline

Preserve failed approaches and barriers in the portable failure/lesson ledger. Do not repeatedly restart a recorded dead route unless new information actually changes the obstruction or the user explicitly asks to revisit it. An explicit revisit permits reassessment, not use of a false or unproved dependency.

A blocked route triggers diagnosis and one bounded repair, rework, or pivot assessment, as specified in [RESEARCH_RECOVERY_PROTOCOL.md](RESEARCH_RECOVERY_PROTOCOL.md). Investigating a new candidate premise is permitted before it is proved; consuming it as a sufficient theorem is not. Prefer a concrete changed mathematical mechanism and falsification test over another roadmap or an unchanged source search.

Stopping a failed candidate and finishing an RL are local control decisions. Preserve a next recovery task so the programme can continue from the failure rather than repeatedly rediscovering it.

This repository begins without a roadmap. Do not create a global roadmap as a side effect of ordinary research unless the user explicitly requests one.

## Closeout reserve

Do not spend all available context/tool capacity on one more speculative branch. Preserve enough capacity to classify results, write a portable handover, verify it, construct the atomic transition, advance the remote ref, and read it back.

When the closeout trigger occurs, stop research and follow `docs/CLOSEOUT_LOCK.md`.
