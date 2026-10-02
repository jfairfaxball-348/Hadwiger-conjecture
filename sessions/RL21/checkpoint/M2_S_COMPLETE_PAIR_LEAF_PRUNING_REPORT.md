# RL21 m=2 S-complete resource-pair leaf-pruning assessment

Date: 2026-10-02 Europe/Madrid.
Status: **bounded analytic work complete; RL21 OPEN / NOT PROMOTED.**

## Inputs and exact scope

Work in the full C_7 cyclic degree-seven domain retained from RL13. Thus G is finite simple, chi(G)=7, every proper minor is six-colorable, v has degree seven, H=G-v, S=N_G(v)={u_0,...,u_6}, and the only nonedges of H[S] are the cyclic pairs e_i=u_i u_(i+1).

Let {T_1,T_2} be the fixed maximum partial resource family of cardinality m=2, chosen with minimum total size among maximum families. Put U=T_1 union T_2 and assume

    N_H(U) intersect S = S.

T_1 and T_2 are disjoint connected exterior resources and have an actual joining edge. Fix exactly one such edge

    pq,  p in T_1, q in T_2.

No other joining edge is selected.

## 1. Singleton-side obstruction

If |T_1|=1, then T_1={p}. There is no spanning-tree leaf x!=p on this fixed side, so the prescribed leaf-deletion gate cannot start while preserving a nonempty B and the fixed joining endpoint p.

This is a method obstruction only. It is not a contradiction, does not constrain T_2, and does not permit switching to T_2 in this work unit. The m=2, A=S branch therefore remains open on this subcase.

For the remainder assume |T_1|>=2.

## 2. One fixed leaf deletion and one use of minimum total size

Choose one spanning tree Q_1 of H[T_1] rooted at p and exactly one leaf x!=p. Put

    B = T_1 - {x}.

Because x is a non-root leaf, Q_1-x shows B is nonempty and connected, and p remains in B. Hence the fixed actual joining edge pq still joins B to T_2.

Suppose B were a resource. Then {B,T_2} would still be a valid size-two partial resource family:

- B and T_2 are nonempty, connected and exterior;
- they are disjoint because B is a subset of T_1;
- pq is still an actual joining edge;
- T_2 is unchanged.

Its total size would be |T_1|+|T_2|-1, strictly smaller than the chosen minimum total size among maximum cardinality-two families. Contradiction.

This is the one and only use of the minimum-total-size tie-breaker in the assessment. Therefore B is not a resource. Since nonemptiness, connectedness and exteriority are already verified, B must fail cyclic coverage. Choose exactly one cyclic nonedge

    e = ab

such that

    N_H(a) intersect B = N_H(b) intersect B = empty.          (1)

No other defect edge is selected.

Because p is in B, (1) also gives

    pa, pb notin E(H).                                         (2)

The fixed joining edge pq survives, but (2) shows that the joining endpoint p itself repairs neither endpoint of e.

## 3. Exact repair classification for the selected defect

Define two endpoint sets

    X = {s in {a,b} : xs in E(H)},
    Y = {s in {a,b} : N_H(s) intersect T_2 is nonempty}.

Only these endpoint-level repair sets are classified.

Since T_1=B union {x} is a resource and B sees neither endpoint of e, T_1 can cover e only through x. Hence

    X is nonempty.                                             (3)

Since T_2 is a resource,

    Y is nonempty.                                             (4)

Since U is S-complete, each of a and b has a neighbor in U. By (1), neither has a B-neighbor. Every U-neighbor of either endpoint therefore lies in {x} union T_2. Hence

    X union Y = {a,b}.                                         (5)

Conversely, (3)-(5) are exactly the endpoint-level consequences forced by the permitted resource/S-completeness information for this selected defect. Thus there are exactly seven possible repair patterns:

1. X={a},     Y={b};
2. X={b},     Y={a};
3. X={a},     Y={a,b};
4. X={b},     Y={a,b};
5. X={a,b},   Y={a};
6. X={a,b},   Y={b};
7. X={a,b},   Y={a,b}.

The fixed joining edge pq imposes no further endpoint repair identity: q may or may not be one of the T_2 vertices witnessing Y. In particular there is no m=1-style identity N_H(a) intersect T_1={x} or N_H(b) intersect T_1={x} unless separately forced by the chosen pattern, and nothing here makes either resource individually S-complete.

This proves the selected-defect repair classification.

## 4. The one tested consequence: five-color boundary compression

Test only a direct RL13-style one-endpoint recoloring, now at the m=2, A=S interface.

Choose one cyclic nonedge f of the seven-cycle disjoint from e=ab. Contract in the original graph the connected star {v} union endpoints(f). The resulting graph is a proper minor, so choose one actual proper six-coloring and pull it back to H; call the pullback c.

