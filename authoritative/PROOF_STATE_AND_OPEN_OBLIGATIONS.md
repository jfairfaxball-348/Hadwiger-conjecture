# HC7 proof state and open obligations

Status: CURRENT after RL56.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.
Correction/demotion: NONE.

## Classification preservation

RL56 changes no inherited mathematical theorem classification and no source classification.

RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 remain valid exactly at their recorded scopes. RL47-P01 through RL49-P01 retain their conditional pivotal-edge scope.

RL51-P01 remains proved scoped analytic candidate-payoff sufficiency only. M3-CLIQUE-SEPARATOR-DICHOTOMY remains ADMITTED / UNPROVED on the retained full-C7 degree-seven m=3,A=S domain.

FL-043 through FL-057 and all recorded retry conditions remain in force. The anti-Collatz suspensions from RL40 and RL50 remain binding.

## Certified HC7-universal frontier

For every hypothetical minor-minimal HC7 counterexample G:
1. G is finite simple, chi(G)=7, and has no K7 minor;
2. every proper minor is 6-colorable, hence G is full-C7 critical in the repository sense;
3. every proper subgraph is 6-colorable and G is connected;
4. delta(G)>=7 by inherited RL6-P03 with HC7 applicability certified by RL52;
5. SRC-0025 remains checked_primary at theorem-statement/hypothesis level and implies that G contains a K4,4 minor.

The full subscription proof of SRC-0025 was not independently reconstructed in RL54-RL56.

## RL55-P01 — minimum-model branch-set irreducibility

Choose a legitimate K4,4 minor model minimizing total branch-set size. For a branch set X and opposite branch sets Y_1,...,Y_4, let T_j be the vertices of X having a neighbour in Y_j.

No proper nonempty connected subset of X meets all four T_j.

Consequences:
- if X-x remains connected, then x is the unique member of some T_j;
- every spanning tree of G[X] has at most four leaves;
- each leaf uniquely supports adjacency to an opposite branch set, and distinct leaves support distinct opposite branch sets.

Status: PROVED ANALYTIC MATHEMATICS at the minimum-model scope.

No singleton branch-set, K4,4-subgraph, induced-tree, unique-cross-edge, separator, independent-side, or quotient-minimum-degree conclusion is licensed.

## RL56-C01 — exterior double-apex attachment candidate

Let M=(A_1,...,A_4;B_1,...,B_4) be a minimum-total-size K4,4 model in a certified delta(G)>=8 graph and let U be the union of the eight branch sets.

Candidate: there exist disjoint nonempty connected sets P,Q subseteq V(G)\U such that P and Q are adjacent and each is adjacent to every one of A_1,...,A_4,B_1,...,B_4.

Status: NOT ESTABLISHED / NOT PROMOTED as a universal existence theorem.

## RL56-P01 — conditional double-apex payoff

Under the hypotheses above, if P and Q with the stated attachment properties exist, then G contains K7 as a minor.

Proof: the five disjoint connected branch sets
- A_1 union B_1,
- A_2 union B_2,
- A_3 union B_3,
- A_4,
- B_4
form a K5 minor using only the K4,4 cross adjacencies. P and Q are disjoint connected branch sets adjacent to each other and to all five, giving a K7 minor.

Status: PROVED ANALYTIC MATHEMATICS, conditional at the stated model-relative attachment scope.

This conditional payoff does not establish that P or Q exists.

## RL56 degree-attachment outcome

RL56 genuinely uses delta(G)>=8 only in the original graph. The intended inference was to turn degree-eight surplus into an attachment outside U.

Current authority does not support that inference. RL55-P01 controls indispensability for connectivity and required opposite-side adjacency, but not neighbour multiplicity in one opposite branch set, internal degree, or total degree inside U.

A concrete allowed local degree-absorption pattern is a spanning-tree leaf x of a branch set X that uniquely supports one opposite branch Y_1, has one internal neighbour in X, and has seven distinct neighbours in Y_1. Then d_G(x)=8 with no new attachment type. This is not asserted to realize all HC7 hypotheses.

delta(G)>=8 eliminated: NO.
HC7 graph-level residual genuinely narrowed in RL56: NO.
HC7-universal obligation genuinely reduced: NO.

## First open universal dependency

**HC7-K44-MODEL-UNION-DEGREE-ABSORPTION/ESCAPE.**

Exact first candidate for RL57: for every hypothetical minor-minimal HC7 counterexample G with delta(G)>=8 and every minimum-total-size K4,4 model M, if U is the union of its eight branch sets, then there exists v in U with

    |N_G(v) intersect U| <= 7.

If proved, the original-graph inequality d_G(v)>=8 forces at least one neighbour outside U. No stronger attachment or K7 conclusion follows automatically.

Status: OPEN / NOT ESTABLISHED.

## Downstream obligations retained

HC7-K44-MODEL-RELATIVE-DEGREE-ATTACHMENT remains open beyond the conditional RL56-P01 payoff.
HC7-DEGREE-SEVEN-EXISTENCE remains unproved; delta(G)>=8 remains the active universal residual.
All degree-seven neighborhood/resource/Kempe/M3 work remains conditional at its recorded scope. M3-CORE remains NOT CERTIFIED.

## Exact successor

RL57 is READY / NOT STARTED and performs only the bounded HC7-K44-MODEL-UNION-DEGREE-ABSORPTION-ESCAPE-GATE in RL57_HC7_K44_MODEL_UNION_DEGREE_ABSORPTION_ESCAPE_GATE_BRIEF.md.

Programme ACTIVE.
