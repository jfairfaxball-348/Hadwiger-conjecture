# RL66 checkpoint summary

Status: RL66 record. CLOSED/FROZEN on promotion at RL66 closeout. This is the kickoff checkpoint as presented to the user, with the closeout red-team scoping edits applied (RL66_RED_TEAM_RECORD.md). The promoted records supersede it wherever they differ.

Session: RL66 HC7-K7MINUS-HEAVY-SIDE-ROOTED-K6-GATE. Root: HC7 only.
BASE_HEAD a9f89debfb523bf32f1aed703b9ceee8484ec72f. Unchanged at plan start, at Phase 0 and at checkpoint.

**Bounds used.**
- Retrievals: 0/2. No F1 or [Dvo26] statement became load-bearing.
- Mathematical computation: 0. Census: 0. Candidates: 1 (C66).

**F1 caveat.** F1 is used only through statements and definitions already quoted in authority, all at Level A, with nothing promoted: definitions; Thm 1.6 (B65⁷, S66 Meaning); F1.txt:225–226 (S66 step 3); F1.txt:392–393 (payoff caveat 5); Thm 2.9 (attempt note and orientation note). It is an unrefereed preprint, its AI-assisted proofs are disclosed in §1.1, and its proofs are unread.

**Records:**
- RL66_PAYOFF_CHAIN.md
- RL66_FALSIFICATION_TEST.md
- RL66_C66_ASSESSMENT.md
- FAILURE_AND_LESSON_LEDGER_APPENDIX.md (FL-067)
- RL66_RETRIEVAL_LOG.md
- INCOMING_SNAPSHOT.md and authoritative_sha256.txt

## 1. Payoff chain (with caveats)

- **Identity.** ρ4(R_AB) + ρ4(R_BA) = |E(G)| − 4|V(G)| + 10 + m (re-proved). So in a minimal (2.8⁻)-counterexample the two sides sum to >= m+8.
- **Claims P66a and P66b** (PROVED; P66a CONDITIONAL on C66, P66b on C66 and H54⁻). Under C66, no K7^- -minor-free graph has a 5-separation with both sides 4-light, one at ρ4 >= m+7 and the other at ρ4 >= 1. With H54⁻ added, the r = 1 both-quite-heavy sub-case of the K7^- analogue of Lemma 5.7 is excluded.
- **Caveats:**
  - H54⁻ (the K7^- analogue of F1 Lemma 5.4) is NOT PROMOTED;
  - (2.8⁻) is not claimed;
  - C66 is open;
  - r >= 2, the downstream loci, (2.8⁻) and C65 all remain open;
  - U9 stays conditional.

## 2. Falsification test: no falsifier found in the tested members

| Family | Result |
|---|---|
| (i) apex + planar | ρ4 <= m, never K6↓5. z + icosahedron is a 4-light witness with ρ4 = m = 5. Threshold-necessity witness only |
| (ii) two apices + planar | exact criterion (a)/(b). K6↓5 in every tested member: 5-connected triangulations with any placement; four roots on a 4-face; all five on a 5-face; any member with a rich component. The poor regime is NOT ASSESSED |
| (iii) matching-attached blob | one-directional reduction to a core with surplus larger by 15 − o >= 5 (cores are not excluded). One-edge attachments on <= 4 vertices are below threshold. Concentrated contacts are below threshold or have K6↓5. The unique-neighbour case with \|T\| = 4 is not excluded |
| (iv) G0 copies; K2,2,2,2 | K6↓5 (Lemma F′; explicit models). Single K2,2,2,2 copies are below threshold and still have K6↓5 |

## 3. C66 outcome

**OPEN.** CANDIDATE / NOT ESTABLISHED, not falsified.

**First missing dependency (sharpened).** A rooted extremal theorem forcing K6↓5 in the reduced core, at surplus >= 7. The core is:
- (C1) 1 <= #disjoint full sets <= τ(M) <= 4;
- (C2) a unique non-root neighbour occurs only when it is a full vertex and its root is adjacent to all other roots;
- (C3) no concentration of root contacts on <= 4 non-roots.

**Strength:**
- by E66, a rooted K6↓5 in R is equivalent to a K7^- model of R + z' with {z'} a bag, and C66's threshold is exactly C65's edge bound for R + z';
- by S66, it implies C65 for 5-connected graphs with a degree-5 vertex. That case is not established and is not used by U9 via B65.

## 4. New proved items (PROVED ANALYTIC, elementary)

- Lemma F′;
- Lemma P and its contraction formula;
- Lemma S;
- Lemma K4r;
- E66;
- Prop S66;
- the (ii) criterion and the (iii) reduction;
- the falsification models;
- precision B65⁷: B65 needs C65 only on 7-connected graphs.

