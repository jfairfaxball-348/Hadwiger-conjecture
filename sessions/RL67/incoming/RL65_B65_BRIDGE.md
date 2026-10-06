# RL65 — Bridge B65

Status: RL65 record. CLOSED/FROZEN on promotion at RL65 closeout. F1.txt line references are to the pdftotext -layout extraction (sha256 76b7917b56762c2527a79e3b592a34fd100aa049fab904a3e53311a22f13e89d) of the pinned F1 v1 PDF, as in RL64_ADMISSION_RECORD.md. The F1 text itself is not stored (licence).

Root: HC7 only. Sources: F1 = arXiv:2609.17760v1 (Dvořák–Norin–Rahman), re-fetched in RL65 R1 and byte-identical to the RL64-admitted v1 (PDF sha256 6af798e5…c907; F1.txt sha256 76b7917b…, line references as in RL64). F1 is an unrefereed preprint. Its §1.1 (F1.txt:154–182) discloses that AI was used to obtain the proofs; its proofs are unread here.

## Inputs consumed (exact text, re-checked in RL65 against F1.txt)

- **C65 = F1 Conjecture 1.5** (F1.txt:103–104): "Every 5-connected graph with n ≥ 6 vertices and at least 4n − 2 edges contains K7− as a minor." Status: CONJECTURE / NOT ESTABLISHED. It is used here only as a hypothesis.
- **F1 Theorem 1.6** (F1.txt:109–111): "Let G be a K7− -minor free graph of chromatic number at least seven. If every proper minor of G is 6-colorable, then G is 7-connected and |E(G)| ≥ 4|V(G)| − 2." Level A, statement only.
- **Definitions in F1.**
  - K7^- is K7 minus one edge (F1.txt:34–36).
  - Minor and model are standard (F1.txt:188–195).
  - k-connected (F1.txt:225–226): "a graph with at least k + 1 vertices is k-connected if and only if it has no proper (≤ (k − 1))-separation". That sentence characterises k-connectivity only for graphs with at least k+1 vertices. Reading it as the standard notion (more than k vertices, and no separating set of fewer than k vertices) is an interpretation. B65 does not depend on it; see the convention-proofing in step 4.
- Graphs are finite and simple, as in RL64_ADMISSION_RECORD.md.

## Statement

**B65.** Assume C65, and assume F1 Thm 1.6 as stated. Then every finite simple graph G with chi(G) >= 7 contains K7^- as a minor. Consequently:

> **U9 (conditional).** Every HC7 counterexample (finite simple, chi = 7, no K7 minor) contains K7^- as a minor. Minimality is not needed.

## Proof

**Lemma B65.0.** If H is a minor of a finite graph G and H is not isomorphic to G, then |V(H)| + |E(H)| < |V(G)| + |E(G)|.

*Proof.* Let µ be a model of H in G.
- The bags µ(u) are pairwise disjoint and non-empty, so |V(H)| <= |V(G)|.
- Each edge of G has its ends in at most one pair of distinct bags. So distinct edges of H map to distinct edges of G, and |E(H)| <= |E(G)|.
- Suppose both inequalities are equalities. Then the |V(G)| disjoint non-empty bags partition V(G) into singletons, so u ↦ the vertex of µ(u) is a bijection V(H) → V(G). Under this bijection every edge uv of H maps to the edge µ(u)µ(v) of G. These images are distinct and number |E(H)| = |E(G)|, so they are all of E(G). Hence the bijection is an isomorphism H ≅ G, a contradiction. ∎

The lemma covers both conventions for "proper minor": a minor not isomorphic to G, or a minor obtained by at least one deletion or contraction. Each deletion or contraction strictly decreases |V| + |E| for finite simple graphs.

*Remark (multigraph minors).* Suppose "proper minor" in F1 Thm 1.6 were read to include minors with parallel edges. Parallel edges do not change the chromatic number. The underlying simple graph of such a minor is a simple minor of G, and it is not isomorphic to G unless the minor already is G. So step 2 below covers that reading too.

**Proof of B65.**
1. Suppose B65 fails. Among all finite simple graphs with chi >= 7 and no K7^- minor, choose G with |V(G)| + |E(G)| minimum. This is possible because the quantity is a non-negative integer.
2. **Every proper minor of G is 6-colourable.** Let H be a proper minor of G.
   - H has no K7^- minor, because the minor relation is transitive: a K7^- minor of H would be one of G.
   - By Lemma B65.0, |V(H)| + |E(H)| < |V(G)| + |E(G)|.
   - If chi(H) >= 7, H would contradict the minimality of G. So chi(H) <= 6.
