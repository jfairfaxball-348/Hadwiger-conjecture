# RL28 edge-critical extra-neighbor assessment

Date: 2026-10-03 Europe/Madrid.
Status: bounded analytic work complete; RL28 OPEN / NOT PROMOTED.
BASE_HEAD: 3a90dd79fc56e9238c10229c0a32e3602bc16924.

## Exact retained conditional scope

Keep full sharp Hadwiger h(G)>=chi(G) for every finite simple graph.

Retain the exact RL27 conditional non-singleton m=2, A=S fixed choices, only under V(P)=T_2. In particular retain the same fixed family {T_1,T_2}, joining edge pq, rooted spanning tree Q_1, non-root leaf x, B=T_1-{x}, selected cyclic defect e=ab, repair pattern X={a},Y={b}, fixed x-p path L, fixed y in N_H(b) intersect T_2, fixed q-y path P, and V(P)=T_2.

Thus the retained incidence data include

    N_H(a) intersect B = N_H(b) intersect B = empty,
    xa in E(H), xb notin E(H),
    N_H(a) intersect T_2 = empty,
    N_H(b) intersect T_2 != empty.

Retain R_1=V(L) union V(P), J=G/R_1, the same one fixed proper six-coloring c of J, rho, gamma=c(rho), the fixed lists

    A(u)=[6] \ c(N_G(u) \ R_1),

and exactly the same one inclusion-minimal induced non-A-list-colorable K from RL27. Retain

    |A(u)| <= d_K(u)

for every u in V(K).

Retain W=L+pq+P and let w_1 be the unique W-neighbor of x.

No actual full C_7 realization of V(P)=T_2 is asserted.

## Conditional extra-neighbor branch

Work only under

    x in V(K) and N_K(x) not subseteq {w_1}.

This is the conditional branch prescribed by the brief; no independent realization claim is added.

Fix exactly one

    z in N_K(x) \ {w_1}.

Then z lies in V(K) subseteq R_1 and xz is an original-G edge.

Because G is finite simple, deleting xz strictly decreases the edge count. Hence G-xz is a proper minor of G. By full C_7 criticality fix exactly one proper six-coloring

    d:V(G)->[6]

of G-xz.

No second coloring is selected.

## RL28-P01 candidate: forced equality on the deleted edge

Claim:

    d(x)=d(z).

Suppose instead that d(x)!=d(z). The coloring d is already proper on every edge of G-xz. Restoring the single deleted edge xz creates no conflict because its endpoints have distinct colors. Therefore the same map d is a proper six-coloring of original G.

That contradicts chi(G)=7.

Hence

    d(x)=d(z).                                                 (RL28-EQ)

Put

    delta=d(x)=d(z).

This equality is structural information only and by itself reduces no named obligation.

## The one fixed consequence, stated before testing

After certifying RL28-EQ, fix exactly the following consequence and no other:

> **C28-X.** The coloring d is fully color-saturated at x away from the deleted neighbor z:
>
>     d(N_G(x) \ {z}) = [6] \ {delta}.

### Proof of C28-X

Because d is proper on G-xz, every neighbor r of x distinct from z satisfies d(r)!=delta. Therefore

    d(N_G(x) \ {z}) subseteq [6] \ {delta}.

Now fix any alpha in [6]\{delta}. If no vertex of N_G(x)\{z} had d-color alpha, recolor x alone from delta to alpha in G-xz. This remains proper: no surviving neighbor of x has color alpha, and xz is absent.

After that recoloring, restore xz. Vertex z still has color delta, while x now has alpha!=delta, so xz is proper. Every other edge is unchanged and remains proper. This would give a proper six-coloring of original G, contradicting chi(G)=7.

Thus every alpha in [6]\{delta} occurs on N_G(x)\{z}. Hence C28-X holds.

In particular x has at least five neighbors other than z and therefore d_G(x)>=6. This is a lower-degree consequence, not an upper bound on internal degree.

## Test of C28-X against the retained incidences and K/list data

The repair pattern gives xa in E(G), so d(a)!=delta. It also gives

    N_H(a) intersect B = empty
    and
    N_H(a) intersect T_2 = empty.

Since R_1 is contained in {x} union B union T_2 and contains x, it follows that

    N_G(a) intersect R_1 = {x}.

Therefore z in R_1\{x} is not adjacent to a. These are exact retained original-G incidences.

They do not convert C28-X into the missing FL-030 upper bound. C28-X says that five distinct d-colors occur among neighbors of x other than z, but it does not locate those witnesses inside R_1 or K. The fixed a-edge merely supplies one external neighbor with one non-delta d-color.

The fixed lists A do not repair this. They were defined from the independent quotient coloring c:

    A(x)=[6] \ c(N_G(x)\R_1).

Thus membership of a label in A(x) records absence of that label under c on external neighbors of x. C28-X records occurrence of labels under the separately fixed coloring d. No retained premise identifies d with c on G-R_1, aligns their color classes in a load-bearing way, or forces a d-color witness supplied by C28-X to belong to R_1, still less to K.

Consequently RL27-P02,

    |A(x)| <= d_K(x),

remains only a lower bound on d_K(x). C28-X supplies another lower-degree/color-saturation fact in G. Neither gives

    d_K(x) <= 1

or any other rigorously sufficient original-graph internal-degree upper bound at x.

This is the first missing color/incidence implication. The assessment stops here, as required.

No second consequence, z, coloring, endpoint, K, contraction, y, P, L, tree, leaf, joining edge, defect, resource side or replacement family is selected.

## Classification and obligation accounting

Candidate RL28-P01: for the one fixed z and one fixed six-coloring d of G-xz, d(x)=d(z).

Candidate RL28-P02/C28-X: with delta=d(x)=d(z),

    d(N_G(x)\{z})=[6]\{delta}.

Classification: proved scoped elementary analytic mathematics, same-worker review only; NOT PROMOTED pending normal RL28 closeout.

Stopping result: the new edge-critical coloring is not tied to the fixed quotient coloring c defining A, and its color-saturation witnesses are not localized to R_1 or K. It therefore does not close the FL-030 internal-degree gap.

There is no explicit contradiction with saturation/full C_7, no six-coloring of G, no sufficient internal-degree restriction at x, and no exclusion of V(P)=T_2.

No named inherited mathematical obligation is genuinely reduced. RL25's first nonemptiness obstacle remains unresolved and gates 2-6 remain NOT REACHED. Minimum total size is not invoked.

Preserve RL27-P01/P02 and FL-030, RL26/FL-029, RL25/FL-028, RL24/FL-027, RL23/FL-026, RL22-P01/FL-025, RL21-P01/P02/FL-024 and RL20 NONE/FL-023 exactly. The m=1 failed-anchor/private-endpoint line remains suspended.

Correction/demotion: NONE.

New mathematical source queries/opens: 0.
Mathematical numerical work: 0.
Programme ACTIVE.

Recommendation: it makes sense to finish up here
