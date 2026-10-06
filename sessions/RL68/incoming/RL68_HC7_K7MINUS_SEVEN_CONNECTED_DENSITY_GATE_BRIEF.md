# RL68 brief — HC7 K7^- seven-connected density gate

Status: READY / NOT STARTED.
Programme: ACTIVE.
Root: HC7 only (every finite simple graph G with chi(G)=7 has a K7 minor). A legitimate negative is a rigorously verified G with chi(G)=7 and h(G)<=6.
Selected by: RL67 (authoritative/RL67_REPORT.md §8). Predecessor: RL67 CLOSED/FROZEN under sessions/RL67/.
Mode: one bounded NEW-MATHEMATICS candidate gate. It lies **outside** the F1-interface lemma chain, as the drift rule requires (FL-068).

Required reading:
- AGENTS.md
- authoritative/START_HERE.md
- this brief
- authoritative/HC7_RESEARCH_PROGRAMME.md (§14)
- authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md
- authoritative/RL67_REPORT.md
- authoritative/RL66_C66_ASSESSMENT.md (§1, precision B65⁷)
- authoritative/RL65_B65_BRIDGE.md
- authoritative/RL65_FALSIFICATION_TEST.md (families F-a..F-e and standard facts P1–P4; P5 is orientation only)
- authoritative/RL64_SOURCE_REGISTER.md (admission Levels A/B/C; row RL63-SRC-02) and authoritative/RL64_CLASSICAL_INPUT_TABLE.md (rows 2–3)
- authoritative/FAILURE_AND_LESSON_LEDGER.md (FL-064..FL-068)

## Start-gate precondition

None. No external retrieval is permitted in RL68.

## Definitions

- Graphs are finite and simple. Minor and model are standard. K7^- is K7 minus one edge. A K7^- model is 7 disjoint connected bags with all pairs adjacent except at most one.
- **k-connected:** standard, i.e. more than k vertices and no separating set of fewer than k vertices. For graphs with at least k+1 vertices this agrees with F1's characterisation (F1.txt:225–226, as discussed in RL65_B65_BRIDGE.md), with F1's "proper" read as A∖B ≠ ∅ ≠ B∖A (RL66_C66_ASSESSMENT.md S66 step 3). So for n >= 8 the 7-connectivity supplied by F1 Thm 1.6 is standard 7-connectivity, and B65⁷ applies C68 as stated.
- **Glossary of drift-rule labels:**
  - (2.8⁻): "a 4-bilight graph with n >= 3 vertices and at least 4n − 2 edges contains K7^- as a minor" (RL65_LOCUS_ASSESSMENT.md §3; NOT claimed);
  - 4-bilight: no dense (≤4)-bifragment (F1.txt:383–387, quoted in RL67_H67_ASSESSMENT.md §1);
  - H54⁻: RL66_PAYOFF_CHAIN.md Step 2;
  - T2.9⁻: RL65_LOCUS_ASSESSMENT.md §3;
  - C66, E66, S66: RL66_C66_ASSESSMENT.md;
  - H67: RL67_H67_ASSESSMENT.md.

## Candidate C68 (status on entry: CANDIDATE / NOT ESTABLISHED)

> **C68 (= C65⁷).** Every 7-connected graph with n >= 8 vertices and at least 4n − 2 edges contains K7^- as a minor.

**Chain to the root.** Precision B65⁷ (RL66_C66_ASSESSMENT.md §1; PROVED ANALYTIC, CONDITIONAL exactly as B65): C68 + F1 Thm 1.6 ⇒ every finite simple graph with chi >= 7 has a K7^- minor ⇒ **U9** (every HC7 counterexample has a K7^- minor).
- **F1 Thm 1.6** (F1.txt:109–111, Level A statement): "Let G be a K7− -minor free graph of chromatic number at least seven. If every proper minor of G is 6-colorable, then G is 7-connected and |E(G)| ≥ 4|V(G)| − 2."
  - It is an unrefereed preprint, its AI-assisted proofs are disclosed (F1 §1.1, F1.txt:154–182), and its proof is unread.
  - Internally it uses Level-B Mader 7-connectivity.
- If C68 is proved, U9 rests on in-repo proofs (B65⁷, C68) plus F1 Thm 1.6 at Level A statement. That is the same evidential standard as U8, which rests on F1 Thm 1.1 at Level A.
- Whether to promote U9 to the certified frontier on that basis must be decided explicitly under the RL64 admission rule (RL64_SOURCE_REGISTER.md, admission levels: Level A is consumable for HC7-universal promotion) and recorded at RL68 verification. It is not decided here.

