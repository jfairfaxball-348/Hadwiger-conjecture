# RL34 prepared recovery task

Status: prepared at RL34 closeout; NOT ASSESSED in RL34.

Changed mechanism: stop deleting vertices. Retain the exact RL34 leaf-critical blocker produced by deletion of the already fixed final leaf w_{K-1}, and exploit only its relation to the final selected miss and the inherited cyclic least-miss / first-passing order.

If the RL31 obstruction profile is all-SAT, record it and stop.

Otherwise retain the same i*, K, C_{K-1}, T_i*, Q_i*, P_{K-1}, g_{K-1}, a_{K-1}, w_{K-1}, and the least deletion blocker h. Do not choose a new side, tree, path, family, deletion vertex, blocker, or support vertex.

Audit at most the two already forced profiles:

- EQ: h=g_{K-1}. Determine whether the first-passing closure and least-miss order force or exclude one-endpoint versus two-endpoint contact of g with w_{K-1}, and whether the profile itself is contradictory.
- NEQ: h!=g_{K-1}. Retain g_{K-1}<h, the internal off-core support of g_{K-1} before the leaf, and the leaf-only support of h in the exact weak RL34 sense. Determine whether this ordered support pattern contradicts the first-passing property or survives as a sharper obstruction.

Do not classify arbitrary neighborhoods of w_{K-1} in S and do not run a seven-nonedge subset census.

Exact successor target M3-LEAF-BLOCKER-ORDER: determine whether cyclic order eliminates either RL34 profile or sharpens its endpoint-contact statement.

This task is unassessed and supplies no premise to RL34.
