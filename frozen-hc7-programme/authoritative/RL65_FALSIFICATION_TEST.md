# RL65 — C65 falsification test on the named families (analytic; computation 0)

Status: RL65 record. CLOSED/FROZEN on promotion at RL65 closeout. F1.txt line references are to the pdftotext -layout extraction (sha256 76b7917b56762c2527a79e3b592a34fd100aa049fab904a3e53311a22f13e89d) of the pinned F1 v1 PDF, as in RL64_ADMISSION_RECORD.md. The F1 text itself is not stored (licence).

F1 = arXiv:2609.17760v1: an unrefereed preprint whose §1.1 (F1.txt:154–182) discloses AI-obtained proofs. It is used here only for the statement of C65 and as the source of the family pointers. Every claim below is re-proved from (P1)–(P4).

C65 (F1.txt:103–104): "Every 5-connected graph with n ≥ 6 vertices and at least 4n − 2 edges contains K7− as a minor."

A falsifier must satisfy all four of: 5-connected; n >= 6; e >= 4n−2; no K7^- minor.

**Standard facts used.** All are elementary and classical, used at textbook level:
- (P1) Minors of planar graphs are planar, and K5 is non-planar. So planar graphs have no K5 minor.
- (P2) In a simple plane triangulation with >= 4 vertices, the neighbours of each vertex v span a cycle subgraph C_v, the link of v, in rotation order. C_v may have chords; only its cycle edges and the adjacency of v to all of C_v are used.
- (P3) Every outerplanar graph with >= 2 vertices has a vertex of degree <= 2.
- (P4) A 5-connected plane triangulation has minimum degree >= 5. From 5m <= 2(3m−6), it has m >= 12 vertices.
- (P5, orientation only; not re-verified and not used by any per-T claim.) 5-connected plane triangulations exist on arbitrarily many vertices: F1.txt:84–86 uses this implicitly. The RL65 red team notes, unverified here, that none exists on exactly 13 vertices. Only the "Role" sentences that speak of arbitrarily large n rely on (P5).

**Family sources.**
- K6 and apex + triangulation: F1.txt:82–87.
- F2's G_n: F1.txt:71–76, and F2.txt:651–658 as quoted in RL64_FRONTIER_OBSTRUCTION_MAP.md §2. F2.txt itself was not re-read in RL65. The direct proof in F-c does not depend on F2.
- K2,2,2,2: F1 Thm 1.2 exception (F1.txt:68–70) and F2 Thm 6.
- Two apices + triangulation: F1.txt:115–118.

## Summary table

| # | Family | 5-connected? | e vs 4n−2 | K7^- minor? | Falsifier? |
|---|---|---|---|---|---|
| F-a | K6 (n=6) | yes | 15 < 22 | no | **no**: edge hypothesis fails |
| F-b | universal vertex x + 5-connected plane triangulation T (\|T\| = n−1 >= 12) | yes (6-connected) | 4n−10 < 4n−2 | no (not even K6) | **no**: edge hypothesis fails |
| F-c | F2's G_n: A = 4 universal vertices, G_n[B] a matching | **no** for n >= 7; 4-connected; G_6 = K6 | 4n+⌊n/2⌋−12, which is >= 4n−2 iff n >= 20 | no | **no**: 5-connectivity fails |
| F-d | K2,2,2,2 (n=8) | yes (6-connected) | 24 < 30 | no (best is K7^=) | **no**: edge hypothesis fails |
| F-e | two adjacent universal vertices x, y + 5-connected plane triangulation T (\|T\| = n−2 >= 12) | yes (7-connected) | 5n−15 >= 4n−1 > 4n−2 (n >= 14) | **yes** | **no**: C65's conclusion holds; no K7 minor |

**Verdict.** No named family falsifies C65. C65 remains CONJECTURE / NOT ESTABLISHED.

## Reasoning

**F-a. K6.**
- K6 is 5-connected: it has 6 > 5 vertices, and removing <= 4 vertices leaves a complete graph.
- Its edge count is 15 < 4·6−2 = 22.
- A minor has at most as many vertices as the host, so K6 has no 7-vertex minor at all.
- F1 notes 15 = 4n−9, used for K7^= Conjecture 1.4.

**F-b. Apex over a 5-connected plane triangulation.** Let m = n−1 >= 12 (P4).
- Edge count: (3m−6) + m = 4m−6 = 4n−10 < 4n−2.
- 6-connected: a set S with |S| <= 5 and x ∉ S leaves x adjacent to everything. If x ∈ S, then T − (S−x) is connected, because |S−x| <= 4.
- No K6 minor. A K6 model has at most one bag containing x, so >= 5 bags lie in T. Two such bags are adjacent only through edges of T. That gives a K5 minor of T, contradicting (P1).
- K6 ⊆ K7^- (delete one end of the missing edge), so there is no K7^- minor.
- Role: 5-connected K7^- -minor-free graphs with 4n−10 edges, for arbitrarily large n by (P5).

