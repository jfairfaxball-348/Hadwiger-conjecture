# Prepared recovery after RL28

Status: candidate future work only; NOT STARTED / NOT PROMOTED.

## Exact obstacle

RL28's one fixed coloring d of G-xz proves d(x)=d(z) and full five-color saturation at x away from z. This does not close FL-030 because d is independent of the fixed quotient coloring c used to define the lists A, and the d-color witnesses are not localized to R_1 or K.

Repeating edge deletion with another z or coloring, relabeling d to simulate compatibility with c, or deriving further lower-degree saturation does not address the obstruction.

## One changed bounded mechanism

Retain the same conditional V(P)=T_2 scope, the same fixed R_1, c, A, K, x, and the same already fixed z in N_K(x)\{w_1}.

Assess exactly whether the one edge xz is **A-list-essential inside the fixed K**.

Delete xz only inside K and ask whether K-xz has a proper coloring phi respecting the already fixed lists A.

- If K-xz is A-list-colorable, fix exactly one such phi. Because K itself is not A-list-colorable, restoring xz forces phi(x)=phi(z); otherwise phi would already color K. This equality then lives in the same fixed A-list system, avoiding RL28's c-versus-d compatibility gap. Test at most one consequence toward an internal-degree restriction at x.
- If K-xz is not A-list-colorable, record that this particular off-path edge is not essential to the fixed list obstruction and stop. Do not replace z, K, or the edge.

This is candidate development only. Current authority does not assert that K-xz is A-list-colorable.

## Bounds and guards

- same fixed K, x and z only;
- one edge xz only;
- at most one A-list coloring phi, and only if existence is proved;
- no second z, K, endpoint, quotient coloring, proper-minor coloring, path, tree, defect, resource side or family;
- do not infer original-graph degree from Q_1 or W;
- do not compare color labels across independently chosen colorings;
- no RL25 gates 2-6 and no minimum-total-size exchange;
- no m=1 revival and no m=3/m=4 work;
- no new source retrieval or numerical census by default.

A positive result must still yield an explicit contradiction at the retained saturation scope or a rigorously sufficient original-graph internal-degree restriction at x. An equal-color statement in an A-list coloring alone is structural information.

Programme ACTIVE.
