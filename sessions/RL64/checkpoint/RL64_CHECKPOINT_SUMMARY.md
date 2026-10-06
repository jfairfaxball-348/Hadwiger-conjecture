# RL64 checkpoint summary (scratch; NOT PROMOTED until closeout)

Session: RL64 HC7-TWO-EDGE-DEFICIENT-FRONTIER-ADMISSION-GATE. Root: HC7 only.
BASE_HEAD: b313c5c865b01805261d7cb8ebb7c0232783051f (unchanged at checkpoint).

**Start-gate precondition.**
- First failed: A0 and A0b both got an arxiv.org CONNECT 403.
- Satisfied after the user allowed arxiv.org: A0c returned 200 at 2026-10-06T09:54:02Z.
- That was an access defect, now resolved. It was not an integrity failure.

**Bounds used.**
- Retrievals: 4/6 (R1, R2 abstract pages; R3, R4 v1 PDFs).
- Mathematical computation: 0. Census: 0.
- Proof reconstruction: none.
- No literature loop, no substitutes, no RL63 replay.

## 1. Admission (exact text in RL64_ADMISSION_RECORD.md)

| | F1 | F2 |
|---|---|---|
| Source | arXiv:2609.17760v1 (15 Sep 2026; manuscript 23 Aug 2026), Dvořák–Norin–Rahman | arXiv:2507.03244v1 (4 Jul 2025), Norin–Totschnig |
| Main theorem | "Theorem 1.1. Every K7= -minor-free graph is 6-colorable." | "Theorem 4. Every graph with no K7∨ -minor is 6-colorable." |
| Definition | "two independent edges" removed from K7 | "two edges with a common end" deleted from K7 |
| Minor | standard (models; equivalently subgraph plus contractions) | standard (models with connected bags) |
| Setting | graphs; finite (minimal counterexample); no multigraph/loop convention | "standard graph theoretical notation"; finite |
| Conditional? | no | no |
| Status | unrefereed preprint; AI-usage disclosure (§1.1); depends on unrefereed [Dvo26] | unrefereed preprint; CC BY 4.0 |
| **Decision** | **ADMITTED, Level A** (statement-checked, proof unread, v1-pinned) | **ADMITTED, Level A** (same) |

No falsification condition fired.

## 2. Updated universal frontier

For every hypothetical HC7 counterexample G:
- U1–U7 are unchanged.
- **New: U8.** G contains K7−{e,f} as a minor for every pair of distinct edges e,f of K7 (both K7^= and K7^vee). Basis: F1 + F2, Level A statement-level, proofs unread, two unrefereed preprints. Minimality is not needed. This is the first universal narrowing since RL54.

Precisions:
- U8 does **not** imply U7, because K4,4 has 8 vertices. U7 is retained.
- U8 does **not** give K7^-.

FL-064 positions:

| Item | Status |
|---|---|
| S4 | certified (U8) |
| S1 | Level B only. Load-bearing inside both proofs; the papers' Mader citations disagree; FL-063 unsatisfied. |
| S2 | Level C. Not used by the frontier. |
| S3 | Level C. Not used. |

The open interval for HC7 is now:

    K7 − any two edges (certified)  →  K7^- (open; density gap)  →  K7 (open; the density method is documented to fail)

## 3. Classical-input table (Level B)

Details: RL64_CLASSICAL_INPUT_TABLE.md. The headline:

| Input | Status |
|---|---|
| Mader 7-connectivity | load-bearing in both papers |
| Dirac | load-bearing in both; equals repository U4 at k=7 |
| Kriesell–Mohr Lemma 2 | load-bearing in both |
| KT05 Lemma 3(i) | F2 |
| KT05 Section 2 | F1 |
| Kawarabayashi–Luo–Niu–Zhang | F2 |
| RST93 (2.4)/(2.6) | F2 |
| Jørgensen 1994 | F2 |
| Dvořák 2026 rooted-K5 extremal function | F1 |
| Fabila-Monroy–Wood | F1, indirect |
| Jakobsen | background only |
| Mader K7/K6 extremal functions | **NOT CITED** |
| Gallai | **NOT CITED** |

New edge-extremal bounds, stated and proved in the pinned texts:
- F2 Thm 6: 4-connected, e >= 4n−8 ⇒ K7^vee, unless K2,2,2,2.
- F1 Thm 1.3 / 2.8: 5-connected or 4-bilight, e >= 4n−7 ⇒ K7^=.

