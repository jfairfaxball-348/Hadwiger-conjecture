# RL19 articulation-side pruning assessment

Date: 2026-10-02 Europe/Madrid.
Status: **bounded analytic work complete; RL19 OPEN / NOT PROMOTED.**

## Inputs and scope

Use RL18-P01 only in its disconnected alternative. Thus H[T-{y}] is disconnected, y is an articulation of H[T], and every component C of H[T-{y}] satisfies

    N_H(C) ∩ (T\C) = {y}.

Let K_x be the component containing x. Fix exactly one other component K. Put

    R  = K ∪ {y},
    R' = T \ K.

No other component is selected and no coloring/Kempe mechanism is used.

## 1. The two sides are proper connected exterior subsets

Both R and R' are subsets of the exterior resource T, hence remain exterior.

R is nonempty and connected: K is a nonempty component and the exact attachment identity gives a K-y edge. R is proper because it omits K_x.

R' is nonempty and proper: it contains y and K_x, and it omits nonempty K. It is connected because every component C of H[T-{y}] other than K has y as its exact T-side attachment, so y has a neighbor in every such C; therefore y joins all components retained in R'.

Consequently |R|<|T| and |R'|<|T|.

## 2. Exactly two minimum-cardinality invocations

T is minimum-cardinality among resources. Since R is a strictly smaller nonempty connected exterior set, R cannot be a resource. At this gate the only remaining resource condition that can fail is cyclic coverage. Choose one cyclic nonedge

    e_R = pq

such that neither p nor q has a neighbor in R.

Apply minimum-cardinality a second and final time to R'. The same reasoning yields one cyclic nonedge

    e_R' = rs

such that neither r nor s has a neighbor in R'.

No further use of minimum-cardinality is made.

## 3. S-completeness localizes the defect endpoints

Because T is S-complete, every vertex of S has a T-neighbor.

For p and q, there is no R-neighbor. Hence each must have a T-neighbor in

    T\R = (T-{y})\K,

that is, on the union of articulation components other than K. In particular neither endpoint can rely on y, since y∈R.

For r and s, there is no R'-neighbor. Hence each must have a T-neighbor in

    T\R' = K.

Thus the two chosen defects are forced to opposite sides of the articulation split.

Moreover e_R and e_R' cannot share an endpoint. If a vertex t of S lay in both defect edges, then t would have no neighbor in R and no neighbor in R'. Since R∪R'=T, t would have no T-neighbor, contradicting S-completeness. Therefore

    {p,q} ∩ {r,s} = ∅.

This is the positive scoped consequence of the gate.

## 4. First missing coverage implication

The seven-cycle permits two vertex-disjoint cyclic nonedges. The allowed premises impose no further relation between the chosen defects.

At the incidence level, label the cyclic vertices s_0,...,s_6 and take the two defects to be s_0s_1 for R and s_3s_4 for R'. Let s_0,s_1 receive T-neighbors only on the R'\R side (for example in K_x), let s_3,s_4 receive T-neighbors in K, and let s_2,s_5,s_6 receive a T-neighbor at y. Then:

- T is S-complete at this boundary-incidence level;
- R misses both endpoints only of s_0s_1 and covers every other cyclic nonedge;
- R' misses both endpoints only of s_3s_4 and covers every other cyclic nonedge;
- the two defects are vertex-disjoint and obey the forced opposite-side localization.

This incidence pattern is not asserted to extend to an actual full C_7 critical graph and is not a Hadwiger counterexample. Its sole role is to show that S-completeness plus the articulation split do not logically force either R or R' to recover complete cyclic coverage.

No genuinely smaller resource is forced: R and R' are already smaller but coverage-defective, while the permitted information supplies no complete-coverage conclusion for K, K_x, {y}, or any other proper subset.

## Candidate result RL19-P01

At the exact disconnected RL18-P01 scope and for one fixed component K≠K_x, the two pruning sides R=K∪{y} and R'=T\K are proper nonempty connected exterior subsets. Minimum-cardinality gives one cyclic coverage defect on each side. S-completeness forces the R-defect endpoints to have T-neighbors in T\R and the R'-defect endpoints to have T-neighbors in K; the two chosen defect cyclic nonedges are vertex-disjoint.

Classification: **proved scoped elementary analytic mathematics, same-worker review only; NOT PROMOTED pending normal RL19 closeout.**

## Stopping point

The mechanism stops at the first missing implication: vertex-disjoint opposite-side defect edges on the seven-cycle need not contradict one another, and no allowed premise propagates the attachment of one defect into full cyclic coverage on either side.

No named mathematical obligation is reduced. The m=1 case, endpoint anchoring, a second resource, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order-seven coverage, higher orders, and full sharp Hadwiger all remain open.
