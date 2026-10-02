# RL23 work-unit scope

Date: 2026-10-02 Europe/Madrid.
Status: RL23 OPEN / bounded analytic checkpoint / NOT PROMOTED.

BASE_HEAD: 57572d2e3cf353cad139460902e0958339371480
Incoming authoritative tree: 76e0cc682e1b454e0d8436ece9db72a7ac9d442f
Work branch: work/rl23-one-sided-leaf-color-compatibility-20261002

Root remains full sharp Hadwiger:

    h(G) >= chi(G)

for every finite simple graph.

Preserved exactly: RL22-P01 at its fixed-choice scope; FL-025; RL21-P01/P02; FL-024; the RL20 audit NONE correction/demotion result; FL-023. The m=1 failed-anchor/private-endpoint line is not resumed.

Exact retained setup: full C_7 cyclic degree-seven domain; fixed maximum-cardinality/minimum-total-size non-singleton m=2, A=S family {T_1,T_2}; U=T_1 union T_2; N_H(U) intersect S=S; fixed joining edge pq with p in T_1 and q in T_2; fixed spanning tree of H[T_1] rooted at p; fixed non-root leaf x; B=T_1-{x}; fixed selected cyclic defect e=ab; fixed repair pattern X={a},Y={b}; fixed cyclic nonedge f disjoint from e; and the same fixed actual six-coloring c pulled back from the permitted original-G star minor for f.

Put alpha=c(a), beta=c(b). Retain

    xa in E(H), xb notin E(H),
    N_H(a) intersect B = N_H(b) intersect B = empty,
    N_H(a) intersect T_2 = empty,
    Z_a = empty,
    N_H(b) intersect T_2 != empty.

The sole conditional branch is

    c(x)=beta.

The only mechanism assessed is whether properness plus the retained fixed-side/resource consequences contradict this equality. No second coloring, changed f, repair pattern, resource side, defect, leaf, tree, joining edge, quotient lift, m=1 identity, smaller-family construction, m=3 or m=4 work is executed.
