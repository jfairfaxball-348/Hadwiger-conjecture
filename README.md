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

RL11 is **CLOSED/FROZEN** under [sessions/RL11/](sessions/RL11/START_HERE.md).
Its [analytic countermodel](authoritative/RL11_MK2_COUNTERMODEL_REPORT.md)
refutes MK2 on exact D_cyc: an eighteen-vertex deletion-minimal graph has
an independent triple and no Q5, while retaining UP_6 and a rooted K6.
This is no ordinary Hadwiger counterexample. No inherited theorem is
demoted; general UP_6, CR_6 and full sharp Hadwiger remain unresolved here.
The unique incoming **RL12** performs user-requested new-route discovery
under its [sole brief](authoritative/RL12_NEW_ROUTE_DISCOVERY_BRIEF.md).
No route is preselected and RL12 is not started. All prior results,
source limits and lessons survive; every tenth session follows the
[audit policy](docs/TENTH_SESSION_PROGRESS_AUDIT.md). Programme active.

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
