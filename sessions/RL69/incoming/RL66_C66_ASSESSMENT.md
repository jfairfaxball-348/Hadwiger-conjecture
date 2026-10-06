# RL66 — assessment of C66

Status: RL66 record. CLOSED/FROZEN on promotion at RL66 closeout.

Root: HC7 only.

**Candidate (status on entry: CANDIDATE / NOT ESTABLISHED).**
> **C66.** Every 4-light 5-rooted graph R with ρ4(R) >= m(R) + 7 contains K6↓5 as a rooted minor.

Definitions are those of the RL66 brief (F1's, as quoted in RL65_LOCUS_ASSESSMENT.md §2). The fragment form of 4-light is operative. F1 caveat: F1 = arXiv:2609.17760v1 is an unrefereed preprint whose §1.1 discloses AI-obtained proofs. F1 enters below through:
- its definitions;
- F1 Thm 1.6 at Level A, in B65⁷ and in S66's Meaning paragraph;
- the F1.txt:225–226 connectivity convention, in S66 step 3;
- F1 Thm 2.9 at Level A, in attempt note §3 and orientation note §4, with nothing promoted;
- a reference to RL65's reading of F1 §5, in §3 route 2.

[Dvo26] is not consumed; its scope is only characterized, as in the RL66 brief.

**Notation.**
- X is the root set.
- M = M(R) is the graph on X whose edges are the non-adjacent root pairs, so |E(M)| = m(R).
- τ(M) is the minimum size of a vertex cover of M. Since |X| = 5, τ(M) <= min(m, 4).
- A **full set** is a non-empty set F of non-roots such that R[F] is connected and every root has a neighbour in F.
- A **full component** is a component C of R − X with ∂C = X. Every full component is a full set.
- ν_full(R) is the maximum number of pairwise disjoint full sets in R.

**Outcome: C66 is OPEN, sharpened (§3).** No falsifier was found in the tested members of families (i)–(iv); see RL66_FALSIFICATION_TEST.md, whose family (ii) poor regime is NOT ASSESSED.

## 1. Proved lemmas (PROVED ANALYTIC, elementary)

### Lemma F′ (full packing)
If R contains τ(M)+1 pairwise disjoint full sets, then R contains K6↓5 as a rooted minor. In particular, 5 pairwise disjoint full sets always suffice, and so do m+1 full components.

*Proof.* Let F_0, …, F_τ be the full sets and {y_1, …, y_τ} a minimum vertex cover of M. Put:
- A = F_0;
- B_{y_k} = {y_k} ∪ F_k for k = 1..τ;
- B_x = {x} for every other root x.

Check:
- The bags are disjoint. Each is connected, since F_k is connected and has a neighbour at y_k. A contains no root.
- A has a neighbour at every root, so it is adjacent to every root bag.
- Two root bags B_x, B_{x'} are adjacent if xx' ∈ E(R). Otherwise xx' ∈ E(M), so some cover vertex y_k ∈ {x, x'}, and F_k ⊆ B_{y_k} has a neighbour at the other endpoint. ∎

**Corollary F′.1.**
- If R is 4-light with ρ4(R) > 0, then R − X has a full component (RL65 Lemma D, steps 1–2).
- Hence C66 holds whenever m(R) = 0, and then already at the threshold ρ4 >= 1.
- A counterexample to C66 has m >= 1, and its full-packing number satisfies 1 <= ν_full(R) <= τ(M) <= 4.

### Contraction formula and Lemma P (unique non-root neighbour)
Let x be a root and v a non-root neighbour of x. Let R' = R/xv, rooted at X with x standing for {x, v}, and let T = N(x) ∩ N(v).

**Formula.** (ρ4(R') − m(R')) − (ρ4(R) − m(R)) = 3 − |T|.

*Proof.* Every edge at v has a non-root end, so all deg(v) of them count in ρ(R). In R' they are replaced by the edges xw with w ∈ N(v) ∖ N[x]; of these, only those with w a non-root count in ρ(R'). Also deg(v) = 1 + |T| + |N(v) ∖ N[x]|. Therefore:
- Δρ = −1 − |T| − |N_X(v) ∖ N[x]|;
- Δn = −1, so Δρ4 = 3 − |T| − |N_X(v) ∖ N[x]|;
- Δm = −|N_X(v) ∖ N[x]|, from the new root edges xw.

