# RL65 checkpoint summary

Status: RL65 record. CLOSED/FROZEN on promotion at RL65 closeout. This is the kickoff checkpoint as presented to the user, with the closeout red-team and critic scoping edits applied (RL65_RED_TEAM_RECORD.md, RL65_CLOSEOUT_VERIFICATION_REPORT.md). The promoted records supersede it wherever they differ.

Session: RL65 HC7-K7MINUS-DENSITY-CANDIDATE-GATE. Root: HC7 only.
BASE_HEAD 60ccaddd48147a64df431e91d26675089200c82e. Unchanged at plan start, at Phase 0 and at checkpoint.

**Bounds used.**
- Retrievals: 2/3 (R1 F1 PDF; R2 [Dvo26] abstract). R3 unused.
- Mathematical computation: 0. Census: 0. Candidates: 1.
- F1 proof reading: §5 and §6 for the locus and the proof order only. §3, §4 and §7 proofs unread.

**Start-gate precondition.** arxiv.org reachable. F1 re-fetched from the unversioned URL: sha256 equals the pinned 6af798e5…c907, stamp v1, so no new version. F1.txt hash equals RL64's.

## 1. B65 (RL65_B65_BRIDGE.md)
C65 + F1 Thm 1.6 ⇒ every finite simple graph with chi >= 7 has a K7^- minor ⇒ U9: every HC7 counterexample has a K7^- minor.

The proof is a minimal counterexample on |V|+|E|, with every hypothesis checked:
- every proper minor is 6-colourable (a lemma shows proper minors are strictly smaller);
- 7-connected ⇒ 5-connected under F1's own definition (F1.txt:225–226);
- n >= 8 independently of any convention (chi >= 7 forces n >= 7, and n = 7 forces K7 ⊇ K7^-);
- e >= 4n−2 exactly.

U9 ⇒ U8. Strictness is not claimed.

**Classification:** PROVED ANALYTIC, CONDITIONAL on:
- C65, which is a CONJECTURE;
- F1 Thm 1.6 at Level A statement: unrefereed; AI-assisted proofs disclosed (F1 §1.1); proof unread; internally uses Level-B Mader 7-connectivity.

B65 does not use [Dvo26].

## 2. Falsification test (RL65_FALSIFICATION_TEST.md)

| Family | 5-conn | e vs 4n−2 | K7^- minor | Verdict |
|---|---|---|---|---|
| K6 | yes | 15 < 22 | no | not a falsifier (edges) |
| apex + 5-conn triangulation | yes (6-conn) | 4n−10 | no (no K6) | not a falsifier (edges) |
| F2 G_n | no (n >= 7), 4-conn | >= 4n−2 iff n >= 20 | no | not a falsifier (connectivity); shows 5-connectivity is necessary |
| K2,2,2,2 | yes (6-conn) | 24 < 30 | no (best K7^=) | not a falsifier (edges) |
| 2 apices + 5-conn triangulation | yes (7-conn) | 5n−15 > 4n−2 | **yes** (K5^- in T + 2 apices) | consistent with C65; K7-free, which is the K7 density failure |

**Classification:** PROVED ANALYTIC (elementary). **No falsifier.** C65 stays CONJECTURE / NOT ESTABLISHED.

## 3. Locus (RL65_LOCUS_ASSESSMENT.md)

**First locus.** F1 **Thm 2.9 as consumed in Lemma 5.7** (F1.txt:412–413, 1220–1226). Lemma 5.9, Lemma 6.4/6.6 and Cor 6.7 are all downstream of Lemma 5.7. Cor 5.3's use of Thm 2.9 is not a K7^= deficiency.

**Quoted K7^= statements.**
- Thm 2.9: "Let G be a 4-light 5-rooted graph. If G is quite heavy, then G contains a vampire or K2,↓5 as a rooted minor."
- Lemma 5.7 step: "K ∪ W is isomorphic to K7= or one of its supergraphs".

**K7^- analogue (T2.9⁻).** Same hypotheses. Outcome: a rooted 7-vertex graph obtained from K7 by deleting the root edges and at most one further edge, i.e. K2 ∨ K̄5, K2,↓5 or a one-fanged vampire. This is exactly the requirement, because K5 ∪ W ⊇ K7^- iff W misses at most one of its 11 non-root edges.

