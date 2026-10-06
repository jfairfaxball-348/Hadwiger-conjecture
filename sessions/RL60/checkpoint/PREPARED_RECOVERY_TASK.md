# RL60 prepared recovery task — RL61

Selected successor: RL61 HC7-K44-SPANNING-SIDE-CHROMATIC-SUM-GATE.

## Exact quantifiers

For every hypothetical minor-minimal HC7 counterexample G satisfying delta(G)>=8, and every legitimate K4,4 minor model

    M=(A_1,A_2,A_3,A_4;B_1,B_2,B_3,B_4)

that minimizes total branch-set size and is spanning, U=V(G), define

    A=A_1 union A_2 union A_3 union A_4,
    B=B_1 union B_2 union B_3 union B_4.

Assess exactly the candidate

    chi(G[A]) + chi(G[B]) <= 6.

## Inherited bridge

Consume only the certified minor-minimal/full-C7-critical HC7 baseline, delta(G)>=8 residual, SRC-0025 K4,4-minor consequence, RL55-P01 at minimum-model scope, and the spanning subcase.

## Independent root-facing sufficiency

If the candidate holds, properly color G[A] and G[B] with disjoint palettes of their chromatic sizes. Since A and B partition V(G), this gives a proper coloring of G using at most six colors, contradicting chi(G)=7.

## First missing dependency

A proved HC7-critical/minimum-model mechanism bounding the chromatic numbers of the ORIGINAL side-unions.

## Falsification / stopping condition

A certified-domain example with chromatic sum at least seven falsifies the candidate. Otherwise stop at the first step requiring an unproved quotient-palette lift, branch-set catalog, RL57 degree cap, RL56 exterior attachment, or another contraction/uncontraction extension theorem.

If no direct original-graph mechanism is established in the bounded task, suspend the spanning K4,4 coloring route rather than rename the lift.

## Bounds and changed mechanism

External mathematical source retrieval: 0 by default.
Mathematical numerical computation: 0.
Candidate count: exactly 1.

Changed mechanism: the quotient Q and its coloring are removed entirely. RL61 targets an invariant of the original graph itself.
