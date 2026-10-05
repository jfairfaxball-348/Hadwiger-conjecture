# HC7 proof state and open obligations

Status: CURRENT after RL54.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.
Correction/demotion: NONE.

## Classification preservation

No inherited mathematical theorem changed classification in RL54.

RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 remain valid exactly at their recorded scopes. RL47-P01 through RL49-P01 retain their conditional pivotal-edge scope.

RL51-P01 remains proved scoped analytic candidate-payoff sufficiency only. M3-CLIQUE-SEPARATOR-DICHOTOMY remains ADMITTED / UNPROVED on the retained full-C7 degree-seven m=3,A=S domain.

FL-043 through FL-054 remain in force. RL54 adds FL-055, recording the K4,4-minor payoff barrier and its retry condition.

## Certified HC7-universal frontier

For every hypothetical minor-minimal HC7 counterexample G:
1. G is finite simple, chi(G)=7, and has no K7 minor;
2. every proper minor is 6-colorable, hence G is full-C7 critical in the repository sense;
3. every proper subgraph is 6-colorable and G is connected;
4. delta(G)>=7 by inherited RL6-P03 with HC7 applicability certified by RL52;
5. SRC-0025 is now checked_primary at theorem-statement/hypothesis level and implies that G contains a K4,4 minor.

The K4,4 conclusion is a genuine new root-facing structural reduction supplied by an externally inherited theorem whose source status was strengthened in RL54. RL54 does not claim an independent reconstruction of the long proof.

## SRC-0025 verification

Source: Ken-ichi Kawarabayashi and Bjarne Toft, *Any 7-Chromatic Graphs Has K7 Or K4,4 As A Minor*, Combinatorica 25 (2005), 327–353, DOI 10.1007/s00493-005-0019-1.

Verification basis: original Springer Nature article page, marked Original Paper, with authors, volume/pages/year/DOI and abstract statement that the paper proves the result stated in its title. Exact source classification after RL54: checked_primary. The full subscription proof was not independently reconstructed.

Exact theorem statement consumed: any 7-chromatic graph has K7 or K4,4 as a minor. No additional qualifier is stated in the primary theorem formulation. It applies to every finite simple graph in the HC7 domain.

Frozen RL6 source records remain historically unchanged and continue to record the pre-RL54 not_directly_checked state.

## RL54 payoff outcome

The universal K4,4-minor consequence does not itself contradict full-C7 criticality. K4,4 has chromatic number two, so a proper K4,4 minor is compatible with the requirement that every proper minor be 6-colorable.

The condition delta(G)>=8 is a condition on G. It does not automatically pass to a contracted K4,4 quotient and does not turn an arbitrary K4,4 minor model into a K7 minor.

Therefore delta(G)>=8 remains OPEN / NOT ELIMINATED.

## First open universal dependency

**HC7-K44-MINOR-MODEL-PAYOFF.** For every hypothetical minor-minimal HC7 counterexample G with delta(G)>=8 and every legitimate K4,4 minor model in G, derive either a K7 minor or an exact contradiction with the premise that every proper minor is 6-colorable.

Status: OPEN / NOT ESTABLISHED.

No K4,4 subgraph, induced K4,4, prescribed branch-set model, separator, or independent bipartite side may be assumed without proof.

## Downstream obligations retained

HC7-DEGREE-SEVEN-EXISTENCE remains unproved; delta(G)>=8 is still a residual branch. All degree-seven neighborhood/resource/Kempe/M3 work remains conditional at its recorded scope. M3-CORE remains NOT CERTIFIED.

## Exact successor

RL55 is READY / NOT STARTED and performs only the bounded HC7-K44-MINOR-MODEL-CRITICAL-AUGMENTATION-GATE in RL55_HC7_K44_MINOR_MODEL_CRITICAL_AUGMENTATION_GATE_BRIEF.md.

Programme ACTIVE.