**Relation to C65.** C65 ⇒ C68, since a 7-connected graph with n >= 8 is 5-connected with n >= 6. Whether C68 is strictly weaker is not claimed.

**Not assumed.**
- S1 (7-connectivity of HC7 counterexamples) is not assumed. C68 concerns all 7-connected graphs, and 7-connectivity enters B65⁷ only through F1 Thm 1.6's conclusion.
- C65, C66, H67, H54⁻ and (2.8⁻) are not assumed.

## HC7 programme §5 fields

- **Quantifiers.** Every 7-connected finite simple graph with n >= 8 and |E| >= 4n − 2.
- **Inherited connections.** B65⁷ (above). The RL65 family F-e (two adjacent apices over a 5-connected plane triangulation) is 7-connected and contains K7^- (re-proved in RL65). Every member has n = |T| + 2 >= 14 (P4), so 5n − 15 >= 4n − 1 > 4n − 2. It is consistent with C68.
- **HC7-universal obligation reduced, if C68 is established.** U9 would rest only on F1 Thm 1.6 at Level A, instead of on C65⁷ = C68 and F1 Thm 1.6 as recorded since RL66. Promotion to certified is to be decided explicitly at RL68 verification (above).
- **First known gap.** No statement in authority gives a K7^- minor in 7-connected graphs at 4n − 2 edges. C65 (F1 Conjecture 1.5, the 5-connected version) is CONJECTURE / NOT ESTABLISHED in authority. The literature status of C65 and C68 has not been assessed, and no retrieval is permitted in RL68.
- **Mader's extremal functions are not available.** Mader's K6 function (4n − 10) would give a K6 minor at once, but it is Level C (RL63-SRC-02: located, not inspected) and not cited by F1/F2 (RL64_CLASSICAL_INPUT_TABLE.md rows 2–3). It may not be consumed. Any step needing it must be proved in the repository or recorded as an open dependency.
- **Falsification condition.** An explicit 7-connected graph with n >= 8 and >= 4n − 2 edges and no K7^- minor.
  - It refutes C68 and C65.
  - It also refutes (2.8⁻), since a 7-connected graph with n >= 8 is 4-bilight (F1.txt:392–393; re-proved in RL67_H67_ASSESSMENT.md §4 item 4).
  - It blocks the B65⁷ route to U9; U9 itself stays open.
  - **HC7.** If chi(G) >= 7, any 7-chromatic subgraph of G is K7-minor-free, hence an HC7 counterexample, and F2 Conjecture 21 also fails. That would have to be rigorously verified before any claim. If chi(G) <= 6, no claim on HC7.
  - **C66** (scope remark, by the argument of S66; not promoted). G refutes C66 whenever |E(G)| >= 4|V(G)| + δ(G) − 7.
    - Take v of minimum degree δ, and five neighbours X of v. R = G − v rooted at X is vacuously 4-light: a fragment Y with |∂_R Y| <= 4 has |∂_G Y| <= 5, since ∂_G Y ⊆ ∂_R Y ∪ {v}, and it would separate Y from a root outside Y ∪ ∂_R Y, contradicting 7-connectivity.
    - R + z' is G minus the δ − 5 edges from v to N(v)∖X, a subgraph of G. By E66(b), ρ4(R) − m(R) = |E(G)| − δ − 4|V(G)| + 14 >= 7.
    - A rooted K6↓5 in R would give a K7^- minor of G by E66(a).
    - Below that edge count no implication to C66 is recorded.
  - **H67.** It is not shown to refute H67: G has no 5-separation, so it is not itself an H67 instance.
  - It does not refute U8, nor B65⁷ (a proved implication).

## Falsification test (first, analytic)

For each of families (a)–(d), and (f) if attempted, record 7-connectivity, |E| against 4n − 2, and whether a K7^- minor exists, with reasoning.
- (a) **Two adjacent apices over a 5-connected plane triangulation** (RL65 F-e). Consistency check only.
- (b) **K_{2×t}**, the complete t-partite graph with all parts of size 2 (K_{2t} minus a perfect matching), for t >= 5. It has 2t vertices, connectivity 2t − 2 and 2t(t−1) edges, which is >= 4·2t − 2 iff t >= 5.
- (c) **C_n^4**, the 4th power of the cycle C_n, for n >= 10 (C_9^4 = K9). It is 8-regular with 4n edges.
- (d) **K5 □ K5** (Cartesian product). It is 8-regular, with 25 vertices and 100 >= 98 edges.
- (e) **7-connected graphs below 4n − 2**, outside C68's hypothesis; recorded only, not tested: K_{2,2,2,2,1} (7-connected, 32 < 34 edges) and 7-regular 7-connected graphs (3.5n edges).
  - They show that 7-connectivity alone does not give 4n − 2 edges.
  - They say nothing about whether the threshold is sharp. K_{2,2,2,2,1} in fact has a K7 minor.
