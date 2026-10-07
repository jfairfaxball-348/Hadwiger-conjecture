# RL66 — C66 falsification test on the named families (analytic; computation 0)

Status: RL66 record. CLOSED/FROZEN on promotion at RL66 closeout. Root: HC7 only.

C66: every 4-light 5-rooted R with ρ4(R) >= m(R)+7 has a rooted K6↓5 minor. A falsifier must be 4-light, satisfy ρ4 >= m+7, and have no rooted K6↓5.

The definitions are those of the RL66 brief, with the fragment form of 4-light. F1 enters only through its definitions. F1 = arXiv:2609.17760v1 is an unrefereed preprint whose §1.1 discloses AI-obtained proofs.

**Standard facts used.** These are elementary and classical, as in RL65_FALSIFICATION_TEST.md:
- (P1) planar graphs have no K5 minor;
- (P4) a 5-connected plane triangulation T has δ >= 5 and |T| >= 12;
- (P6) deleting one edge lowers vertex connectivity by at most 1;
- (P7) the icosahedron graph (12 vertices, 30 edges, a plane triangulation) is 5-connected, and the neighbours of each vertex induce a 5-cycle.

**Lemmas used** (proved in RL66_C66_ASSESSMENT.md §1): F′ (full packing), P (unique non-root neighbour), S (concentrated contacts), K4r (three-rooted K4 in 3-connected graphs).

**Recurring face argument.** If some roots lie on a common face of a plane graph H, then H has no K4 model with four of those roots in distinct bags. Otherwise, adding a vertex inside that face adjacent to them would give a planar graph with a K5 minor, contradicting (P1).

## Summary table

| # | Family | 4-light? | ρ4 vs m+7 | Rooted K6↓5? | Falsifier? |
|---|---|---|---|---|---|
| (i) | apex z over planar P, X ⊆ V(P) | witness yes: z + icosahedron, X = N(v) | ρ4 = m + e(P) − 3\|P\| + 6 <= m | **never** | **no** (always below threshold). Threshold-necessity witness only |
| (ii) | two apices a, b over planar P, X ⊆ V(P) (ab optional) | iff P is 2-sparse w.r.t. X | ρ4 = m + e(P) − 2\|P\| + 2 + [ab ∈ E] | iff (a) or (b) below | **no** in every member tested: (ii-1)–(ii-4), including the root placements that block rooted K4. The all-components-poor regime is NOT ASSESSED |
| (iii) | dense blob D attached to X by a matching, and sparse variants | matching: inherited by the core | the core's surplus is larger by 15 − o >= 5 | lifts from the core | **none found**: one-directional reduction (R falsifier ⇒ core falsifier, of surplus >= 12; such cores are not excluded). Sparse variants: as in the body |
| (iv-a) | t copies of G0 glued on X (arbitrary fang pairs) | yes (vacuous) | ρ4 = t, so threshold means t >= m+7 | yes once t >= τ(M)+1 (<= 5) | **no** |
| (iv-b) | K2,2,2,2 with 5 roots (types 1 and 2), and t glued copies | yes (vacuous) | type 1: m=1, ρ4=3t; type 2: m=2, ρ4=4t; threshold iff t >= 3 | yes, already for t = 1 | **no** |

**Verdict.** No falsifier was found among the tested members of families (i)–(iv).
- (i): none exists, since the family is always below threshold.
- (ii): the family is not exhausted; its all-components-poor regime is NOT ASSESSED.
- (iii): any falsifier reduces to a core falsifier of surplus >= 12, which is not excluded. Sparse variants are handled as in the body.
- (iv): no threshold member is a falsifier.

C66 remains CANDIDATE / NOT ESTABLISHED. **Classification of this record: PROVED ANALYTIC (elementary)** for every claim marked "(proved)".

## (i) Apex over planar

Setup: P planar with |P| >= 5, X ⊆ V(P), and z a non-root adjacent to all of V(P).

