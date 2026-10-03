# RL27 fixed-color minimal list-obstruction extraction report

Date: 2026-10-03 Europe/Madrid.
Status: bounded analytic work complete; RL27 OPEN / NOT PROMOTED.
BASE_HEAD: c032a457aa986b3d2f366e4c3807d0a985de45cb.

## Exact retained scope

Keep full sharp Hadwiger h(G)>=chi(G) for every finite simple graph.

Retain the exact RL26 conditional non-singleton m=2, A=S fixed choices, only under V(P)=T_2. Retain R_1=V(L) union V(P), the proper original-G minor J=G/R_1, the same one fixed proper six-coloring c:V(J)->[6], the contracted vertex rho, and gamma=c(rho). Every external neighbor of R_1 avoids gamma.

For every u in R_1 define exactly

    A(u)=[6] \ c(N_G(u) \ R_1).

Therefore gamma belongs to A(u) for every u in R_1.

No actual full C_7 realization of V(P)=T_2 is asserted.

## 1. Non-A-list-colorability of G[R_1]

Assume for contradiction that phi is a proper A-list coloring of G[R_1]. Thus phi(u) is in A(u) for every u in R_1.

Define a six-label map \hat c on V(G) by

    \hat c(u)=phi(u)   for u in R_1,
    \hat c(z)=c(z)     for z outside R_1.

Check every edge of original G.

1. If both ends lie in R_1, their colors differ because phi is proper on G[R_1].
2. If both ends lie outside R_1, their colors differ because contraction of R_1 does not change edges among outside vertices and c is proper on J.
3. If uz is a crossing edge with u in R_1 and z outside R_1, then z belongs to N_G(u)\R_1. Hence c(z) belongs to c(N_G(u)\R_1). Since phi(u) belongs to A(u)=[6]\c(N_G(u)\R_1), phi(u) differs from c(z).

Thus \hat c is a proper six-coloring of original G, contradicting chi(G)=7.

Therefore G[R_1] admits no proper A-list coloring.

This proof uses the same fixed c throughout; it does not select a second quotient coloring or retry the RL26 pullback.

## 2. Fix one deletion-minimal obstruction K

Because R_1 is finite and G[R_1] is not A-list-colorable, the finite family of vertex sets X subseteq R_1 for which G[X] is not A-list-colorable is nonempty.

Choose once and for all one inclusion-minimal such X and fix

    K=G[X].

The lists remain the original fixed lists A restricted to V(K); they are not recomputed. No second K will be chosen.

For every u in V(K), K-u is properly A-list-colorable. Otherwise K-u would be a strictly smaller induced non-A-list-colorable subgraph, contradicting the fixed inclusion-minimal choice of K.

## 3. Exact local list/degree implication

Fix u in V(K). Let phi_u be one proper A-list coloring of K-u, whose existence was just proved.

Suppose

    |A(u)| > d_K(u).

The neighbors of u in K number exactly d_K(u), so under phi_u they use at most d_K(u) distinct colors. Since A(u) contains more than d_K(u) colors, at least one color alpha in A(u) is unused on N_K(u).

Assign u the color alpha and leave phi_u unchanged on K-u. The resulting coloring is proper on K: all old edges remain proper, and every edge from u goes to a neighbor whose color differs from alpha. It also respects every fixed list A.

This contradicts the non-A-list-colorability of K. Therefore, for every u in V(K),

    |A(u)| <= d_K(u).                                        (RL27-LD)

Since gamma belongs to A(u), every A(u) is nonempty. Hence RL27-LD also gives

    d_K(u) >= 1

for every u in V(K).

This is a finite delete-and-extend proof reconstructed at the exact fixed scope; no list-critical folklore is cited.

## 4. The one fixed endpoint/path consequence

After certifying RL27-LD, fix exactly the following candidate consequence and no other:

> **C27-X.** If x belongs to V(K), then d_K(x)=1. Consequently RL27-LD and gamma in A(x) would force A(x)={gamma}.

This is the sole endpoint/path consequence assessed in RL27.

The intended incidence input is that x is a non-root leaf of the fixed spanning tree Q_1 and is the endpoint w_0=x of the fixed spanning path W=L+pq+P through R_1.

## 5. Test of C27-X and first missing implication

The lower bound d_K(x)>=1 is available if x is in K. The required upper bound d_K(x)<=1 is not.

Being a leaf of Q_1 means only that x is incident with exactly one **tree edge of Q_1**. It does not say that x has degree one in H[T_1], G[R_1], or K.

Likewise, being the endpoint of W means only that x has exactly one **path edge of W**. RL26 proved that W is a spanning path of R_1, not that W is induced and not that E(G[R_1]) consists only of the path edges.

Accordingly the retained premises permit, without contradiction at the present scope, additional original-G edges from x to later vertices of L and/or to vertices of P=T_2. If such a vertex also lies in K, the edge contributes to d_K(x). No retained resource, S-completeness, joining-edge, defect, path, or list premise supplies the missing exclusion

    N_K(x) subseteq {the W-successor of x}.

Therefore d_K(x)<=1 is NOT CERTIFIED, so C27-X fails at its first required degree-to-incidence implication.

The assessment stops here. The symmetric endpoint y is not tried. No second K, coloring, path, contraction or consequence is selected.

Even if C27-X were available, A(x)={gamma} would still be structural list information; RL27 would require a further explicit contradiction with the retained saturation/full-C_7 axioms before excluding V(P)=T_2. That contradiction stage is not reached.

## Classification and obligation accounting

Candidate RL27-P01: G[R_1] is not A-list-colorable for the fixed c and fixed A.

Candidate RL27-P02: for the one fixed inclusion-minimal obstruction K, every u in K satisfies |A(u)|<=d_K(u); in particular d_K(u)>=1.

Classification: proved scoped elementary analytic mathematics, same-worker review only; NOT PROMOTED pending normal RL27 closeout.

Stopping result: the one fixed endpoint/path consequence C27-X is not certified because path-endpoint/tree-leaf data do not upper-bound original-graph degree inside R_1.

There is no saturation exclusion, six-coloring of G, K_7 minor, valid smaller resource family, m=2 exclusion, boundary compression, UP_6/CR_6 result, order-seven closure or root conclusion.

No named inherited mathematical obligation is genuinely reduced. RL25's first nonemptiness obstacle remains unresolved and gates 2-6 remain NOT REACHED. Minimum total size is not invoked.

Correction/demotion: NONE. All inherited source/certificate, simultaneous-compatibility, sharpness and unbounded-parameter limits remain unchanged.

New mathematical source queries/opens: 0.
Mathematical numerical work: 0.
Programme ACTIVE.

Recommendation: it makes sense to finish up here