## 4. Assessment
**T2.9⁻ is REFUTED by an explicit counterpattern.** The counterpattern is the two-fanged vampire G0: p ~ all roots but x2, q ~ all roots but x1, pq an edge, independent roots.
- ρ4 = 1, and no non-root is adjacent to all roots, so G0 is quite heavy.
- It has no (≤4)-fragment, so it is 4-light.
- It has 9 non-root edges, while every target needs >= 10, and all bags must be singletons.

**Classification:** PROVED ANALYTIC (elementary; F1 definitions only).

**What this is.** A lemma-level METHOD BARRIER, not a refutation of C65. The deficiency at the first locus is intrinsic to the quite-heavy threshold, for a standalone lemma assuming only 4-light and quite heavy. Lemmas with extra minimality-derived hypotheses are not excluded.

**Also proved: Lemma D.** K6↓5 rooted on one side, plus a 4-light side with ρ4 > 0 on the other, gives K7^-.

**Repair requirement (CANDIDATE / NOT ASSESSED).** H65: every 4-light 5-rooted R with ρ4(R) >= m(R)+7 contains K6↓5 as a rooted minor. H65 + Lemma D would close the r = 1 both-quite-heavy sub-case of Lemma 5.7's analogue, the sub-case where G0 lives. This is conditional on the NOT PROMOTED reading that the K7^- analogue of F1 Lemma 5.4 makes both sides 4-light. The extra resource is the C65 density surplus: sides sum to >= m+8, against m+3 in F1.

**First missing dependency.** H65. No inspected statement gives a 6-vertex rooted target: neither F1's restatements of [Dvo26] Thm 4 / Cor 13 / Cor 16, nor the [Dvo26] v1 abstract.

## 5. Frontier (FL-064/065 positions)
- **U1–U8:** certified, unchanged. **U8:** Level A, unchanged.
- **U9:** CONDITIONAL on C65 via B65. NOT certified.
- **S1 (7-connectivity):** Level B. Not needed; it appears only inside F1 Thm 1.6's conclusion.
- **S2 (delta in {7,8,9}):** Level C. Not used.
- **S4/U8:** certified start point. Nothing is re-derived below it.
- **K7^- target (C65):** CONJECTURE. B65 proved conditional. No falsifier. The F1-interface route is blocked at its first locus; repair requirement H65.
- **K7 density-failure examples:** re-checked. The 2-apex family satisfies C65's hypotheses, contains K7^- and is K7-free. No K7 density attempt was made.

## 6. Corrections / demotions
NONE.

## 7. Source-status changes
NONE. Register notes:
- F1 v1 re-pinned (unchanged).
- RL64-SRC-09 [Dvo26]: v1 only, 12 Sep 2026, sole author Dvořák, 85 pp, CC BY 4.0, no journal-ref/DOI, abstract pinned. Content stays Level B.

## 8. RL66 recommendation (exactly one)
**Selected: RL66 HC7-K7MINUS-HEAVY-SIDE-ROOTED-K6-GATE.** Assess H65 as one bounded new-mathematics candidate: prove, give an explicit counterpattern, or name the exact first missing dependency.
- It addresses the exact sub-case of the RL65 counterpattern.
- It spends the C65-specific density surplus.
- Given a Lemma 5.7 analogue, it may also serve the Lemma 5.9 analogue. That needs a linkage variant of Lemma D and a 5-path analogue; it is reading level, NOT PROMOTED.

**Runner-up: T2.9⁻ at the raised threshold ρ4 >= 2** (lighter-side repair). It loses because:
- it leaves the r = 1 sub-case containing G0 untouched, so some heavy-side or two-sided statement is needed there anyway. H65 is the formulated one. Symmetrically, H65 leaves r >= 2 untouched, but r = 1 is the sub-case the RL65 counterpattern forces;
- Lemma 5.9's side R_S is only known to be quite heavy;
- it would mean re-running F1 §4 (AI-originated Lemmas 4.5/4.9), above Level A.

**Not selected:**
- Lemma 6.4/6.6, which is downstream of the unrepaired Lemma 5.7;
- the S1/Mader gate, which has no consumer.

**Standing.** The RL70 periodic audit is still owed (after RL69).
