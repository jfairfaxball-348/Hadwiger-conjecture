# RL26 — bounded full-critical path-saturation minor input-development gate

**SOLE INCOMING RL26 BRIEF. READY / NOT STARTED.**
Prepared from RL25's fixed recovery task at closeout on 2026-10-02 Europe/Madrid.

## Start gate and root

Follow AGENTS.md, authoritative/START_HERE.md, docs/RESEARCH_RECOVERY_PROTOCOL.md and the exact current records below. Pin live main, compare it with the RL25 promotion commit supplied in the kickoff, snapshot incoming authority and confirm RL26 is unique before mathematics. Investigate any mismatch before consuming authority.

Keep full sharp Hadwiger as the root:

    h(G) >= chi(G)

for EVERY finite simple graph, with both values zero on the empty graph. Either a complete rigorous proof or an actual rigorously verified finite counterexample is legitimate.

Read:
- RL25_SESSION_STATE_AND_RL26_KICKOFF.md;
- RL25_CROSS_RESOURCE_PATH_TRANSFER_EXCHANGE_REPORT.md;
- RL25_PROOF_STATE_AND_RESIDUAL_LEDGER.md;
- RL25_FAILURE_AND_LESSON_LEDGER_APPENDIX.md;
- RL25_PREPARED_RECOVERY_TASK.md;
- RL25_SOURCE_QUESTION_AND_LIMITS.md;
- RL24_STRICT_MINIMUM_TOTAL_SIZE_RESOURCE_FAMILY_EXCHANGE_REPORT.md;
- PROOF_STATE_AND_OPEN_OBLIGATIONS.md;
- FAILURE_AND_LESSON_LEDGER.md;
- DEPENDENCY_MAP.md;
- RL13_CRITICAL_CONNECTED_RESOURCE_REPORT.md;
- RL21_M2_S_COMPLETE_PAIR_LEAF_PRUNING_REPORT.md;
- RL22_FIXED_DEFECT_TARGET_COLOR_BLOCKER_REPORT.md.

Preserve RL25's gate-1 stopping result and FL-028 exactly. Preserve RL24/FL-027, RL23/FL-026, RL22-P01/FL-025, RL21-P01/P02/FL-024, and the RL20 NONE correction/demotion result/FL-023 exactly. The inherited m=1 failed-anchor/private-endpoint line stays suspended.

## Exact retained domain and fixed choices

Retain full C_7: G is finite simple with chi(G)=7, every proper minor is six-colorable, v has degree seven, H=G-v, S=N_G(v)={u_0,...,u_6}, and the only nonedges of H[S] are the seven cyclic pairs.

A resource is a nonempty connected subset T of V(H) minus S such that each cyclic nonedge st has an endpoint with an H-neighbor in T. A partial resource family consists of disjoint resources and an actual joining edge between each pair. Retain the maximum-cardinality/minimum-total-size cardinality-two family {T_1,T_2}, U=T_1 union T_2, and A=N_H(U) intersect S=S.

Retain |T_1|>=2, the fixed actual joining edge pq with p in T_1 and q in T_2, the fixed spanning tree Q_1 rooted at p, its fixed non-root leaf x, B=T_1-{x}, the fixed selected cyclic defect e=ab, and X={a},Y={b}. Thus retain exactly

    N_H(a) intersect B = N_H(b) intersect B = empty,
    xa in E(H), xb notin E(H),
    N_H(a) intersect T_2 = empty,
    N_H(b) intersect T_2 != empty.

Keep L as the unique x-p path in Q_1, the already fixed y in N_H(b) intersect T_2 and the already fixed simple q-y path P in H[T_2]. A length-zero P is permitted if y=q. These are symbolic fixed witnesses for an abstract full-domain input; no actual full C_7 realization is claimed. Do not select another witness.

The old candidate is permanently

    R_1 = V(L) union V(P),
    R_2 = T_2 minus V(P),
    F' = {R_1,R_2}.

RL25 certified R_1 nonempty/exterior and R_2 exterior but could not certify R_2 nonempty. Gates 2-6 were NOT REACHED, and minimum total size was not invoked. This is a missing implication, not a counterexample or logical-independence theorem.

## Exactly one changed bounded mechanism

Work only in the unresolved conditional saturation alternative

    V(P) = T_2.

Do not assume that this alternative occurs in an actual full C_7 graph. The task is to develop and assess an earlier contradiction excluding it at the retained fixed scope.

Use exactly the one prescribed original-G contraction candidate

    J = G/R_1,

with all of R_1 contracted to one vertex and the resulting graph treated as a finite simple minor.

First rigorously certify that this contraction is legitimate: the proposed contraction set is nonempty and connected and J is a proper minor of original G. Use L, P and the actual edge pq only as justified. These are new admissibility checks for RL26; RL25's unvisited gates are not retrospectively marked passed.

Only after that admissibility gate passes, fix exactly one actual proper six-coloring of J supplied by full criticality. Develop and fix at most one explicit reconstruction proposal and its intended output before testing it. The output must be either:
- a complete proper six-coloring of original G; or
- an explicit simultaneous K_7 minor of original G whose contradiction with the exact C_7 axioms is justified.

Assess only that one proposal. Check every original edge and expanded path interior for a coloring reconstruction, or every branch set's nonemptiness, disjointness, connectedness and all pairwise adjacencies for a minor reconstruction. Account for every boundary attachment actually needed. If no explicit valid proposal can be supplied, record that first missing implication and stop.

A six-coloring of J alone supplies neither result. Pulling one quotient color back onto adjacent original vertices is not a proper coloring lift. Connectedness or path membership supplies no unproved additional S-incidence.

## Bounds and guards

- Exactly one conditional saturation alternative and one prescribed contraction; at most one reconstruction proposal and one actual source coloring.
- No second y, P, tree, leaf, joining edge, defect, replacement family, contraction, coloring or reconstruction after a failure.
- Do not retry RL24's singleton family or RL23's source-coloring/recoloring mechanism.
- Do not import m=1 private-endpoint/Kempe identities, start m=3 or m=4, splice different fixed choices, use an unjustified quotient lift, or infer a full-domain countermodel from a local incidence assignment.
- Do not invoke minimum total size to establish the old candidate's family validity.
- Do not resume RL25 gates 2-6 in this work unit, even if saturation is excluded.
- No new mathematical source retrieval or numerical work by default; no graph, coloring or path census.
- Stop at the first missing contraction-admissibility, incidence or reconstruction implication. Do not start a second mechanism after this candidate stops.

## Success, classification and handover

A positive result must give the explicit graph-level certificate and derive the earlier contradiction from the exact fixed saturation axioms. Anything less is structural information or a method barrier only. Excluding saturation would address only RL25's first nonemptiness obstacle for the retained choices; it would not by itself certify a smaller resource family, the remaining exchange gates, m=2 exclusion, UP_6, CR_6, ordinary order seven or full Hadwiger.

Preserve exact quantifiers, simultaneous compatibility, source/certificate limits, sharpness and every unbounded residual parameter. No mathematical assessment of this minor or reconstruction was performed in RL25 or its closeout.

Checkpoint the exact frontier, state explicitly whether any named mathematical obligation is genuinely reduced, and recommend continue or finish under AGENTS.md. If blocked, preserve the lesson and one bounded changed recovery task under the recovery protocol. Programme ACTIVE.
