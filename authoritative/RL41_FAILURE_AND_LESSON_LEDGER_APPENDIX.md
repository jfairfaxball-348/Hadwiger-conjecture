# FL-044 — individual boundary covers plus union do not force simultaneous rooted-K6 selection

Date: 2026-10-04.
Origin: RL41 direct three-resource rooted-K6 boundary-selection assessment.
Classification: boundary-interface falsification / recovery lesson accompanying RL41-P01; not a mathematical error, theorem demotion, source-status change, full graph counterexample, or finite computational certificate.

Expectation tested: whether the three attachment sets, using only the premises that each A_i is a C7 vertex cover and A_1 union A_2 union A_3=S, always admit distinct roots and a common independent three-set J sufficient for the direct rooted-K6 assembly.

Actual observation: no. The explicit symbolic triple

    A_1={u_1,u_3,u_5,u_6},
    A_2={u_0,u_1,u_3,u_5},
    A_3={u_1,u_2,u_4,u_6}

satisfies every stated boundary-set axiom but has no common admissible J at all.

First failed implication: the passage from three individual C7 cover conditions plus union=S to simultaneous three-resource boundary selection.

Surviving valid scope: the conditional branch-set assembly itself is valid. If suitable roots and J exist, the six branch sets form an S-rooted K6 in H and adding {v} gives a K7 minor in G at the retained full-C7 critical scope.

Downstream effect: M3-DIRECT-ROOTED-K6-SELECTION is false at the boundary-set scope. This does not demote RL39-P01, the RL40 audit, inherited resource-family results, M3-CORE, or any earlier scoped theorem. The retained m=3,A=S configuration and full Hadwiger root remain open.

Lesson: individual attachment-cover data are too coarse for this direct universal selection. Do not respond by enumerating more boundary triples. A retry requires a genuinely additional cross-resource consequence derived from the original maximum partial resource-family semantics.

Correction/demotion: NONE.

Retry condition: audit this exact counterpattern against the original RL13 maximum partial resource-family definition, pairwise joining-edge semantics, exterior/disjointness conditions, and maximality consequences. Only a proved additional cross-A_i constraint may reopen direct selection.

Selected successor: RL42 one bounded maximum-resource boundary-compatibility audit on this exact counterpattern.

Sources/computation: zero new mathematical source retrieval and zero mathematical numerical computation.
Programme ACTIVE.
