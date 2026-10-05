# HC7 proof state and open obligations

Status: CURRENT after RL55.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.
Correction/demotion: NONE.

## Classification preservation

RL55 changes no inherited theorem classification and no source classification.

RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 remain valid exactly at their recorded scopes. RL47-P01 through RL49-P01 retain their conditional pivotal-edge scope.

RL51-P01 remains proved scoped analytic candidate-payoff sufficiency only. M3-CLIQUE-SEPARATOR-DICHOTOMY remains ADMITTED / UNPROVED on the retained full-C7 degree-seven m=3,A=S domain.

FL-043 through FL-056 and all recorded retry conditions remain in force. The anti-Collatz suspensions from RL40 and RL50 remain binding.

## Certified HC7-universal frontier

For every hypothetical minor-minimal HC7 counterexample G:
1. G is finite simple, chi(G)=7, and has no K7 minor;
2. every proper minor is 6-colorable, hence G is full-C7 critical in the repository sense;
3. every proper subgraph is 6-colorable and G is connected;
4. delta(G)>=7 by inherited RL6-P03 with HC7 applicability certified by RL52;
5. SRC-0025 remains checked_primary at theorem-statement/hypothesis level and implies that G contains a K4,4 minor.

The full subscription proof of SRC-0025 was not independently reconstructed in RL54 or RL55.

## RL55-P01 — minimum-model branch-set irreducibility

Choose a legitimate K4,4 minor model minimizing total branch-set size. For a branch set X and opposite branch sets Y_1,...,Y_4, define T_j as the vertices of X having a neighbour in Y_j.

No proper nonempty connected subset of X meets all four T_j.

Consequences:
- if X-x remains connected, then x is the unique member of some T_j;
- every spanning tree of G[X] has at most four leaves;
- each leaf uniquely supports adjacency to an opposite branch set, and distinct leaves support distinct opposite branch sets.

Status: PROVED ANALYTIC MATHEMATICS at the minimum-model scope.

This does not imply singleton branch sets, a K4,4 subgraph, induced-tree branch sets, unique cross edges, a separator, independent sides, or quotient minimum degree.

## RL55 augmentation outcome

Contracting an internal edge of a branch set preserves a K4,4 model in the resulting proper minor. This is compatible with full-C7 criticality because that proper minor is required to be 6-colorable. Minimum model size inside G does not compare across to the contracted graph.

delta(G)>=8 remains an original-graph condition and is not transferred to the contracted quotient. RL55 therefore obtains no K7 minor and no proper minor of chromatic number at least seven from minimum-model criticality alone.

delta(G)>=8 eliminated: NO.
HC7 graph-level residual genuinely narrowed in RL55: NO.

## First open universal dependency

**HC7-K44-MODEL-RELATIVE-DEGREE-ATTACHMENT.** For every hypothetical minor-minimal HC7 counterexample G with delta(G)>=8 and a minimum-total-size K4,4 model, use the degree-eight condition in the original graph to force an explicit model-relative attachment configuration whose already-justified payoff is either a K7 minor or an exact contradiction with proper-minor 6-colorability.

Status: OPEN / NOT ESTABLISHED.

A candidate may not obtain this by repeating branch-set irreducibility, comparing model size across different graphs, transferring minimum degree to a quotient, or assuming stronger K4,4 structure.

## Downstream obligations retained

HC7-DEGREE-SEVEN-EXISTENCE remains unproved; delta(G)>=8 remains the active universal residual. All degree-seven neighborhood/resource/Kempe/M3 work remains conditional at its recorded scope. M3-CORE remains NOT CERTIFIED.

## Exact successor

RL56 is READY / NOT STARTED and performs only the bounded HC7-K44-MODEL-RELATIVE-DEGREE-ATTACHMENT-GATE in RL56_HC7_K44_MODEL_RELATIVE_DEGREE_ATTACHMENT_GATE_BRIEF.md.

Programme ACTIVE.
