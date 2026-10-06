# RL67 — assessment of H67

Status: RL67 record. CLOSED/FROZEN on promotion at RL67 closeout.

Root: HC7 only. Brief: sessions/RL67/incoming/RL67_HC7_K7MINUS_R1_MINIMALITY_TRANSFER_GATE_BRIEF.md (frozen; authored at the RL66 closeout). BASE_HEAD 00552df.

**F1 caveat.** F1 = arXiv:2609.17760v1 (R1: sha256 equals the pin; extraction hash equals the RL64 one). It is an unrefereed preprint, and its §1.1 (F1.txt:154–182) discloses AI-obtained proofs. F1 is used here only for the definitions quoted in §1 and for statements already in authority, all at Level A. No F1 proof is consumed; every claim below is proved from the quoted definitions.

## 1. Quoted definitions (R1)

- **Fragment and boundary** (F1.txt:335–338). "For a graph H, a fragment of H is a non-empty set Y ⊆ V (H). If H is a rooted graph, we additionally require that Y ∩ XH = ∅. We define ∂H Y as the set of vertices in V (H) \ Y with a neighbor in Y , ρ(H, Y ) as the number of edges of H with at least one end in Y , and ρ4 (H, Y ) = ρ(H, Y ) − 4|Y |."
- **Bifragment and 4-bilight** (F1.txt:383–387). "A bifragment in a graph G is a pair (S, T ) of disjoint fragments such that G has no edge with one end in S and the other end in T . It is a k-bifragment if |∂G S|, |∂G T | = k, and (≤ k)-bifragment if |∂G S|, |∂G T | ≤ k. We say that the bifragment is dense if ρ4 (G, S) > 0 and ρ4 (G, T ) > 0. We say that a graph G is 4-bilight if it does not have any dense (≤ 4)-bifragment."
- **Minimality convention** (F1.txt:1061–1065). "A 2.8-counterexample is a 4-bilight K7= -minor-free graph G with n ≥ 3 vertices and at least 4n − 7 edges. … A 2.8-counterexample G is minimal if every 2.8-counterexample either has more than |V (G)| vertices, or exactly |V (G)| vertices and at least |E(G)| edges."