- (f) Optional: any further 7-connected family the worker can analyse analytically within the work unit.

**Stopping rule.** Stop at the first of:
1. a verified falsifier of C68;
2. C68 proved, with every dependency classified;
3. C68 open, with its exact first missing dependency;
4. the work-unit bound.

## Frontier position (FL-064 as extended by FL-065..FL-068)

| Item | Position |
|---|---|
| S1 (7-connectivity) | Level B. Not assumed; C68 is about all 7-connected graphs |
| S2 (delta in {7,8,9}) | Level C. Not used |
| S4 / U8 | Certified (Level A statement). C68 targets K7^-, which contains K7^= and K7^vee as subgraphs (U9 ⇒ U8; strictness not claimed). It re-derives no frontier fact |
| K7^- target | C65 is a CONJECTURE. U9 needs only C68 (B65⁷). The F1-interface chain is held under the drift rule: C66 open (FL-067), H67 open (FL-068) |
| K7 density-failure examples | 2-apex triangulations: 7-connected, K7-free, 5n−15 edges. C68 concerns K7^- only. No density attempt for K7 |

## Prohibitions

- **Drift rule (FL-068).** No extension of the F1-interface lemma chain before the RL70 audit prices it. That means:
  - no (2.8⁻) / 4-bilight induction lemmas;
  - no H67 or its minimality-assisted variant;
  - no C66 investment (FL-067);
  - no T2.9⁻ at any threshold;
  - no H54⁻ promotion;
  - no Lemma 5.9 / 6.x / Cor 6.7 analogues;
  - more generally, no adaptation of F1's Thm 2.8 proof architecture: no bilight-type induction at any order, no F1 §2–§6 separation or rooted-minor lemmas, and no [Dvo26]-based rooted targets. If a C68 attempt reduces to such an adaptation, stop and record it as the first missing dependency.
- No upgrade of a K7^=, K7^vee or vampire model to K7^- or K7 by model minimality (FL-055..FL-062).
- No density attempt for K7.
- No degree-7 / M3 / Kempe / K4,4 local work.
- No consumption of F1/F2 statements above Level A statement.
- No consumption of [Dvo26] (RL64-SRC-09), or of the classical inputs cited by F1/F2 (RL63-SRC-01, RL64-SRC-01..10), above Level B; consequences are CONDITIONAL.
- Mader's K6/K7 extremal functions (RL63-SRC-02) are Level C and orientation only. They may not be consumed.
- Any literature result not in RL64_SOURCE_REGISTER.md at Level A or B, including results recalled from memory, is Level C and may not be consumed.
- Only elementary textbook facts at the level of RL65 P1–P4 (for example Menger, Euler's formula, minors of planar graphs being planar) may be used, each stated explicitly. Any other step must be proved in the repository or recorded as the first missing dependency.
- Record F1's AI-assistance disclosure (F1 §1.1, F1.txt:154–182) wherever F1 is used.
- Do not silently assume S1, delta <= 9, C65, C66, H67, H54⁻ or C68.
- No literature loop. No external retrieval.
- No computation and no census.
- No full text of F1 committed to the repository (licence).

## Bounds

- **External retrievals:** 0.
- **Mathematical computation:** 0. **Census:** 0.
- **Candidates:** exactly 1 (C68).

## Expected outputs

1. The falsification record: verdicts and reasoning for (a)–(d), plus (f) if attempted. (e) is recorded as out-of-hypothesis only.
2. The C68 outcome (proved / explicit falsifier / open with exact first missing dependency), classified. If a falsifier is found, record its chi(G) status and |E(G)| against 4n + δ(G) − 7.
3. The updated frontier position (U8 / U9).
4. Corrections/demotions, including NONE.
5. Source-status changes, including NONE.
6. Exactly ONE RL69 recommendation, with a runner-up and why it loses. The drift rule still binds RL69: it must not extend the F1-interface chain.

**The RL70 periodic audit follows RL69.** It is owed, and it must price the F1-interface chain (FL-068).

**Root-level navigation note.** The repository-root START_HERE.md and README.md are stale (they name RL52) and non-authoritative (PK-7). authoritative/START_HERE.md governs.

Programme ACTIVE.
