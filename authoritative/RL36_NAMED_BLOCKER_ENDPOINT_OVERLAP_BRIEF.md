# RL36 named-blocker endpoint-overlap brief

Status: READY / NOT STARTED.
Scope: one bounded recovery from RL35-P01 / FL-038. Programme ACTIVE.

Follow AGENTS.md, authoritative/START_HERE.md, docs/RESEARCH_RECOVERY_PROTOCOL.md, authoritative/RL35_PROOF_STATE_AND_RESIDUAL_LEDGER.md, authoritative/RL35_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and the RL35 incoming provenance named there. Preserve RL34-P01/FL-037, RL33-P01/FL-036, RL32-P01/FL-035, RL31-P01/FL-034, and the RL35 choice discipline exactly.

Keep full sharp Hadwiger as root: h(G) >= chi(G) for every finite simple graph.

Retain the same m=3, A=S fixed-choice setup and exact final data C,T,Q,P,g,a,w,h, with I=V(P)\(C union {w}). Preserve RL35-P01 exactly.

If the RL31 profile is all-SAT, record it and STOP. If EQ holds, h=g, record the exact RL35 EQ profile and STOP; do not invent a substitute mechanism.

Only in NEQ retain: g<h; g misses C but is covered by I; h misses C union I=T-{w}; both endpoints of h have no T-neighbor outside w and at least one is adjacent to w; h is the first C-miss not repaired by I.

Execute exactly one named-pair endpoint-overlap audit:

1. Determine whether the already named g and h are vertex-disjoint or share an endpoint. Do not choose another nonedge.
2. If disjoint, record that exact ordered blocker profile and STOP. Do not inspect cyclic distance through other nonedges.
3. If they share endpoint x, prove or reject: x has no I-neighbor because x is an endpoint of h, while g is covered by I, so the I-supported endpoint of g must be its other endpoint.
4. If proved, compare that forced endpoint only with the already fixed endpoint a of g. Determine whether x=a or x!=a forces any additional T-neighborhood statement or contradiction. Do not choose an I-support vertex unless uniquely forced.
5. STOP after this audit.

Target M3-NAMED-BLOCKER-OVERLAP: determine whether overlap of the named NEQ pair forces the support endpoint of g, sharpens the leaf-contact profile, or yields a contradiction.

No second deletion, MISS side, tree, closure, joining edge, family, coloring, blocker, or arbitrary other cyclic nonedge. Do not enter m=4 or return to suspended m=2. No broad graph, coloring, list, neighborhood-subset, cyclic-distance, or seven-nonedge census. New mathematical source retrieval and numerical computation are zero by default.

Checkpoint exact frontier, obligation reduction, failure lesson/retry condition, and continue/finish recommendation under AGENTS.md.