In an unrooted graph (G, G') a fragment is any non-empty vertex set. Within a bifragment, T ∩ ∂S = ∅ and S ∩ ∂T = ∅, since there are no S–T edges.

**Notation.** For any vertex set Y of S1, possibly containing roots, e_{S1}(Y) denotes the number of edges of S1 with at least one end in Y. For S ⊆ V(S1), ρ(G',S) = e_{S1}(S) + |S∩X|.

**(2.8⁻) convention adopted.** A (2.8⁻)-counterexample is a 4-bilight K7^- -minor-free graph G with |V(G)| >= 3 and |E(G)| >= 4|V(G)| − 2. G is minimal if every (2.8⁻)-counterexample has more than |V(G)| vertices, or exactly |V(G)| vertices and at least |E(G)| edges. This is F1.txt:1063–1065 transported to the (not claimed) K7^- setting. It is a scope convention, not an open condition.

4-light is used in the fragment form operative in authority. If S1 is only known to be 4-light in F1's separation form, RL66_PAYOFF_CHAIN.md (Notes, "Separation-form H54⁻") converts it without Obs 2.5.

**Minimality-order check for P67 (PROVED).**
- Label the sides so that S1 = G[B] and S2 = G[A] with A∩B = X (RL66_PAYOFF_CHAIN.md Step 0 and the WLOG of the proof of P66a). Then |V(G)| = |V(S1)| + n(S2), while |V(G')| = |V(S1)| + 1.
- n(S2) >= 2. n(S2) = 0 gives ρ4 = 0. n(S2) = 1 with ρ4 = 1 forces the single non-root to have degree 5, i.e. to be adjacent to all five roots, which quite-heaviness excludes (F1's parenthetical, RL65_LOCUS_ASSESSMENT.md §2).
- So G' strictly precedes G, and the "to be checked" proviso of P67 is discharged.
- Also |V(G')| >= 7, since n(S1) >= 1 (ρ4(S1) >= 7 > 0). G' meets the edge bound by E66(b), and it is K7^- -free as a minor of G. So G' satisfies every clause of a (2.8⁻)-counterexample except possibly 4-bilightness.

## 2. Lemma R67 — structure of a dense bifragment of S1 + z' (PROVED ANALYTIC, elementary)

Let S1 be a 4-light 5-rooted graph with root set X, let G' = S1 + z' (unrooted), and let (S, T) be a dense (≤4)-bifragment of G'. Write ∂_1 Y = ∂_{G'}Y ∖ {z'}. Then:
- (a) z' ∉ S ∪ T.
- (b) S ∩ X ≠ ∅ and T ∩ X ≠ ∅. Also z' ∈ ∂_{G'}S ∩ ∂_{G'}T, so |∂_1 S| <= 3 and |∂_1 T| <= 3, and ∂_1 S = N_{S1}(S)∖S.
- (c) |S ∩ X| >= 2 and |T ∩ X| >= 2. Hence at most one root lies outside S ∪ T, and no root of S is adjacent to a root of T.

*Proof.*
- *Key claim.* A fragment Y of G' with Y ∩ (X ∪ {z'}) = ∅ is a fragment of the rooted graph S1. Its neighbourhood and its incident edges are the same in G' and in S1, because z' is adjacent only to X. So if |∂_{G'}Y| <= 4, then ρ4(G',Y) = ρ4(S1,Y) <= 0, by 4-lightness. Hence each of S, T meets X ∪ {z'}.
- (a) If z' ∈ S, then X = N(z') ⊆ S ∪ ∂S. Since T ∩ (S ∪ ∂S) = ∅, T misses X ∪ {z'}, contradicting the key claim. Symmetrically z' ∉ T.
- (b) By (a) and the key claim, S and T each meet X. Then z' is adjacent to both, so z' ∈ ∂S ∩ ∂T. Also V(G')∖S = (V(S1)∖S) ∪ {z'}, so ∂_1 S = N_{S1}(S)∖S.
- (c) Suppose S ∩ X = {x}, and put S° = S ∖ {x}.
  - If S° = ∅, then ρ(G',{x}) = deg(x) = |∂{x}| <= 4, so ρ4 <= 0.
  - Otherwise S° is a fragment of S1, with ∂_{S1}S° ⊆ ∂_1 S ∪ {x}. So |∂_{S1}S°| <= 4 and ρ4(S1,S°) <= 0. Since z' is not adjacent to S°, ρ(G',S) = ρ(S1,S°) + |N_{G'}(x)∖S|, and N_{G'}(x)∖S ⊆ ∂_{G'}S. So ρ4(G',S) <= ρ4(S1,S°) + 4 − 4 <= 0.

  Either way S is not dense, a contradiction. The same argument applies to T. ∎

## 3. Proposition V67 — what an H67 instance would refute (PROVED ANALYTIC)

Let (S1, S2) satisfy every hypothesis of H67.
1. **G = S1 ∪ S2 is a (2.8⁻)-counterexample.**
   - It is 4-bilight and K7^- -minor-free, by hypothesis.
   - (A,B) = (V(S2), V(S1)) is a separation of G with A∩B = X. The root edges agree and every edge of G lies in S1 or S2, so G[V(S1)] = S1, G[V(S2)] = S2, and 10 − |E(G[X])| = m. Step 0 (RL66_PAYOFF_CHAIN.md) then gives |E(G)| − 4|V(G)| = ρ4(S1) + ρ4(S2) − 10 − m >= (m + 7) + 1 − 10 − m = −2.
   - |V(G)| = 5 + n(S1) + n(S2) >= 8. Here n(S1) >= 1 because ρ4(S1) >= 7 > 0, and n(S2) >= 2 by §1. So n >= 3 for (2.8⁻) and n >= 6 for C65.
2. **S1 is a C66 counterexample.** S1 is 4-light with ρ4(S1) >= m + 7. If S1 had a rooted K6↓5, then Lemma D (RL65) with S2 (4-light, ρ4 = 1 > 0) would give a K7^- minor in G, contradicting the hypothesis. This is the argument of P66a's proof (RL66_PAYOFF_CHAIN.md Step 3), applied to S1. P66a's statement gives only the weaker conclusion that C66 fails.

Consequences:
- (i) (2.8⁻) ⇒ H67 and C66 ⇒ H67, both vacuously: under either hypothesis, items 1 and 2 show that no H67 instance can exist.
- (ii) Every H67 instance, whatever its conclusion, explicitly refutes (2.8⁻) and C66. If G is also 5-connected, it refutes C65. P66a/P66b stay valid as implications.
- (iii) So stopping outcome 2 (an explicit violating configuration) would itself be an explicit refutation of (2.8⁻) and C66, and of C65 if G is 5-connected.
  - The RL67 brief admits it as an outcome, but it is not a realistic product of a bounded, single-candidate, no-computation gate. None is known, and none was sought by computation (bound 0).
  - The realistic RL67 outcomes were therefore "proved" or "open". H67 is refutable only together with (2.8⁻) and C66.

H67 is thus a lemma about a hypothetical (not necessarily minimal) (2.8⁻)-counterexample, like F1's §5 lemmas that assume a (minimal) 2.8-counterexample.

**Correction C67-1** (explicit; a correction of a scope remark in current authority, not a theorem demotion). The RL67 brief's falsification condition says that a violating pair "refutes the standalone H67 only. It refutes neither P66a/P66b, C66, (2.8⁻) nor C65."
- This is incorrect. By (ii), any such pair (indeed any H67 instance) refutes (2.8⁻) and C66, and refutes C65 if G is 5-connected.
- P66a/P66b remain valid.
- The brief's procedural redirect to the minimality-assisted variant would be moot in that event. A violating pair would itself refute (2.8⁻) and C66, which voids the variant's payoff P67. The correct response would be to record those refutations (and C65's, if G is 5-connected).
- The redirect played no role in RL67, because no violating pair was found. No deduction consumed the incorrect remark.

## 4. Counterpattern G* — the relaxed H67 fails (PROVED ANALYTIC, elementary)

Let **H67⁰** be H67 with the hypothesis "G has no K7^- minor" deleted. **H67⁰ is FALSE.**

**Construction.**
- Roots X = {x1, …, x5}. Root edges: x1x2, x3x4, and x5x_i for i = 1..4. So the missing pairs are x1x3, x1x4, x2x3, x2x4, and m = 4.
- **S1\*.** Non-roots q1, q2, S° = {s1, s2, s3} and T° = {t1, t2, t3}. Edges:
  - q1q2;
  - q_i to every root and to every vertex of S° ∪ T°;
  - S° and T° are cliques;
  - S° is complete to {x1, x2, x5}, and T° is complete to {x3, x4, x5}.
- **S2\*.** Non-roots p, q, with p ~ X∖{x2}, q ~ X∖{x1}, pq ∈ E, and the same six root edges. This is RL65's G0 with root edges added. Root edges have no non-root end, so they change no fragment, boundary, ρ4(R,Y), ρ4(R) or non-root–root adjacency. RL65 §4's verification (ρ4 = 1, quite heavy, every fragment boundary of size 5) therefore applies verbatim.
- G* = S1\* ∪ S2\*, with 15 vertices and 62 edges.

**Verification.**
1. **S1\* is 4-light (vacuously).**
   - A fragment containing q1 or q2 has boundary ⊇ X.
   - A fragment Y ⊆ S° ∪ T° meeting S° has boundary ⊇ {x1, x2, x5, q1, q2}; one meeting T° has boundary ⊇ {x3, x4, x5, q1, q2}.
2. **ρ4(S1\*) = 15 >= m + 7 = 11.** S1\* has 47 edges with a non-root end:
   - q1q2: 1;
   - q's to X: 10;
   - q's to S° ∪ T°: 12;
   - cliques: 6;
   - S° to {x1,x2,x5}: 9; T° to {x3,x4,x5}: 9.

   There are 8 non-roots, so ρ4 = 47 − 32 = 15. As a cross-check, |E(G*)| − 4|V(G*)| = 62 − 60 = 2 = 15 + 1 − 10 − 4.
3. **S2\*** is 4-light, and quite heavy with ρ4 = 1 (see the construction).
4. **G\* is 5-connected, hence 4-bilight.** (F1.txt:392–393, re-proved: if (S,T) were a (≤4)-bifragment, then T ∩ (S ∪ ∂S) = ∅, so deleting ∂S, at most 4 vertices, would separate S from T.) Let |Z| <= 4.
   - x5 is adjacent to every other vertex of G* (degree 14), so G* − Z is connected if x5 ∉ Z.
   - If x5 ∈ Z and some q_i ∉ Z: q_i is adjacent to every vertex except p and q. If p ∉ Z, then p reaches q_i through one of x1, x3, x4 not in Z, or else Z = {x1, x3, x4, x5} and the path p–q–x2–q_i works. q is handled symmetrically.
   - Otherwise Z ⊇ {q1, q2, x5}, and Z has at most one further vertex w.
     - S° ∪ {x1, x2} and T° ∪ {x3, x4} each induce K5, so each stays connected after deleting any one vertex.
     - The connectors x1–p–x3 and x2–q–x4 are vertex-disjoint, so w destroys at most one of them.
     - p (if p ≠ w) is adjacent to both x3 and x4, and q (if q ≠ w) is adjacent to both x3 and x4, so each attaches to T° ∪ {x3, x4} ∖ {w}.
     - If |Z| = 3 there is no w.
5. **G\* has a K7 minor**, with bags {q1}, {q2}, {x5}, {x1, p}, {x2, q}, {x3}, {x4}. Indeed S1\* already contains K8 subgraphs; see Meaning. So it is not K7^- -free; this is the only hypothesis of H67 it violates.
6. **G\*' = S1\* + z' is NOT 4-bilight.** Take S = S° ∪ {x1, x2} and T = T° ∪ {x3, x4}.
   - They are disjoint, with no S–T edge.
   - ∂S = ∂T = {x5, q1, q2, z'}.
   - ρ(G*',S) = 27: S° clique 3; S° to {x1,x2,x5,q1,q2} 15; x1x2 1; x1x5, x2x5 2; {x1,x2} to {q1,q2} 4; x1z', x2z' 2. With |S| = 5, ρ4 = 7 > 0. The same count holds for T, with T° and x3, x4.

**Meaning (scoped).**
- Any proof of standalone H67 must use the K7^- -freeness of G.
- More generally, any argument that **excludes** the root-split configuration of Lemma R67, or that shows G' (or G^x, §5) to be 4-bilight, must use K7^- -freeness, or a minimality-derived hypothesis that G* violates. The recorded G'/G^x hypotheses of §5 do not exclude G*.
- G* does **not** constrain a direct K7^- -forcing argument from the configuration.
- **G\* is a weak counterpattern.** S ∪ ∂_1 S = S° ∪ {x1, x2, x5, q1, q2} and T ∪ ∂_1 T each induce K8 inside S1\*.
  - G* is therefore excluded by any hypothesis implying ω(G) <= 7. It constrains only arguments that use **no** consequence of K7^- -freeness at all (nor any other hypothesis G* violates).
  - It is also not edge-minimal: |E(G*)| − 4|V(G*)| = 2. For example, G* − q1q2 is still 5-connected, with 61 >= 4·15 − 2 edges.
  - It shows only that the forbidden-minor hypothesis cannot be dropped altogether.
  - An edge-tight (|E| = 4|V| − 2) or K7-subgraph-free counterpattern was not constructed.

## 5. Minimality-assisted variant (probe)

**Proved minimality-derived hypothesis (implication with presuppositions).** Let G be a minimal (2.8⁻)-counterexample with an r = 1 5-separation whose lighter side S2 has a full component C. This is guaranteed under H54⁻ (NOT PROMOTED): C exists by RL65 Lemma D steps 1–2, though uniqueness is not claimed. For a root x, put G^x = S1 + {xy : y ∈ X∖N[x]}; this is the minor of G obtained by contracting C into x and deleting the rest of S2. Then
- |E(G^x)| − 4|V(G^x)| = (ρ4(S1) − m − 10) + 4 − deg_X(x) >= 1 − deg_X(x).

So G^x is a proper minor meeting the (2.8⁻) edge bound whenever deg_X(x) <= 3; the sharp criterion is deg_X(x) <= ρ4(S1) − m − 4. It is K7^- -free, being a minor of G. By minimality, **for every root x with deg_X(x) <= ρ4(S1) − m − 4 (in particular deg_X(x) <= 3), G^x is not 4-bilight.** In the configuration of Lemma R67, every x ∈ S∩X qualifies, since deg_X(x) <= 2. Likewise G' itself is not 4-bilight; that is the contrapositive of P67.

**Probe on G\*.** G* satisfies this extra hypothesis while still containing the configuration:
- By Lemma R67(c), every dense (≤4)-bifragment of G*' has {S∩X, T∩X} = {{x1,x2},{x3,x4}}. The only missing root pairs are x1x3, x1x4, x2x3, x2x4, and x5 is adjacent to every root.
- G*^{x1} (adding x1x3 and x1x4) is not 4-bilight. The witness is (S° ∪ {x2}, T° ∪ {x3, x4}):
  - the boundaries are {x1, x5, q1, q2} for both sets;
  - ρ4 = 22 − 16 = 6 and 27 − 20 = 7;
  - there is no edge between the two sets.
- A root-set-preserving automorphism σ of S1 maps {xy : y ∈ X∖N[x]} onto {σ(x)y' : y' ∈ X∖N[σ(x)]}, so G^x ≅ G^{σ(x)}. The automorphisms (x1 x2) and (x1 x3)(x2 x4)(s_i t_i) of S1\* generate a group transitive on {x1, x2, x3, x4}. So G*^{x2}, G*^{x3} and G*^{x4} are isomorphic to G*^{x1}.
- x5 has deg_X = 4, outside the uniform criterion. Under the sharp criterion (bound 15 − 4 − 4 = 7 for G*) it qualifies. G*^{x5} = S1\* (excess 53 − 52 = 1) is not 4-bilight: the witness is (S° ∪ {x1, x2}, T° ∪ {x3, x4}), with boundaries {x5, q1, q2} and ρ4 = 5 on each side. So G* satisfies the G^x hypothesis for every root.

So the recorded G'/G^x minimality-derived hypotheses, without K7^- -freeness, do not exclude the configuration.

**Scope of the probe.** G* probes only the G'/G^x family. Since G* is not edge-minimal, the edge-deletion consequence of minimality (G − e is not 4-bilight whenever |E(G)| >= 4|V(G)| − 1) already excludes it. So the probe gives no evidence about minimality-assisted exclusion beyond G'/G^x.

**Statements and status.**
- **Var** (the minimality-assisted form of H67): for every minimal (2.8⁻)-counterexample G satisfying H54⁻ and every r = 1 5-separation, S1 + z' is 4-bilight. **OPEN.** By P67 and the contrapositive above, Var is equivalent to closing the r = 1 sub-case under H54⁻.
- **H67^G**: H67's hypotheses plus the G^x hypotheses plus K7^- -freeness exclude the configuration. **NOT ASSESSED** beyond the G* probe.

## 6. Outcome

**H67 (standalone): CANDIDATE / NOT ESTABLISHED — OPEN.** It is not refuted; by V67 it is refutable only together with (2.8⁻) and C66. The minimality-assisted form Var is also OPEN (§5); H67^G is NOT ASSESSED beyond the G* probe.

**Exact first missing dependency.**
- *For the variant and for P67:* a K7^- -forcing (or reduction) lemma for the **root-split two-dense-halves configuration**.
  - Hypotheses: G is a minimal (2.8⁻)-counterexample satisfying H54⁻, with a 5-separation in the r = 1 configuration, and the heavy side S1 contains disjoint, non-adjacent sets S and T with:
    - each containing at least two roots;
    - |N_{S1}(S)∖S| <= 3 and |N_{S1}(T)∖T| <= 3;
    - e_{S1}(S) + |S∩X| > 4|S| and e_{S1}(T) + |T∩X| > 4|T| (i.e. ρ4(G',S), ρ4(G',T) > 0).
  - Conclusion: a K7^- minor, or a smaller (2.8⁻)-counterexample.
  - By Lemma R67, this dependency is equivalent to Var, and Var is equivalent to closing the r = 1 sub-case under H54⁻. So no reduction of the r = 1 sub-case is claimed; Lemma R67 contributes necessary structure only. No strictly weaker sub-lemma is isolated.
- *For the standalone form:* the corresponding dependency is the exclusion of the same configuration under H67's hypotheses alone.
- By G* (and §5), any **exclusion** argument must use K7^- -freeness, or a minimality-derived hypothesis that G* violates. The recorded G'/G^x hypotheses do not suffice. G* is weak, though: it is excluded by ω <= 7 and by edge-minimality. A direct K7^- -forcing argument is not constrained by G*.
- By V67(2), the configuration can only occur when S1 is a C66 counterexample. So (C1), (C3) and the first clause of (C2) of the RL66 core (RL66_C66_ASSESSMENT.md §3) hold for S1, since they hold for every C66 counterexample. The unique-neighbour clause of (C2) (Cor P.1) needs |V| + |E| minimality among C66 counterexamples, and is not claimed for S1.

**P67 status.**
- PROVED ANALYTIC implication, CONDITIONAL on H67 (open) and H54⁻ (NOT PROMOTED), with the F1 definitions at Level A.
- Scope convention: minimality in F1's lexicographic order (|V|, |E|), transported to (2.8⁻) (§1).
- The brief's minimality-order proviso is discharged (§1).
- The r = 1 sub-case stays open by both routes, C66 and H67.

Programme ACTIVE.
