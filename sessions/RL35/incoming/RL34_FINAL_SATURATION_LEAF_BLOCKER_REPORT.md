# RL34 final saturation leaf-blocker report

Date: 2026-10-03 Europe/Madrid.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the retained RL31/RL32/RL33 full C_7 cyclic degree-seven m=3, A=S fixed-choice setup and the one bounded final-saturation leaf-blocker assessment authorized by the RL34 brief.

## Result RL34-P01 — final saturation leaf-critical blocker

Retain RL33-P01, RL32-P01 and RL31-P01, the same maximum minimum-total family F={T_1,T_2,T_3}, the same three fixed joining edges, terminal endpoints s_i,t_i, spanning trees Q_i, terminal cores R_i, and the same RL33 least-index MISS side and closure sequence.

If the RL31 obstruction profile is all-SAT, RL34 has no MISS-side candidate and stops exactly as required.

Otherwise retain the exact RL33 first coverage-passing index K>=1 and write

    C = C_{K-1},   T = T_i*,   Q = Q_i*,
    g = g_{K-1},   a = a_{K-1},   w = w_{K-1},
    r = r_{K-1},   P = P_{K-1}.

RL33-P01 gives C_K=T and, from the defining last augmentation,

    T = C union V(P).

### Structural deletion audit

The closure sets are connected in the fixed tree Q, not merely in H. C_0=R_i* is the vertex set of a Q-path, hence Q[C_0] is connected. Inductively P_k is the Q-path from w_k outside C_k to the first vertex r_k of C_k, so P_k meets C_k only at r_k and Q[C_{k+1}] is connected. Thus Q[C] is connected.

Write the final path from w toward C as w=v_0,v_1,...,v_l=r, with l>=1 because w is outside C. Suppose w had a Q-neighbor x distinct from v_1. Saturation puts x in C union V(P). If x lies on P, the edge wx together with the corresponding P-segment gives a cycle in Q. If x lies in C, the edge wx, the Q[C] path from x to r, and P from r to w give a cycle in Q. Both contradict that Q is a tree. Therefore

    deg_Q(w)=1.

Hence Q-w is a connected spanning tree of T-{w}. Since C is nonempty and C is contained in T-{w}, the set T-{w} is nonempty. Consequently H[T-{w}] is connected.

### Required replacement-family audit

Audit

    F^- = {T-{w}} union {T_j : j != i*}

in the prescribed order.

1. Nonempty/exterior: PASS. C is contained in T-{w}, and T-{w} is contained in exterior T.
2. Disjointness: PASS, inherited from T and the unchanged pair.
3. Connectedness: PASS by the Q-w argument above.
4. Exact cyclic resource coverage: if this passed, continue.
5. Preservation of the three original fixed joining edges: PASS if gate 4 passes. Both fixed terminal endpoints on side i* lie in R_i* contained in C, while w is outside C; the joining edge between the unchanged pair is untouched.
6. Strict size: PASS because w lies in T and T-{w} is a proper nonempty subset of T.

Therefore, if gate 4 passed, F^- would be a valid cardinality-three partial resource family of strictly smaller total size than F, contradicting the defining minimum-total-size choice. Thus in every retained non-all-SAT branch gate 4 must fail.

Let h=uv be the least cyclic nonedge in the inherited cyclic order whose two endpoints both miss T-{w}. Since T itself is a resource, at least one of u,v has a neighbor in T. Since both miss T-{w},

    N_H(u) intersect T is a subset of {w},
    N_H(v) intersect T is a subset of {w},

and at least one of uw,vw is an edge. No conclusion that both are adjacent to w is justified.

### Prescribed equality dichotomy

If h=g, then the already fixed edge aw together with the fact that g misses T-{w} gives

    N_H(a) intersect T = {w}.

The other endpoint of g has T-neighborhood either empty or {w}. No contradiction follows. The final selected miss itself is leaf-critical.

If h!=g, then h misses C as well. Because g was the least cyclic nonedge missed by C, g precedes h in the inherited cyclic order. Because h is the least cyclic nonedge missed by T-{w}, the earlier g is covered by T-{w}. Yet g misses C. Hence some endpoint of g has a neighbor in

    V(P) \ (C union {w}).

Thus P has an internal off-C vertex supporting g before the leaf, while h is covered in T only through w in the exact weak sense above. No contradiction follows. This is a distinct retained terminal blocker profile.

Therefore the strongest valid conclusion is the two-profile final-leaf obstruction above.

Classification: proved scoped analytic mathematics, same-worker review only. No formal proof checker, independent external certification, source upgrade, novelty claim, finite certificate, broad census, or mathematical numerical computation.

## Target and obligation accounting

M3-SATURATION-LEAF-BLOCKER is CERTIFIED at exactly the retained fixed-choice scope.

M3-CORE remains NOT CERTIFIED. The m=3, A=S configuration remains open. No named inherited universal mathematical obligation is genuinely reduced. The full sharp Hadwiger conjecture remains open.

Correction/demotion: NONE.

Preserve RL33-P01/FL-036, RL32-P01/FL-035, RL31-P01/FL-034, the RL30 audit and FL-033, all valid RL20-RL29 restricted results, and all earlier source/certificate limits exactly. The RL21-RL29 m=2 chain remains suspended.

## New frontier

Deletion connectivity is no longer the blocker: the final saturation endpoint w is a genuine leaf of the retained spanning tree and can be deleted while preserving connectivity and all fixed joining edges. Minimum total size therefore forces exact cyclic resource coverage to depend on that leaf. The next changed mechanism must exploit the resulting leaf-critical blocker profile itself, not repeat deletion with another vertex, side, tree, path, or family.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
Broad census: 0.
Programme ACTIVE.