**F-c. F2's G_n.** V = A ∪ B, |A| = 4, A complete and joined to everything, G_n[B] a matching. The edge count from F2 is 4n+⌊n/2⌋−12 = 6 + 4(n−4) + ⌊(n−4)/2⌋.
- *4-connected for n >= 5.* Removing <= 3 vertices leaves a vertex of A, which is adjacent to all the rest.
- *Not 5-connected for n >= 7.* G_n − A = G_n[B] has >= 3 vertices spanned by a matching, so it has >= 2 components, and A is a 4-separator.
- *Small cases.* G_6 = K6 is covered by F-a. G_5 = K5 has n < 6.
- So no G_n satisfies C65's hypotheses.
- *No K7^- minor (direct proof; F2 is not needed).* Take a model with 7 bags.
  - At most 4 bags meet A, so >= 3 "B-bags" lie inside G_n − A.
  - A B-bag is connected inside a matching graph, so it is a single vertex or a matched pair.
  - Two B-bags are adjacent only through a matching edge bb'. Then both lie in the component {b, b'}, so they are {b} and {b'}.
  - Hence each B-bag is adjacent to at most one other B-bag. Among k >= 3 B-bags there are >= C(k,2) − ⌊k/2⌋ >= 2 non-adjacent pairs.
  - A K7^- model allows at most one non-adjacent pair of bags, so none exists.
  - (For k = 3, the two non-adjacent pairs share a bag. This is consistent with F2's claim that G_n has no K7^= minor, and with F2 Thm 6 forcing K7^vee.)
- *Edge threshold.* 4n+⌊n/2⌋−12 >= 4n−2 iff ⌊n/2⌋ >= 10 iff n >= 20.
- **Role.** For n >= 20, G_n is a 4-connected K7^- -minor-free graph with >= 4n−2 edges. So C65's 5-connectivity hypothesis cannot be weakened to 4-connectivity.

**F-d. K2,2,2,2** (K8 minus a perfect matching {aa', bb', cc', dd'}).
- e = 28−4 = 24 < 4·8−2 = 30.
- 6-connected: n = 8 > 6. After deleting <= 5 vertices, >= 3 remain. Any two remaining vertices are adjacent, or are partners with a common neighbour among the rest.
- *No K7^- minor.* The 7 disjoint non-empty connected bags in 8 vertices are of two kinds:
  - **Seven singletons.** The induced K1,2,2,2 has 3 non-adjacent pairs, but at most 1 is allowed.
  - **One bag {u, w}, an edge with u, w in different parts, plus six singletons.**
    - {u, w} is adjacent to everything. u' is adjacent to w and w' to u, since they lie in different parts.
    - Among the singletons u', w', and the two intact pairs, the only non-adjacent pairs are those two intact pairs. u'w' is an edge.
    - So the quotient is exactly K7^=, with 2 non-adjacent pairs.
- Role: a 5-connected K7^- -minor-free graph with 4n−8 edges. The bound 4n−8 is the F2 Thm 6 / F1 Thm 1.2 exceptional value.

**F-e. Two adjacent universal vertices x, y over a 5-connected plane triangulation T.** Let m = n−2 >= 12 (P4), so n >= 14.
- *Edges.* (3m−6) + 2m + 1 = 5n−15. Then 5n−15 − (4n−2) = n−13 >= 1.
- *7-connected.* T + x is 6-connected, as in F-b. Now take S with |S| <= 6. If y ∉ S, y is adjacent to every remaining vertex. If y ∈ S, then (T+x) − (S−y) is connected because |S−y| <= 5. Also n >= 14 > 7. ("Universal" includes xy ∈ E; F1's count 5n−15 includes that edge.) So the graph is 5-connected and n >= 6. All C65 hypotheses hold.
- **K7^- minor exists.**
  1. Pick v ∈ T and let C = C_v be its link cycle (P2), with |C| = d(v) >= 5.
  2. *T − v − N(v) ≠ ∅.* Otherwise every vertex of T − v lies on the single face bounded by C, so T − v is outerplanar. By (P3) it has a vertex of degree <= 2, which has degree <= 3 in T, contradicting (P4).
  3. Let D be a component of T − ({v} ∪ N(v)). Then N(D) ⊆ N(v) = V(C). D is a component of T − N(D), and v ∉ D ∪ N(D). So N(D) separates, and 5-connectivity gives |N(D)| >= 5.
  4. Choose four attachments a1, …, a4 ∈ N(D) in cyclic order on C. Split C into consecutive vertex-disjoint paths P1..P4 with a_i ∈ P_i.
  5. Take bags B0 = {v}, B1 = V(P1) ∪ V(D), B2 = V(P2), B3 = V(P3), B4 = V(P4).
     - The bags are disjoint and connected: D is attached to a1.
     - B0 is adjacent to all others. Cyclically consecutive arcs are adjacent through cycle edges. B1 is adjacent to B3 because D attaches to a3.
     - Only B2B4 may be non-adjacent. So T has a K5^- model.
  6. Adding the bags {x} and {y}, which are adjacent to each other and to everything, gives a **K7^- model**.
- **No K7 minor.** At most 2 bags meet {x, y}. The other >= 5 bags lie in T and are pairwise adjacent through edges of T, giving a K5 minor of T, which contradicts (P1). This is F1's statement (F1.txt:115–118), re-proved here.
- **Role.** This family satisfies C65's hypotheses and conclusion: it is consistent with C65. It is the documented **K7 density failure**. 7-connected K7-minor-free graphs have 5n−15 edges, so no density statement can upgrade C65's conclusion from K7^- to K7.

## Byproducts (recorded, not promoted beyond their scope)

- Lower bounds on the K7^- density threshold for 5-connected graphs: 4n−8 (K2,2,2,2, n=8) and 4n−10 for arbitrarily large n (F-b, using (P5)). C65's constant −2 is consistent with both.
- The 5-connectivity hypothesis is necessary: F-c gives 4-connected counterexamples for n >= 20.

## Classification

- **Falsification-test record: PROVED ANALYTIC MATHEMATICS** (elementary; the per-family claims use only (P1)–(P4); (P5) is orientation for the "Role" lines only).
- **Outcome: NO FALSIFIER** among the five named families.
- C65: CONJECTURE / NOT ESTABLISHED (unchanged).
- No computation and no census were performed.

Programme ACTIVE.
