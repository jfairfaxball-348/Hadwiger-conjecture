# RL66 brief — HC7 K7^- heavy-side rooted K6 gate

Status: READY / NOT STARTED.
Programme: ACTIVE.
Root: HC7 only (every finite simple graph G with chi(G)=7 has a K7 minor). A legitimate negative is a rigorously verified G with chi(G)=7 and h(G)<=6.
Selected by: RL65 (authoritative/RL65_REPORT.md §9). Predecessor: RL65 CLOSED/FROZEN under sessions/RL65/.
Mode: one bounded NEW-MATHEMATICS candidate gate. It is the bounded repair task named by FL-066.

Required reading:
- AGENTS.md
- authoritative/START_HERE.md
- this brief
- authoritative/HC7_RESEARCH_PROGRAMME.md (§12)
- authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md
- authoritative/RL65_REPORT.md
- authoritative/RL65_LOCUS_ASSESSMENT.md (definitions, G0, Lemma D, the derivation of H65)
- authoritative/RL65_B65_BRIDGE.md
- authoritative/FAILURE_AND_LESSON_LEDGER.md (FL-055..FL-066)

## Start-gate precondition

None for mathematics. C66 below is self-contained, and every definition it uses is quoted in this brief and in RL65_LOCUS_ASSESSMENT.md.

arxiv.org reachability is checked only immediately before a logged retrieval. If it is unreachable, do not retrieve, and use no substitutes, mirrors or re-routing. A re-fetched F1 PDF must match sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907. A mismatch or a new version is recorded and blocks use until re-admitted.

## Definitions

These are F1's (arXiv:2609.17760v1, Level A text), quoted or restated in RL65_LOCUS_ASSESSMENT.md §2.

- A **5-rooted graph** R is a finite simple graph with a root set X = X_R, |X| = 5.
- **Counts:** n(R) = |V(R) \ X|; ρ(R) = |E(R) \ E(R[X])|; ρ4(R) = ρ(R) − 4n(R) (F1.txt:280–282). Root–root edges do not affect ρ4.
- **Fragment:** a non-empty set Y ⊆ V(R) \ X. ∂Y is the set of vertices outside Y with a neighbour in Y, and ρ4(R,Y) = #(edges with an end in Y) − 4|Y| (F1.txt:335–339).
- **Root separation and right-hand side** (F1.txt:220–235). A separation (A, B) of R has V(R) = A ∪ B and no edge between A \ B and B \ A. It is a root separation if X ⊆ A, and its order is |A ∩ B|. Its right-hand side R_{A,B} is R[B] rooted at A ∩ B; root–root edges are irrelevant to ρ4.
- **4-light:** every root (≤4)-separation has a right-hand side with ρ4 <= 0. Equivalently (F1 Obs 2.5, F1.txt:346–347), every fragment Y with |∂Y| <= 4 has ρ4(R,Y) <= 0. **For RL66 the fragment form is the operative definition of 4-light.** The equivalence is F1's Obs 2.5, consumed at Level A only; RL65 verified G0 in both forms.
- **m(R):** 10 − |E(R[X])|, the number of non-adjacent root pairs.
- **Rooted minor** (F1.txt:196–218): a model µ in which each root of R lies in the branch set of its corresponding root vertex of the target.
- **K6↓5:** the 5-rooted graph on X ∪ {a} in which X is a clique and a is adjacent to all of X. A K6↓5 rooted minor of R consists of:
  - five disjoint connected branch sets B_x ∋ x (x ∈ X), pairwise adjacent;
  - a sixth connected branch set A, disjoint from them, containing no root and adjacent to every B_x.

## Candidate C66 (= H65 of RL65; status on entry: CANDIDATE / NOT ESTABLISHED)

> **C66.** Every 4-light 5-rooted graph R with ρ4(R) >= m(R) + 7 contains K6↓5 as a rooted minor.

## HC7 programme §5 fields

**Quantifiers.** Every 4-light 5-rooted finite simple graph R with ρ4(R) >= m(R)+7.

**Chain to the root.** C66 sits two levels below the documented K7^- target. The chain is:
1. C66 + Lemma D (+ both sides 4-light) ⇒ the r = 1 sub-case of the K7^- analogue of F1 Lemma 5.7;
2. ⇒ (with further, unassessed steps) the K7^- analogue (2.8⁻) of F1 Thm 2.8;
3. ⇒ C65 = F1 Conjecture 1.5;
4. ⇒ U9 via B65.

**Inherited connections.**
- **Lemma D** (RL65, proved). If R1 contains K6↓5 as a rooted minor, and R2 is 4-light with ρ4(R2) > 0 on the same roots, then R1 ∪ R2 contains K7^-.
- **B65** (RL65, proved conditional on C65 and on F1 Thm 1.6 at Level A).
- **The r = 1 arithmetic** (RL65). In a minimal (2.8⁻)-counterexample the sides of a 5-separation satisfy ρ4(R_AB) + ρ4(R_BA) >= m+8. If both sides are quite heavy and the lighter one has ρ4 = 1, the heavier one has ρ4 >= m+7.
- **Status of 4-lightness of both sides.** It comes from the K7^- analogue of F1 Lemma 5.4. That is a reading-level observation and is NOT PROMOTED. An RL66 payoff statement must carry it as an explicit hypothesis or prove it.

