# RL24 strict minimum-total-size resource-family exchange feasibility report

Date: 2026-10-02 Europe/Madrid.
Status: bounded analytic work complete; RL24 OPEN / NOT PROMOTED.

## Exact fixed scope

Retain the full C_7 cyclic degree-seven domain and the exact inherited non-singleton m=2, A=S setup.

A resource is a nonempty connected exterior set meeting at least one endpoint of every cyclic nonedge of H[S]. The fixed family {T_1,T_2} is a maximum-cardinality partial resource family and has minimum total size among maximum families.

Keep the fixed joining edge pq, rooted spanning tree of H[T_1], non-root leaf x, B=T_1-{x}, selected defect e=ab and the exact repair pattern

    X={a}, Y={b}.

Thus

    N_H(a) intersect B = N_H(b) intersect B = empty,
    xa in E(H), xb notin E(H),
    N_H(a) intersect T_2 = empty,
    N_H(b) intersect T_2 != empty.

The RL23 source coloring and c(x)=beta branch are not used.

## Single fixed candidate

Before any use of minimum total size, fix exactly

    R_1={x},
    R_2=T_2,
    F'={R_1,R_2}.

No second candidate is considered.

Because T_1 is non-singleton, this candidate is intended to be strictly smaller: if it passed all family-validity gates then replacing T_1 by {x} would remove every vertex of B. This intended arithmetic is not used as a minimality contradiction before gates 1-5.

## Gate 1: nonempty exterior sets

R_1={x} is nonempty. Since x belongs to T_1 and every resource lies in V(H)\S, x is exterior.

R_2=T_2 is a retained resource, hence nonempty and exterior.

Gate 1 passes.

## Gate 2: disjointness

The retained family has T_1 intersect T_2=empty. Since x is in T_1,

    {x} intersect T_2 = empty.

Gate 2 passes.

## Gate 3: connectedness

H[{x}] is connected as a singleton induced subgraph. H[T_2] is connected by the resource definition.

Gate 3 passes.

## Gate 4: exact cyclic resource coverage

R_2=T_2 is unchanged and remains a resource.

For R_1={x}, resource coverage requires the universal condition

    for every cyclic nonedge g=uv of H[S],
    xu in E(H) or xv in E(H).

The retained selected-defect data certify this condition only for e=ab: xa is an edge, so {x} covers e even though xb is a nonedge.

No retained premise certifies the same condition for each of the other six cyclic nonedges.

The fact that T_1=B union {x} is a resource does not force singleton x to cover a cyclic pair that B already covers. The fact that B is connected is irrelevant to coverage. A=S and the resource property of T_2 constrain the union or T_2, not the S-neighborhood of x. RL21-P01/P02 and RL22-P01 add no universal all-seven-pairs incidence statement for x. RL23's coloring branch is historical and cannot repair this incidence requirement.

Therefore R_1={x} is not certified as a resource.

This is the first missing implication, so the mandated audit stops at gate 4.

## Local incidence compatibility witness for the missing implication

This is only an incidence-level schema showing why the retained resource/repair consequences do not themselves force singleton x to be a resource. It is not asserted to extend to a full C_7 critical graph and is not a counterexample to Hadwiger.

Relabel the cyclic nonedges as

    u_0u_1, u_1u_2, ..., u_6u_0

with a=u_0 and b=u_1. Take a local exterior schema with B={p}, T_1={p,x}, T_2={q}, and actual edges px and pq. Give the S-incidences

    N_H(x) intersect S = {u_0},
    N_H(p) intersect S = {u_2,u_4,u_6},
    N_H(q) intersect S = {u_1,u_3,u_5,u_6}.

Then:

- T_1 covers every cyclic nonedge;
- T_2 covers every cyclic nonedge;
- N_H(T_1 union T_2) intersect S = S;
- B misses both u_0 and u_1, so e=u_0u_1 is a B-defect;
- X={u_0} and Y={u_1};
- pq is an actual joining edge;
- but {x} misses both endpoints of u_1u_2 and therefore is not a resource.

This schema is used only to demonstrate compatibility of the missing singleton-coverage implication with the listed local resource/incidence axioms. No full critical-graph realization is claimed.

## Gates 5 and 6

Not reached.

In particular, no joining-edge claim for {x} and T_2 is required or inferred, the strict-size gate is not invoked, and the minimum-total-size tie-breaker is not used.

## Verdict and obligation accounting

The one fixed exchange candidate cannot be certified through the family axioms. The exact first missing implication is

    N_H(x) intersect {u_i,u_(i+1)} != empty

for every cyclic nonedge, not merely for the selected defect e=ab.

Classification: scoped analytic feasibility/stopping result and method barrier, same-worker review only.

Candidate FL-027 records that one selected leaf-repair incidence cannot be globalized into singleton resource coverage. No correction or demotion is triggered. No named inherited mathematical obligation is genuinely reduced. The full m=2, A=S branch remains open, as do m=1, m=3, m=4, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order-seven coverage, all higher orders and full sharp Hadwiger.

All inherited source/certificate limits, simultaneous-compatibility requirements, sharpness conditions and unbounded residual parameters remain unchanged.

New mathematical numerical computation: 0.
New mathematical source queries/opens: 0.
Programme ACTIVE.
