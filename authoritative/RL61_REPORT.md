# RL61 report — HC7 K4,4 spanning side-chromatic-sum gate

Date: 2026-10-06.
Status: completed bounded assessment.
Root: HC7 only.
BASE_HEAD: ee3a649da561e2f9aae8f0073a7436d7d4421a45.
BASE_TREE: 77d8f92e8f9cb1d54b8274a371eebfa5b7a50958.
Incoming authoritative tree: faa9a1cc757ff8a9b2e8e6ad7276569ad118ee3b.

## Exact candidate

HC7-K44-SPANNING-SIDE-CHROMATIC-SUM:

    chi(G[A]) + chi(G[B]) <= 6

for every hypothetical minor-minimal HC7 counterexample G on the delta(G)>=8 residual and every globally minimum-total-size spanning K4,4 model, with A and B the two side-unions.

Entry classification: CANDIDATE / NOT ESTABLISHED.

## Assessment

For every finite graph G and every partition V(G)=A disjoint-union B,

    chi(G) <= chi(G[A]) + chi(G[B]).

Proof: properly color G[A] and G[B] using disjoint palettes of their respective chromatic sizes. The combined coloring is proper on G.

Therefore every actual graph in the RL61 domain, which has chi(G)=7, satisfies

    chi(G[A]) + chi(G[B]) >= 7.

Consequently the proposed <=6 bound is not an independent structural invariant. It can hold universally on the stated counterexample domain only vacuously, if an independent argument has already eliminated that entire domain.

Full-C7 criticality gives only the separate bounds chi(G[A])<=6 and chi(G[B])<=6 because each is a proper induced subgraph. RL55-P01 controls opposite-side attachment support and supplies no same-side chromatic upper bound. No permitted inherited mechanism establishes the required sum upper bound.

## Classification and effect

HC7-K44-SPANNING-SIDE-CHROMATIC-SUM: CANDIDATE / NOT ESTABLISHED; not certified-domain falsified.

Spanning U=V(G) subcase eliminated: NO.
delta(G)>=8 genuinely narrowed: NO.
HC7-universal obligation genuinely reduced: NO.

Mathematical correction/demotion: NONE.
Inherited mathematical theorem classification changes: NONE.
Source-classification changes: NONE.

First missing dependency: a genuinely independent non-color-lift structural contradiction eliminating or transforming the spanning minimum-model subcase.

No external mathematical source retrieval was performed.
No mathematical numerical computation was performed.
Candidate count: exactly 1.

## Route decision

FL-062 records that removing the quotient did not produce an independent coloring invariant. The spanning K4,4 coloring route is suspended. Do not rename the same missing contradiction as another quotient-palette, disjoint-palette or side-chromatic statement.

Exactly one successor is prepared: RL62 HC7-CRITICAL-7-CONNECTIVITY-GATE, a root-universal structural candidate outside the suspended coloring route.

Programme ACTIVE.
