# RL33 prepared recovery task

Status: prepared at RL33 closeout; NOT ASSESSED in RL33.

Changed mechanism: stop augmenting cyclic misses. Use the forced saturation C_K=T_i* from RL33-P01 and inspect only the final closure attachment P_{K-1}.

If the RL31 obstruction profile is all-SAT, record it and stop.

Otherwise retain the exact RL33 closure sequence and let K>=1 be the first index with exact cyclic resource coverage, so C_K=T_i*. Let g_{K-1} be the final selected missed cyclic nonedge, a_{K-1} its fixed endpoint, w_{K-1} the fixed neighbor used in the last augmentation, r_{K-1} the first vertex of C_{K-1} on the fixed Q_i* path, and P_{K-1} that path.

First audit, rather than assume, the structural consequence of saturation: T_i*=C_{K-1} union V(P_{K-1}), with all vertices outside C_{K-1} lying on this one final attachment. Determine whether w_{K-1} is a deletable leaf of the retained spanning-tree structure and whether T_i*\{w_{K-1}} stays connected.

If deletion is connected, audit exactly one replacement family using T_i*\{w_{K-1}} in the order nonempty/exterior, disjointness, connectedness, exact cyclic resource coverage, preservation of the three fixed joining edges, and strictness. Do not invoke minimum total size before the family-validity gates.

If coverage fails, record the least cyclic nonedge h whose endpoints both miss T_i*\{w_{K-1}}. Since T_i* itself is a resource, audit the exact resulting adjacency-to-w_{K-1} statement and then compare only the two cases h=g_{K-1} and h!=g_{K-1}.

Exact successor target M3-SATURATION-LEAF-BLOCKER: certify the strongest valid final-leaf blocker statement and determine whether either equality case forces a contradiction or a new retained obstruction.

This task is unassessed and supplies no premise to RL33.
