# HC7 proof state and open obligations

Status: CURRENT after RL57.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.
Correction/demotion: NONE.

## Classification preservation

RL57 changes no inherited mathematical theorem classification and no source classification.

RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 remain valid exactly at their recorded scopes. RL47-P01 through RL49-P01 retain their conditional pivotal-edge scope.

RL51-P01 remains proved scoped analytic candidate-payoff sufficiency only. M3-CLIQUE-SEPARATOR-DICHOTOMY remains ADMITTED / UNPROVED on the retained full-C7 degree-seven m=3,A=S domain.

FL-043 through FL-058 and all recorded retry conditions remain in force. The anti-Collatz suspensions from RL40 and RL50 remain binding.

## Certified HC7-universal frontier

For every hypothetical minor-minimal HC7 counterexample G:
1. G is finite simple, chi(G)=7, and has no K7 minor;
2. every proper minor is 6-colorable, hence G is full-C7 critical in the repository sense;
3. every proper subgraph is 6-colorable and G is connected;
4. delta(G)>=7 by inherited RL6-P03 with HC7 applicability certified by RL52;
5. SRC-0025 remains checked_primary at theorem-statement/hypothesis level and implies that G contains a K4,4 minor.

The full subscription proof of SRC-0025 was not independently reconstructed in RL54-RL57.

## RL55-P01 — minimum-model branch-set irreducibility

Choose a legitimate K4,4 minor model minimizing total branch-set size. For a branch set X and opposite branch sets Y_1,...,Y_4, let T_j be the vertices of X having a neighbour in Y_j.

No proper nonempty connected subset of X meets all four T_j.

Consequences:
- if X-x remains connected, then x is the unique member of some T_j;
- every spanning tree of G[X] has at most four leaves;
- each leaf uniquely supports adjacency to an opposite branch set, and distinct leaves support distinct opposite branch sets.

Status: PROVED ANALYTIC MATHEMATICS at the minimum-model scope.

No singleton branch-set, K4,4-subgraph, induced-tree, unique-cross-edge, separator, independent-side, or quotient-minimum-degree conclusion is licensed.

## RL56 state retained

RL56-C01, universal existence of two adjacent connected exterior sets each attached to all eight branch sets, remains NOT ESTABLISHED / NOT PROMOTED.

RL56-P01 remains PROVED ANALYTIC MATHEMATICS only as a conditional payoff: if such exterior sets P,Q exist, then the K4,4 model supplies a K5 minor and P,Q extend it to K7.

No existence of P or Q is licensed.

## RL57-C01 — model-union degree cap / escape candidate

For every certified G on the delta(G)>=8 residual and every minimum-total-size K4,4 model M with union U, RL57-C01 proposed:

    there exists v in U with |N_G(v) intersect U| <= 7.

Status: NOT ESTABLISHED / NOT PROMOTED.

If RL57-C01 were proved, delta(G)>=8 in the ORIGINAL GRAPH would imply that the selected v has a neighbour in V(G)\U. This conditional implication is elementary. No universal escape edge is currently proved.

## RL57 interface counterpattern and barrier

Current authority permits an RL55-interface pattern with eight three-vertex path branch sets indexed by K4,4. Choose an alternating Hamilton cycle of K4,4. On the two cycle pairs incident with each branch set, use its two path endpoints as distinct singleton supporters; on each of the remaining two opposite-side pairs, join the corresponding three-vertex paths completely.

For every branch set, the four attachment sets are the two singleton endpoints and two copies of the whole path, so no proper nonempty connected subset meets all four. Thus the displayed interface satisfies the exact RL55-P01 irreducibility condition.

Every endpoint has one internal neighbour, one sparse cycle cross-neighbour, and six neighbours in the two complete opposite paths; each middle vertex has two internal neighbours and the same six complete-pair neighbours. Hence every displayed model vertex has exactly eight neighbours inside U.

Classification: METHOD BARRIER / COUNTERPATTERN at the RL55 model-interface scope. It is not a certified HC7 counterexample and does not establish that the displayed model is globally minimum-total-size. Therefore it does not falsify RL57-C01 in the certified domain.

Exact consequence: RL55-P01 plus the basic legitimate-model interface is insufficient to prove RL57-C01.

## RL57 outcome

delta(G)>=8 eliminated: NO.
Universal escape edge proved: NO.
HC7 graph-level residual genuinely narrowed in RL57: NO.
HC7-universal obligation genuinely reduced: NO.

Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.
Correction/demotion: NONE.

## First open universal dependency

**HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF.**

Exact first candidate for RL58: for every hypothetical minor-minimal HC7 counterexample G with delta(G)>=8 and every minimum-total-size K4,4 model M with union U,

    if |N_G(v) intersect U| >= 8 for every v in U,
    then G contains a K7 minor.

The RL58 proof mechanism must seek a direct K7 payoff from dense in-union adjacency using the full certified HC7 hypotheses. Merely rewriting the failed cap, repeating RL55-P01, or first deriving an escape edge is not a changed mechanism.

Status: OPEN / NOT ESTABLISHED.

## Downstream obligations retained

HC7-K44-MODEL-UNION-DEGREE-ABSORPTION/ESCAPE remains open.
HC7-K44-MODEL-RELATIVE-DEGREE-ATTACHMENT remains open beyond the conditional RL56-P01 payoff.
HC7-DEGREE-SEVEN-EXISTENCE remains unproved; delta(G)>=8 remains the active universal residual.
All degree-seven neighborhood/resource/Kempe/M3 work remains conditional at its recorded scope. M3-CORE remains NOT CERTIFIED.

## Exact successor

RL58 is READY / NOT STARTED and performs only the bounded HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF-GATE in RL58_HC7_K44_DENSE_MODEL_UNION_K7_PAYOFF_GATE_BRIEF.md.

Programme ACTIVE.
