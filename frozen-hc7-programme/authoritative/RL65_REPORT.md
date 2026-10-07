# RL65 report — HC7 K7^- density candidate gate (C65 = F1 Conjecture 1.5)

Status: RL65 record. CLOSED/FROZEN on promotion at RL65 closeout.

Session: RL65 HC7-K7MINUS-DENSITY-CANDIDATE-GATE. Root: HC7 only.
BASE_HEAD: 60ccaddd48147a64df431e91d26675089200c82e. Unchanged at kickoff, checkpoint and CLOSEOUT_LOCK.

**Start-gate precondition.** Satisfied. R1 fetched the unversioned F1 URL at 2026-10-06T10:34:15Z: HTTP 200, sha256 6af798e5…c907, equal to the pin, with stamp v1. So there is no new version, and the extraction hash equals RL64's, which keeps the line references stable. Retrieval log: sessions/RL65/checkpoint/RL65_RETRIEVAL_LOG.md.

**Bounds used.**
- Retrievals: 2/3 (R1 F1 PDF; R2 [Dvo26] abstract page). R3 was not needed.
- Mathematical computation: 0. Census: 0. Candidates: 1.
- F1 reading: §2 definitions; §5 in full; §6 for the proof order only; statements of Obs 4.1 / Cor 4.2. The proofs of Thm 2.9 (§4) were not read. §3: only F1.txt:439–498 was viewed, incidentally. §7: scanned by the closeout red team for its citations only, to confirm that B65 does not use [Dvo26]. No statement from §3, §4 or §7 is consumed.

**Reliance caveats (F1).** Unrefereed preprint. §1.1 discloses that AI obtained the proofs. At this locus, AI originated F1 Lemmas 4.5 and 4.9 (inside the proof of Thm 2.9), the weaker form of Lemma 6.4, and the idea of Lemma 6.6 (F1.txt:169–177).

## 1. Bridge B65 (RL65_B65_BRIDGE.md)

**Statement.** C65 + F1 Thm 1.6 ⇒ every finite simple graph with chi >= 7 has a K7^- minor ⇒ **U9**: every HC7 counterexample has a K7^- minor, minimality not needed.

**Proof.** Take a minimal counterexample on |V|+|E|. Lemma B65.0 shows a proper minor is strictly smaller, so every proper minor is 6-colourable. F1 Thm 1.6 then gives a 7-connected graph with e >= 4n−2. The C65 hypotheses are checked explicitly:
- 5-connected, in F1's own k-connectivity sense (F1.txt:225–226);
- n >= 8;
- e >= 4n−2.

**Corollaries.**
- U9 ⇒ U8. Strictness is not claimed.
- B65 is C65 ⇒ F2 Conjecture 21.
- B65 does not use [Dvo26].

**Classification.** PROVED ANALYTIC MATHEMATICS, CONDITIONAL on C65 (CONJECTURE) and on F1 Thm 1.6 at Level A statement. Thm 1.6 internally uses Mader 7-connectivity (Level B, FL-063). **U9 is CONDITIONAL, not certified.**

## 2. Falsification test (RL65_FALSIFICATION_TEST.md)

| Family | 5-conn | e vs 4n−2 | K7^- minor | Verdict |
|---|---|---|---|---|
| K6 | yes | 15 < 22 | no | not a falsifier (edges) |
| apex + 5-conn plane triangulation | yes (6-conn) | 4n−10 | no (no K6) | not a falsifier (edges) |
| F2's G_n | no for n >= 7 (4-conn) | >= 4n−2 iff n >= 20 | no | not a falsifier (connectivity); 5-connectivity is necessary in C65 |
| K2,2,2,2 | yes (6-conn) | 24 < 30 | no (best K7^=) | not a falsifier (edges) |
| 2 adjacent apices + 5-conn plane triangulation | yes (7-conn) | 5n−15 > 4n−2 | **yes** | consistent with C65; K7-free: the documented K7 density failure |

**Classification.** PROVED ANALYTIC (elementary). **No falsifier.** C65 remains CONJECTURE / NOT ESTABLISHED.

## 3. First F1 locus (RL65_LOCUS_ASSESSMENT.md §1–§2)

