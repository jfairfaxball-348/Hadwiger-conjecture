# HC7 proof state and open obligations

Status: CURRENT after RL58.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.
Correction/demotion: NONE.

## Classification preservation

RL58 changes no inherited mathematical theorem classification and no source classification.

RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 remain valid exactly at their recorded scopes. RL47-P01 through RL49-P01 retain their conditional pivotal-edge scope.

RL51-P01 remains proved scoped analytic candidate-payoff sufficiency only. M3-CLIQUE-SEPARATOR-DICHOTOMY remains ADMITTED / UNPROVED on the retained full-C7 degree-seven m=3,A=S domain.

FL-043 through FL-059 and all recorded retry conditions remain in force. The anti-Collatz suspensions from RL40 and RL50 remain binding.

## Certified HC7-universal frontier

For every hypothetical minor-minimal HC7 counterexample G:
1. G is finite simple, chi(G)=7, and has no K7 minor;
2. every proper minor is 6-colorable, hence G is full-C7 critical in the repository sense;
3. every proper subgraph is 6-colorable and G is connected;
4. delta(G)>=7 by inherited RL6-P03 with HC7 applicability certified by RL52;
5. SRC-0025 remains checked_primary at theorem-statement/hypothesis level and implies that G contains a K4,4 minor.

The full subscription proof of SRC-0025 was not independently reconstructed in RL54-RL58.

## Minimum K4,4 model state

Choose a legitimate K4,4 minor model minimizing total branch-set size and let U be the union of its eight branch sets.

RL55-P01 remains PROVED ANALYTIC MATHEMATICS exactly at this minimum-model scope: no proper nonempty connected subset of one branch set meets all four opposite attachment sets. Its recorded spanning-tree consequences remain valid; no singleton branch-set, K4,4-subgraph, separator, independent-side, unique-cross-edge, or quotient-minimum-degree conclusion is licensed.

RL56-C01, universal existence of an exterior adjacent double apex attached to all eight branch sets, remains NOT ESTABLISHED / NOT PROMOTED. RL56-P01 remains PROVED ANALYTIC MATHEMATICS only as the conditional payoff that such P,Q yield K7.

RL57-C01, the universal in-union degree cap, remains NOT ESTABLISHED / NOT PROMOTED. No universal escape edge follows.

## RL58-C01 — dense model-union K7 payoff

For every certified G on the delta(G)>=8 residual and every minimum-total-size K4,4 model M with union U, RL58-C01 proposed:

    if |N_G(v) intersect U|>=8 for every v in U,
    then G contains a K7 minor.

Status: NOT ESTABLISHED / NOT PROMOTED and not certified-domain falsified.

The premise concerns G[U] in the ORIGINAL GRAPH, not a contracted quotient.

The inherited K4,4 model gives a K5 minor with branch sets A_1 union B_1, A_2 union B_2, A_3 union B_3, A_4, B_4, but those five sets collectively consume all eight original K4,4 branch sets. Current authority has no universal theorem converting dense adjacency inside U into a seven-way connected pairwise-adjacent repartition or equivalent augmentation.

The fixed RL57 three-vertex-path interface remains a METHOD BARRIER / COUNTERPATTERN at the RL55-interface scope. It blocks any inference based only on RL55-P01, the basic model interface, or dense in-union degree, but is not a certified HC7 counterexample and does not falsify RL58-C01.

## RL58 outcome

New direct K7 consequence proved: NO.
Universal escape edge proved: NO.
delta(G)>=8 eliminated: NO.
HC7 graph-level residual genuinely narrowed in RL58: NO.
HC7-universal obligation genuinely reduced: NO.

Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.
Correction/demotion: NONE.

## First open universal dependency

HC7-K44-SPANNING-DENSE-MODEL-CRITICAL-REPARTITION/AUGMENTATION.

The sharp bounded subcase is U=V(G). There is then no exterior vertex, so the next changed mechanism must use proper-minor 6-colorability / HC7 criticality to develop and assess one concrete K5-to-K7 repartition/augmentation candidate. A statement merely renaming "G contains K7" is not admissible.

Status: OPEN / NOT ESTABLISHED.

## Downstream obligations retained

HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF remains open beyond RL58.
HC7-K44-MODEL-UNION-DEGREE-ABSORPTION/ESCAPE remains open.
HC7-K44-MODEL-RELATIVE-DEGREE-ATTACHMENT remains open beyond the conditional RL56-P01 payoff.
HC7-DEGREE-SEVEN-EXISTENCE remains unproved; delta(G)>=8 remains the active universal residual.
All degree-seven neighborhood/resource/Kempe/M3 work remains conditional at its recorded scope. M3-CORE remains NOT CERTIFIED.

## Exact successor

RL59 is READY / NOT STARTED and performs only the bounded HC7-K44-SPANNING-DENSE-MODEL-CRITICAL-REPARTITION-GATE in RL59_HC7_K44_SPANNING_DENSE_MODEL_CRITICAL_REPARTITION_GATE_BRIEF.md.

Programme ACTIVE.
