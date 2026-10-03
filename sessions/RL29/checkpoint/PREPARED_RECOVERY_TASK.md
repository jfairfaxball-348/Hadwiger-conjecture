# RL29 prepared changed recovery task

Status: PREPARED ONLY / NOT ASSESSED / NOT A CURRENT PREMISE.

RL30 is the next mandatory every-tenth-session progress/correction audit. Do not execute this recovery task during RL29 or in place of RL30.

If the RL30 audit preserves the RL29 fixed-edge frontier, a later bounded recovery may keep the same fixed A, K, x, z and xz and change mechanism as follows:

1. Use only the already proved vertex-minimality of K to fix exactly one proper A-list coloring psi of K-x.
2. Test exactly whether psi(z) belongs to A(x).
3. If yes, test exactly whether psi(z) is absent from the colors on N_K(x)\{z}.
4. If both tests pass, color x with psi(z); this gives one proper A-list coloring of K-xz and reaches the edge-essential branch without replacing K or recomputing A.
5. At the first failed test, stop and record that exact blocker. Do not choose a second psi.

No second K, z, edge, coloring, quotient coloring, path, resource family, or list system is part of this prepared task. It is a changed recovery mechanism because it uses a guaranteed vertex-deletion coloring directly rather than treating induced-vertex minimality as edge-minimality.