Subtracting gives the formula. ∎

**Lemma P.** Suppose N(x) ∖ X = {v}. Then:
- (a) R' is 4-light whenever R is;
- (b) ρ4(R') − m(R') = ρ4(R) − m(R) + 3 − |T|;
- (c) a rooted K6↓5 in R' lifts to R;
- (d) |V(R')| + |E(R')| < |V(R)| + |E(R)|.

*Proof.*
- (a) A fragment Y of R' is a fragment of R avoiding v. Since N(x) ∩ Y ⊆ {v} ∩ Y = ∅, x ∉ ∂_R Y. In R', x is adjacent to y ∈ Y iff yv ∈ E(R). So ∂_{R'}Y = (∂_R Y ∖ {v}) ∪ ({x} if v ∈ ∂_R Y), which has the same size. Edges at Y are not merged, because no y ∈ Y is adjacent to x in R. So ρ4_{R'}(Y) = ρ4_R(Y).
- (b) is the formula.
- (c) Replace x by {x, v} in its bag.
- (d) is clear. ∎

**Corollary P.1.** Let R be a counterexample to C66 minimizing |V| + |E|. If a root x has exactly one non-root neighbour v, then |T| = 4. That is, x is adjacent to the four other roots, and v is adjacent to all five roots (a full vertex).
- *Proof:* if |T| <= 3, then R' is a smaller 4-light instance with surplus >= 7, so by minimality it has K6↓5, and that lifts to R. Since N(x)∖X = {v} and v ∉ N(v), T ⊆ X∖{x}, so |T| <= 4. Hence |T| = 4 means T = X∖{x}.
- Every root has at least one non-root neighbour, by Lemma S with s = 0.

### Lemma S (concentrated root contacts)
Let R be 4-light. Let Z be a set of s non-roots, and let Y = V(R) ∖ X ∖ Z, with N_X(Y) the set of roots having a neighbour in Y. If |N_X(Y)| <= 4 − s, then ρ4(R) <= |E(R[Z])| + |E(Z, X)| − 4s <= C(s,2) + s.

*Proof.* If Y ≠ ∅, then ∂Y ⊆ Z ∪ N_X(Y), so |∂Y| <= 4 and ρ4(R,Y) <= 0. An edge with a non-root end and no end in Y lies inside Z or between Z and X. So ρ4(R) = ρ4(R,Y) + |E(R[Z])| + |E(Z,X)| − 4s, where the first term is taken as 0 if Y = ∅. ∎

**Corollary S.1.**
- (i) Under the hypotheses of Lemma S with s <= 3, ρ4(R) <= C(s,2) + s <= 6 < 7 <= m + 7, so R is below the C66 threshold.
- (ii) Let R be 4-light. Suppose s = 4 and every non-root neighbour of every root lies in Z. If ρ4(R) >= m + 7, then R has K6↓5.
  - Let μ = #{(z,x) ∈ Z × X : zx ∉ E(R)} = 20 − |E(Z,X)|.
  - From ρ4 >= m + 7 and Lemma S, |E(Z,X)| >= m + 23 − |E(R[Z])| >= m + 17. So μ <= 3 − m. In particular m <= 3; for m >= 4 the hypothesis cannot hold, and (ii) is vacuous.
  - Each non-full z contributes at least 1 to μ, so Z has at least 4 − μ >= m + 1 >= τ(M) + 1 full vertices. Lemma F′ applies.
- (iii) Consequently, in a C66 counterexample the root contacts are never concentrated on 4 or fewer non-roots in the sense of (i) or (ii).

### Lemma K4r (three-rooted K4 in 3-connected graphs)
Let G be 3-connected (standard convention: |V(G)| >= 4, and G − S is connected for every |S| <= 2) and let u, v, w be distinct vertices. Then G has a K4 model (four disjoint connected bags, pairwise adjacent) with u, v, w in three distinct bags.

*Proof.* The standard facts used are:
- (T1) two vertices of a 2-connected graph lie on a common cycle;
- (T2) the fan lemma: in a k-connected graph, for a vertex a and a set S ∌ a with |S| >= k, there are k paths from a to S that share only a and meet S only at their distinct ends.

