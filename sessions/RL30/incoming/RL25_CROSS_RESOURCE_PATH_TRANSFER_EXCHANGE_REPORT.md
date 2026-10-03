# RL25 cross-resource path-transfer family-exchange feasibility report

Date: 2026-10-02 Europe/Madrid.
Status: bounded assessment complete; RL25 OPEN / NOT PROMOTED.
BASE_HEAD: 1f9725c0ea44d91c107f8bbc02dd881aa62cb3a3.

## Exact fixed scope and candidate

Keep full sharp Hadwiger, h(G)>=chi(G) for EVERY finite simple graph, as the root.

Retain full C_7: G is finite simple, chi(G)=7, every proper minor is six-colorable, v has degree seven, H=G-v, S=N_G(v)={u_0,...,u_6}, and the only nonedges of H[S] are the seven cyclic pairs.

A resource is a nonempty connected exterior set T contained in V(H) minus S such that, for every cyclic nonedge st of H[S], at least one of s,t has a neighbor in T. A partial resource family consists of disjoint resources with an actual joining edge between each pair. Retain the maximum-cardinality family {T_1,T_2}, with minimum total size among maximum families, U=T_1 union T_2 and N_H(U) intersect S=S.

Retain |T_1|>=2, the actual joining edge pq with p in T_1 and q in T_2, the fixed spanning tree Q_1 rooted at p, the fixed non-root leaf x, B=T_1-{x}, the selected cyclic defect e=ab and X={a},Y={b}. Thus exactly:

    N_H(a) intersect B = N_H(b) intersect B = empty,
    xa in E(H), xb notin E(H),
    N_H(a) intersect T_2 = empty,
    N_H(b) intersect T_2 != empty.

The one-time bindings made before the audit are unchanged:
L is the unique x-p path in Q_1;
y is one fixed witness in N_H(b) intersect T_2;
P is one fixed simple q-y path in H[T_2].
The last two exist from the retained nonempty neighborhood and connectedness of T_2. A length-zero path is allowed if y=q. The graph is an abstract fixed input; no concrete full C_7 instance or numerical vertex choice is asserted.

Permanently define

    R_1 = V(L) union V(P),
    R_2 = T_2 minus V(P),
    F' = {R_1,R_2}.

No optimization, witness reselection, second path or second replacement family occurs. The explicit RL25 brief and user instruction govern this L-based candidate; the preliminary B-based direction in RL24_PREPARED_RECOVERY_TASK.md is unchanged historical provenance and is not assessed here.

## Gate 1: nonempty exterior sets

R_1 is nonempty because x belongs to V(L), hence to R_1. Both path vertex sets are exterior: V(L) is contained in T_1 and V(P) is contained in T_2. Thus R_1 is contained in V(H) minus S.

R_2 is contained in T_2, so R_2 is exterior.

The remaining gate-1 requirement is exactly

    T_2 minus V(P) != empty,

equivalently

    V(P) is a proper subset of T_2.

No such strict containment is certified by the retained results for the fixed P.

The existence proof for P establishes V(P) subseteq T_2, not a vertex outside that path. The fact that T_2 is nonempty, connected and a resource gives no available certificate that this selected path leaves a vertex behind. The selected incidences guarantee a b-neighbor y in the path, not another T_2 vertex outside it. No lower bound |T_2|>=2 has been supplied by the retained fixed-choice records; even a non-singleton bound by itself would not certify that a path is nonspanning.

If V(P)=T_2, the already defined R_2 is empty and this candidate fails gate 1. This conditional is a direct set identity. The assessment does NOT assert that saturation occurs in an actual full C_7 graph, or that it occurs for every permitted input. No full-domain countermodel or logical independence from full criticality is claimed. The exact finding is the absence of a proved implication excluding saturation for this fixed candidate.

No earlier contradiction from full criticality or the exact candidate axioms has been derived. The minimum-total-size rule cannot be invoked to supply family validity: the comparison family must first pass gates 1-5. No new minimum-total-size invocation is made.

Gate 1 is therefore NOT CERTIFIED. Stop here.

## Later gates

| Gate | Status |
|---|---|
| 2. Disjointness | NOT REACHED |
| 3. Connectedness of both induced subgraphs | NOT REACHED |
| 4. Exact cyclic resource coverage of both sets | NOT REACHED |
| 5. An actual joining edge between the two sets | NOT REACHED |
| 6. Strict decrease in total size | NOT REACHED |

No later-gate conclusion is claimed, even conditionally as a passed audit gate. In particular xa, yb, the path edges and pq are not promoted into any unexamined full-coverage or two-resource compatibility assertion. The size-equality alternative |V(L)|=|T_1| remains unexamined at its mandated gate 6.

## Classification and obligation accounting

Outcome: scoped analytic feasibility/stopping record and method barrier. The set-membership observations are elementary; they are not a new positive exchange theorem or a finite certificate. Verification is same-worker analytic review only. Candidate lesson ID: FL-028, pending normal closeout.

The exact first missing implication is existence of a vertex in T_2 outside the already fixed P. F' is not certified as a cardinality-two partial resource family; there is no smaller valid family, minimum-total-size contradiction, m=2 exclusion, new boundary compression, rooted model or Hadwiger counterexample.

No named inherited mathematical obligation is genuinely reduced.

Preserve exactly: RL24's gate-4 stopping result and FL-027; RL23's stopping result and FL-026; RL22-P01 and FL-025; RL21-P01/P02 and FL-024; the RL20 audit NONE correction/demotion result and FL-023. No inherited claim is corrected or demoted. The m=1 failed-anchor/private-endpoint line is not resumed.

The whole m=2, A=S branch remains open, including the selected repair pattern. m=1, m=3, m=4, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order-seven coverage, every higher order and full sharp Hadwiger remain open in this programme. Graph and exterior orders, resource and component sizes, internal structures, path lengths, attachment patterns and coloring choices remain unbounded. No simultaneous certificate across distinct choices is asserted.

All inherited source/certificate and sharpness limits remain unchanged. New mathematical source queries/opens: 0. Mathematical numerical work: 0. No formal or external independent certification or novelty claim.

## Durable frontier

RL25 remains OPEN / NOT PROMOTED. Preserve this gate-1 barrier and the single prepared, unassessed recovery task in PREPARED_RECOVERY_TASK.md. Do not restart this audit, switch y or P, or continue into gates 2-6 without a newly justified input for this first requirement.

Programme ACTIVE.
Recommendation: it makes sense to finish up here
