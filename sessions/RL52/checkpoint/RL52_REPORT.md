# RL52 HC7 root-coverage audit report

Date: 2026-10-05.
Status: CLOSED/FROZEN on promotion.
Scope: one bounded provenance-first coverage audit from the HC7 root toward inherited degree-seven/local machinery.
Root: HC7 only — every finite simple graph G with chi(G)=7 must contain K7 as a minor.

## Start gate and preservation

BASE_HEAD: dcd5e713d135089dedebffb90a599d34f0eaca43.
BASE_TREE: ce91fd3a85dbe9a91ff904159261a10a0b4ca8af.

The live main ref matched the expected predecessor. sessions/RL52 did not exist at startup. RL52 was the unique incoming numbered session and authoritative/RL52_HC7_ROOT_COVERAGE_GATE_BRIEF.md was the sole current brief.

The 2026-10-05 non-RL target amendment is preserved exactly. All frozen RL1-RL51 records remain unchanged. RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 survive exactly at recorded scopes; RL47-P01 through RL49-P01 retain their pivotal-edge antecedent. RL51-P01 remains only a scoped conditional payoff theorem. M3-CLIQUE-SEPARATOR-DICHOTOMY remains ADMITTED / UNPROVED. FL-043 through FL-054 and all retry conditions remain in force.

Correction/demotion at entry: NONE.
New external mathematical source retrieval: 0.
New mathematical numerical computation: 0.
Graph/coloring/resource census: 0.
New local Kempe/refinement mathematics: 0.

## Certified HC7 coverage arrows

### RL52-C01 — minor-minimal baseline

If HC7 is false, choose a K7-minor-free finite simple graph G with chi(G)=7 minimal under the minor relation among such counterexamples. Then every proper minor of G is 6-colorable.

Classification: elementary reduction already recorded in authoritative/HC7_RESEARCH_PROGRAMME.md; RL52 rechecked applicability but claims no new theorem credit.

Consequences: G is full-C7 critical in the repository sense; every proper subgraph is 6-colorable; G is connected; and the elementary extension argument gives delta(G)>=6.

Universal over every hypothetical minor-minimal HC7 counterexample: YES.

### RL52-C02 — inherited strengthening to delta(G)>=7

Exact statement: every hypothetical minor-minimal HC7 counterexample satisfies delta(G)>=7.

Classification: proved inherited analytic consequence; HC7 applicability certified by RL52. This is not a new RL52 mathematical theorem.

Exact provenance:
- sessions/RL6/RL6_RECOVERY_REPORT.md, RL6-P03 star-fold context;
- sessions/RL6/RL6_PROOF_STATE_AND_RESIDUAL_LEDGER.md;
- sessions/RL10/checkpoint/DEPENDENCY_SCOPE_AUDIT.md.

RL6-P03 proves alpha(G[N(v)])<=d(v)-5 in every full-C7 critical graph. If d(v)=6, this forces alpha(G[N(v)])<=1, so N(v) is a K6; then v together with N(v) is a K7, contradicting the K7-minor-free HC7 counterexample premise.

Universal over every hypothetical minor-minimal HC7 counterexample: YES.

### RL52-C03 — exhaustive first degree split

Every such G satisfies exactly one of:
1. G has a vertex of degree seven; or
2. delta(G)>=8.

Classification: elementary exhaustive case split after RL52-C02.

Universal: YES.

## First uncertified coverage arrow

The first missing universal arrow is:

For every finite simple G with chi(G)=7, no K7 minor, and every proper minor 6-colorable, there exists v in V(G) with d_G(v)=7.

Equivalently, under the certified delta(G)>=7 baseline, prove that the residual branch delta(G)>=8 is impossible.

Classification: OPEN / NOT SOURCE-VERIFIED at the required repository scope.

Exact retained evidence:
- sessions/RL6/RL6_RECOVERY_REPORT.md explicitly leaves every vertex degree at least eight as a residual;
- sessions/RL6/RL6_PROOF_STATE_AND_RESIDUAL_LEDGER.md retains every degree at least eight;
- sessions/RL10/checkpoint/DEPENDENCY_SCOPE_AUDIT.md states that the minimum-degree argument does not force a degree-seven vertex to exist;
- authoritative/HC7_RESEARCH_PROGRAMME.md and authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md prohibit assuming degree-seven existence without a proved/source-verified bridge.

Residual universal branch: delta(G)>=8.

Because this arrow fails proof admission, RL52 does not audit H[S]=K7-C7 exhaustiveness, resource-case exhaustiveness, m=3,A=S, the RL41 attachment triple, fixed colorings, Kempe components, pivotal edges, or M3-CLIQUE-SEPARATOR-DICHOTOMY as HC7-facing branches.

## Checkpoint classification

HC7 coverage arrows certified:
- root negation -> minor-minimal counterexample;
- minor-minimal -> proper-minor-six-colorable / full-C7 critical;
- full-C7 critical -> proper subgraphs 6-colorable, connected, delta(G)>=6;
- inherited RL6-P03 plus K7-minor-freeness -> delta(G)>=7;
- delta(G)>=7 -> exhaustive split: degree-seven vertex exists OR delta(G)>=8.

First uncertified arrow: exclusion of delta(G)>=8 / universal existence of a degree-seven vertex.

Universal residual branch: delta(G)>=8.

Inherited theorem classification changes: NONE.
Correction/demotion: NONE.

HC7-universal obligation genuinely reduced: YES, as a coverage/provenance result. HC7-UNIVERSAL-STRUCTURE is certified through delta(G)>=7. No new mathematical theorem was proved and HC7 itself is not closed on any exhaustive branch beyond that structural restriction.

## Exact bounded successor

RL53 — HC7-DEGREE-SEVEN-EXISTENCE-GATE.

At exactly the minor-minimal HC7 baseline with certified delta(G)>=7, prove or exactly source-verify the statement that some vertex has degree seven, equivalently eliminate delta(G)>=8. If a classical structural theorem is load-bearing but only weakly verified in the repository, perform one bounded exact source-verification task for that theorem rather than importing it from memory. Do not descend into degree-seven neighborhood/resource/Kempe/M3 work until this gate passes.

Programme ACTIVE.
