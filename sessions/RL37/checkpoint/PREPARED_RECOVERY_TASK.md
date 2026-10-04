# RL37 prepared recovery task

Status: prepared at RL37 closeout; NOT ASSESSED in RL37.

Changed mechanism: do not replay fixed-endpoint nearest-witness choice. Couple endpoint selection and witness selection for the selected least cyclic miss.

Candidate rule: when C_k fails exact cyclic resource coverage, choose the least missed cyclic nonedge g_k. Among all pairs (v,u) such that v is an endpoint of g_k and u lies in N_H(v) intersect T_i*, choose (a_k,w_k) minimizing dist_Q(u,C_k). Ties may be fixed arbitrarily. Let P_k be the Q_i* path from w_k to the first vertex of C_k and put C_{k+1}=C_k union V(P_k).

Bounds:
1. Re-establish well-definedness, Q-connectedness, monotone repair, termination in at most seven augmentations, first exact coverage, and every replacement-family gate. If any gate fails, record the first failure and STOP.
2. Only if minimum total size again forces C_K=T_i*, independently redo the final leaf/deletion blocker and least-miss order interface.
3. If all-SAT or EQ occurs, record and STOP.
4. In refined NEQ, if the named final g,h are vertex-disjoint, record and STOP.
5. Only if they overlap at x, let y be the nonshared endpoint of g. The inherited overlap-support inference gives a T-neighbor z in I of y. Test whether the eligible pair (y,z) has strictly smaller witness distance to C than the selected final pair (a,w), contradicting global pair minimality. If certified, record only that refined overlap is impossible and STOP.
6. Do not seek a contradiction in the surviving DISJOINT profile during RL38.

Do not choose another MISS side, family, spanning tree, terminal core, joining edge, deletion vertex, coloring, blocker beyond the refined final h, or arbitrary other cyclic nonedge. Do not classify cyclic distances, enter m=4, or return to the suspended m=2 chain. No broad graph, coloring, list, neighborhood-subset, seven-nonedge, or numerical census.

Target: M3-GLOBAL-NEAREST-PAIR-OVERLAP. This task is unassessed and supplies no premise to RL37.