## 4. Frontier-obstruction map (RL64_FRONTIER_OBSTRUCTION_MAP.md)

**Architecture.** Both papers combine two halves:
- a colouring half: contraction-critical ⇒ 7-connected, then degree-7 / 5-clique analysis, giving an edge lower bound;
- a density half: an extremal theorem in 4- or 5-connected graphs.

**Finite low-degree case analysis.** Yes, through degree-seven vertices:
- F2: at least 18 degree-7 vertices, then 5-clique combinatorics.
- F1: at most 5 degree-7 vertices, hence e >= 4n−2.

There is no delta in {7,8,9} partition and no computer search.

**Where only two-edge-deficient minors arise.** Only in the density half:
- F2 Thm 6;
- F1 Thm 1.3, through the matching-deficient rooted tools (vampire / K2,↓5 in Thm 2.9, and K5^- in Lemma 6.4/6.6).

F1's colouring half, Thm 1.6, already works under K7^- -minor-freeness.

**K7^- obstruction.** In the authors' words, the missing piece is exactly F1 **Conjecture 1.5**: "Every 5-connected graph with n ≥ 6 vertices and at least 4n − 2 edges contains K7− as a minor". Their remarks on it:
- "This would be sufficient to prove that K7− -minor-free graphs are 6-colorable."
- "there does not seem to be any fundamental obstruction".
- F2 Conj 21: "would require a corresponding extremal result".

**K7 obstruction.** The authors state: "a density result analogous to Theorem 1.3 is false for K7 -minor-free graphs". Their examples are two universal vertices added to 5-connected planar triangulations, which are 7-connected with 5n−15 edges. Their verdict: the "final step" is "substantially more difficult".

## 5. Source-register updates (RL64_SOURCE_REGISTER_UPDATE.md)

Proposed, effective at closeout:
- SRC-03: C→A. SRC-04: C→A.
- GAP-02 (Jakobsen): C→B.
- SRC-01 (Mader 175) stays B, with a further restatement.
- New Level-B rows RL64-SRC-01..10, including the Mader 174 (1967) attribution used by F2.
- SRC-02 (Mader 178) and GAP-01 (Gallai) stay C.
- SQ1 resolved.

## 6. Corrections / demotions

**Mathematical correction/demotion: NONE.** Inherited theorem-classification changes: NONE.

Orientation records superseded by inspection. These are recorded explicitly so nothing changes silently. They are not demotions, because they were Level-C expectations, not recorded claims.

| ID | RL63 orientation | Inspected finding |
|---|---|---|
| EX-1 | The RL63 verdict expected the frontier papers to "almost certainly consume the extremal and connectivity inputs themselves". | They consume Mader's connectivity but **not** the K7 extremal function. |
| EX-2 | The RL63 runner-up rationale placed the 2025–26 papers on the delta in {7,8,9} branches. | They use 4n−c density bounds and degree-7 analysis instead. S2's de-prioritisation stands, and is strengthened. |
| EX-3 | The RL63 register dated F1 "23 Aug 2026". | That is the manuscript date. arXiv v1 was submitted 15 Sep 2026. |
| EX-4 | The RL63 register gave F2's author as "not in excerpt". | The authors are Norin and Totschnig. |

## 7. Source-status changes

The proposed changes are those in §5. Nothing takes effect until the closeout transition. Promoted in RL64 so far: NONE.

## 8. Route-portfolio effect (proposed)

| Route | Change |
|---|---|
| R02 | SOURCE-GATE → **RESOLVED (admitted)** |
| R16 / R18 | formally superseded as near-K7 structure (R16 already KILL; R18 SUSPEND → SUPERSEDED) |
| R21 | SUSPEND → **scopable**: the K7^- part has an exact documented target (F1 Conj 1.5) and a Level-A bridge (F1 Thm 1.6); the K7 part stays SUSPENDED (density documented false; no scoped mechanism) |
| R03 (S2) | further de-prioritised: not used by the frontier |
| R04 (S1) | unchanged SOURCE-GATE, now with an attribution discrepancy |
| R10–R15 | unchanged; the degree-7 literature analysis at K7^- strength confirms R15 CONDITIONAL ONLY |

## 9. RL65 recommendation (exactly one)

**Selected: (ii) NEW-MATH. RL65 HC7-K7MINUS-DENSITY-CANDIDATE-GATE.**

