# RL40 load-bearing dependency and scope audit

Status: completed mandatory audit.

## Resource coverage

RL13 defines a resource T by requiring that for every cyclic nonedge e, at least one endpoint of e has a neighbor in T. Therefore

    g covered by C union I but missed by C

forces an endpoint y of g with a neighbor z in I. RL39 does not assume a stronger two-endpoint or common-neighbor condition.

## RL38 global pair rule

For each least miss g_k, the admissible set
    W_k={(v,u): v endpoint of g_k, u in N_H(v) intersect T_i*}
is nonempty because T_i* is a resource. Since g_k misses C_k, admissible witnesses lie outside C_k; finiteness gives a distance minimizer.

RL38 independently re-establishes Q-connected closure, permanent repair, K<=7 first exact coverage, replacement-family validity, saturation C_K=T_i*, and the final leaf/blocker interface before using global pair-minimality.

## Q-distance

At the final stage Q[C] is connected and P is the unique Q-path from w to its first contact r with C. I consists exactly of strict internal vertices of P. For z in I, any Q-route from z to a different C vertex avoiding r would create a cycle with Q[C]. Hence
    dist_Q(z,C)=dist_Q(z,r)<dist_Q(w,r)=dist_Q(w,C).

## Choice discipline

No retroactive import was found:
- RL33 uses its original fixed-choice closure;
- RL37 defines a new fixed-endpoint nearest-witness closure and rebuilds affected premises;
- RL38 defines a separate global endpoint-witness-pair closure and rebuilds them again;
- RL39 consumes RL38 only.

## Residuals

All-SAT remains unresolved before MISS-side machinery starts. EQ remains unresolved because no I-support of g exists to compete with w. Both block the universal RL31 target M3-CORE.

M3-CORE remains NOT CERTIFIED. The m=3,A=S configuration and full root remain open.

No verifier/certificate overreach was found. RL31-RL39 remain same-worker analytic results at recorded scopes.

Correction/demotion: NONE.
