# RL37 nearest-witness choice-refinement report

Date: 2026-10-04 Europe/Madrid.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the retained RL31 m=3, A=S configuration and one new nearest-witness monotone closure candidate authorized by the RL37 brief. The result does not retroactively strengthen RL33-RL36.

## Result RL37-P01 — nearest-witness overlap localization

Retain the same maximum minimum-total family F={T_1,T_2,T_3}, the same fixed joining edges, terminal endpoints, spanning trees Q_i, terminal cores R_i, and least-index MISS-side discipline from RL31. If the RL31 profile is all-SAT, stop exactly as prescribed.

For the separate RL37 candidate closure, whenever C_k fails exact cyclic resource coverage, let g_k be the least cyclic nonedge missed by C_k, fix one admissible endpoint a_k of g_k having a T_i* neighbor, choose

    w_k in N_H(a_k) intersect T_i*

to minimize dist_Q(w_k,C_k), let P_k be the unique Q_i* path from w_k to the first vertex r_k of C_k, and put

    C_{k+1}=C_k union V(P_k).

### Closure and first-passing audit

The modified augmentation is well-defined. Since T_i* is a resource and g_k is a cyclic nonedge missed by C_k, at least one endpoint of g_k has a neighbor in T_i*; the fixed admissible endpoint has a finite nonempty T_i*-neighbor set, so a distance minimizer w_k exists. Because g_k misses C_k, w_k is outside C_k.

Maintain the stronger invariant that Q_i*[C_k] is connected. It holds for C_0=R_i*, which is a Q_i* path vertex set. The unique Q_i* path P_k from w_k to the first contact r_k with C_k meets C_k only at r_k; adjoining it preserves Q-connectedness, hence H-connectedness, and keeps C_{k+1} inside T_i*. The edge a_kw_k repairs g_k. Since C_k is contained in C_{k+1}, every cyclic nonedge already covered remains covered.

Thus a selected miss never reappears. There are exactly seven cyclic nonedges in the retained C_7 interface, so a first exact-coverage stage occurs at some K<=7.

### Replacement-family and saturation audit

At the first exact-coverage stage, the family

    {C_K} union {T_j : j!=i*}

passes nonempty/exterior status, pairwise disjointness, connectedness, and exact cyclic resource coverage. Both fixed terminal endpoints on side i* lie in R_i* subset C_K, so the two incident original joining edges remain; the joining edge between the unchanged pair is untouched.

If C_K were a proper subset of T_i*, this would be a valid cardinality-three partial resource family of strictly smaller total size than F, contradicting minimum total size. Hence

    C_K = T_i*.

### Reconstructed final interface

Write

    C=C_{K-1}, T=T_i*, Q=Q_i*, P=P_{K-1},
    g=g_{K-1}, a=a_{K-1}, w=w_{K-1},

and

    I=V(P)\(C union {w}).

The preceding Q-connected invariant and saturation imply independently that w is a leaf of Q. Therefore T-{w} is nonempty and connected and preserves all three original fixed joining edges. Minimum total size forces exact cyclic resource coverage to fail for T-{w}. Let h be the least cyclic nonedge missed by T-{w}=C union I.

Then g is the least cyclic nonedge missed by C, h is the least cyclic nonedge missed by C union I, and therefore g<=h.

If h=g, record the refined EQ profile and stop.

Only in refined NEQ, g<h. The miss g is repaired by I, while h misses C union I and is covered in T only through w in the exact weak leaf-critical sense.

If g,h are vertex-disjoint, record the refined ordered disjoint profile and stop.

Suppose instead that g,h share endpoint x, and let y be the other endpoint of g. Because x is an endpoint of h and h misses C union I,

    N_H(x) intersect I = empty.

Because g is I-covered, its nonshared endpoint y satisfies

    N_H(y) intersect I != empty.

If x!=a, then a=y. Hence some z in I satisfies az in E(H). The final path P is the Q-path from w to its first contact with the Q-connected set C, and z is strictly internal on this path. Therefore

    dist_Q(z,C) < dist_Q(w,C).

But z belongs to N_H(a) intersect T, contradicting the defining choice of w as a T-neighbor of a minimizing Q-distance to C.

Thus refined NEQ overlap with x!=a is impossible. Under the RL37 nearest-witness candidate, every surviving overlap profile satisfies

    x=a.

RL37 stops there. No further contradiction is claimed.

## Strongest retained conclusion

M3-NEAREST-WITNESS-OVERLAP is CERTIFIED at exactly this new refined-closure scope:

- the modified closure is valid and reaches first exact coverage in at most seven repairs;
- minimum total size again forces saturation C_K=T_i*;
- the final leaf/deletion blocker and least-miss order interface re-derive under the changed selection discipline;
- all-SAT, EQ, and refined DISJOINT remain stopping profiles;
- in refined NEQ overlap, x!=a is impossible, so overlap forces x=a.

Classification: proved scoped analytic mathematics plus bounded stopping conclusion, same-worker review only. No formal proof checker, independent external certification, source upgrade, novelty claim, finite certificate, broad census, or mathematical numerical computation.

## Obligation accounting

M3-CORE remains NOT CERTIFIED. The m=3, A=S configuration remains open. The full sharp Hadwiger conjecture remains open.

No named inherited universal mathematical obligation is genuinely reduced.
Correction/demotion: NONE.

Preserve RL36-P01/FL-039, RL35-P01/FL-038, RL34-P01/FL-037, RL33-P01/FL-036, RL32-P01/FL-035, RL31-P01/FL-034, the RL30 audit and FL-033, all valid RL20-RL29 restricted results, and earlier source/certificate limits exactly. The RL21-RL29 m=2 chain remains suspended.

## New frontier

The fixed-endpoint nearest-witness rule eliminates exactly the overlap profile in which the selected endpoint a is the internally supported nonshared endpoint. It does not eliminate x=a, because then the closer internal support belongs to the other endpoint of g and is outside the set over which w was minimized.

A changed retry may couple endpoint choice and witness choice by minimizing Q-distance over admissible endpoint-witness pairs for the selected miss. Such a retry must independently rebuild the modified closure, saturation, and final-blocker interface before testing the surviving overlap profile.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
Broad census: 0.
Programme ACTIVE.
