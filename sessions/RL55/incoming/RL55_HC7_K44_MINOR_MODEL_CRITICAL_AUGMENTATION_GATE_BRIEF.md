# RL55 HC7 K4,4 minor-model critical augmentation gate brief

Status: READY / NOT STARTED.
Programme ACTIVE.
Root: HC7 only.

Follow AGENTS.md, START_HERE.md, HC7_RESEARCH_PROGRAMME.md, PROOF_STATE_AND_OPEN_OBLIGATIONS.md, RL55_STATE.md, RL54_REPORT.md, RL54_PROOF_STATE_AND_RESIDUAL_LEDGER.md, FAILURE_AND_LESSON_LEDGER.md, RL54_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, RL51_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and docs/RESEARCH_RECOVERY_PROTOCOL.md.

Preserve all inherited theorem scopes, FL-043 through FL-055, and correction/demotion NONE.

## Certified domain

Work only with a hypothetical minor-minimal HC7 counterexample G with:
- G finite simple, chi(G)=7, no K7 minor;
- every proper minor 6-colorable;
- delta(G)>=8;
- a K4,4 minor, certified by RL54/SRC-0025.

A K4,4 minor is not a K4,4 subgraph.

## Single changed mechanism

Choose a legitimate K4,4 minor model with disjoint connected branch sets A1,...,A4 and B1,...,B4, every Ai adjacent to every Bj.

If useful, choose a model minimizing the total number of vertices in its eight branch sets. This is only a finite-choice normalization. Prove every consequence before using it. Do not assume singleton branch sets, induced trees, unique cross edges, a separator, independent sides, or quotient minimum degree.

Assess exactly whether model minimality plus full-C7 criticality, K7-minor-freeness and delta(G)>=8 forces:
1. a K7 minor; or
2. a proper minor that is not 6-colorable.

Stop at the first further missing universal dependency.

## Prohibitions

No broad literature campaign, graph/coloring/resource census, numerical computation, degree-seven neighborhood work, RL31-RL49 resource/Kempe/pivotal-edge mechanisms, or M3-CLIQUE-SEPARATOR-DICHOTOMY work.

## Checkpoint

State the exact model normalization and proved consequences; whether delta(G)>=8 is eliminated; whether the universal residual was narrowed; the first missing dependency; provenance; classification changes; correction/demotion; and one exact bounded successor.

End with the AGENTS.md recommendation line.
