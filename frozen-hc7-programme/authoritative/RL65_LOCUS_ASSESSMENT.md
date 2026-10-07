# RL65 — first F1 deficiency locus and its K7^- analogue

Status: RL65 record. CLOSED/FROZEN on promotion at RL65 closeout. F1.txt line references are to the pdftotext -layout extraction (sha256 76b7917b56762c2527a79e3b592a34fd100aa049fab904a3e53311a22f13e89d) of the pinned F1 v1 PDF, as in RL64_ADMISSION_RECORD.md. The F1 text itself is not stored (licence).

Source: F1 = arXiv:2609.17760v1, re-pinned in RL65 R1 (sha256 6af798e5…c907; F1.txt sha256 76b7917b…). Unrefereed preprint. §1.1 (F1.txt:154–182) discloses AI-obtained proofs. Specific to this locus: "Lemma 4.5 … was suggested by AI" and "Lemma 4.9 was suggested by AI" (F1.txt:169–172). Both lie inside F1 §4, the proof of Thm 2.9. Lemma 6.4's weaker form and Lemma 6.6's idea also came from AI (F1.txt:173–177).

F1 statements are used at Level A statement level only. [Dvo26] (arXiv:2609.13818v1, R2-pinned) is used at Level B only.

**F1 reading performed.**
- §2 definitions: F1.txt:186–413.
- §5 in full: F1.txt:1058–1277.
- §6, read only to fix the proof order: F1.txt:1279–1476.
- Statements of Obs 4.1 and Cor 4.2: F1.txt:674–730.