Construct the model as follows.
1. G − u is 2-connected, so by (T1) a cycle C ⊆ G − u contains v and w.
2. By (T2) there are paths P1, P2, P3 from u to V(C) with distinct ends c1, c2, c3. The c_k split E(C) into three non-empty gaps.
3. Let Q, Q' be the two v–w paths along C. Each gap meets Q or Q', and both meet some gap. Since there are 3 gaps, some gap g meets Q and a different gap g' meets Q'. (Otherwise the gaps meeting Q and the gaps meeting Q' would both be one and the same single gap, yet all three gaps meet Q ∪ Q'.)
4. Delete one edge of g ∩ E(Q), one edge of g' ∩ E(Q'), and one edge of the third gap. This leaves three arcs. Each arc runs between two consecutive deleted edges, so it contains exactly one c_k. Also v and w lie in different arcs, because an edge of each v–w path along C was removed.
5. Take the bags B0 = (V(P1) ∪ V(P2) ∪ V(P3)) ∖ {c1, c2, c3}, which contains u, and the three arcs.

Check:
- The bags are disjoint and connected. B0 ∩ V(C) = ∅, since each P_k meets V(C) only at c_k and u ∉ V(C).
- The arcs are pairwise adjacent. The deleted edge in the gap c_k…c_{k+1} joins the arcs containing c_k and c_{k+1}, so the three deletions give all three arc pairs.
- B0 is adjacent to each arc through the last edge of P_k. B0 contains the second-to-last vertex of P_k. ∎

### E66 (exact reformulation)
Let z' be a new vertex adjacent exactly to X, and let G' = R + z'.
- (a) R contains K6↓5 as a rooted minor iff G' has a K7^- model in which {z'} is a bag. (A K7^- model is 7 disjoint connected bags with all pairs adjacent except at most one.)
- (b) |E(G')| − 4|V(G')| = ρ4(R) − m(R) − 9. Hence ρ4(R) >= m(R) + 7 iff |E(G')| >= 4|V(G')| − 2, which is exactly the edge hypothesis of C65.

*Proof.*
- (b) |E(R)| = ρ4(R) + 4n(R) + 10 − m(R), |V(R)| = n(R) + 5, and z' adds 1 vertex and 5 edges.
- (a), forward direction: add the bag {z'}. It is adjacent to every root bag, so only the pair ({z'}, A) can be non-adjacent.
- (a), reverse direction: {z'} is adjacent only to bags meeting X, so to at most 5 bags. In K7^- every vertex has degree >= 5, so {z'} is adjacent to exactly 5 bags, each meeting X, and the missing pair is ({z'}, A). The five roots fill these five bags, one root each, so A contains no root. Each bag B ≠ {z'} satisfies G'[B] = R[B], so it is connected in R, and adjacency between such bags is adjacency in R. (In particular the model cannot be a full K7 model, since {z'} meets at most 5 bags.) Hence the bags give a rooted K6↓5. ∎

### Prop S66 (strength of C66)
C66 implies the following case of C65: **every 5-connected graph G with a vertex of degree exactly 5 and |E(G)| >= 4|V(G)| − 2 contains K7^- as a minor.**

*Proof.*
1. A degree-5 vertex gives |V(G)| >= 6. |V(G)| = 6 is impossible, since 15 < 22. So |V(G)| >= 7.
2. Let z have degree 5, R = G − z and X = N(z). Then G = R + z' with z' = z. By E66(b), ρ4(R) − m(R) = |E(G)| − 4|V(G)| + 9 >= 7.
3. *R is 4-light.* Let Y be a fragment of R with |∂_R Y| <= 4. Then z ∉ ∂_G Y, because N(z) ∩ Y = ∅. So (V(G) ∖ Y, Y ∪ ∂_R Y) is a separation of G of order <= 4, with z on one side only and Y ≠ ∅ on the other. Here "proper" means A∖B ≠ ∅ ≠ B∖A (equivalently A ≠ V(G) ≠ B), the reading also used in RL65_B65_BRIDGE.md step 4. This contradicts 5-connectivity, both in F1's convention (F1.txt:225–226; |V(G)| >= 6) and in the standard one. So 4-lightness holds vacuously.
4. C66 gives a rooted K6↓5 in R, and E66(a) turns it into a K7^- model in G. ∎