The first place in the proof of F1 Thm 2.8 where a matching-deficient rooted tool is spent against K7^= -minor-freeness is **Thm 2.9 as consumed in Lemma 5.7** (F1.txt:412–413, 1220–1226):

> "Theorem 2.9. Let G be a 4-light 5-rooted graph. If G is quite heavy, then G contains a vampire or K2,↓5 as a rooted minor."

> "… note that K ∪ W is isomorphic to K7= or one of its supergraphs, which is a contradiction since G is K7= -minor-free."

Lemma 5.9, Lemma 6.4/6.6 and Cor 6.7 are all downstream of Lemma 5.7. Cor 5.3's use of Thm 2.9 is a fragment reduction, not a K7^= deficiency.

## 4. The K7^- analogue and its assessment (RL65_LOCUS_ASSESSMENT.md §3–§4)

**Setting.** For at least 4n−2 edges, a minimal counterexample to the K7^- analogue (2.8⁻) of F1 Thm 2.8 has ρ4 >= −2. Its 5-separations therefore satisfy ρ4(R_AB) + ρ4(R_BA) >= m+8. The analogue (2.8⁻) is not claimed.

**The required analogue T2.9⁻.** Same hypotheses as Thm 2.9 (4-light, quite heavy). Outcome: a rooted 7-vertex graph obtained from K7 by deleting the root edges and at most one further edge. This is exactly what F1's interface needs, because K5 on the roots ∪ W ⊇ K7^- iff W misses at most one of its 11 non-root edges.

**Assessment: REFUTED by an explicit counterpattern.** The counterpattern is G0, the two-fanged vampire: roots independent; p adjacent to all roots except x2; q adjacent to all roots except x1; pq an edge.
- ρ4 = 1, and no non-root is adjacent to all roots, so G0 is quite heavy.
- It has no (≤4)-fragment, so it is 4-light.
- It has 9 non-root edges, while every target needs >= 10 and all branch sets must be singletons.

**Classification.** PROVED ANALYTIC (elementary; F1 definitions only).

**Meaning.** A METHOD BARRIER at lemma level. The matching deficiency at the first locus is intrinsic to the quite-heavy threshold, for a standalone lemma assuming only 4-light and quite heavy. Lemmas with extra minimality-derived hypotheses are not excluded. The refutation is near-tautological, since G0 is one of F1's own Thm 2.9 outcomes; its weight is the interface observation. This is **not** a refutation of C65, of (2.8⁻) or of F2 Conjecture 21.

## 5. Repair formulation (RL65_LOCUS_ASSESSMENT.md §5)

