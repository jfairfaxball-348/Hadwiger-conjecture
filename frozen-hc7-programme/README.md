# FROZEN — the HC7 research programme as it stood on 2026-10-07

**Nothing in this folder is current authority.** It is history, kept unaltered.

On 2026-10-07 the user retired the HC7 root by an explicit programme amendment and
re-rooted the repository on a Lean 4 formalisation project. The amendment, quoted in
full, is in the repository's root `START_HERE.md`.

## What HC7 was, and how it ended

HC7 was the statement: every finite simple graph G with chi(G) = 7 has a K7 minor.

**HC7 was retired, not solved.** It is neither proved nor refuted by anything in this
repository, and it is not settled by the paper the repository now formalises: that
paper's counterexamples to Hadwiger's conjecture are arbitrarily large graphs with
independence number at most 2, and it says nothing about graphs of chromatic number 7.

## What is in this folder

| Path | What it is |
|---|---|
| `authoritative/` | The complete incoming authoritative state for RL70, exactly as committed at main `0d17783` (RL69 closeout). It was the sole current mathematical state of the HC7 programme. |
| `docs/` | The conveyor process documents that governed RL sessions (research protocol, state machine, closeout lock, verification and closeout, recovery protocol, tenth-session audit, proof-state classifications, connector workflow). |
| `AGENTS.md` | The binding conveyor contract as it stood at main `0d17783`. |
| `START_HERE.md`, `README_ROOT.md`, `CONTRIBUTING.md` | The former root entry-point files. `README_ROOT.md` is the former root `README.md`. These two navigation files were already stale at the freeze: they still name RL52 as the incoming session. They are preserved as found. |

All files were moved with `git mv`; none was edited. Paths written inside them
(`authoritative/...`, `docs/...`) refer to the layout before the move.

## Where the rest of the HC7 history is

These were deliberately left where they were, and are equally frozen:

- `sessions/RL1/` … `sessions/RL69/` — the frozen numbered research sessions.
- `Archive/` — cold historical material.
- `knowledge/` — generated, non-authoritative lookup material.
- Remote branches named `work/rl*`, `rl*-closeout*`, `rl30-audit-work`, `claude/*` — per-session work checkpoints.

## RL70

RL70 was the incoming session at the freeze. It was started as an all-out frontier
push, then stopped without closeout. **No RL70 result was certified.** Its working
directory is preserved on the branch `rl70-frontier-push` (see `work/RL70/ABANDONED.md`
there). It is not merged, and nothing on it is authority.

## Status of the mathematics recorded here

The freeze changes no proof classification. Every result keeps exactly the scope and
status recorded in `authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md` and in the
frozen sessions. Every correction, demotion and failure-ledger entry
(`authoritative/FAILURE_AND_LESSON_LEDGER.md`, FL-001 to FL-070) stands as written.
At the freeze: U1–U8 certified, U9 conditional, C68/C69 open with no falsifier.

None of it is used by, or is a dependency of, the formalisation project.

## Rules for this folder

- Do not edit, rewrite, renumber or delete anything here, in `sessions/`, or in `Archive/`.
- Do not cite anything here as current project state.
- Reviving HC7 work requires a new explicit user-authorised programme amendment.
