# RL12 separator feasibility — CLOSED/FROZEN

The exact local result BR-06-SEP2 below is retained as an RL12 scoped
analytic theorem. It is not a universal separator-existence result, a
rooted-minor theorem or ordinary Hadwiger progress. RL13 is the sole
successor.

---
# RL12 one bounded feasibility check — two-defect separator synchronization

Date: 2026-10-01 Europe/Madrid. **Complete analytic work; NOT PROMOTED. RL12 remains OPEN.**
Decision and pre-recorded bounds: [ROUTE_COMPARISON.md](ROUTE_COMPARISON.md) and [WORK_UNIT_SCOPE.md](WORK_UNIT_SCOPE.md).

## Exact outcome

**BR-06-SEP2 is true at the stated local scope.** The four possible boundary color patterns either already align, or force two simultaneous paths with disjoint palettes, after which one proper minor supplies the missing compatible pattern.

This is a scoped analytic coloring reduction. It is not an exact finite computational certificate, a theorem of universal separator existence, a rooted-Hadwiger theorem or a finite ordinary counterexample. The full sharp root remains h(G)>=chi(G) for EVERY finite simple graph. No novelty, formal proof checking or external independent certification is claimed.

## Statement RL12-P01 / BR-06-SEP2

For every integer t>=7 and finite simple graph G with C_t(G), there is NO partition
V(G)=A disjoint-union Q disjoint-union B satisfying all of:

1. A and B are nonempty and there are no edges between them.
2. Q={x,y,z,w} union D has size k with 4<=k<=t-1; the four displayed vertices are distinct.
3. The only nonedges of G[Q] are xy and zw.
4. There is an x-y path with internal vertices in A and one with internal vertices in B; there is likewise a z-w path through each side.

No disjointness of the two initially supplied paths inside a side is assumed. A or B need not be connected, and no order/path bound is imposed. The four path hypotheses are explicit; we do not infer them from an arbitrary separation.

C_t means exact chi(G)=t and every proper minor is (t-1)-colorable. In particular the theorem applies to hypothetical minor-minimal t-counterexamples with this configuration. It does not assert that such a configuration exists.

## Proof

Put q=t-1. Write G_A=G[A union Q] and G_B=G[B union Q].
Both are proper minors of G, since the other side is nonempty, and both admit proper maps into [q]. All colorings below use the fixed q labels but need not use all of them.

For X in {A,B}, define Sigma_X to be the set of masks (epsilon_1,epsilon_2) attained by proper q-colorings c of G_X, where epsilon_1=1 means c(x)=c(y), and epsilon_2=1 means c(z)=c(w). A zero means the corresponding endpoints have distinct colors.

Because all other pairs of Q are edges, the mask specifies the ENTIRE equality partition on Q. Its classes are the selected pairs and the remaining singletons. There are exactly k-epsilon_1-epsilon_2 boundary classes. Each Sigma_X is a nonempty subset of {00,10,01,11}.

### 1. A common mask gives a sharp coloring of G

Suppose c_A and c_B have the same mask. They induce exactly the same partition of Q; assign a bijection between their used boundary labels according to those classes. Extend this bijection to a permutation of all q labels, possible because both use the same number of boundary classes. Apply that permutation to c_B.

The colorings now agree on every vertex of Q. Define c on G by c_A on A union Q and the permuted c_B on B. Every edge lies wholly in one retained side because no A-B edge exists. Thus c is a proper q-coloring of G, contradicting chi(G)=q+1.

Consequently, under the assumed C_t configuration,
Sigma_A intersect Sigma_B is empty.                                      (1)

This is a necessary contradiction setup, not a statement about arbitrary side-coloring families.

### 2. Individual opposite-side paths impose each equality separately

Take an x-y path with internal vertices in B. Delete B outside that path, and contract the WHOLE path to identify x and y, retaining A and every other vertex of Q. At least one internal vertex exists since xy is a nonedge. The result is a proper minor of G: contraction strictly decreases vertex count, and any further deletions do not change that fact.

Its proper q-coloring pulls back to a proper q-coloring of G_A with x and y equal. Only x and y among vertices of G_A were identified, and they were nonadjacent. Every original G_A edge remains an edge constraint. Extra quotient edges impose extra restrictions rather than justify dropping a side edge. No coloring is pulled back to the internal B path, which was discarded from this side.

It follows that Sigma_A meets {10,11}. The z-w path through B similarly makes Sigma_A meet {01,11}. Using the two paths through A gives the same two facts for Sigma_B. These are FOUR separate proper-minor constructions. We have not contracted intersecting paths together.

For each X in {A,B},
Sigma_X meets {10,11} AND Sigma_X meets {01,11}.                          (2)