## 5. Orientation notes (NOT ASSESSED)

- **H67.** S1 + z' is a proper minor of G that meets (2.8⁻)'s edge bound when r = 1. If it is 4-bilight, minimality closes r = 1 without C66.
- **Extension.** Using F1 Thm 2.9 outcomes W, the same mechanism would reach r <= ρ(W) − 8 (at most 3).

## 6. Frontier (FL-064/065/066 rule)

| Item | Position after the RL66 checkpoint |
|---|---|
| U1–U8 | certified; unchanged (last narrowing RL64) |
| U9 | CONDITIONAL. Precision: conditional on C65⁷ (C65 on 7-connected graphs, implied by C65) and on F1 Thm 1.6 at Level A. Not certified |
| S1 (7-connectivity) | Level B. Not used: C66 is a rooted density statement. B65⁷ uses 7-connectivity only as the conclusion of F1 Thm 1.6 |
| S2 (delta in {7,8,9}) | Level C. Not used |
| S4 / U8 | certified start point. Nothing re-derived below it. C66 and the families target strictly above U8 |
| K7^- target (C65) | CONJECTURE. B65 is proved conditionally. The F1 interface is blocked at T2.9⁻ (FL-066). C66 is open and shown to be at least as strong as C65's degree-5 case (S66) |
| K7 density-failure examples | not used for K7. Family (ii) reuses the 2-apex shape only as a rooted 4-light test family for C66. No density attempt for K7 |

## 7. Corrections and source status

- Corrections/demotions: **NONE**.
- Inherited theorem-classification changes: **NONE**.
- Source-status changes: **NONE** (no retrieval).
- FL-067 is appended at closeout. FL-001..FL-066 are untouched.

## 8. RL67 recommendation (exactly one)

**Selected: RL67 HC7-K7MINUS-R1-MINIMALITY-TRANSFER-GATE.**
- **Candidate H67.** Let G be a minimal (2.8⁻)-counterexample, with H54⁻ carried explicitly. Take a 5-separation in the r = 1 configuration. Contract a full component of the lighter side S2 to z'. Then G' = S1 + z' satisfies the hypotheses of (2.8⁻), i.e. F1's 4-bilight condition (n >= 3 and e >= 4n − 2 are already proved).
- **Payoff.** If H67 holds and G' precedes G in F1's minimality order (to be checked at R1), then r = 1 would be closed without C66, conditional on H54⁻ and on F1's definitions at Level A. (The Thm 2.9-outcome extension to r = 2, 3 stays a NOT ASSESSED pointer and is not tested by RL67.)
- **Bounds:**
  - <= 1 retrieval: the F1 v1 PDF, sha256-pinned 6af798e5…c907, for the 4-bilight definition and the minimality convention; arxiv.org checked only before the logged call;
  - computation 0; census 0; one candidate.
- **Stopping rule.** H67 proved / an explicit violating configuration / open with first missing dependency.

**Runner-up: continue C66 on its reduced core (C1)–(C3).** It loses on two counts:
- S66 makes any standalone proof of C66 settle C65's degree-5 case without the minimality available at its use-site. That case is not established and is not used by U9 via B65 (B65⁷);
- E66 shows the r = 1 payoff never needs C66's singleton-bag conclusion.

So it would be a paper-scale campaign for content the root does not use.

**Not selected:**
- T2.9⁻ at ρ4 >= 2: re-runs F1 §4, above Level A, with AI-originated lemmas;
- promotion of H54⁻: needs F1 §5 proof content above Level A, and H67 first shows whether r = 1 needs anything beyond it;
- Lemma 6.4/6.6: downstream;
- the S1/Mader gate: no consumer.

**Chain-cost weighing** (RL65 drift caution). C66 was sharpened but not resolved. The F1-interface route to C65 still needs all of:
- H54⁻;
- r = 1 (C66 or H67);
- r >= 2 (a lighter-side lemma above Level A, or the unassessed extension that stops at r <= 3);
- the analogues 5.9⁻ (a linkage variant of Lemma D plus a 5-path analogue), 6.1⁻/6.2⁻, 6.4⁻/6.6⁻ and Cor 6.7⁻;
- then (2.8⁻) ⇒ C65 ⇒ U9 (only C65⁷ is needed).

Even complete, it yields K7^-, one edge short of HC7, where density is documented to fail. H67 is chosen because it is the one cheap, decisive link.

If H67 fails or stays open, RL68–RL69 should not extend the F1-interface chain before the RL70 audit prices it. **The RL70 periodic audit is still owed** and is not replaced.

## 9. Session recommendation

The gate reached its stopping rule 3: C66 is open with an exact, sharpened first missing dependency. Further C66 work would be a proof campaign at C65-degree-5 strength, outside RL66's bounded scope.

it makes sense to finish up here
