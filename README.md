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

RL5 is **CLOSED/FROZEN** under [`sessions/RL5/`](sessions/RL5/START_HERE.md). Its one bounded CR6 source/new-input gate is blocked/inconclusive, with a checked source update at its exact scope. The RL3 roadmap, scoped proofs/barriers/certificate, RL4 deductions, unchanged RL2 corpus and Collatz review remain carried into `authoritative/`. By explicit process amendment, the unique incoming **RL6** is ready for a bounded repair, rework, or pivot assessment under its [sole recovery brief](authoritative/RL6_ROUTE_RECOVERY_AND_PIVOT_BRIEF.md). No new input is accepted as proved. Universal CR6 and the full sharp bridge remain unresolved by this project.

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
