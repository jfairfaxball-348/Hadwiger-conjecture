# RL29 fixed-edge A-list-essentiality assessment

Date: 2026-10-03 Europe/Madrid.
Status: bounded analytic work unit complete; RL29 OPEN / NOT PROMOTED.
BASE_HEAD: ad222da6f4747d019af4ea0be7897920e5a5b355.

## Start gate

The live default branch was pinned at the expected predecessor exactly. The sole incoming session is RL29 under authoritative/START_HERE.md and authoritative/RL29_BRIEF.md. No incoming integrity mismatch was found.

The retained scope is exactly the conditional non-singleton m=2, A=S frontier under V(P)=T_2, with the same fixed T_1,T_2,pq,Q_1,x,B,e=ab,X={a},Y={b},L,P,R_1,J,c,rho,gamma, the same lists

    A(u)=[6] \ c(N_G(u) \ R_1),

the same inclusion-minimal induced non-A-list-colorable K, the same x in V(K), and the same fixed z in N_K(x)\{w_1}. The fixed edge is xz. No choice was replaced.

RL27-P02 remains

    |A(u)| <= d_K(u)

for every u in V(K). RL28-P01/P02 remain scoped to the independent proper-minor coloring d and are not identified with c or with any A-list coloring.

## Exact fixed-edge assessment

Put

    K' = K - xz,

meaning the graph on the same vertex set V(K) with only the fixed edge xz removed, and retain the already fixed lists A without recomputation.

RL27 fixed K only by inclusion-minimality among induced vertex subgraphs of G[R_1] that are not A-list-colorable. Consequently, for every u in V(K), K-u is A-list-colorable. This vertex-minimality statement does not classify K'. The graph K' has the same vertex set as K and is not a proper induced subgraph of K or G[R_1]; it is obtained by deleting one edge. Therefore the inherited minimality premise does not imply that K' is A-list-colorable.

The converse is also not supplied: non-A-list-colorability of K does not imply non-A-list-colorability after deletion of xz. No retained theorem, certificate, or fixed A-list coloring decides the edge deletion.

The retained x/z/resource incidences do not repair this gap. From xa in E(G) and a outside R_1, c(a) is excluded from A(x). RL28 also records az notin E(G), because N_G(a) intersect R_1={x}. But az notin E(G) does not imply c(a) belongs to A(z): another external neighbor of z may carry color c(a). No retained premise controls all c(a)-colored external neighbors of z. Thus no certified list asymmetry at x and z decides K'.

Hence the exact status is:

    K-xz A-list-colorable: NOT CERTIFIED.
    K-xz non-A-list-colorable: NOT CERTIFIED.

This is the first missing list/edge-essentiality implication, so the bounded assessment stops here.

## Consequences not reached

Because A-list-colorability of K-xz is not certified, RL29 does not fix any map phi on K-xz. Therefore the mandated equality phi(x)=phi(z) is not reached. No consequence of that equality is selected or tested.

The fixed edge xz is not classified as essential or nonessential to the fixed list obstruction. RL28-P01/P02 remain untouched at their independent-d-coloring scope. No comparison of color labels across c, d, or a hypothetical list coloring is made.

## Classification and obligation accounting

Classification: scoped analytic stopping result / method barrier, same-worker review only; NOT PROMOTED pending normal closeout.

The result identifies a missing dependency rather than a theorem about the edge: RL27's induced-vertex minimality is insufficient to decide fixed-edge essentiality.

No saturation contradiction is obtained. V(P)=T_2 remains unexcluded. RL25 gate 1 remains unresolved; gates 2-6 remain NOT REACHED. FL-030 and FL-031 remain open at their exact scopes.

Named mathematical obligations genuinely reduced: none.
Correction/demotion: NONE.
New mathematical source retrieval: 0.
Mathematical numerical work: 0.
Graph/coloring/list census: 0.
Programme: ACTIVE.

Recommendation: it makes sense to finish up here
