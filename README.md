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

RL2 is **CLOSED/FROZEN** under [`sessions/RL2/`](sessions/RL2/START_HERE.md). Its literature corpus and pinned Collatz failure review are carried into `authoritative/`. The unique incoming **RL3** sets a top-down roadmap for the full sharp conjecture; no proof strategy has yet been selected and no project-originated theorem or certificate has been established.

## Interactive convention

Typical session control is:

- kickoff: `@GitHub continue with the next authoritative session`;
- continuation: `continue`;
- closeout: `finish up`.

Each research turn should form a coherent bounded work unit. A completed RL is frozen and handed over atomically before the successor becomes authoritative.

## Research provenance

This project may use AI-assisted mathematical exploration, drafting, computation, verification, and research-state management. Claims are classified by their actual proof/verification status, not by who or what generated them.

This repository is a research record, not a claim that the Hadwiger Conjecture has been proved.