**HC7-universal obligation reduced, if C66 is established.** None directly. C66 would close one sub-case of one lemma in a route to C65 ⇒ U9. That closure is conditional on the NOT PROMOTED Lemma 5.4 analogue. The r >= 2 sub-cases and the downstream loci remain: Lemma 5.9 / 6.1 / 6.2 analogues, Lemma 6.4/6.6, Cor 6.7.

**First known gap.** No inspected statement gives a rooted density theorem for a 6-vertex target with an apex over the 5 roots. F1's restatements of [Dvo26] Thm 4 / Cor 13 / Cor 16 and the [Dvo26] v1 abstract all concern 5-vertex targets on the roots, or 7-vertex targets with two non-roots.

**Falsification condition.** An explicit 4-light 5-rooted graph R with ρ4(R) >= m(R)+7 and no K6↓5 rooted minor. Such an R refutes C66 only. It does NOT refute C65, (2.8⁻) or Lemma D. It would redirect the r = 1 repair to a two-sided requirement, formulated here and NOT ASSESSED: for every such R and every 4-light 5-rooted R2 on the same roots with ρ4(R2) = 1, R ∪ R2 contains K7^-. Background: RL65_LOCUS_ASSESSMENT.md §5.

Test first, analytically, the following families. Record each family's 4-lightness, its ρ4 against m+7, and whether it has K6↓5:
- (i) **apex over a 5-connected plane triangulation P, roots in P.** RL65 orientation: ρ4 = m, below the threshold. Record it as a threshold-necessity witness only; do not treat it as a test.
- (ii) **two apices over a planar graph P with the roots in P.** Include root placements that block rooted K4 in P, such as four roots on one face of a non-triangulated P, while preserving 4-lightness.
- (iii) **a dense non-root blob attached to X by a matching**, and variants with sparse attachments.
- (iv) **many copies of the two-fanged vampire G0 glued on X**, and K2,2,2,2-based rooted graphs.

**Stopping rule.** Stop at the first of:
1. a verified falsifier of C66;
2. C66 proved, with its exact dependencies classified;
3. C66 open, with its exact first missing dependency;
4. the work-unit bound.

Do not chain into the r >= 2 sub-cases or into downstream loci.

## Frontier position (FL-064 as extended by FL-065 and FL-066)

| Item | Position |
|---|---|
| S1 (7-connectivity) | Level B. Not needed: C66 is a rooted density statement. |
| S2 (delta in {7,8,9}) | Level C. Not used. |
| S4 / U8 | Certified (Level A statement). C66 targets strictly above it and re-derives no frontier fact. |
| K7^- target (C65) | CONJECTURE. B65 is proved conditionally. The F1 interface is blocked at T2.9⁻ by G0 (FL-066). C66 is the named heavy-side repair. |
| K7 density-failure examples | The 2-apex triangulations satisfy C65 and are K7-free (re-proved in RL65). No density attempt for K7 is made. |

## Prohibitions

- No retry of T2.9⁻ at the quite-heavy threshold (FL-066).
- No upgrade of a K7^=, K7^vee or vampire model to K7^- or K7 by model minimality (FL-055..FL-062).
- No density attempt for K7.
- No degree-7 / M3 / Kempe / K4,4 repository local work.
- No r >= 2 sub-cases. No Lemma 6.4/6.6, Cor 6.7 or other second locus.
- No consumption of F1/F2 statements above Level A statement, nor of [Dvo26] or cited classical inputs above Level B. Record F1's AI-assistance disclosure wherever F1 is used.
- Do not silently assume 7-connectivity, delta <= 9, C65, C66 or the NOT PROMOTED Lemma 5.4 analogue.
- No literature loop beyond F1 and [Dvo26].
- No computation and no census.
- No full text of F1 committed to the repository (licence). Quotations, line references and hashes only.

## Bounds

- **External retrievals:** at most 2, each logged before its call:
  - (1) the F1 v1 PDF, only if an F1 statement not already quoted in authority becomes load-bearing (sha256-pinned as above);
  - (2) the [Dvo26] v1 PDF (arXiv 2609.13818, CC BY 4.0), only if a [Dvo26] statement becomes load-bearing. It is consumed at Level B only.
- **Mathematical computation:** 0. **Census:** 0.
- **Candidates:** exactly 1 (C66).

## Expected outputs

1. A falsification record for families (i)–(iv), with each family's verdict and reasoning.
2. The C66 outcome (proved / explicit falsifier / open with exact first missing dependency), classified.
3. If proved: its exact consequence for the r = 1 sub-case, stated conditionally on every NOT PROMOTED input. C65 is still not established.
4. The updated frontier position (U8 / U9).
5. Corrections/demotions, including NONE.
6. Source-status changes, including NONE.
7. Exactly ONE RL67 recommendation, with a runner-up and why it loses.

The RL70 periodic audit is still owed (after RL69) and is not replaced.

Programme ACTIVE.
