# RL31 prepared recovery task

Status: prepared at RL31 closeout; NOT ASSESSED in RL31.

Changed mechanism: consume one actual coverage-miss witness rather than retrying the unchanged terminal core.

For the RL31 obstruction profile, if at least one coordinate is MISS_i(g_i), choose the least such i. Keep the same fixed joining edges, Q_i and R_i. Because T_i is a resource while both endpoints of g_i miss R_i, RL32 may fix exactly one actual edge from one endpoint of g_i to one vertex w_i in T_i minus R_i. Let P_i be the unique Q_i path from w_i to the first vertex of R_i and define the one augmented core R_i^+=R_i union V(P_i).

Audit only F_i^+={R_i^+} union {T_j:j!=i} through the ordered family-validity and strictness gates before invoking minimum total size.

If no MISS coordinate exists, record the all-SAT profile and stop. No alternative candidate is authorized in the same RL.

This task is unassessed and supplies no premise to RL31.
