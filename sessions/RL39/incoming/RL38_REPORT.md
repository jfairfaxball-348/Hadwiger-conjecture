# RL38 global nearest endpoint-witness pair refinement report

Date: 2026-10-04 Europe/Madrid.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the retained RL31 m=3, A=S configuration and the one new global endpoint-witness-pair monotone closure candidate authorized by the RL38 brief. The result does not retroactively strengthen RL33-RL37.

## Result RL38-P01 — global-pair overlap elimination

Retain the same maximum minimum-total family F={T_1,T_2,T_3}, the same fixed joining edges, terminal endpoints, spanning trees Q_i, terminal cores R_i, and least-index MISS-side discipline from RL31. If the RL31 profile is all-SAT, stop exactly as prescribed.

For the separate RL38 candidate closure, whenever C_k fails exact cyclic resource coverage, let g_k be the least cyclic nonedge missed by C_k and define

    W_k={(v,u): v is an endpoint of g_k and u in N_H(v) intersect T_i*}.

Choose (a_k,w_k) in W_k minimizing dist_Q(w_k,C_k), with arbitrary tie-breaking among minimizers. Let P_k be the unique Q_i* path from w_k to the first vertex r_k of C_k and put

    C_{k+1}=C_k union V(P_k).

### Closure and first-passing audit

The modified augmentation is well-defined. Because T_i* is a resource and g_k is missed by C_k subset T_i*, at least one endpoint of g_k has a neighbor in T_i*, so W_k is nonempty. The graph is finite, hence a minimizing pair exists. Since g_k misses C_k, every admissible witness u lies outside C_k, in particular w_k is outside C_k.

Maintain the invariant that Q_i*[C_k] is connected. It holds for C_0=R_i*, a Q_i* path vertex set. The unique Q_i* path P_k from w_k to its first contact r_k with C_k meets C_k only at r_k. Adjoining V(P_k) therefore preserves Q-connectedness and keeps C_{k+1} inside T_i*. The retained edge a_kw_k repairs g_k. Because C_k subset C_{k+1}, every cyclic nonedge already covered remains covered.

Thus a selected miss never reappears. There are exactly seven cyclic nonedges in the retained C_7 interface, so a first exact-coverage stage occurs at some K<=7.

### Replacement-family and saturation audit

At the first exact-coverage stage,

    {C_K} union {T_j : j!=i*}

is a valid cardinality-three partial resource family: C_K is nonempty, exterior, connected, disjoint from the unchanged resources, and has exact cyclic resource coverage. Both fixed terminal endpoints on side i* lie in R_i* subset C_K, so the two incident original joining edges remain; the joining edge between the two unchanged resources is untouched.

If C_K were a proper subset of T_i*, the replacement family would have strictly smaller total size than the fixed maximum-cardinality minimum-total family F, a contradiction. Hence

    C_K=T_i*.

### Independently reconstructed final interface

Write

    C=C_{K-1}, T=T_i*, Q=Q_i*, P=P_{K-1},
    g=g_{K-1}, a=a_{K-1}, w=w_{K-1},

and

    I=V(P)\(C union {w}).

Because Q[C] is connected, P is the unique Q-path from w to its first contact with C, and T=C union V(P), the vertex w is a leaf of Q. Indeed, any second Q-neighbor of w outside the next vertex of P would either create a cycle in the tree Q or give an earlier Q-contact with C. Therefore Q-w is connected on T-{w}.

Thus T-{w}=C union I is nonempty and connected. The fixed terminal endpoints lie in C, so deleting w preserves both joining edges incident with T and leaves the third joining edge unchanged. If T-{w} had exact cyclic resource coverage, replacing T by T-{w} would contradict minimum total size. Hence exact cyclic resource coverage fails for T-{w}. Let h be the least cyclic nonedge missed by T-{w}=C union I.

The nonedge g is the least cyclic nonedge missed by C. Since C subset C union I and h is missed by C union I, h is also missed by C, so

    g<=h.

If h=g, record the refined EQ profile and stop.

Only in refined NEQ, g<h. Then g is covered by C union I but missed by C, so its repair is supplied through I. The nonedge h misses C union I and is covered by T only through w in the exact weak leaf-critical sense.

If g and h are vertex-disjoint, RL38 records the refined ordered DISJOINT profile and stops that branch exactly as required by the brief.

Suppose instead that g,h share endpoint x, and let y be the nonshared endpoint of g. Since x is an endpoint of h and h misses C union I,

    N_H(x) intersect I = empty.

Since g is covered by C union I but missed by C, at least one endpoint of g has an I-neighbor. Therefore

    N_H(y) intersect I != empty.

Choose z in I with yz in E(H). The pair (y,z) belongs to the final admissible set W_{K-1}: y is an endpoint of g, z lies in T, and yz is an edge. Also z is strictly internal on the final Q-path P from w toward C, so

    dist_Q(z,C) < dist_Q(w,C).

But the selected final pair (a,w) minimizes witness distance over all admissible endpoint-witness pairs in W_{K-1}. The eligible pair (y,z) is strictly better, a contradiction.

Therefore refined NEQ overlap is impossible under the RL38 global-pair closure.

## Strongest retained conclusion

M3-GLOBAL-NEAREST-PAIR-OVERLAP is CERTIFIED at exactly this new candidate-closure scope:

- the global endpoint-witness-pair closure is well-defined and reaches first exact coverage in at most seven repairs;
- minimum total size forces saturation C_K=T_i*;
- the final leaf/deletion blocker and least-miss order interface independently re-derive;
- all-SAT and EQ remain stopping profiles;
- refined NEQ DISJOINT remains a stopping profile because RL38 was expressly bounded not to test it;
- refined NEQ OVERLAP is impossible by global pair minimality.

Classification: proved scoped analytic mathematics plus bounded stopping conclusion, same-worker review only. No formal proof checker, independent external certification, source upgrade, novelty claim, finite certificate, broad census, or mathematical numerical computation.

## Obligation accounting

M3-CORE remains NOT CERTIFIED. The m=3, A=S configuration remains open. The full sharp Hadwiger conjecture remains open.

No named inherited universal mathematical obligation is genuinely reduced.
Correction/demotion: NONE.

Preserve RL37-P01/FL-040, RL36-P01/FL-039, RL35-P01/FL-038, RL34-P01/FL-037, RL33-P01/FL-036, RL32-P01/FL-035, RL31-P01/FL-034, the RL30 audit and FL-033, all valid RL20-RL29 restricted results, and earlier source/certificate limits exactly. The RL21-RL29 m=2 chain remains suspended.

## New frontier

Under the certified RL38 global-pair closure, the only refined NEQ profile left by the RL38 stopping rules is the vertex-disjoint pair g,h. In that profile g<h still implies that g is covered by C union I while missed by C. RL38 did not test whether this alone supplies an endpoint y of g and z in I with yz an edge, making (y,z) an eligible final pair strictly closer to C than w. That exact inference is reserved for a bounded successor assessment.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
Broad census: 0.
Programme ACTIVE.
