# RL18 inside-T witness-essentiality assessment

Date: 2026-10-02 Europe/Madrid.
Status: **RL18 OPEN; bounded assessment complete; NOT PROMOTED.**

## Retained setup

Work in the full C_7 degree-seven cyclic domain. Thus H=G-v, S=N_G(v)={u_0,...,u_6}, and the only nonedges of H[S] are the cyclic pairs e_i=u_i u_(i+1) (indices modulo seven). A resource is a nonempty connected subset of V(H)\S whose S-neighborhood meets every e_i.

In the unresolved m=1 case, T is S-complete and minimum-cardinality among all resources, so N_H(T)∩S=S. Fix the inherited spanning-tree leaf x and private endpoint a, so x∈T and N_H(a)∩T={x}. Fix the inherited proper six-coloring d of G-x, with gamma=d(v), alpha=d(a), and A_rho=N_G(x)∩d^{-1}(rho).

In the failed-anchor branch C_a∩A_gamma=empty, retain the same witness
y∈(A_alpha\C_a)\S. RL16-P01 gives y∈V(H)\S and {y} is not a resource. RL17 proved no implication y∉T. This assessment works only in the conditional subcase y∈T.

Put T_y=T-{y}.

## First consequence: T_y is nonempty

Because y is a vertex of G-x, y!=x. Since x∈T, x∈T_y. Hence T_y is nonempty. There is no empty deletion subcase.

## Connected branch: y is cyclic-coverage essential

Assume H[T_y] is connected. Then T_y is a nonempty connected exterior set and |T_y|=|T|-1. If T_y were a resource, it would contradict minimum-cardinality of T. Therefore T_y is not a resource.

Connectedness and exteriority are already satisfied, so the only failed resource condition is cyclic coverage. Hence there exists at least one cyclic nonedge e_i=pq such that

    N_H(p)∩T_y = N_H(q)∩T_y = empty.              (1)

Because T is S-complete, p,q∈N_H(T). Since T=T_y∪{y}, (1) forces

    N_H(p)∩T = N_H(q)∩T = {y}.                    (2)

Thus y is genuinely coverage-essential for at least one cyclic nonedge: both endpoints of one cyclic missing edge have y as their unique neighbor in T. No uniqueness of e_i is claimed, and no stronger coverage statement is inferred.

The defect cannot involve the fixed private endpoint a, because N_H(a)∩T={x} with x!=y.

The fixed coloring makes the palette mismatch explicit. Since p,q∈S=N_G(v), properness gives d(p),d(q)!=gamma. Since yp,yq are edges and d(y)=alpha, properness also gives d(p),d(q)!=alpha. Moreover x∈T_y and (1) gives xp,xq notin E(H), so neither endpoint is a neighbor of x. The newly forced defect edge therefore lies outside the fixed gamma/alpha palette and outside the x-neighborhood data A_gamma∪A_alpha.

Consequently the retained gamma/alpha component separation does not eliminate this branch and does not turn T_y into a resource. It gives no implication contradicting (2), no new T_y coverage, and no new valid-resource construction.

## Disconnected branch: y is an articulation with exact T-side attachments

Assume H[T_y] is disconnected, with components K_1,...,K_r where r>=2. Since H[T] is connected and T=T_y∪{y}, every K_i has at least one edge to y. Distinct K_i have no edge between them by definition. Hence for every i,

    N_H(K_i) ∩ (T\K_i) = {y}.                    (3)

Thus y is a cut vertex of H[T], and y is the unique vertex of T outside K_i through which K_i attaches to the rest of T. The component containing x attaches to y via the inherited edge xy because y∈A_alpha.

Minimum-cardinality does not by itself make the disconnected T_y a resource; connectedness already fails. The fixed gamma/alpha component data does not rule out (3): connectivity of T is unrestricted in color, while the Kempe partition is taken only in the gamma/alpha-induced subgraph of G-x. The edge xy disappears from G-x, and no retained premise forces the y-to-K_i attachment vertices to have gamma color, to lie in C_a, or to create a gamma/alpha path from y to a or v.

Therefore the disconnected alternative also survives the authorized test.

## Exact outcome

The bounded gate proves the following conditional structural dichotomy.

**RL18-P01 candidate (unpromoted):** under the retained RL18 hypotheses and y∈T, T_y is nonempty and exactly one of the following holds:

1. H[T_y] is connected, and there exists a cyclic nonedge pq of H[S] with
   N_H(p)∩T=N_H(q)∩T={y}; in the fixed coloring d its endpoints have colors outside {gamma,alpha} and are not neighbors of x; or
2. H[T_y] is disconnected, y is an articulation of H[T], and every component K of H[T_y] satisfies N_H(K)∩(T\K)={y}.

The same fixed gamma/alpha locked-component data does not eliminate either alternative and supplies no changed valid-resource argument. The first missing bridge is from this coverage-essential-or-articulation dichotomy to either cyclic coverage of a smaller connected exterior set or a component/attachment statement visible to an appropriate Kempe structure.

No contradiction, y∉T theorem, endpoint anchoring, second resource, or m=1 exclusion follows.

## Obligation accounting and limits

No named mathematical obligation is reduced. The m=1 case, endpoint anchoring, second-resource construction, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order-seven coverage, every higher order and full sharp Hadwiger remain open.

RL16-P01, RL15-P01, RL14-P01, RL13-P00/P01/P02, all inherited results and source limits, and FL-001 through FL-020 retain exact scope.

Mathematical numerical computation: 0.
New source queries: 0.
New source opens: 0.
Verification: same-worker analytic review only; no formal or external independent certification and no novelty claim.
Programme ACTIVE.
