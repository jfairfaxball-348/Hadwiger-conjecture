# Hadwiger Conjecture Research Repository

This repository is an ongoing, exploratory research record for the full
Hadwiger Conjecture.

The current incoming state is [authoritative/START_HERE.md](authoritative/START_HERE.md);
binding worker rules are in [AGENTS.md](AGENTS.md). The repository distinguishes
proved mathematics, exact certificates, computational evidence, conjectures,
barriers, corrections and open obligations.

## Current handover

RL22 is CLOSED/FROZEN under [sessions/RL22/](sessions/RL22/START_HERE.md).
It completed one bounded fixed-defect T_2 target-color blocker assessment
inside one fixed unresolved RL21 repair pattern.

At the exact fixed pattern X={a}, Y={b}, RL22-P01 records that
N_H(a) intersect T_2 is empty and therefore Z_a is empty. The corresponding
a->beta recoloring is safe on S, B and T_2 but is not certified against the
one-sided leaf x: xa is an edge, xb is a nonedge, and properness does not
force c(x)!=beta. FL-025 records this method barrier. No named inherited
mathematical obligation is reduced.

RL23 is the unique incoming session through
[authoritative/RL23_ONE_SIDED_LEAF_COLOR_COMPATIBILITY_BRIEF.md](authoritative/RL23_ONE_SIDED_LEAF_COLOR_COMPATIBILITY_BRIEF.md).
It is READY / NOT STARTED and works only in the same fixed pattern and same
fixed coloring, conditional on c(x)=beta.

The programme is active and the root remains full sharp Hadwiger for every
finite simple graph.

## Core repository model

`authoritative/` → one incoming RL session → verified freeze in
`sessions/RL...` + one successor `authoritative/`.

- `authoritative/` is the sole current incoming mathematical state.
- `sessions/` is frozen research history.
- `Archive/` is cold historical material.
- `knowledge/` is non-authoritative lookup/index material.
- `.rl-work/` is ignored local scratch/checkpoint state.

The interactive convention is:
`@GitHub continue with the next authoritative session`.
Every tenth session applies the audit policy in
[docs/TENTH_SESSION_PROGRESS_AUDIT.md](docs/TENTH_SESSION_PROGRESS_AUDIT.md).
