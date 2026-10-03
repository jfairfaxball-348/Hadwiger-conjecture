# RL26 work-unit scope

Date: 2026-10-03 Europe/Madrid.
Status: RL26 OPEN / bounded analytic checkpoint / NOT PROMOTED.

BASE_HEAD: ff395bbe3eb5d69b3dc425710f80753146f80f7e
Work branch: work/rl26-full-critical-path-saturation-minor-20261003

Root remains full sharp Hadwiger:

    h(G) >= chi(G)

for every finite simple graph.

Retain exactly the full C_7 cyclic degree-seven domain and the non-singleton m=2, A=S fixed choices required by authoritative/RL26_FULL_CRITICAL_PATH_SATURATION_MINOR_BRIEF.md: the fixed resource family {T_1,T_2}, joining edge pq, rooted spanning tree Q_1 of H[T_1], non-root leaf x, B=T_1-{x}, selected cyclic defect e=ab, repair pattern X={a},Y={b}, fixed x-p tree path L, fixed y in N_H(b) intersect T_2, and fixed q-y path P.

Work only under the unresolved conditional alternative

    V(P)=T_2.

No claim is made that this alternative is realized by an actual full C_7 graph.

The sole contraction is

    R_1 = V(L) union V(P),
    J = G/R_1.

After contraction admissibility, fix exactly one proper six-coloring c of J supplied by full criticality. Let rho be the contracted vertex and gamma=c(rho).

The sole reconstruction proposal is fixed before testing: concatenate L, the actual edge pq, and P to obtain a simple path W=(w_0=x,...,w_k=y) spanning R_1. Preserve c outside R_1 and expand W in reverse order. At each w_i choose the least color in [6] absent from all already fixed external neighbors and already colored later internal neighbors. The intended output is a complete proper six-coloring of original G.

No second coloring, path, witness, tree, leaf, joining edge, defect, contraction, reconstruction, resource exchange, m=1 identity, RL23 recoloring mechanism, m=3 or m=4 branch is permitted.
