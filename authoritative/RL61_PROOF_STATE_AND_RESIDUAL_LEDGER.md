# HC7 proof state and open obligations

Status: CURRENT after RL61.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.

Correction/demotion in RL61: NONE.
Inherited mathematical theorem classification changes in RL61: NONE.
Source-status changes in RL61: NONE.

## Certified HC7-universal frontier

For every hypothetical minor-minimal HC7 counterexample G:

1. G is finite simple, chi(G)=7, and has no K7 minor.
2. Every proper minor is 6-colorable, hence G is full-C7 critical in the repository sense.
3. Every proper subgraph is 6-colorable and G is connected.
4. delta(G)>=7 by inherited RL6-P03 with HC7 applicability certified by RL52.
5. The exhaustive first degree split is: some degree-seven vertex exists, or delta(G)>=8. Degree-seven existence remains OPEN / NOT ESTABLISHED.
6. SRC-0025 remains checked_primary at theorem-statement/hypothesis level and certifies that every HC7 counterexample contains a K4,4 minor. The full subscription proof has not been independently reconstructed.

RL52 and RL54 remain the latest sessions that genuinely narrowed the HC7-universal graph-level residual.

## Minimum K4,4 model state

On the active delta(G)>=8 residual choose a legitimate K4,4 minor model minimizing total branch-set size, with branch sets

    M=(A_1,A_2,A_3,A_4;B_1,B_2,B_3,B_4)

and union U.

RL55-P01 remains PROVED ANALYTIC MATHEMATICS exactly at minimum-model scope: no proper nonempty connected subset of one branch set meets all four opposite attachment sets.

RL56-P01 remains PROVED only as the conditional double-apex K7 payoff. RL56-C01 remains NOT ESTABLISHED / NOT PROMOTED.

RL57-C01 remains NOT ESTABLISHED / NOT PROMOTED and not certified-domain falsified.

RL58-C01 remains NOT ESTABLISHED / NOT PROMOTED and not certified-domain falsified.

RL59-C01 remains NOT ESTABLISHED / NOT PROMOTED and not certified-domain falsified.

The RL57 three-vertex-path pattern remains only a method barrier at the RL55/basic-interface scope.

## RL61 result

In the spanning subcase U=V(G), set

    A=A_1 union A_2 union A_3 union A_4,
    B=B_1 union B_2 union B_3 union B_4.

RL61 assessed exactly

    HC7-K44-SPANNING-SIDE-CHROMATIC-SUM:
    chi(G[A]) + chi(G[B]) <= 6.

For every finite graph and every vertex partition V(G)=A disjoint-union B,

    chi(G) <= chi(G[A]) + chi(G[B])

by combining optimal side colorings with disjoint palettes. Thus every actual RL61-domain member, having chi(G)=7, satisfies

    chi(G[A]) + chi(G[B]) >= 7.

Classification: HC7-K44-SPANNING-SIDE-CHROMATIC-SUM remains CANDIDATE / NOT ESTABLISHED and is not certified-domain falsified. The analytic lower bound is a method barrier: the <=6 candidate can hold on the stated counterexample domain only if that domain has already been eliminated independently.

Spanning U=V(G) eliminated: NO.
delta(G)>=8 narrowed: NO.
HC7-universal obligation genuinely reduced: NO.

First missing dependency: a genuinely independent non-color-lift structural mechanism eliminating or transforming the spanning minimum-model subcase.

FL-062 suspends the spanning K4,4 coloring route. The RL59 quotient-palette lift and RL61 side-chromatic-sum reformulation must not be immediately retried under renamed palette/coloring statements.

## RL62 candidate

RL62 assesses exactly the root-universal structural candidate:

    HC7-CRITICAL-7-CONNECTIVITY:
    every hypothetical minor-minimal HC7 counterexample is 7-connected.

Status on entry: CANDIDATE / NOT ESTABLISHED.

A proof would genuinely narrow every hypothetical HC7 counterexample and may create new structural leverage independent of the suspended spanning-coloring route. A source may be consumed only after exact theorem statement, hypotheses, applicability and source status are verified. No connectivity strength beyond what is actually proved or source-verified may be assumed.

First missing dependency on entry: a complete proof or exactly applicable checked source establishing 7-connectivity from the current minor-minimal/full-C7-critical HC7 baseline.

## Downstream obligations retained

HC7-DEGREE-SEVEN-EXISTENCE remains unproved; delta(G)>=8 remains open.

HC7-K44-MODEL-RELATIVE-DEGREE-ATTACHMENT remains open beyond RL56-P01.
HC7-K44-MODEL-UNION-DEGREE-ABSORPTION/ESCAPE remains open.
HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF remains open.
The spanning K4,4 coloring route is SUSPENDED by FL-062.

All degree-seven neighborhood/resource/Kempe/M3 work remains conditional at recorded scopes. RL51-P01 remains a scoped conditional payoff only. M3-CLIQUE-SEPARATOR-DICHOTOMY remains ADMITTED / UNPROVED. M3-CORE remains NOT CERTIFIED.

FL-043 through FL-062 and all retry conditions remain in force.

Programme ACTIVE.