- **Density (proved).** n = |P| − 4 and ρ = e(P) − e_X + |P|, so ρ4 = m + e(P) − 3|P| + 6 <= m by Euler. Always below m + 7.
- **No K6↓5 at all (proved).** A K6↓5 model has six pairwise adjacent bags, at most one of which contains z. The other five lie in P and are pairwise adjacent through edges of P, giving a K5 minor of P, which contradicts (P1).
- **Explicit 4-light witness (proved).** P = icosahedron, v ∈ V(P) and X = N_P(v).
  - By (P7), m = 5 and ρ4 = 5 + 30 − 36 + 6 = 5 = m.
  - 4-light (vacuous): a fragment containing z has boundary ⊇ X. A fragment Y ⊆ V(P)∖X has ∂Y = {z} ∪ ∂_P Y. If |∂Y| <= 4, then |∂_P Y| <= 3, so some root lies outside Y ∪ ∂_P Y, and ∂_P Y separates P. That contradicts 5-connectivity.
- **Role.** Threshold-necessity witness only: a threshold of the form m + c needs c >= 1.
- The RL65 orientation note on a uniform threshold ⌈(m+8)/2⌉ is not tested by this witness (m = 5) and stays NOT PROMOTED.

## (ii) Two apices over planar

Setup: P planar, X ⊆ V(P); a, b non-roots, each adjacent to all of V(P); ε = 1 if ab ∈ E, else ε = 0.

**Density (proved).** n = |P| − 3 and ρ = e(P) − e_X + 2|P| + ε, so ρ4 = m + e(P) − 2|P| + 2 + ε. Hence ρ4 >= m + 7 iff e(P) >= 2|P| + 5 − ε.

**4-lightness (proved).** R is 4-light iff P is **2-sparse**: every Y ⊆ V(P)∖X with |∂_P Y| <= 2 has e_P(Y) <= 2|Y|, where e_P(Y) is the number of edges of P with an end in Y.
- A fragment containing a or b has boundary ⊇ V(P)∖Y ⊇ X.
- A fragment Y ⊆ V(P)∖X has ∂Y = ∂_P Y ∪ {a, b} and ρ4(R,Y) = e_P(Y) − 2|Y|.

**Exact K6↓5 criterion (proved).** R has a rooted K6↓5 iff one of:
- (a) for some i, P − x_i has a K4 model with the four roots X − x_i in distinct bags;
- (b) for some i ≠ j, P − x_i − x_j has a K4 model with the three roots X∖{x_i, x_j} in distinct bags (the fourth bag free).

*Proof.*
- (a) ⇒ K6↓5: take B_{x_i} = {x_i, b}, A = {a}, and the four K4 bags.
- (b) ⇒ K6↓5: take B_{x_i} = {x_i, a}, B_{x_j} = {x_j, b} (adjacent via a x_j, so ab is not needed), the three rooted K4 bags, and the free K4 bag as A.
- Conversely, let a K6↓5 model be given.
  - If at most one bag meets {a, b}, the other >= 5 bags give a K5 minor of P.
  - So a and b lie in distinct bags, and the remaining four bags lie in P and are pairwise adjacent through P.
  - If a ∈ A and b ∈ B_{x_i} (or vice versa), the four other root bags give (a).
  - If a ∈ B_{x_i} and b ∈ B_{x_j}, the three other root bags and A give (b). ∎

**Members tested (proved).** (ii-1)–(ii-3) use a 5-connected plane triangulation T and obtain K6↓5 via (b) and Lemma K4r. (ii-4) is a general sufficient criterion via (b).
- **(ii-1) P = T, any root placement, ε ∈ {0, 1}.**
  - 2-sparse vacuously, since 5-connectivity leaves no Y with |∂_P Y| <= 2.
  - ρ4 = m + |T| − 4 + ε >= m + 8.
  - T − x_i − x_j is 3-connected, so K4r gives (b). **K6↓5.**
- **(ii-2) Four roots blocking rooted K4.** P = T − y1y3, where y1y2y3 and y1y3y4 are the two faces at y1y3. X = {y1, y2, y3, y4, y5}, with y5 any other vertex.
  - y1..y4 lie on the new 4-face, so P has no rooted K4 on them (face argument).
  - P is 4-connected by (P6), so it is 2-sparse vacuously. ρ4 = m + |T| − 5 + ε >= m + 7.
  - P − y1 − y3 = T − y1 − y3 is 3-connected, so (b) holds with U = {y2, y4, y5}. **K6↓5.**