**Meaning.**
- C66 is not just a rooted lemma "two levels below" C65. It contains C65's degree-5 case, which is not established: no statement in authority supplies it, and its literature status was not assessed.
- That case is not used by U9 via B65. B65 applies C65 only to a graph that is 7-connected by F1 Thm 1.6 (Level A), hence has minimum degree >= 7 (precision B65⁷).
- The (2.8⁻) route that contains C66 would itself prove C65 in full, degree-5 case included. The point of S66 is narrower: C66, as a standalone rooted lemma without the minimality hypotheses available at its use-site, must already settle C65's degree-5 case.
- C66 may still be true. S66 bounds its strength from below; it is not evidence against it.

### Precision B65⁷ (PROVED ANALYTIC, CONDITIONAL exactly as B65)
B65's proof (RL65_B65_BRIDGE.md, step 4) applies C65 only to a graph that is 7-connected by the conclusion of F1 Thm 1.6 and has n >= 8 (step 4, order bullet). So B65's statement holds with C65 replaced by:
> **C65⁷.** Every 7-connected graph with n >= 8 vertices and at least 4n − 2 edges contains K7^- as a minor.

In the proof, step 5 applies C65⁷ to G using only the order bound, the 7-connectivity and the edge bound of steps 3–4. The 5-connectivity bullet of step 4 becomes unnecessary.

C65 ⇒ C65⁷ holds under either connectivity convention, by monotonicity in k as in B65 step 4. Whether C65⁷ is strictly weaker is not claimed.
- This is a statement about B65's dependency only. It does **not** assume 7-connectivity of HC7 counterexamples, so S1 is not used as an input.
- As recorded in RL65_B65_BRIDGE.md, F1 Thm 1.6 (Level A) depends internally on Level-B Mader 7-connectivity.
- U9 stays CONDITIONAL, now recorded as conditional on C65⁷ (implied by C65) and on F1 Thm 1.6 at Level A.

## 2. Falsification
See RL66_FALSIFICATION_TEST.md. No falsifier was found among the tested members of families (i)–(iv). Family (i) is a threshold-necessity witness only. Family (iii) reduces one-directionally to cores of larger surplus. The all-components-poor regime of family (ii) is NOT ASSESSED; no falsifier was found there.

## 3. Proof attempt and where it stops

Inputs available: Lemma F′, Lemma P and Corollary P.1, Lemma S, and Lemma D. A minimal counterexample R to C66 (on |V| + |E|) therefore lies in the following **reduced core**:
- (C1) m >= 1, and 1 <= ν_full(R) <= τ(M) <= min(m, 4). In particular, R − X has at most τ(M) full components, and every other component has ρ4 <= 0.
- (C2) Every root has a non-root neighbour. A root with exactly one non-root neighbour v is adjacent to all other roots, and v is a full vertex.
- (C3) No set of s <= 4 non-roots concentrates the root contacts in the sense of Lemma S (Cor. S.1).

Within the core:
- Σ over full components C of ρ4(R,C) >= m + 7, while there are at most τ(M) <= 4 disjoint full sets. So some full component has ρ4(R,C) >= ⌈(m+7)/τ(M)⌉.

