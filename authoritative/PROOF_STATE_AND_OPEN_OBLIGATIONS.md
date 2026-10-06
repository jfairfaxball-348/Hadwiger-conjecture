# HC7 proof state and open obligations

Status: CURRENT after RL59.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.
Correction/demotion: NONE.

## Classification preservation

RL59 changes no inherited mathematical theorem classification and no source classification.

RL55-P01 remains proved analytic mathematics exactly at minimum-total-size K4,4-model scope. RL56-P01 remains proved only as its conditional double-apex K7 payoff; RL56-C01 remains NOT ESTABLISHED. RL57-C01 and RL58-C01 remain NOT ESTABLISHED / NOT PROMOTED. RL59-C01 is also NOT ESTABLISHED / NOT PROMOTED.

RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 remain valid exactly at recorded scopes. RL47-P01 through RL49-P01 retain their pivotal-edge antecedent. RL51-P01 remains proved scoped analytic candidate-payoff sufficiency only. M3-CLIQUE-SEPARATOR-DICHOTOMY remains ADMITTED / UNPROVED.

FL-043 through FL-060 and all retry conditions remain in force. The anti-Collatz suspensions from RL40 and RL50 remain binding.

## Certified HC7-universal frontier

For every hypothetical minor-minimal HC7 counterexample G:
1. G is finite simple, chi(G)=7, and has no K7 minor;
2. every proper minor is 6-colorable, hence G is full-C7 critical in the repository sense;
3. every proper subgraph is 6-colorable and G is connected;
4. delta(G)>=7 by inherited RL6-P03 with HC7 applicability certified by RL52;
5. SRC-0025 remains checked_primary at theorem-statement/hypothesis level and implies that G contains a K4,4 minor.

The full subscription proof of SRC-0025 has not been independently reconstructed in the recent K4,4 sessions.

## Minimum K4,4 model state

Choose a legitimate K4,4 minor model minimizing total branch-set size and let U be the union of its eight branch sets.

RL55-P01 remains PROVED ANALYTIC MATHEMATICS exactly at this minimum-model scope: no proper nonempty connected subset of one branch set meets all four opposite attachment sets. No singleton branch-set, K4,4-subgraph, separator, independent-side, unique-cross-edge, or quotient-minimum-degree conclusion is licensed.

RL56-C01 remains NOT ESTABLISHED / NOT PROMOTED. RL56-P01 remains only the conditional payoff that a suitable adjacent exterior double apex yields K7.

RL57-C01, the universal in-union degree cap, remains NOT ESTABLISHED / NOT PROMOTED. No universal escape edge follows.

RL58-C01, the universal dense model-union K7 payoff, remains NOT ESTABLISHED / NOT PROMOTED and not certified-domain falsified.

## RL59-C01 — spanning quotient side-palette lift

Restrict to U=V(G) on the delta(G)>=8 residual. Let A=A_1 union A_2 union A_3 union A_4 and B=B_1 union B_2 union B_3 union B_4.

Contract each of the eight connected branch sets to obtain an eight-vertex minor Q with quotient vertices a_1,...,a_4,b_1,...,b_4. Because G is finite simple with delta(G)>=8, |V(G)|>=9. Since the eight nonempty branch sets partition V(G), at least one is non-singleton; hence Q is a proper minor. Therefore Q is 6-colorable.

Q contains K4,4 on the eight quotient vertices. Thus in every proper coloring phi of Q the palettes P_A(phi)={phi(a_i):1<=i<=4} and P_B(phi)={phi(b_j):1<=j<=4} are disjoint.

RL59-C01 asks whether some proper 6-coloring phi of Q can always be chosen such that G[A] is properly colorable from P_A(phi) and G[B] is properly colorable from P_B(phi). If so, the two disjoint side colorings combine to a proper coloring of G with at most six colors, contradicting chi(G)=7.

The conditional payoff is proved. The universal side-palette lift is not established by current authority. Contraction can erase internal side-union chromatic structure, and RL55-P01 does not bound that structure.

Status: NOT ESTABLISHED / NOT PROMOTED and not certified-domain falsified.

The fixed RL57 three-vertex-path stress test does not falsify RL59-C01: its branch-set quotient is K4,4 and each side-union is 2-colorable. It remains only a method barrier against RL55/basic-interface/dense-degree-only reasoning.

## RL59 outcome

Direct unconditional K7 consequence proved: NO.
Direct unconditional coloring contradiction proved: NO.
Conditional coloring contradiction under RL59-C01 lift: YES.
U=V(G) eliminated: NO.
delta(G)>=8 eliminated: NO.
HC7-universal graph-level residual genuinely narrowed: NO.
HC7-universal obligation genuinely reduced: NO.

Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.
Correction/demotion: NONE.

## First open universal dependency

HC7-K44-SPANNING-QUOTIENT-SIDE-PALETTE-LIFT.

Status: OPEN / NOT ESTABLISHED.

Because RL60 is a mandatory every-tenth-session audit, this dependency is not automatically the RL60 proof target. RL60 must first audit RL50-RL59, the intervening HC7 pivot, present HC7 applicability, and Collatz risk, then select one bounded RL61 successor.

## Downstream obligations retained

HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF remains open beyond RL58.
HC7-K44-MODEL-UNION-DEGREE-ABSORPTION/ESCAPE remains open.
HC7-K44-MODEL-RELATIVE-DEGREE-ATTACHMENT remains open beyond the conditional RL56-P01 payoff.
HC7-DEGREE-SEVEN-EXISTENCE remains unproved; delta(G)>=8 remains the active universal residual.
All degree-seven neighborhood/resource/Kempe/M3 work remains conditional at recorded scopes. M3-CORE remains NOT CERTIFIED.

## Exact successor

RL60 is READY / NOT STARTED and performs the mandatory progress/correction audit of RL50-RL59 under docs/TENTH_SESSION_PROGRESS_AUDIT.md.

Programme ACTIVE.
