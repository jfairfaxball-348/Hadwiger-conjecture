# RL36 prepared recovery task

Status: prepared at RL36 closeout; NOT ASSESSED in RL36.

Changed mechanism: do not replay the fixed-choice endpoint-overlap audit. Test one new witness-selection discipline inside the same retained m=3, A=S resource-family setup.

Candidate rule: in the monotone MISS closure, after the inherited least cyclic miss g_k and one admissible endpoint a_k are fixed, choose w_k from N_H(a_k) intersect T_i* to minimize Q_i*-distance to C_k. Let P_k be the Q_i* path from w_k to the first vertex of C_k, exactly as before.

Bounds:
1. Re-establish, for this modified candidate only, the monotone repair, termination in at most seven augmentations, first coverage-passing stage, and minimum-total-size saturation conclusion. If any required step fails, record the first failure and STOP.
2. Only if saturation is re-established, redo the final leaf/deletion blocker construction and the least-miss order localization needed to obtain the same EQ/NEQ interface for the refined closure. Do not consume old fixed-choice blocker facts as if they automatically transferred.
3. If all-SAT or EQ occurs, record and STOP.
4. In refined NEQ, if the named final g,h are disjoint, record and STOP.
5. Only if they overlap at x, apply the RL36 endpoint-support inference. Test solely whether x!=a would force a neighbor of a in the internal part I that lies strictly closer in Q to C than the selected w, contradicting the new nearest-witness rule. If this eliminates x!=a, record the surviving x=a profile and STOP.
6. Do not seek a contradiction beyond that point.

Do not inspect other cyclic nonedges, classify cyclic distances, choose another MISS side, alter the fixed family/tree/terminal-core data, enter m=4, or return to the suspended m=2 chain. No broad graph, coloring, list, neighborhood-subset, or numerical census.

Target: M3-NEAREST-WITNESS-OVERLAP. This task is unassessed and supplies no premise to RL36.