**Attempted routes and their stopping points:**
1. **Iterate Lemma F′.** This needs τ(M)+1 disjoint full sets. Density does not supply them: no Erdős–Pósa-type statement for full sets is available in authority, and a single full component can carry unbounded ρ4(R,C).
2. **Contract non-root edges in <= 3 triangles.** By the formula, Δρ4 = 3 − t >= 0 with m unchanged. But the contraction can create a (<=4)-fragment with ρ4 > 0. Handling such reducible fragments is what F1 §5 does for K7^=-minor-free hosts (RL65 reading of the Level-A text: Lemma 5.1 / Cor 5.3). [Dvo26] (85 pp; content Level B) is known in authority only through F1's restatements of its Thm 4 / Cor 13 / Cor 16 and its pinned v1 abstract. These concern 5-vertex targets on the roots (or targets on <= 4 roots), or 7-vertex targets with two non-roots (vampire / K2,↓5). Nothing in authority treats the target K6↓5.
3. **F1 Thm 2.9 (Level A statement; attempt only; NOT PROMOTED, CONDITIONAL).** R is quite heavy, so Thm 2.9 gives a vampire or K2,↓5 rooted minor.
   - A K2,↓5 outcome gives K6↓5 whenever τ(M) <= 1: one non-root bag is A, and the other is added to the root bag of the cover vertex.
   - Vampire outcomes give it only in some sub-cases. Using only the adjacencies guaranteed by the outcome W and by R[X], it fails, for example, for a two-fanged vampire whose fang pair {x_a, x_b} is a missing root pair (the G0 pattern of FL-066): neither "A = P, Q into B_{x_a}" nor "A = Q, P into B_{x_b}" covers x_a x_b.
   - The route never uses the m+7 surplus. With the same restriction to the adjacencies guaranteed by W and R[X], a 7-vertex outcome supplies at most two non-root bags, so it cannot reach τ(M) >= 2.
   - The root bags of the model may be adjacent in R beyond R[X]; that case is not analysed.

**Exact first missing dependency (sharpened).** A rooted extremal theorem forcing K6↓5 in a 4-light 5-rooted graph of the reduced core (C1)–(C3) with surplus ρ4 − m >= 7.
- By E66 this is equivalent to forcing a K7^- model with a singleton bag {z'} in G' = R + z', which has C65 density.
- By S66 it is at least as strong as C65 for 5-connected graphs with a degree-5 vertex.
- No inspected statement supplies it. F1's statements (including Thm 2.9, Lemma 5.6 and Thm 2.6/2.7), its restatements of [Dvo26] Thm 4 / Cor 13 / Cor 16, and the [Dvo26] v1 abstract concern only:
  - 5-vertex targets on the roots, or targets on <= 4 roots;
  - 7-vertex targets with two non-roots (vampire / K2,↓5).

  None is a 6-vertex target with an apex over the 5 roots.
- By the reduction to the core, this dependency is equivalent to C66 itself. No strictly weaker sub-lemma has been isolated.

**Classification of C66: CANDIDATE / NOT ESTABLISHED — OPEN, not falsified, first missing dependency as above.**

## 4. Orientation notes (NOT ASSESSED; nothing consumed)

- **r = 1 self-similarity (candidate H67).**
  - Setting: a minimal (2.8⁻)-counterexample G under H54⁻, with a 5-separation in the r = 1 configuration.
  - Contract a full component of the 4-light lighter side S2 to one vertex z' and delete the rest of S2. This gives the proper minor G' = S1 + z'.
  - By Step 0 of RL66_PAYOFF_CHAIN.md and E66(b), |E(G')| >= 4|V(G')| − 2. Also |V(G')| < |V(G)|, since a quite-heavy S2 with ρ4 = 1 has at least 2 non-roots.
  - If G' satisfies the 4-bilight hypothesis of (2.8⁻), minimality gives a K7^- minor in G', hence in G. That would close r = 1 **without C66 and without the singleton-bag requirement.**
  - F1's 4-bilight definition is not quoted in authority. NOT ASSESSED.
- **Extension with Thm 2.9 outcomes.** If S2 has a rooted minor W that is a 7-vertex outcome with ρ(W) non-root edges, then S1 ∪ W satisfies |E| − 4|V| >= ρ(W) − 10 − r. So it meets the (2.8⁻) edge bound when r <= ρ(W) − 8, which means r <= 1, 2 or 3 depending on W.
  - It would need:
    - the same 4-bilight transfer;
    - F1 Thm 2.9 at Level A;
    - H54⁻, since Thm 2.9 requires S2 to be 4-light;
    - that S1 ∪ W be a proper minor of G. This fails if n(S2) = 2, e.g. S2 ≅ G0, so at r = 1 the note adds nothing beyond H67.
  - Its r = 2, 3 content lies outside RL66's scope (the brief forbids r >= 2 sub-cases). It is recorded as a pointer only, not to be pursued without a brief that authorizes it.
  - NOT ASSESSED.

Programme ACTIVE.