The proofs of Thm 2.9 (§4) and §7 were not read. In §3, only F1.txt:439–498 (the start of Lemma 3.1's proof) was viewed incidentally; no §3 statement is consumed.

## 1. Locating the first locus

The proof of Thm 2.8 (F1.txt:1474–1476) reads in full: "Corollary 6.7 implies that |E(G)| ≥ 4|V(G)|. However, this contradicts Lemma 6.1." Its dependency chain, taken from the cited lines, is:

- Cor 6.7 ← Lemma 6.6 (F1.txt:1449) ← Lemma 6.4 (1432) and Lemma 6.2 (via Cor 6.3/6.5) ← Cor 5.10 (1357);
- Lemma 6.1 ← Cor 5.10 (1316–1317) and Lemma 5.7 (1321);
- Cor 5.10 ← Lemma 5.9 (1275) and Lemma 5.4 (1276);
- Lemma 5.9 ← Lemma 5.8 (1259) and Thm 2.9 (1258), and also Lemma 5.4 (1246), Cor 5.5 (1253) and Cor 5.3 (1255);
- Lemma 5.8 ← Lemma 5.7 (1234);
- Lemma 5.7 ← Thm 2.9 (1222), Lemma 5.6 (1223) and Lemma 5.4 (1221).

**Places where a matching-deficient tool is spent against K7^= -minor-freeness:**

| Locus | Line | What happens |
|---|---|---|
| **Lemma 5.7** | **1220–1226** | Thm 2.9 (vampire/K2,↓5) + Lemma 5.6 (rooted K5) ⇒ "K ∪ W is isomorphic to K7= or one of its supergraphs" |
| Lemma 5.9 | 1258–1262 | the same pair, linked by 5 paths |
| Lemma 6.6 | 1432–1434 | Lemma 6.4 (rooted K5^- in N(v)) plus 2 vertices ⇒ K7^= |
| Cor 6.7 | 1469–1471 | G[Q] − u6 ≅ K7^= |

**Places that are not deficiency loci:**
- Cor 5.3 (1111–1122) uses Thm 2.9 only through Cor 4.2 to produce a reducible (≤4)-fragment. Its contradiction is with Lemma 5.1, not with K7^= -freeness.
- §3 contains no reference to K7. The only K7 occurrence in F1.txt:186–1057 is the statement of Thm 2.8 at line 390.
- §4 is the rooted proof of Thm 2.9 itself.
- Lemma 6.1 (1322–1323) finds K7^- directly, so no deficiency is spent there. It is nevertheless downstream of Lemma 5.7: it uses Lemma 5.7 at 1321 to get the clique.
- Cor 6.7 also has non-deficient sub-cases: K7 at 1462–1463 and K7^- at 1467–1468. Only 1469–1471 spends the deficiency.
- **Hereditary uses** of K7^= -minor-freeness only apply its closure under minors, not a deficient model. They carry over verbatim to K7^-. They are Lemma 5.1 (1071–1072, "Since H is a minor of G, it is K7= -minor-free"; upstream of Lemma 5.7 via Lemma 5.4 and Cor 5.3), Lemma 6.1 (1288–1289) and Lemma 6.2 (1336).

**Conclusion.** The first locus is **Thm 2.9 as consumed in Lemma 5.7**. Lemma 6.4/6.6 is strictly downstream, via Lemma 6.2 → Cor 5.10 → Lemma 5.9 → Lemma 5.8 → Lemma 5.7. It is not assessed in RL65.

## 2. Exact K7^= statements at the locus (quoted)

**Definitions** (F1.txt:280–287, 398–406):
- n(G) = |V(G) \ X_G|; ρ(G) = |E(G) \ E(G[X_G])|; ρ4(G) = ρ(G) − 4n(G).
- "A k-rooted graph G is 4-light if ρ4(R_{A,B}) ≤ 0 holds for every root (≤ (k − 1))-separation of G."
- Observation 2.5 (F1.txt:346–347): 4-light iff every (≤(k−1))-fragment Y has ρ4(G,Y) ≤ 0. A fragment of a rooted graph is a non-empty set of non-roots (F1.txt:335–336).
- "A 5-rooted graph G is quite heavy if either ρ4(G) ≥ 2, or ρ4(G) = 1 and no vertex in V(G) \ X_G is adjacent to all five roots (in particular, this excludes the case that G has only one non-root vertex)."
- "A vampire is a 7-vertex 5-rooted graph W with no edges between roots whose non-root vertices p and q are adjacent and there exist distinct roots x1, x2 ∈ X_W such that p is adjacent to every root except possibly to x2, and q is adjacent to every root except possibly to x1."
- "Let K2,↓5 denote the 7-vertex 5-rooted graph whose non-root vertices p and q do not form an edge and are adjacent to all roots. Thus, both a vampire and K2,↓5 only miss edges of a matching among those incident with p and q."

**Theorem 2.9** (F1.txt:412–413): "Let G be a 4-light 5-rooted graph. If G is quite heavy, then G contains a vampire or K2,↓5 as a rooted minor."

**Lemma 5.7** (F1.txt:1201–1204): "Let (A, B) be a 5-separation of a minimal 2.8-counterexample G, and let m = 10 − |E(G[A ∩ B])| denote the number of missing edges between the vertices of A ∩ B. Then exactly one of the 5-rooted graphs RA,B and RB,A is quite heavy, and moreover the quite heavy one has 4-density at least m + 2."

**The deficiency step** (F1.txt:1220–1226): "Suppose now for a contradiction that RB,A is quite heavy as well. … Theorem 2.9 implies that RB,A has an id-rooted minor W, where W is a vampire or K2,↓5. On the other hand, given (4), Lemma 5.6 implies that RA,B has an id-rooted minor K isomorphic to K5. Consequently, G contains the graph K ∪ W as a minor. However, note that K ∪ W is isomorphic to K7= or one of its supergraphs, which is a contradiction since G is K7= -minor-free."

## 3. The K7^- setting and the exact analogue required

**Setting.** The K7^- analogue of Thm 2.8 is:

> **(2.8⁻)** A 4-bilight graph with n ≥ 3 vertices and at least 4n − 2 edges contains K7^- as a minor.

(2.8⁻) implies C65, because 5-connected ⇒ 4-bilight (F1.txt:392–393). It is **not** claimed and **not** assessed. It only fixes the context in which the locus analogue is "required".

A minimal (2.8⁻)-counterexample has ρ4(G) ≥ −2. The identity in Lemma 5.7's proof (F1.txt:1207–1208), ρ4(G) = ρ4(R_AB) + ρ4(R_BA) − 10 − m, then gives

    ρ4(R_AB) + ρ4(R_BA) >= m + 8     (in place of F1's (3): >= m + 3).

**Why the analogue is forced.** Let K be a K5 on X, id-rooted. Let W be a 7-vertex 5-rooted graph with independent roots and non-roots p, q, so that E(W) ⊆ E* := {pq} ∪ {px, qx : x ∈ X}, with |E*| = 11. Then K ∪ W = K7 − (E* \ E(W)). On 7 vertices a K7^- minor is a K7^- subgraph, which has 20 of the 21 edges. So K ∪ W ⊇ K7^- **iff W misses at most one edge of E***.

This exactness holds under the 7-vertex outcome convention of Thm 2.9. The weaker requirement "K5 on the roots together with the lighter side contains K7^-" could in principle be met by outcomes with more non-roots. G0 (§4) also fails that weaker requirement: K5 ∪ G0 = K7 − {px2, qx1} ≅ K7^=, which has 19 edges on 7 vertices and so no K7^- minor.

Keeping F1's interface means: Thm 2.9-type outcome on the side known only to be 4-light and quite heavy (R_BA in Lemma 5.7, F1.txt:1220–1222; R_S in Lemma 5.9, F1.txt:1258), and Lemma 5.6 rooted K5 on the other side. Under that interface, the exact K7^- requirement is:

> **T2.9⁻ (the RL65 candidate analogue).** Let G be a 4-light 5-rooted graph. If G is quite heavy, then G contains, as a rooted minor, a member of 𝒲₁. Here 𝒲₁ is the set of 7-vertex 5-rooted graphs W with no root edges, non-roots p, q and E(W) = E* minus at most one edge. Up to symmetry these are three graphs:
> - K2 ∨ K̄5;
> - K2,↓5 (missing pq);
> - the one-fanged vampire (missing a single qx).

𝒲₁ is contained in {vampires} ∪ {K2,↓5}. So T2.9⁻ is exactly Thm 2.9 with the two-fanged vampire outcome removed. This is the brief's form "at most one missing non-root edge".

## 4. Assessment: T2.9⁻ is REFUTED by an explicit counterpattern

**Counterpattern G0, the two-fanged vampire, as a 5-rooted graph.**
- Roots X = {x1, …, x5}, pairwise non-adjacent. Non-roots p, q.
- E(G0) = {pq} ∪ {px : x ≠ x2} ∪ {qx : x ≠ x1}, with x1 ≠ x2. So |E(G0)| = 9.

**Verification against F1's definitions.**
1. **ρ4(G0) = 1.**
   - n(G0) = 2, and ρ(G0) = 9 because every edge has a non-root end. So ρ4 = 9 − 8 = 1.
   - Check via Obs 2.3: ½[(deg p + deg_X p − 8) + (deg q + deg_X q − 8)] = ½[(5+4−8)+(5+4−8)] = 1.
2. **Quite heavy.** ρ4 = 1, and no non-root is adjacent to all five roots: p misses x2 and q misses x1.
3. **4-light.** The fragments are {p}, {q} and {p,q}.
   - ∂{p} = {x1, x3, x4, x5, q};
   - ∂{q} = {x2, x3, x4, x5, p};
   - ∂{p,q} = X.

   All boundaries have size 5, so there is no (≤4)-fragment, and 4-lightness holds vacuously by Obs 2.5.

   The same follows directly from the separation definition. Let (A, B) be a root separation, so X ⊆ A, and suppose p ∈ B \ A. Then N(p) = {x1, x3, x4, x5, q} ⊆ B, and x1, x3, x4, x5 ∈ A ∩ B.
   - If q ∈ A, then q ∈ A ∩ B, so the order is >= 5.
   - Otherwise x2 ∈ N(q) ⊆ B, so A ∩ B ⊇ X, and again the order is >= 5.

   The case q ∈ B \ A is symmetric. So every root (≤4)-separation has B \ A = ∅, and its right-hand side has ρ4 = 0.
4. **No member of 𝒲₁ is a rooted minor.**
   - A model of a 7-vertex graph in the 7-vertex G0 uses 7 disjoint non-empty bags, so every bag is a singleton. Rootedness forces the root bags to be {x_i}, so the non-root bags are {p} and {q}.
   - Distinct edges of W map to distinct edges of G0.
   - Every member of 𝒲₁ has >= 10 edges, but G0 has 9. Contradiction.

**Consistency.** G0 is itself a vampire, so it agrees with Thm 2.9 (Level A).

**Classification: PROVED ANALYTIC MATHEMATICS (elementary).** T2.9⁻ is FALSE. The proof uses only F1's definitions; no F1 proof and no [Dvo26] statement is consumed.

**Scope.**
- The counterpattern refutes **only** the lemma-level statement T2.9⁻. It refutes neither C65, nor (2.8⁻), nor F2 Conjecture 21.
- It does not show that F1's architecture cannot reach K7^-.
- It shows that **the matching deficiency at the first locus is intrinsic to the "quite heavy" threshold.** The two-fanged vampire is at once a valid 4-light, quite-heavy input and an outcome missing two non-root edges. A K7^- version cannot keep F1's Thm 2.9 / Lemma 5.6 interface at this threshold. "Interface" here means a standalone rooted lemma whose only hypotheses are 4-light and quite heavy, which is exactly what F1 uses at F1.txt:1220–1222 and 1250–1258.
- A Thm 2.9-type lemma with **extra hypotheses** derivable from minimality is **not** excluded. For example, in G0 the non-roots have degree 5, and pq lies in only 3 triangles.
- The refutation is near-tautological: G0 is one of F1's own listed Thm 2.9 outcomes. Its weight is the interface observation, not a new obstruction.

## 5. Diagnosis and bounded repair (recovery protocol; formulated, NOT assessed)

**The only new resource.** The 5-unit density surplus: ρ4(R_AB) + ρ4(R_BA) >= m + 8, against m + 3 in F1.

In the both-quite-heavy case, let r = ρ4(R_BA) be the lighter side's density, so r >= 1. Then ρ4(R_AB) >= m + 8 − r. The counterpattern lives in the sub-case **r = 1**, where the heavier side has ρ4 >= m + 7.

**Lemma D (proved; elementary).** Let R1 and R2 be 5-rooted graphs on a common root set X with disjoint non-root sets, glued along X. Suppose R1 contains K6↓5 as a rooted minor, and R2 is 4-light with ρ4(R2) > 0. Then R1 ∪ R2 contains K7^- as a minor. Here K6↓5 is the 6-vertex 5-rooted graph whose 5 roots form a clique and whose single non-root is adjacent to all roots.

*Proof.*
1. Let C1, …, Ck be the components of R2 − X. Each edge with a non-root end has all its non-root ends in exactly one Ci, and root–root edges are counted on neither side. So Σ ρ4(R2, Ci) = ρ4(R2) > 0. The same identity is displayed at F1.txt:470–473; it is cited for comparison only, since the identity is proved here.
2. If every Ci had |∂Ci| <= 4, then Obs 2.5 would give each ρ4(R2, Ci) <= 0. So some component C has ∂C = X.
3. Take the K6↓5 model in R1: five root bags, pairwise adjacent, and an apex bag adjacent to all of them. Add the bag C, which is adjacent to every root bag through its root neighbours.
4. Only the pair (apex, C) can be non-adjacent. So this is a model of K7^-. ∎

Lemma D is a minor construction from two given rooted structures in a fixed graph. It is not an upgrade of a fixed K7^= model by minimality (FL-055..062).

**Exact repaired requirement for the r = 1 sub-case (the RL66 candidate; NOT assessed in RL65):**

> **H65.** Every 4-light 5-rooted graph R with ρ4(R) >= m(R) + 7, where m(R) is the number of non-adjacent root pairs, contains K6↓5 as a rooted minor.

**Why H65 would help.**
- In a minimal (2.8⁻)-counterexample, Lemma 5.4's proof is K7^=-agnostic on reading: it uses Cor 5.3, Lemma 5.1 and 4-bilightness (F1.txt:1129–1145). Read that way, both sides are 4-light. This reading is NOT PROMOTED.
- Then H65 plus Lemma D excludes the r = 1 both-quite-heavy case. This is **conditional on that NOT PROMOTED reading**, which must travel with the claim.
- If a (2.8⁻) version of Lemma 5.7 held, its heavy side would have ρ4 >= m + 7. H65 on R_T together with the star in R_S might then also give the Lemma 5.9 analogue. This is reading level, NOT PROMOTED. Lemma D does not apply literally, because R_S and R_T have different root sets ∂S and ∂T. Two more things would be needed:
  - a **linkage variant** of Lemma D, contracting the 5 disjoint paths of F1.txt:1256–1262 into the root bags;
  - a (2.8⁻) analogue of the 5-path claim, which uses Cor 5.5 and Cor 5.3 (F1.txt:1250–1255).
- The r >= 2 sub-cases still need either T2.9⁻ at threshold ρ4 >= r on the lighter side, or H65 at threshold m + 8 − r. These remain open and unassessed.

**Sanity checks on H65 (not part of the RL65 assessment).**
- m = 0: roots form a clique. The star from 4-lightness plus ρ4 > 0 gives K6↓5 trivially.
- Apex-over-planar rooted graphs z + P give ρ4 = m < m + 7, so they are not counterpatterns.
- A uniform threshold ⌈(m+8)/2⌉ in place of m + 7 is expected to fail on z + P when m >= 8. This is an orientation note only: NOT PROMOTED, not assessed.

**First missing dependency of the repaired route.** H65, a rooted density theorem for a 6-vertex target with an apex over the 5 roots. No inspected statement supplies it:
- F1's restatements of [Dvo26] (Thm 2.6: 5-vertex target classes S_{5,t}; Thm 2.7: K_k or S_{4,5} targets on <=4 roots; Cor 16: vampire / K2,↓5 / {K4+K1});
- the [Dvo26] v1 abstract (R2): rooted K5 for 5-connected graphs with >= 4n−10 edges.

None of these is a 6-vertex target consisting of K5 on 5 roots plus an apex.

## 6. Outcome summary

| Item | Result | Classification |
|---|---|---|
| First locus | Thm 2.9 as consumed in Lemma 5.7 (F1.txt:412–413; 1220–1226) | reading of F1 (Level A text) |
| K7^= statement | quoted above | — |
| K7^- analogue | T2.9⁻ (at most one missing non-root edge, same hypotheses) | — |
| Assessment | **REFUTED by explicit counterpattern G0** (two-fanged vampire; 4-light, quite heavy, ρ4 = 1, 9 edges) | PROVED ANALYTIC (elementary) |
| Effect on C65 | none: C65 stays CONJECTURE / NOT ESTABLISHED | — |
| Method barrier | the F1 Thm 2.9 / Lemma 5.6 interface (a standalone lemma assuming only 4-light and quite heavy) cannot reach K7^- at the quite-heavy threshold. In the r = 1 sub-case, where the lighter side can be G0, the density surplus must be spent on the heavy side or on minimality-derived hypotheses. For r >= 2 a lighter-side route remains open | METHOD BARRIER (lemma level) |
| Lemma D | K6↓5 ∪ (4-light, ρ4 > 0) ⇒ K7^- | PROVED ANALYTIC (elementary) |
| Next requirement | H65 (r = 1 sub-case; payoff conditional on the NOT PROMOTED Lemma 5.4 analogue) | CANDIDATE / NOT ASSESSED |
| Second locus (Lemma 6.4/6.6) | not assessed (downstream; no chaining) | — |

Programme ACTIVE.
