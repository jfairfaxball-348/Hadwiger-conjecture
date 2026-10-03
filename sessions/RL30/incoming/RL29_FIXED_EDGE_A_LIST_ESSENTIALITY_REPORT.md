# RL29 fixed-edge A-list-essentiality report

Date: 2026-10-03 Europe/Madrid.
Status: CLOSED/FROZEN at closeout.
Base: ad222da6f4747d019af4ea0be7897920e5a5b355.

## Exact retained scope

Keep full sharp Hadwiger h(G)>=chi(G) for every finite simple graph.

Retain exactly the conditional non-singleton m=2, A=S frontier under V(P)=T_2, with the same fixed family {T_1,T_2}, joining edge pq, rooted spanning tree Q_1, non-root leaf x, B=T_1-{x}, selected cyclic defect e=ab, repair pattern X={a},Y={b}, fixed paths L and P, R_1, J=G/R_1, the same quotient coloring c, rho, gamma=c(rho), and exactly

    A(u)=[6] \ c(N_G(u) \ R_1).

Retain the same fixed inclusion-minimal induced non-A-list-colorable obstruction K from RL27 and the same fixed off-path neighbor z in N_K(x)\{w_1} from RL28. The fixed edge is xz. No choice is replaced.

RL27-P02 remains |A(u)|<=d_K(u) for every u in V(K). RL28-P01/P02 remain scoped to the independent proper-minor coloring d and are not identified with c or with any A-list coloring.

## Fixed-edge assessment

Put K'=K-xz, on the same vertex set V(K), retaining the already fixed lists A without recomputation.

RL27 fixed K only by inclusion-minimality among induced vertex subgraphs of G[R_1] that are not A-list-colorable. Therefore K-u is A-list-colorable for every u in V(K). This vertex-minimality does not classify K': K' has the same vertex set as K and differs only by deletion of the fixed edge xz. It is not a proper induced vertex subgraph of K.

Thus the inherited minimality premise does not imply that K-xz is A-list-colorable. Conversely, non-A-list-colorability of K does not imply non-A-list-colorability after deletion of xz. No retained theorem, certificate, or already fixed A-list coloring decides this edge deletion.

The retained incidences do not repair the gap. Since xa is an edge and a lies outside R_1, c(a) is excluded from A(x). RL28 also records az is absent because N_G(a) intersect R_1={x}. But az notin E(G) does not imply c(a) belongs to A(z), since another external neighbor of z may carry color c(a). No retained premise controls all c(a)-colored external neighbors of z.

Therefore, at this exact fixed scope:

    K-xz A-list-colorable: NOT CERTIFIED.
    K-xz non-A-list-colorable: NOT CERTIFIED.

This is the first missing list/edge-essentiality implication, so RL29 stops here.

## Consequences not reached

Because A-list-colorability of K-xz is not certified, RL29 fixes no map phi on K-xz. The mandated equality phi(x)=phi(z) is therefore not reached, and no consequence of that equality is selected or tested.

The fixed edge xz is not classified as essential or nonessential to the fixed list obstruction. No comparison of labels across c, d, or a hypothetical list coloring is made.

## Classification and obligation accounting

Classification: scoped analytic stopping result / method barrier, same-worker review only.

RL29 promotes no positive theorem, finite certificate, numerical result, saturation exclusion, or edge-essentiality conclusion. It records that the retained induced-vertex minimality input is insufficient to decide the fixed edge deletion.

FL-032 records this exact barrier.

V(P)=T_2 remains unexcluded. RL25 gate 1 remains unresolved; gates 2-6 remain NOT REACHED. FL-030 and FL-031 remain open at their exact scopes.

Named mathematical obligations genuinely reduced: none.
Correction/demotion: NONE.
New mathematical source retrieval: 0.
Mathematical numerical work: 0.
Graph/coloring/list census: 0.
Programme: ACTIVE.
