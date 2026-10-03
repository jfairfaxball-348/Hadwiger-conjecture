# RL32 prepared recovery task

Status: prepared at RL32 closeout; NOT ASSESSED in RL32.

Changed mechanism: replace the single-witness attempt by a finite monotone coverage closure over the seven cyclic nonedges, while keeping the same least-index MISS side, fixed joining edges, fixed spanning tree Q_i*, and original terminal core.

If the RL31 obstruction profile is all-SAT, record it and stop.

Otherwise let i* be the least RL31 MISS coordinate. Start C_0=R_i*. Repeatedly, only while C_k is not a resource, choose the first still-missed cyclic nonedge in the inherited cyclic order. Because T_i* is a resource, fix one endpoint with one actual neighbor w_k in T_i*. Since that edge is missed by C_k, w_k is outside C_k. Add the unique Q_i* path from w_k to the first vertex of C_k, forming C_{k+1}.

Each augmentation repairs its selected cyclic nonedge permanently and never destroys earlier coverage. Hence no cyclic nonedge is selected twice and at most seven augmentations are permitted.

Audit nonempty/exterior, disjointness, connectedness, exact cyclic resource coverage, preservation of the three original fixed joining edges, and final strictness before invoking minimum total size.

Exact successor target: determine whether this bounded monotone closure must equal T_i* in every retained configuration, or whether a strict fully covering closure yields the minimum-total-size contradiction.

This task is unassessed and supplies no premise to RL32.