*Candidate C65.* This is F1 Conjecture 1.5, exactly: every 5-connected finite simple graph with n >= 6 vertices and at least 4n−2 edges contains K7^- as a minor.

*Root bridge, to be written and proved in RL65 before any use.* Take a minimal non-6-colourable K7^- -minor-free graph. Every proper minor is 6-colourable, so F1 Thm 1.6 (Level A statement) makes it 7-connected, hence 5-connected, with e >= 4n−2. C65 then forces a K7^- minor, a contradiction. So:

    C65 ⇒ every graph with chi>=7 has a K7^- minor ⇒ U9 for every HC7 counterexample

This strictly strengthens U8.

*Frontier position (FL-064).*
- It starts from U8 (S4 certified) and targets strictly above it.
- It needs neither S1 nor S2: 7-connectivity is inside Thm 1.6's own statement for that class.
- It re-derives no frontier fact.

*First known gap.* F1 spends the matching deficiency at Thm 2.9 (vampire / K2,↓5) and at Lemma 6.4/6.6 (rooted K5^-). RL65 must formulate and assess the first K7^- analogue needed: one missing non-root edge, or a rooted K5 instead of K5^-.

*Falsification test.* An explicit 5-connected K7^- -minor-free graph with n>=6 and e>=4n−2. Test first against the families named in the inspected texts:
- K6;
- universal vertex + 5-connected triangulation;
- F2's G_n;
- K2,2,2,2;
- two apices + triangulation.

*Bounds.*
- At most 3 retrievals: re-fetch F1 v1, checking sha256 6af798e5…; [Dvo26] abs + PDF.
- 0 computation, 0 census, exactly one candidate.
- Stop at the first missing dependency, or at a falsifier.

*Prohibitions.*
- No upgrading of K7^= / K7^vee models (FL-055..062 pattern).
- No density attempt for K7 itself (documented false at 5n−15).
- No degree-7 / M3 / Kempe / K4,4 repository local work.

**Runner-up: (i) a Level-A gate for Mader's 7-connectivity (S1)**, the one classical input both frontier proofs consume. It loses for three reasons:
1. **No consumer.** U8 is admitted without it, and the selected K7^- bridge carries 7-connectivity inside F1 Thm 1.6's own statement.
2. **Below the frontier.** S1 narrows HC7 counterexamples without a partition, and would re-certify a fact the frontier proofs already use internally (FL-064 rule 2).
3. **Access and attribution risk.** The originals are paywalled (FL-063), and the two frontier papers cite different Mader papers: Math. Ann. 174 (1967) versus 175 (1968). The gate would open as a literature-attribution task.

**Standing.** The RL70 periodic audit is still owed. The ledger FL-001..FL-064 is carried forward untouched, with FL-065 appended at closeout (draft in §10).

## 10. FL-065 draft (appended at closeout only)

**FL-065: the two-edge-deficient frontier admitted; the open interval is now a K7^- density gap and then a K7 method gap.**

*Origin and classification.* Origin: RL64. Classification: source-enabled universal reduction (Level A statement, two unrefereed preprints), plus an externally documented method barrier at K7. It is not a mathematical error, demotion, counterexample, or finite certificate.

*Observation.*
- F1 and F2 are admitted at Level A from arXiv v1 texts.
- U8 holds for every HC7 counterexample.
- The frontier proofs use Mader's 7-connectivity, Dirac, Kriesell–Mohr, KT05 and Dvořák 2026. They do not use the Mader K7 extremal function or Gallai.
- K7^- reduces to the density statement F1 Conj 1.5, through F1 Thm 1.6.
- For K7 the authors document that the density method is false: 7-connected 2-apex planar graphs have 5n−15 edges.

*Access event.* arxiv.org was blocked (A0, A0b) until the user changed the environment (A0c). This was an access defect and is resolved.

*Lesson.* Importing the frontier located the gap exactly. The next new mathematics should target the documented density statement. It should not target an inherited local chain, and not a K7 density bound that is known to be impossible.

*Retry / frontier rule (extends FL-064).* Every later brief also states its position relative to:
- U8;
- K7^- (C65 / F1 Conj 1.5);
- the K7 density-failure examples.

No upgrade of K7^= / K7^vee models.

*Selected successor.* RL65 HC7-K7MINUS-DENSITY-CANDIDATE-GATE.
