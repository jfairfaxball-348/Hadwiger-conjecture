# RL51 M3 universal-payoff candidate gate report

Date: 2026-10-05.
Status: CLOSED/FROZEN on promotion.
Scope: one bounded universal-payoff gate at retained full-C7 degree-seven m=3,A=S scope.
Root: h(G) >= chi(G) for every finite simple graph.

## Preserved authority

BASE_HEAD: 01887ea7bc181d18fcf0d44f0d6d37ab29094f31.
Incoming root tree: 8cf14a95d7cfdcac1a405126ccb12cd020f3958b.
The live main ref matched the expected predecessor. sessions/RL51 did not exist at startup. Required RL50 authority and frozen provenance were consumed.

RL50 correction/demotion remains NONE. RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 survive exactly at recorded scopes. RL47-P01 through RL49-P01 remain conditional on an exterior pivotal separating edge. FL-043 through FL-053 remain in force.

No new mathematical source retrieval or mathematical numerical computation was used.

## C1 — M3-CLIQUE-SEPARATOR-DICHOTOMY

Status: ADMITTED FOR RL52 PROOF/FALSIFICATION; UNPROVED.

Exact candidate: for every retained full-C7 degree-seven m=3,A=S realization (G,v,H,S,F), either:
1. H has an S-rooted K6; or
2. G has a clique separator X with |X|<=6.

Universal-quantifier gate: PASS. No RL41 triple, star coloring, color pair, Kempe component, path, bridge or pivotal edge is fixed.

Independent-sufficiency gate: PASS. If H has an S-rooted K6, adjoining singleton {v} gives a K7 minor. Since d_G(v)=7, G has at least eight vertices, so this K7 minor is proper, contradicting proper-minor 6-colorability. If G has clique separator X and components C_1,...,C_r of G-X, each G[C_j union X] is a proper minor and hence 6-colorable. Every side coloring is injective on clique X. Permute labels on each side to agree on X, then glue; this gives a 6-coloring of G, contradicting chi(G)=7.

Changed-obstruction gate: PASS. The candidate is global in the actual graph rather than an A2 lift, bichromatic separation, pivotal-edge repair or Kempe-stability refinement.

No-hidden-finite-interface gate: PASS at formulation level. Arbitrary resource interiors, residual components and unbounded graph structure remain explicit.

Falsifiability gate: PASS. An exact falsifier is a retained full-C7 m=3,A=S realization having neither an S-rooted K6 in H nor a clique separator of order at most six.

Classification: RL51-P01 is the proved scoped analytic conditional payoff above, same-worker review only. It does NOT prove C1.

## C2 — universal five-color boundary extension

Status: REJECTED. Although its conclusion would contradict A2, it merely reopens the recorded interface-lift obstruction and hides arbitrary interiors/residual components unless the same missing extension theorem is independently proved.

## C3 — universal pivotal/Kempe entry

Status: REJECTED. Even universal existence of an RL47-type entry would yield only the RL47-RL49 necessary constraints, not an S-rooted K6 or direct contradiction. It also remains under FL-053.

## Stopping outcome and successor

RL51 stops under allowed outcome (1): exactly one candidate passes admission. C1 remains exploratory and unproved.

Exactly one RL52 task: on the no-S-rooted-K6 branch, prove or analytically falsify that the actual G has a clique separator X with |X|<=6, keeping arbitrary interiors and residual components explicit.

Correction/demotion: NONE.
Named inherited universal mathematical obligations genuinely reduced: NONE.

M3-CORE remains NOT CERTIFIED. The retained m=3,A=S configuration and full sharp Hadwiger remain open. All previously named M3 repair obligations remain open/not certified.

Failure/lesson packaging: authoritative/FAILURE_AND_LESSON_LEDGER.md is preserved byte-for-byte through FL-053; RL51 FL-054 is carried separately in authoritative/RL51_FAILURE_AND_LESSON_LEDGER_APPENDIX.md and frozen under sessions/RL51/checkpoint/. A later reconciliation may append it without rewriting frozen RL51 history.

Programme ACTIVE.
