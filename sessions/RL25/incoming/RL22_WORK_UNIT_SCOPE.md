# RL22 work-unit scope

Date: 2026-10-02 Europe/Madrid.
Status: RL22 OPEN / bounded analytic checkpoint / NOT PROMOTED.

BASE_HEAD: 33176e4691c1a657ae114cdd058664c544f81a40
Work branch: work/rl22-fixed-defect-target-color-blocker-20261002

Root remains full sharp Hadwiger:

    h(G) >= chi(G)

for every finite simple graph.

This work unit preserves RL21-P01 and RL21-P02 exactly at their fixed-choice scopes, preserves FL-024 exactly, preserves the RL20 audit NONE correction/demotion result and FL-023, and does not resume the m=1 failed-anchor/private-endpoint line.

Exact retained setup: full C_7 cyclic degree-seven domain; fixed maximum-cardinality/minimum-total-size m=2 family {T_1,T_2}; U=T_1 union T_2; N_H(U) intersect S=S; fixed joining edge pq with p in T_1, q in T_2; fixed rooted spanning tree of H[T_1]; fixed non-root leaf x; B=T_1-{x}; and fixed selected cyclic defect e=ab supplied by RL21-P01.

Exactly one unresolved RL21 repair pattern is selected:

    X={a}, Y={b}.   (RL21 pattern 1)

Thus xa is an edge, xb is not an edge, N_H(a) intersect T_2 is empty, and N_H(b) intersect T_2 is nonempty. Also neither a nor b has a B-neighbor.

Fix once and for all exactly one cyclic nonedge f disjoint from e and exactly one actual proper six-coloring c obtained from the permitted original-G star minor for f and pulled back to H. No second f or coloring is selected. Put alpha=c(a), beta=c(b).

The sole mechanism tested is the fixed-defect T_2 target-color blocker gate from the RL22 brief. No T_2 pruning, resource-side switch, second defect/leaf/tree/joining edge/coloring, m=1 identity, quotient lift, smaller-family mechanism, m=3 or m=4 work is permitted.