- **(ii-3) All five roots on one face.** Let y1y2y3, y1y3y4, y1y4y5 be consecutive faces at y1, and P = T − {y1y3, y1y4}, so y1..y5 bound a 5-face. X = {y1, …, y5}.
  - For every i, X − y_i lies on a face of P − y_i, so (a) fails for every i.
  - P is 3-connected by (P6), so it is 2-sparse vacuously. ρ4 = m + |T| − 6 + ε, which is >= m + 7 iff |T| >= 13 − ε.
  - P − y1 − y3 = T − y1 − y3 is 3-connected, so (b) holds with U = {y2, y4, y5}. **K6↓5**, whether or not the threshold is met.
- **(ii-4) Richness criterion.** Let D be a component of P − X, so ∂_P D ⊆ X. If, for some triple U ⊆ ∂_P D, P[D ∪ U] has a K4 model with U in distinct bags ("D is rich for U"), then (b) holds with {x_i, x_j} = X∖U. **K6↓5.** This holds for instance when P[D ∪ U] is 3-connected (K4r).

**Lesson.** In every tested member, root placements that block rooted K4 do not prevent K6↓5. Case (b) puts both apices into root bags and needs only a K4 on three roots with a free fourth bag, which the face argument does not obstruct.

**NOT ASSESSED: the all-components-poor regime.**
- Every edge of P outside P[X] has an end in exactly one component D of P − X. So e(P) − 2|P| = Σ_D (e_P(D) − 2|D|) + e_X − 10, and the threshold reads Σ_D (e_P(D) − 2|D|) >= m + 5 − ε.
- Components with |∂_P D| <= 2 contribute <= 0, by 2-sparsity.
- Planarity bounds the components with |∂_P D| >= 3 to at most 6. (Contract each to a vertex; the bipartite planar graph X versus those vertices has <= 2(5+k) − 4 edges and >= 3k.)
- A falsifier in (ii) would therefore need all of the following:
  - every component with >= 3 attachments poor for every triple, by (ii-4). A (b) model whose non-root vertices lie in one component D is exactly richness of D, since the free bag is connected and so lies in a single component;
  - no (a);
  - no (b) model spread over several components;
  - at most 6 positive components;
  - total contribution >= m + 5 − ε.
- No bound on the contribution of a poor component was proved. This regime is recorded NOT ASSESSED, and no falsifier was found in it.

## (iii) Dense blob attached by a matching, and sparse variants

**Matching attachment.** Setup:
- V(R) = X ∪ D;
- distinct d_1..d_5 ∈ D, and the root–non-root edges are exactly x_i d_i;
- root edges E_X are arbitrary.

The core R_D⁺ is R[D] plus the edges d_i d_j for x_i x_j ∈ E_X, rooted at X_D = {d_1, …, d_5}. Let o be the number of pairs ij with both d_i d_j ∈ E(R) and x_i x_j ∈ E_X. Then:
1. **R 4-light ⇒ R_D⁺ 4-light (proved).** A fragment Y ⊆ D∖X_D has the same neighbours and the same incident edges in both graphs, because Y has no root neighbour in R and the added edges have no end in Y.
2. **Surplus (proved).** ρ4(R) = e(R[D]) + 5 − 4|D| and ρ4(R_D⁺) = e(R[D]) − e(R[X_D]) − 4|D| + 20, with m(R_D⁺) = 10 − e(R[X_D]) − |E_X| + o. Hence (ρ4 − m)(R_D⁺) = (ρ4 − m)(R) + 15 − o, which is at least the surplus of R plus 5.
3. **Lifting (proved).** A rooted K6↓5 in R_D⁺ lifts to R, with B_{x_i} = {x_i} ∪ B'_{d_i}. A transferred edge d_i d_j is replaced by x_i x_j.

So a matching-attached member is a falsifier only if its core is, and the core is a C66 instance with surplus >= 12. The reduction is one-directional: R falsifier ⇒ core falsifier. Such cores are not excluded; that is a C66 question. **Family (iii) produces no falsifier beyond its cores.**

