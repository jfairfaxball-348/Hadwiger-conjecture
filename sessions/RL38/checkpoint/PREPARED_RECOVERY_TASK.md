# RL38 prepared recovery task

Status: prepared at RL38 closeout; NOT ASSESSED in RL38.

Changed bounded continuation: do not replay overlap localization and do not rebuild the global-pair closure. Consume RL38-P01 and test only the surviving refined NEQ DISJOINT profile.

Retained final facts in NEQ:

    g<h,
    g is missed by C,
    g is covered by C union I,
    I=V(P)\(C union {w}),

and the selected pair (a,w) minimizes dist_Q(w,C) over the final admissible pair set from both endpoints of g.

Bounds:
1. Re-establish that g<h and least-miss order imply g is covered by C union I.
2. Combine that with g missed by C and audit whether some endpoint y of g has a neighbor z in I.
3. If so, audit whether (y,z) belongs to the already defined final admissible pair set.
4. Audit whether z in I is strictly internal on P and therefore dist_Q(z,C)<dist_Q(w,C).
5. If all gates pass, determine whether global pair minimality gives a contradiction. Record only that refined NEQ is impossible and STOP.
6. If any gate fails, record the first failure and STOP.
7. Do not investigate all-SAT or EQ during RL39.

Do not choose another MISS side, family, spanning tree, terminal core, joining edge, deletion vertex, coloring, endpoint, witness, blocker, or cyclic nonedge. Do not classify cyclic distances, enter m=4, or return to the suspended m=2 chain. No broad graph, coloring, list, neighborhood-subset, seven-nonedge, or numerical census.

Target: M3-GLOBAL-NEAREST-PAIR-DISJOINT. This task is unassessed and supplies no premise to RL38.
