# FL-055 packaging divergence note (PK-3) — append-only

Date: 2026-10-06. Origin: RL63 global audit. Classification: packaging/provenance note. It is not a mathematical correction, theorem demotion or source-status change.

The FL-055 text in the consolidated authoritative/FAILURE_AND_LESSON_LEDGER.md and the frozen RL54 appendix (sessions/RL54/checkpoint/RL54_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, blob f64fb26223a8bc06ae3f50bccf68f09891f221d9) were both written in RL54 commit b38901e, and they diverge in both directions:
- Heading. Consolidated: "K4,4-minor payoff barrier". Appendix: "verified K4,4-minor structure does not by itself pay off against full-C7 criticality".
- Source-status line. The consolidated text omits the appendix caveat "The full subscription proof was not independently reconstructed." (The caveat survives in PROOF_STATE and RL54_REPORT.)
- Each version contains sentences the other lacks: the barrier explanation, the lesson wording, and the retry-condition wording.

Neither text is overwritten. The appendix text is the frozen RL54 provenance. Where the consolidated entry is silent, the caveat "full subscription proof not independently reconstructed" governs SRC-0025. No classification changes.

Exact diff (consolidated "<" versus appendix ">"):

```diff
1c1
< # FL-055 — K4,4-minor payoff barrier
---
> # FL-055 — verified K4,4-minor structure does not by itself pay off against full-C7 criticality
7c7
< SRC-0025 is now checked_primary at theorem-statement/hypothesis level from the original Springer Nature publication record. Every hypothetical HC7 counterexample therefore contains a K4,4 minor.
---
> SRC-0025 is verified at theorem-statement/hypothesis level from the original Springer Nature publication record. Its title theorem states that any 7-chromatic graph has K7 or K4,4 as a minor, with no additional qualifier in the stated result. Hence every hypothetical HC7 counterexample contains a K4,4 minor.
9c9
< First missing implication: from an arbitrary K4,4 branch-set model in a finite simple full-C7-critical, K7-minor-free graph with delta(G)>=8, derive either a K7 minor or a proper minor of chromatic number at least seven. The K4,4 minor alone is compatible with proper-minor 6-colorability because K4,4 is 2-colorable.
---
> This is only a structural reduction. K4,4 is 2-colorable, so its appearance as a proper minor is compatible with every proper minor being 6-colorable. The condition delta(G)>=8 concerns G and does not automatically pass to the contracted K4,4 quotient.
11c11,13
< Lesson: do not replace K4,4 minor by a subgraph, induced subgraph, separator, prescribed branch-set model, or independent bipartite side. A retry must work with an arbitrary legitimate minor model and prove every normalization it consumes.
---
> First missing implication: from an arbitrary K4,4 branch-set model in a finite simple full-C7-critical, K7-minor-free graph with delta(G)>=8, derive either a K7 minor or a proper minor of chromatic number at least seven.
> 
> Do not replace K4,4 minor by K4,4 subgraph, induced subgraph, prescribed branch-set model, separator, or independent bipartite side.
14,15c16,19
< Source-status change: SRC-0025 not_directly_checked -> checked_primary in current authority; frozen historical source records remain unchanged.
< Retry condition: RL55 may choose a K4,4 model minimizing total branch-set size and audit only proved consequences of that minimality plus full-C7 criticality. No broad literature campaign and no return to degree-seven/resource/Kempe/M3 machinery.
---
> Source-status change: SRC-0025 not_directly_checked -> checked_primary. The full subscription proof was not independently reconstructed.
> 
> Retry condition: RL55 may choose one K4,4 model minimizing total branch-set size and audit exactly what that minimality plus full-C7 criticality forces. Every model-minimal consequence must be proved before use. No broad literature campaign and no return to degree-seven/resource/Kempe/M3 machinery.
> 
18,19d21
< 
< ---
```