### 3. Exhaust the mask conflict symbolically

If neither Sigma contains 11, (2) puts BOTH 10 and 01 in each Sigma, contradicting (1).
If both contain 11, (1) again fails.
Hence exactly one contains 11. Interchange A and B if needed so that

11 is in Sigma_A, 11 is not in Sigma_B,
10 and 01 are in Sigma_B, and 10 and 01 are not in Sigma_A.               (3)

The membership of 00 is immaterial. In particular we do not incorrectly assume Sigma_A={11}; it could also contain 00. The argument covers both cases.

This is the complete four-mask case partition; no coloring enumeration or sampled-coloring inference occurs.

### 4. Two absent boundary colors supply two compatible paths

Choose one coloring c of G_A with mask 11.
Let alpha=c(x)=c(y) and beta=c(z)=c(w). They differ because xz is an edge.

There are k-2 distinct colors on Q. Since q>=k, at least TWO labels of [q] are absent from Q. Choose distinct gamma and delta among them. In particular
{alpha,gamma} and {beta,delta} are disjoint palettes.

Consider the subgraph of G_A induced by vertices with colors alpha or gamma. If x and y lay in different connected components, swap alpha and gamma on the component containing x. This swap is proper: an edge to a vertex of either swapped color cannot leave that two-color component, and an edge to any other color remains proper. On Q, only x changes color: gamma was absent and the only alpha vertices there were x and y. The swap produces mask 01, contrary to (3).

Therefore x and y lie in one such component. Choose a simple x-y path P in it. Its internal vertices lie in A because Q has no other vertex colored alpha or gamma.

The identical argument with beta and delta gives a simple z-w path R, internally in A: otherwise a component swap would produce forbidden mask 10.

The paths P and R are VERTEX-DISJOINT. Their palettes are disjoint and c assigns one label to each vertex. In particular their interiors avoid all four other boundary demands as needed. This is the independent compatibility argument; separate existence alone was never enough.

### 5. One simultaneous proper minor forces the forbidden pattern

Now delete the unused vertices of A and contract P and R, each in its entirety, to two distinct vertices. Keep B and the other vertices of Q. The branch sets for these two contractions are disjoint connected sets; hence this is an actual simultaneous graph minor, strictly smaller than G.

By C_t it has a proper q-coloring. Pull back only to G_B, giving x,y their merged color and z,w their other merged color. Both identified pairs were nonedges in G_B, and no B vertex was contracted. Every G_B edge is respected. Cross edges already present in Q force the two pair colors, and all remaining boundary singleton colors, to be distinct. Thus the pulled-back coloring has mask 11.

This contradicts 11 not in Sigma_B in (3). The assumed configuration in C_t cannot exist. QED.

## Verification of the first independent input

The new step beyond C3 is Step 4 and its use in Step 5. It needs BOTH absent labels; a common label for both connections could recreate RL7's palette collision. Their availability follows exactly from k<=q and a mask-11 coloring. No global independence bound, helper clique, minor-to-subdivision converse, or arbitrary graph-coloring contraction rule is used.

Each contraction is colored because it is an actual proper minor of the original C_t graph. Chromatic number is never assumed minor-monotone for an arbitrary six-colorable H. Colorings are pulled back only to sides where identified boundary pairs are independent; we do not claim they extend over the contracted internal paths.

All four terminal conditions and both side nonemptiness conditions are load-bearing. The proof does not claim a theorem when the missing edges overlap, when other boundary nonedges are present, when k>t-1, when a needed side path is absent, or when C_t is weakened to vertex-criticality or D_cyc.

## Relation to the root and stopping frontier

The exact sharp contradiction is a (t-1)-coloring of a t-chromatic G. This adds a proved local reducibility item to BR-06 in checkpoint work and resolves the newly named subobligation BR-06-SEP2. It does not require a six-branch model; if this is ever used in an A11 route, the universal configuration-coverage theorem is still independently required.

[The source gate](SOURCE_QUESTION_AND_LIMITS.md) removes order-seven progress credit. No comprehensive novelty or residual-open-status claim is made for higher orders. All separator-free cases and all other boundaries remain. The first missing GLOBAL input is unavoidability/applicability of a covering reduction family, and this check stops there.

No general D_cyc, UP_6, CR_6, ordinary t=7 or higher-order Hadwiger theorem follows. No ordinary negative is supplied. C3 remains valid at its original scope; it was not reproved as the new result. No inherited theorem is corrected or demoted.

ONE check complete: four symbolic equality masks, four single-pair minor implications, two Kempe arguments and one simultaneous two-pair minor. ZERO numerical mathematical computation. No extra separator pattern, connected-helper extraction assessment, or source search follows.