By the retained A2 colorful-neighborhood interface, all six colors occur on S. The two endpoints of f are the unique repeated color class on S. Because f is disjoint from e, a and b are singleton color classes. Put

    alpha = c(a),   beta = c(b),

with alpha!=beta.

### Pattern 5: X={a,b}, Y={a}

Here b has no B-neighbor by (1), no T_2-neighbor because b notin Y, and x is its only possible U-neighbor. Since x is adjacent to both a and b, properness of c gives c(x)!=alpha.

Keep c on every vertex of (S union U)-{b} and recolor only

    b -> alpha.

This is proper on H[S union U]:

- inside S, a is the only alpha-colored S vertex and ab is a nonedge;
- every U-neighbor of b is x, and c(x)!=alpha;
- all other edges retain their source colors.

On S the repeated pair f remains and e=ab becomes a second repeated pair, so exactly five colors occur on S.

### Pattern 6: X={a,b}, Y={b}

The symmetric recoloring a->beta is proper for the same reason: a has no B- or T_2-neighbor, its only possible U-neighbor is x, and xb is an edge, so c(x)!=beta. Again H[S union U] has a proper six-label coloring using exactly five colors on S.

Therefore the selected defect yields a five-color boundary compression in exactly these two endpoint-repair patterns by this incidence-only direct recoloring proof.

## Candidate RL21-P01

For the fixed non-singleton T_1 side, fixed pq, fixed rooted spanning tree, fixed leaf x and fixed defect e=ab obtained by the single minimum-total-size invocation, the endpoint repair sets X,Y defined above are nonempty and satisfy X union Y={a,b}. Hence exactly the seven listed repair patterns are possible. Also p is adjacent to neither a nor b.

Classification: **proved scoped elementary analytic mathematics, same-worker review only; NOT PROMOTED pending normal RL21 closeout.**

## Candidate RL21-P02

At the exact RL21-P01 scope, if X={a,b} and Y is a singleton, then one actual star-minor six-coloring with repeated pair disjoint from e supports a direct recoloring of the endpoint missed by T_2 to the other endpoint's color. This gives a proper coloring of H[S union U] into six labels using exactly five colors on S.

Classification: **proved scoped elementary analytic mathematics, same-worker review only; NOT PROMOTED pending normal RL21 closeout.**

## 5. First missing implication in the other five patterns

The same direct recoloring is not certified from the permitted premises in repair patterns 1,2,3,4,7.

For an orientation r->c(s) of e, the recoloring is safe on U exactly if no U-neighbor of r has source color c(s). A structural sufficient condition is that every U-neighbor of r is adjacent to s, but RL21-P01 supplies only endpoint-level existence of x/T_2 repairs. It does not force the T_2-neighbors of one endpoint to be common neighbors of the other endpoint, and it gives no target-color exclusion on those T_2-neighbors.

At the boundary-incidence/color level, pattern 7 allows x to see both a,b, one T_2 vertex t_a to see a but not b, and another T_2 vertex t_b to see b but not a. The shown edges are locally compatible with assigning c(t_a)=beta and c(t_b)=alpha. Additional attachments can make the resources cover the other cyclic pairs without changing this selected-defect incidence. This is not asserted to extend to an actual full C_7 critical graph. It only records that the allowed local resource/S-completeness/joining information does not itself imply either target-color exclusion needed by the direct recoloring.

Accordingly the first missing independent implication is:

> for at least one orientation r,s of the selected defect e, force
> c(N_H(r) intersect U) to avoid c(s), or provide an equally scope-valid
> condition that certifies the same one-endpoint recoloring.

No such implication is proved here. The work unit stops now. No smaller-family mechanism is attempted and no second coloring, leaf, joining edge, defect, or resource side is tested.

## 6. Scope, sharpness and obligation accounting

The two positive candidates concern one fixed joining edge, one fixed T_1 side, one fixed rooted spanning tree, one fixed non-root leaf, one selected cyclic defect, and one star coloring used only for the boundary-compression test. Nothing is simultaneous over different choices.

The singleton T_1 subcase survives untouched. In the non-singleton subcase, five of the seven selected-defect repair patterns survive this direct compression mechanism. Even in the two compressed patterns, no extension through residual components, third resource, m=2 exclusion, rooted K_6, CR_6 result, order-seven theorem, higher-order theorem, or root conclusion is asserted.

No named inherited mathematical obligation is genuinely reduced. The inherited m=2, A=S branch remains open as a whole, as do m=1, m=3, m=4, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order-seven coverage, every higher order and full sharp Hadwiger.

All graph/resource/component orders, internal path lengths, attachment patterns and coloring choices remain unbounded. New mathematical numerical computation: 0. New source queries/opens: 0. No formal or external independent certification or novelty claim is made.
