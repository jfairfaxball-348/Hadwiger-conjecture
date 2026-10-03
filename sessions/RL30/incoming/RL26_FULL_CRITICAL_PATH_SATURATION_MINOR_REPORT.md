# RL26 full-critical path-saturation minor input-development report

Date: 2026-10-03 Europe/Madrid.
Status: bounded analytic assessment complete; RL26 OPEN / NOT PROMOTED.
BASE_HEAD: ff395bbe3eb5d69b3dc425710f80753146f80f7e.

## Exact retained scope

Keep full sharp Hadwiger h(G)>=chi(G) for every finite simple graph.

Retain full C_7: G is finite simple with chi(G)=7, every proper minor is six-colorable, v has degree seven, H=G-v, S=N_G(v)={u_0,...,u_6}, and the only nonedges of H[S] are the seven cyclic pairs.

Retain the exact fixed non-singleton m=2, A=S data and repair pattern X={a},Y={b} from the RL26 brief. In particular T_1 and T_2 are disjoint connected exterior resources, pq is an actual edge with p in T_1 and q in T_2, Q_1 is rooted at p, x is a non-root leaf, L is the fixed x-p path in Q_1, y is the fixed b-neighbor in T_2, and P is the fixed simple q-y path in H[T_2]. Work only under

    V(P)=T_2.

This is a conditional assessment only; no actual full C_7 realization of saturation is asserted.

## 1. Contraction admissibility

Define

    R_1=V(L) union V(P).

The path L is nonempty and contains distinct vertices x and p because x is a non-root leaf of a tree rooted at p. Thus |V(L)|>=2.

The path P lies in T_2. Since T_1 and T_2 are disjoint, V(L) and V(P) are disjoint. The actual edge pq has p in V(L) and q in V(P). Therefore the concatenation of L, pq and P is a simple x-y path W whose vertex set is exactly R_1. This remains true when P has length zero: then y=q and pq joins the terminal p of L to the singleton V(P)={q}.

Hence R_1 is nonempty and connected. In fact |R_1|>=2.

Every vertex of R_1 lies in T_1 union T_2, hence in V(H)\S. Therefore v and every vertex of S lie outside R_1. Contract the edges of the spanning path W to one vertex rho, then suppress loops and parallel edges to obtain the finite simple graph

    J=G/R_1.

This is a minor of original G. Since |R_1|>=2, the contraction strictly decreases the number of vertices, so J is not isomorphic to G. Thus J is a proper minor.

This admissibility gate PASSES. No RL25 exchange gate is retrospectively passed.

## 2. One fixed six-coloring

By full C_7 criticality, the proper minor J has a proper coloring

    c:V(J)->[6].

Fix one such c once and for all. Let

    gamma=c(rho).

Identify every vertex of G-R_1 with its unchanged vertex in J and retain its c-color.

If z is any external neighbor of R_1 in G, then z is adjacent to rho in J. Therefore

    c(z) != gamma.                                             (1)

Thus gamma is boundary-safe for every vertex of R_1: no edge from R_1 to G-R_1 has a gamma-colored endpoint outside R_1. This is structural information only; it is not a quotient-coloring lift.

## 3. The sole fixed reconstruction proposal

Write the spanning path from the admissibility proof as

    W=(w_0=x,w_1,...,w_k=y).

Because x and p are distinct and q lies in the disjoint T_2, k>=2.

Proposal: preserve c on G-R_1 and color W in reverse order. At step i, assign w_i the least color in [6] not used by:
1. any external neighbor in N_G(w_i)\R_1, under the fixed coloring c; or
2. any already colored later vertex w_j, j>i, adjacent to w_i in original G.

If every step succeeds, then every external edge is checked when its R_1 endpoint is colored, and every internal edge is checked when its earlier endpoint is colored. Thus completion would be a proper six-coloring of original G, contradicting chi(G)=7.

No other reconstruction is considered.

## 4. First reconstruction step

At w_k=y there are no already colored internal vertices. By (1), gamma is absent from every external neighbor of y. Hence the proposal can and does assign

    w_k -> gamma.

The first step is certified.

## 5. Second reconstruction step and stopping point

Let w_{k-1} be the predecessor of y on W. It exists because k>=2. The path edge

    w_{k-1}y in E(G)

now forbids gamma at w_{k-1}.

To continue, at least one color in [6]\{gamma} must be absent from

    c(N_G(w_{k-1})\R_1).                                    (2)

Equivalently, the proposal needs

    c(N_G(w_{k-1})\R_1) != [6]\{gamma}.                     (3)

No retained premise proves (3). Properness of c in J proves only the exclusion of gamma from external neighbors of R_1. The resource axioms, S-completeness, the fixed joining edge, and the selected incidences with a and b do not bound the number of other colors appearing around w_{k-1}.

This remains true in both endpoint forms allowed by the fixed path. If P has length zero, y=q and w_{k-1}=p; the known nonedges pa,pb do not exclude the colors c(a),c(b) from other external neighbors of p. If P has positive length, w_{k-1} lies in T_2; N_H(a) intersect T_2=empty excludes the vertex a itself as its neighbor but does not exclude other external vertices carrying color c(a), nor any analogous all-five-color boundary pattern.

Therefore the second greedy expansion step is NOT CERTIFIED. This is the first missing reconstruction implication, so the assessment stops here.

No claim is made that all five non-gamma colors actually occur around w_{k-1} in a full C_7 graph, or that no different reconstruction could work. No second coloring or reconstruction is selected.

## Classification and obligation accounting

Positive structural information at this fixed conditional scope:
- R_1 is connected and nontrivial;
- J=G/R_1 is a proper original-G minor;
- one fixed six-coloring of J exists;
- the contracted color gamma is absent from every external neighbor of R_1;
- the fixed reverse-greedy proposal safely colors y with gamma.

Stopping result:
- the proposal next requires the independent boundary-color omission (3), which is not supplied by retained authority.

Classification: scoped analytic structural result plus method barrier, same-worker review only. Candidate lesson FL-029.

There is no complete six-coloring of G, no explicit simultaneous K_7 minor, and hence no graph-level contradiction excluding V(P)=T_2. RL25's first nonemptiness obstacle remains unresolved.

No named inherited mathematical obligation is genuinely reduced. The full m=2, A=S branch and selected pattern remain open, as do m=1, m=3, m=4, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order seven, every higher order and full sharp Hadwiger. Gates 2-6 of RL25 remain NOT REACHED and minimum total size is not invoked.

Preserve RL25/FL-028, RL24/FL-027, RL23/FL-026, RL22-P01/FL-025, RL21-P01/P02/FL-024 and the RL20 NONE correction/demotion result/FL-023 exactly. No correction or demotion is triggered. All source/certificate, simultaneous-compatibility, sharpness and unbounded-parameter limits remain.

New mathematical source queries/opens: 0.
Mathematical numerical work: 0.
Programme ACTIVE.

Recommendation: it makes sense to finish up here
