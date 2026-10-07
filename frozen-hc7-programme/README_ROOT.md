# Hadwiger chi=7 Research Repository

This repository is an ongoing research record for the **chi=7 case of Hadwiger's conjecture (HC7)**.

Current programme root:

```
for every finite simple graph G with chi(G)=7,
h(G) >= 7
```

equivalently, every 7-chromatic finite simple graph contains a K7 minor. A legitimate negative result is a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.

The former full sharp Hadwiger conjecture is historical context only and is not the current required target.

## Current handover

RL51 is CLOSED/FROZEN under `sessions/RL51/`.

RL52 is the unique incoming numbered session, READY / NOT STARTED, with sole brief:

`authoritative/RL52_HC7_ROOT_COVERAGE_GATE_BRIEF.md`

The durable programme is:

`authoritative/HC7_RESEARCH_PROGRAMME.md`

The 2026-10-05 target pivot is recorded in:

`authoritative/HC7_PROGRAMME_TARGET_AMENDMENT.md`

The first RL52 task is a bounded root-coverage audit from a hypothetical minor-minimal HC7 counterexample to the local domains already studied. It must stop at the first unproved universal coverage arrow rather than continuing automatically into the retained m=3 route.

## Core repository model

`authoritative/` -> one incoming RL session -> verified freeze in `sessions/RL<N>/` + one successor `authoritative/`.

- `authoritative/` is the sole current incoming mathematical state.
- `sessions/` is frozen research history.
- `Archive/` is cold historical material.
- `knowledge/` is non-authoritative lookup/index material.
- `.rl-work/` is ignored local scratch/checkpoint state.

Binding worker rules are in `AGENTS.md`. The interactive convention is `@GitHub continue with the next authoritative session`. Every tenth session applies `docs/TENTH_SESSION_PROGRESS_AUDIT.md`.
