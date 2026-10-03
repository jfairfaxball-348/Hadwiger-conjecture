# RL30 evidence-linked session matrix — RL20 through RL29

Status: completed audit work; NOT PROMOTED.
Pinned base: dee47a50f0a1da072dca22cc1f0d6a76cd6b11ca.
Root: h(G)>=chi(G) for every finite simple graph.

"Named obligation changed" means a named mathematical obligation inherited independently of the session's newly created local sublemma.

| RL | Audited input / task | Audited result and exact scope | Verification/classification | Failure/correction status | Named obligation changed |
|---|---|---|---|---|---|
| RL20 | Mandatory RL10–RL19 audit | No theorem. Preserved RL13–RL19 exact scopes; identified RL14–RL19 repeated m=1 refinement and pivoted to untouched m=2, A=S. | Same-worker audit; inherited finite/package checks only at recorded scopes. | Correction/demotion NONE; FL-023 research-control lesson. | None. |
| RL21 | m=2, A=S pair; fixed joining edge, one non-singleton side, one rooted tree leaf, one selected defect | RL21-P01: for fixed defect, X,Y nonempty with X union Y={a,b}, seven repair patterns, p misses a,b. RL21-P02: only patterns X={a,b}, Y singleton admit the fixed direct one-endpoint recoloring to five colors on S. | Proved scoped analytic mathematics, same-worker review. | Other five patterns blocked at target-color exclusion; FL-024. | None. |
| RL22 | One fixed RL21 repair pattern X={a},Y={b}; one fixed disjoint star coloring c | RL22-P01: Z_a=empty because a has no T_2-neighbor. Corresponding a->beta recoloring is still uncertified at edge ax because c(x)!=beta is not forced. | Scoped analytic observation + stopping result. | No second orientation/coloring/pattern; FL-025. | None. |
| RL23 | Same fixed RL22 data, conditional branch c(x)=beta | The equality is compatible with all retained fixed-scope consequences; singleton beta on S does not exclude beta on exterior x. Recoloring remains blocked on ax. | Scoped analytic compatibility/stopping result. | No existence claim for a full C_7 realization; FL-026. | None. |
| RL24 | Same non-singleton m=2 setup; one replacement family {{x},T_2} | Gates 1–3 pass. Gate 4 fails to certify {x} as a resource because x is only known to cover the selected defect, not all seven cyclic nonedges. Gates 5–6 not reached. | Scoped analytic feasibility/stopping result. Local incidence schema is not a full critical graph. | FL-027. | None. |
| RL25 | One fixed cross-resource path-transfer family R_1=V(L) union V(P), R_2=T_2\V(P) | Gate 1 does not certify R_2 nonempty; V(P)=T_2 is not excluded. Gates 2–6 are NOT REACHED; minimum total size not invoked. | Scoped analytic stopping result. | No saturation realization or independence claim; FL-028. | None. |
| RL26 | Same fixed choices, conditional branch V(P)=T_2 | R_1 has a spanning path and contraction J=G/R_1 is a proper original-G minor. For one fixed six-coloring c of J, gamma is absent from every external neighbor of R_1. Reverse-greedy expansion colors y by gamma but stops at its predecessor. | Scoped analytic structural result + method barrier. | Saturation not excluded; FL-029. | None. |
| RL27 | Same saturation branch and same fixed quotient coloring c; fixed lists A | RL27-P01: G[R_1] is not A-list-colorable. RL27-P02: one inclusion-minimal induced obstruction K satisfies |A(u)|<=d_K(u) for every u. Endpoint upper bound d_K(x)<=1 is not certified. | Proved scoped analytic mathematics, same-worker review. | Tree/path incidence does not control original-G internal degree; FL-030. | None. |
| RL28 | Same branch, additionally x in K and one fixed z in N_K(x)\{w_1}; one proper coloring d of G-xz | RL28-P01: d(x)=d(z). RL28-P02: every non-d(x) color occurs on N_G(x)\{z}. These are lower-degree/color-saturation facts only. | Proved scoped analytic mathematics, same-worker review. | d is independent of c/A and witnesses are not localized to R_1 or K; FL-031. | None. |
| RL29 | Same fixed A,K,x,z,xz | Induced-vertex minimality of K does not decide A-list-colorability of K-xz. Neither colorability nor noncolorability is certified; no phi exists in authority and phi(x)=phi(z) is not reached. | Scoped analytic stopping/dependency result. | No edge-minimality inference; FL-032. | None. |

Evidence:
- authoritative/RL20_AUDIT_REPORT.md, RL20_SESSION_MATRIX.md, RL20_DEPENDENCY_SCOPE_AUDIT.md, RL20_COLLATZ_RISK_AND_VERDICT.md, RL20_CORRECTION_AND_DEMOTION_RECORD.md.
- authoritative/RL21_M2_S_COMPLETE_PAIR_LEAF_PRUNING_REPORT.md and RL21_PROOF_STATE_AND_RESIDUAL_LEDGER.md.
- authoritative/RL22_FIXED_DEFECT_TARGET_COLOR_BLOCKER_REPORT.md and RL22_PROOF_STATE_AND_RESIDUAL_LEDGER.md.
- authoritative/RL23_ONE_SIDED_LEAF_COLOR_COMPATIBILITY_REPORT.md and RL23_PROOF_STATE_AND_RESIDUAL_LEDGER.md.
- authoritative/RL24_STRICT_MINIMUM_TOTAL_SIZE_RESOURCE_FAMILY_EXCHANGE_REPORT.md and RL24_PROOF_STATE_AND_RESIDUAL_LEDGER.md.
- authoritative/RL25_CROSS_RESOURCE_PATH_TRANSFER_EXCHANGE_REPORT.md and RL25_PROOF_STATE_AND_RESIDUAL_LEDGER.md.
- authoritative/RL26_FULL_CRITICAL_PATH_SATURATION_MINOR_REPORT.md and RL26_PROOF_STATE_AND_RESIDUAL_LEDGER.md.
- authoritative/RL27_FIXED_COLOR_MINIMAL_LIST_OBSTRUCTION_REPORT.md and RL27_PROOF_STATE_AND_RESIDUAL_LEDGER.md.
- authoritative/RL28_EDGE_CRITICAL_EXTRA_NEIGHBOR_REPORT.md and RL28_PROOF_STATE_AND_RESIDUAL_LEDGER.md.
- authoritative/RL29_FIXED_EDGE_A_LIST_ESSENTIALITY_REPORT.md and RL29_PROOF_STATE_AND_RESIDUAL_LEDGER.md.

Audit conclusion: the mathematical statements remain internally consistent at their stated scopes, but RL21–RL29 collectively do not close any named inherited mathematical obligation.