**Explicit case D = K_t (t >= 6) (proved).**
- 4-light vacuously. For Y ⊆ D (Y = D gives ∂Y = X), ∂Y = (D∖Y) ∪ {x_i : d_i ∈ Y}. If |Y| = t − s with s <= 4, and j of the s vertices outside Y are attachment vertices (j <= s), then |∂Y| = s + 5 − j >= 5. If |Y| <= t − 5, then |D∖Y| >= 5.
- ρ4 = C(t,2) − 4t + 5, which is >= 17 >= m + 7 for t >= 12. t >= 12 suffices for every m; smaller t (10 or 11) suffice when m is small.
- K6↓5: B_{x_i} = {x_i, d_i} and A = {w} with w ∈ D∖X_D.

**Sparse variants (proved).**
- *Every root attached by one edge, at most 4 distinct attachment vertices.* For 4-light R, Lemma S with Z = the attachment vertices (s <= 4) and N_X(D∖Z) = ∅ gives ρ4 <= C(s,2) + 5 − 4s <= 1. Far below threshold.
- *More generally, root contacts concentrated on <= 4 non-roots* (Corollary S.1): below threshold, or K6↓5 by Lemma F′.
- *A root with a unique non-root neighbour* changes the surplus by 3 − |T| under Lemma P: an increase iff |T| <= 2, unchanged at |T| = 3, a decrease of 1 at |T| = 4. So Lemma P is a reduction (keeping 4-lightness and lifting K6↓5) only for |T| <= 3. The case |T| = 4 (x adjacent to all other roots, v a full vertex) is the residual configuration of Corollary P.1 and is not excluded.

## (iv) G0 copies and K2,2,2,2

**(iv-a) G0 copies (proved).**
- Setup: copies {p_k, q_k}, k = 1..t, glued on X. In copy k, p_k is adjacent to every root except x_{a_k}, q_k to every root except x_{b_k} (a_k ≠ b_k), and p_k q_k is an edge. Root edges are arbitrary.
- ρ4 = t, since root edges do not count.
- **4-light (vacuous).** Copies are pairwise non-adjacent, so a fragment Y has ∂Y = ∪_k ∂(Y ∩ {p_k, q_k}) over its non-empty parts, and each part has a boundary of size 5 (RL65 §4).
- Each copy is a full component.
- **K6↓5.** By Lemma F′, any t >= τ(M) + 1 (at most 5) gives K6↓5. Threshold members have t >= m + 7 >= 7 > 5. **K6↓5.**
- Explicit model with a common fang pair, with a_k = 2 and b_k = 1 (p_k misses x2, q_k misses x1, as in RL65 §4), m = 10 and t = 4 (below threshold, still K6↓5):
  - A = {p_1};
  - B_{x1} = {x1, p_2};
  - B_{x2} = {x2, q_1, q_2};
  - B_{x3} = {x3, p_3};
  - B_{x4} = {x4, p_4};
  - B_{x5} = {x5}.

  All ten root pairs are adjacent: 12 via p_2q_2; 13, 14, 15 via p_2; 23, 24, 25 via q_1; 34, 35 via p_3; 45 via p_4. A is adjacent to x1, q_1, x3, x4, x5.

**(iv-b) K2,2,2,2 (proved).** Parts {a,a'}, {b,b'}, {c,c'}, {d,d'}. Up to symmetry, every 5-set of vertices is of type 1 (2+1+1+1) or type 2 (2+2+1).
- **Type 1:** X = {a, a', b, c, d}, non-roots b', c', d'.
  - m = 1 and ρ4 = 15 − 12 = 3, so a single copy is below 8.
  - 4-light vacuously: every fragment boundary has size 6, except ∂{b', c', d'} = X.
  - **K6↓5:** A = {c'}, B_a = {a, b'}, B_{a'} = {a'}, B_b = {b}, B_c = {c, d'}, B_d = {d}. Pair aa' via b'a'; A meets B_c via c'd'.
- **Type 2:** X = {a, a', b, b', c}, non-roots c', d, d'.
  - m = 2 and ρ4 = 16 − 12 = 4, so a single copy is below 9.
  - 4-light vacuously.
  - **K6↓5:** A = {d}, B_a = {a, c'}, B_b = {b, d'}, the other root bags singletons.
- **t copies of one type glued on X with the same root identification** (so m stays 1 or 2 respectively): ρ4 = 3t or 4t, which reaches the threshold iff t >= 3. Still 4-light vacuously, since copies are pairwise non-adjacent and each part's boundary has size >= 5. K6↓5 is already present in one copy.

Programme ACTIVE.
