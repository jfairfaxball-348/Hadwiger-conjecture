# Hadwiger Conjecture Research Repository

This repository is an ongoing, exploratory research record for the full
Hadwiger Conjecture.

The current incoming state is [authoritative/START_HERE.md](authoritative/START_HERE.md);
binding worker rules are in [AGENTS.md](AGENTS.md). The repository distinguishes
proved mathematics, exact certificates, computational evidence, conjectures,
barriers, corrections and open obligations.

## Current handover

RL12 is CLOSED/FROZEN under [sessions/RL12/](sessions/RL12/START_HERE.md).
Its one selected local result, BR-06-SEP2, is a complete analytic
two-defect separator reduction at its exact C_t scope; it does not establish
universal separator coverage, order-seven coverage, UP_6, CR_6 or full sharp
Hadwiger. RL11's MK2 countermodel remains an exact D_cyc refutation of MK2
only, while retaining UP_6 and a rooted K6.

RL13 is the unique incoming session through
[authoritative/RL13_CRITICAL_CONNECTED_RESOURCE_BRIEF.md](authoritative/RL13_CRITICAL_CONNECTED_RESOURCE_BRIEF.md).
It is one bounded critical connected-resource obstruction/augmentation gate
on full C_7, with no promise that five resources exist. All prior sessions,
source limits, failures, countermodels, certificates and residual obligations
remain authoritative. The programme is active.

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
