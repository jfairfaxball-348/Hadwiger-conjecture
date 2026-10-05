# RL54 HC7 delta>=8 / K4,4 payoff gate report

Date: 2026-10-05.
Status: CLOSED/FROZEN on promotion.
Root: HC7 only.
BASE_HEAD: 292771060190fb6407a17cbfe532dc4e8f78d56f.
BASE_TREE: 8f5d2b9fff5c0377803850e80ace41f8e372c3a9.
AUTHORITATIVE_TREE: be2c0a00c03b18dc1a019418c5f5766470cb4293.

Start gate passed: live main matched BASE_HEAD, sessions/RL54 was absent, and RL54 was the unique incoming session. Frozen RL1-RL53 records and all inherited theorem scopes were preserved. Correction/demotion: NONE.

## Gate A — SRC-0025

Verified source: Ken-ichi Kawarabayashi and Bjarne Toft, *Any 7-Chromatic Graphs Has K7 Or K4,4 As A Minor*, Combinatorica 25 (2005), 327–353, DOI 10.1007/s00493-005-0019-1.

Primary location: https://link.springer.com/article/10.1007/s00493-005-0019-1

The Springer Nature page identifies the Original Paper, authors, volume/pages/year/DOI, and states in the abstract that the paper proves the result stated in its title. No additional qualifier is stated in that theorem formulation.

Classification after RL54: checked_primary at theorem-statement/hypothesis level. The full subscription proof was not independently reconstructed.

Therefore every finite simple 7-chromatic graph has a K7 minor or K4,4 minor. Every hypothetical HC7 counterexample, having no K7 minor, contains a K4,4 minor.

Frozen RL6 source records remain unchanged historical provenance and still record the earlier not_directly_checked status.

## Gate B — payoff

The K4,4 conclusion does not contradict proper-minor 6-colorability: K4,4 is 2-colorable. The condition delta(G)>=8 is on G and need not survive contractions/deletions producing the K4,4 minor.

No current proved authority upgrades an arbitrary K4,4 branch-set model to K7 or to a non-6-colorable proper minor. No subgraph, induced-subgraph, separator, prescribed-model or singleton-side strengthening was assumed.

First missing dependency: HC7-K44-MINOR-MODEL-PAYOFF.

## Classification

Every hypothetical minor-minimal HC7 counterexample certified to contain K4,4 minor: YES.
delta(G)>=8 eliminated: NO.
HC7-universal obligation genuinely reduced: YES, structurally; no branch eliminated.
Inherited mathematical theorem classification changes: NONE.
Source-status change: SRC-0025 not_directly_checked -> checked_primary in current authority.
Correction/demotion: NONE.
FL-055 records the payoff barrier and retry condition.

## Successor

RL55 — HC7-K44-MINOR-MODEL-CRITICAL-AUGMENTATION-GATE.

Changed mechanism: operate on an arbitrary K4,4 branch-set model, optionally chosen minimal in total branch-set size, and prove all consequences before use. Test whether that model-level structure plus full-C7 criticality and delta(G)>=8 yields K7 or a proper-minor coloring contradiction. Stop at the first further missing dependency.

Programme ACTIVE.
