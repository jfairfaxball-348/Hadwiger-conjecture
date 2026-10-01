# Hadwiger Conjecture Research Repository

This repository is an ongoing, exploratory research record for work on the **Hadwiger Conjecture**.

It is organised as a sequence of numbered research sessions ("RL" sessions) carried by the repository rather than by conversation history. The repository distinguishes proved mathematics, exact certificates, computational evidence, conjectures, barriers, corrections, and open obligations; material is not treated as established merely because it appears in a research note.

For the current incoming research state, begin at [`START_HERE.md`](START_HERE.md). The binding worker rules are in [`AGENTS.md`](AGENTS.md).

## Core repository model

`authoritative/` → one incoming RL session → verified freeze in `sessions/RL.../` + successor `authoritative/`

- `authoritative/` is the sole current incoming mathematical state.
- `sessions/` is frozen research history.
- `Archive/` is cold historical material.
- `knowledge/` is non-authoritative lookup/index material only.
- `.rl-work/` is ignored local scratch/checkpoint state.

RL9 is **CLOSED/FROZEN** under [sessions/RL9/](sessions/RL9/START_HERE.md).
It proves EX5 and UP_6 on the explicit D_cyc plus GLOBAL alpha<=2 slice,
using extension of each specified complement edge. General UP_6, CR_6 and
full sharp Hadwiger remain unresolved by this project. All prior results,
failure lessons and source limits are retained. The unique incoming **RL10**
performs a progress/correction audit of the preceding session window under its
[sole brief](authoritative/RL10_PROGRESS_AND_CORRECTION_AUDIT_BRIEF.md).
Every tenth session will audit progress and corrections under the
[recurring policy](docs/TENTH_SESSION_PROGRESS_AUDIT.md). MK2 is deferred.
No RL10 audit has begun. The programme remains active.

## Continuing through failures

A failed route triggers diagnosis and a bounded recovery task; it does not terminate this long programme. The [recovery protocol](docs/RESEARCH_RECOVERY_PROTOCOL.md) separates candidate exploration from proof admission. The portable [failure and lesson ledger](authoritative/FAILURE_AND_LESSON_LEDGER.md) preserves mistakes, barriers, surviving valid results, and retry conditions across sessions. Frozen history and mathematical integrity remain binding.

## Interactive convention

Typical session control is:

- kickoff: `@GitHub continue with the next authoritative session`;
- continuation: `continue`;
- closeout: `finish up`.

Each research turn should form a coherent bounded work unit. A completed RL is frozen and handed over atomically before the successor becomes authoritative.

## Research provenance

This project may use AI-assisted mathematical exploration, drafting, computation, verification, and research-state management. Claims are classified by their actual proof/verification status, not by who or what generated them.

The project accepts either a complete proof of h(G)>=chi(G) for every finite simple graph or a rigorously verified finite counterexample with h(G)<chi(G). Counterexamples to candidate bridges or stronger variants are recorded at their exact scopes. The current state establishes neither a full proof nor an ordinary-Hadwiger counterexample.