3. **The hypotheses of F1 Thm 1.6 hold, each checked:**
   - G is K7^- -minor-free (choice of G);
   - chi(G) >= 7 (choice of G);
   - every proper minor of G is 6-colourable (step 2).

   So G is 7-connected and |E(G)| >= 4|V(G)| − 2.
4. **The hypotheses of C65 hold, each checked:**
   - *Order.* chi(G) >= 7 forces |V(G)| >= 7. A 7-vertex graph with chi >= 7 is K7, which contains K7^-. So |V(G)| >= 8 >= 6, independently of any connectivity convention and without using Thm 1.6.
   - *5-connected.* Since |V(G)| >= 8, F1's characterisation (F1.txt:225–226) applies to G for both k = 7 and k = 5. G is 7-connected (step 3), so G has no proper separation of order <= 6. In particular it has none of order <= 4, so G is 5-connected in F1's sense. This is monotonicity in k, and it holds under either reading of F1's convention.
   - *e >= 4n − 2.* This is exactly the edge bound from step 3.
5. C65 now says G contains K7^- as a minor. This contradicts the choice of G. ∎

**Proof of U9 from B65.** An HC7 counterexample has chi = 7 >= 7. Apply B65. Neither minimality nor the absence of a K7 minor is used.

## Corollaries and precisions

- **B65 ⇒ U8; U9 ⇒ U8.** Let K7^- = K7 − ab.
  - K7^= ≅ K7 − {ab, cd}, with c, d distinct from a, b. It is a subgraph of K7^-.
  - K7^vee ≅ K7 − {ab, ac}. It is also a subgraph of K7^-.

  A subgraph of a minor is a minor. So B65's conclusion (every graph with chi >= 7 has a K7^- minor) implies U8 at its full scope: every graph with chi >= 7 has K7^= and K7^vee minors. Restricted to HC7 counterexamples, U9 implies the counterexample-scoped U8. **Strictness over U8 is not claimed.**
- **B65 is C65 ⇒ F2 Conjecture 21** ("Every graph with no K7− -minor is 6-colorable", F2.txt:666–670, as quoted in RL64_FRONTIER_OBSTRUCTION_MAP.md §3), in contrapositive form. It is the written-out proof of F1's own remark (F1.txt:106, 112–113) that Conjecture 1.5 "would be sufficient".
- **B65 does not use [Dvo26].** Within F1, [Dvo26] is load-bearing only in the proof of Thm 1.3/2.8. It enters through Thms 2.6 and 2.7, which are cited from [Dvo26], and through F1's own Thm 2.9, a strengthening of [Dvo26, Cor 16] (F1.txt:364–413, 1113, 1196, 1343). Other mentions (F1.txt:127–136, 266, 348) are overview or preliminaries. Thm 1.6 is proved in F1 §7 (F1.txt:1479–1606). The RL65 red team checked that §7 cites only Mader, Dirac, KT05, Kriesell–Mohr, Menger and F1's internal Lemmas 7.2, 7.6 and 7.7.
- **Dependencies inside F1 Thm 1.6.** These are internal to the Level-A statement and not consumed separately here. Per RL64_CLASSICAL_INPUT_TABLE.md, F1 §7 uses:
  - Mader 7-connectivity, F1 Thm 7.1 (Level B; Math. Ann. 175 vs 174 attribution discrepancy; FL-063 unsatisfied);
  - Dirac, F1 Thm 7.3;
  - KT05 §2, F1 Thm 7.4;
  - Kriesell–Mohr, F1 Thm 7.5;
  - Menger's theorem and F1's internal Lemmas 7.2, 7.6 and 7.7.
- **No HC7-universal claim is promoted.** U9 is conditional on C65, an open conjecture.
- **Frontier rules respected.**
  - B65 does not assume 7-connectivity of HC7 counterexamples. 7-connectivity appears only inside the conclusion of F1 Thm 1.6, for the K7^- -minor-free class.
  - It does not assume delta <= 9.
  - It does not assume C65 except as the explicit hypothesis.

## Classification

**B65: PROVED ANALYTIC MATHEMATICS, CONDITIONAL.** It is conditional on:
- (i) C65 = F1 Conjecture 1.5, which is a CONJECTURE / NOT ESTABLISHED;
- (ii) F1 Theorem 1.6 at Level A statement: unrefereed preprint, AI-assisted proofs disclosed, proof unread, internally depending on Level-B Mader 7-connectivity.

**U9: CONDITIONAL, NOT CERTIFIED.** The certified frontier remains U1–U8.

Programme ACTIVE.
