# RL35 prepared recovery task

Status: prepared at RL35 closeout; NOT ASSESSED in RL35.

Changed mechanism: stop replaying least-miss / first-passing order. Use only endpoint incidence of the already named pair g,h in NEQ.

If all-SAT, record and stop. If EQ holds, h=g, record the exact RL35 EQ profile and stop.

If NEQ holds, retain g<h, the internal support of g in I=V(P)\(C union {w}), and h's lack of T-{w} support. Determine only whether g and h are disjoint or share one endpoint. If disjoint, record and stop. If they share x, test whether x's lack of I-neighbors forces the I-supported endpoint of g to be its other endpoint, then compare that endpoint only with the fixed a.

Do not inspect other cyclic nonedges, cyclic distances, alternate supports, deletions, sides, trees, paths, families, or colorings.

Target M3-NAMED-BLOCKER-OVERLAP. This task is unassessed and supplies no premise to RL35.