- **Lemma D (PROVED ANALYTIC, elementary).** If R1 contains K6↓5 as a rooted minor (K5 on the 5 roots plus an apex branch set adjacent to all of them), and R2 is 4-light with ρ4(R2) > 0 on the same roots, then R1 ∪ R2 contains K7^-.
- **H65 (CANDIDATE / NOT ASSESSED; RL66's C66).** Every 4-light 5-rooted R with ρ4(R) >= m(R)+7 contains K6↓5 as a rooted minor. Together with Lemma D, it would close the r = 1 both-quite-heavy sub-case of the Lemma 5.7 analogue, where G0 lives. This is conditional on the NOT PROMOTED Lemma 5.4 analogue, which makes both sides 4-light.
- **First missing dependency.** H65. No inspected statement provides a rooted density theorem for a 6-vertex target. That covers F1's restatements of [Dvo26] Thm 4 / Cor 13 / Cor 16 and the [Dvo26] v1 abstract.
- **NOT PROMOTED:**
  - the K7^- analogue of F1 Lemma 5.4, which would make both sides 4-light (reading level);
  - the expectation that a uniform-threshold H65 fails on apex-over-planar rooted graphs (orientation).
- **Open:** the r >= 2 sub-cases and the downstream loci.

## 6. Frontier (FL-064/065/066 positions)

| Item | Position after RL65 |
|---|---|
| U1–U8 | certified; unchanged |
| U9 (K7^- in every HC7 counterexample) | CONDITIONAL on C65 via B65; not certified |
| S1 (7-connectivity) | Level B; not needed (inside F1 Thm 1.6's conclusion only) |
| S2 (delta in {7,8,9}) | Level C; not used |
| S4 / U8 | certified start point; nothing re-derived below it |
| K7^- target (C65) | CONJECTURE; B65 proved conditionally; no falsifier; F1 interface blocked at T2.9⁻; repair C66 |
| K7 density-failure examples | re-proved: the 2-apex family satisfies C65's hypotheses, contains K7^-, and is K7-free; no K7 density attempt was made |

Open interval for HC7: K7 minus any two edges (certified) → K7^- (open; conditional bridge proved; density gap) → K7 (open; density documented to fail).

## 7. Corrections / demotions, and source status

**Mathematical correction/demotion: NONE.** Inherited theorem-classification changes: NONE.

**Promoted source-status changes: NONE.** Register note, effective at RL65 closeout. It supplements authoritative/RL64_SOURCE_REGISTER.md, which remains the consolidated register:

| ID | Note |
|---|---|
| RL63-SRC-03 (F1) | Re-pinned in RL65 R1: the unversioned latest PDF is byte-identical to the admitted v1 (sha256 6af798e5…c907). No new version as of 2026-10-06. Admission unchanged (Level A statement). |
| RL64-SRC-09 ([Dvo26]) | Abstract page inspected in RL65 R2 (sha256 71cbce30…e19e). Title "Extremal function for rooted $K_5$ minors"; sole author Zdeněk Dvořák; only v1 (12 Sep 2026); 85 pp; CC BY 4.0; no journal-ref or DOI, so unrefereed. Abstract: if an n-vertex 5-connected graph has at least 4n−10 edges, then any five vertices can be the roots of a K5 minor; the bound is best possible. **Content stays Level B.** Metadata are now pinned. |
| SQ6 | Partially resolved. The F1 §5 locus was read, and the [Dvo26] abstract was pinned. The [Dvo26] PDF was not read. |

## 8. Route-portfolio effect

| Route | Change |
|---|---|
| R21-K7^- | Stays ACTIVE. Its F1-interface version is blocked at T2.9⁻ (FL-066). Next is C66 (heavy-side rooted K6). |
| R21-K7 | Unchanged: SUSPENDED (2-apex examples re-proved K7-free). |
| R04 (S1) | Unchanged; still no consumer. |
| others | Unchanged. |

## 9. RL66 recommendation (exactly one)

**Selected: RL66 HC7-K7MINUS-HEAVY-SIDE-ROOTED-K6-GATE.** Assess C66 = H65 as one bounded new-mathematics candidate. The reasons:
- it addresses exactly the sub-case of the RL65 counterpattern;
- it spends the C65-specific density surplus;
- it may also serve the Lemma 5.9 analogue, via a linkage variant of Lemma D and a 5-path analogue (reading level, NOT PROMOTED).

**Runner-up: T2.9⁻ at the raised threshold ρ4 >= 2** (lighter-side repair). It loses for three reasons:
1. It leaves the r = 1 sub-case that contains G0 untouched, so some heavy-side or two-sided statement is needed there anyway; H65 is the formulated one. (Symmetrically, C66 leaves r >= 2 untouched, but r = 1 is the sub-case forced by G0.)
2. Lemma 5.9's lighter side R_S is only known to be quite heavy.
3. It would require re-running F1 §4, the proof of Thm 2.9, whose Lemmas 4.5/4.9 came from AI. That is above Level A.

**Not selected:**
- Lemma 6.4/6.6 (downstream of the unrepaired Lemma 5.7);
- the S1/Mader gate (no consumer);
- a K7 mechanism (unscoped).

**Drift caution.** C66 is two levels below C65. RL66 should stop at its first decisive outcome, and the next selection should weigh the RL70 audit.

**Standing.** The RL70 periodic audit is still owed (after RL69). The ledger FL-001..FL-065 is carried forward untouched, with FL-066 appended (§10).

## 10. FL-066

FL-066 is appended to authoritative/FAILURE_AND_LESSON_LEDGER.md and recorded in RL65_FAILURE_AND_LESSON_LEDGER_APPENDIX.md.

Programme ACTIVE.
