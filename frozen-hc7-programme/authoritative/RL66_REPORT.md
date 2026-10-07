# RL66 report — HC7 K7^- heavy-side rooted K6 gate (C66)

Status: RL66 record. CLOSED/FROZEN on promotion at RL66 closeout.

Session: RL66 HC7-K7MINUS-HEAVY-SIDE-ROOTED-K6-GATE. Root: HC7 only.
BASE_HEAD: a9f89debfb523bf32f1aed703b9ceee8484ec72f. Unchanged at kickoff, checkpoint and CLOSEOUT_LOCK.

**Start gate.**
- Live main equalled the user's expected predecessor; sessions/RL66 was absent; RL66 was the unique incoming session.
- No unresolved integrity failure; the ledger FL-001..FL-066 was complete.
- No precondition for mathematics.

**Bounds used.**
- Retrievals: 0/2. No F1 or [Dvo26] statement became load-bearing.
- Mathematical computation: 0. Census: 0. Candidates: 1.

**Reliance caveats (F1).** F1 = arXiv:2609.17760v1 is used only through statements and definitions already quoted in authority, all at Level A, with nothing promoted:
- definitions;
- Thm 1.6 (B65⁷, S66 Meaning);
- F1.txt:225–226 (S66 step 3);
- F1.txt:392–393 (payoff caveat 5);
- Thm 2.9 (attempt note §3 and orientation note §4). It is an unrefereed preprint, and its §1.1 (F1.txt:154–182) discloses AI-obtained proofs; that includes F1 Lemmas 4.5 and 4.9 inside the proof of Thm 2.9. F1's proofs are unread.

## 1. Payoff chain (RL66_PAYOFF_CHAIN.md)

- **Step 0 identity** (PROVED ANALYTIC, elementary; re-proved, F1 not consumed). For a separation with |A∩B| = 5, ρ4(R_AB) + ρ4(R_BA) = |E(G)| − 4|V(G)| + 10 + m. So at 4n − 2 edges the sides sum to >= m + 8.
- **P66a** (PROVED ANALYTIC, CONDITIONAL on C66). No K7^- -minor-free graph has a 5-separation with both sides 4-light, one side at ρ4 >= m+7 and the other at ρ4 >= 1.
- **P66b** (PROVED ANALYTIC, CONDITIONAL on C66 and H54⁻). In a minimal (2.8⁻)-counterexample the r = 1 both-quite-heavy sub-case of the K7^- analogue of F1 Lemma 5.7 does not occur.
- **Caveats:**
  - H54⁻ (the K7^- analogue of F1 Lemma 5.4) is NOT PROMOTED;
  - (2.8⁻) is not claimed;
  - r >= 2, the downstream loci and C65 stay open;
  - U9 stays conditional.

## 2. Falsification test (RL66_FALSIFICATION_TEST.md)

| Family | 4-light | ρ4 vs m+7 | K6↓5 | Verdict |
|---|---|---|---|---|
| (i) apex z over planar P | witness: z + icosahedron, X = N(v) | ρ4 <= m | never | not a falsifier (below threshold); threshold-necessity witness only |
| (ii) two apices over planar P | iff P is 2-sparse | ρ4 = m + e(P) − 2\|P\| + 2 + [ab] | iff (a) or (b) | none found. All tested members have K6↓5, including four or five roots on one face. Poor regime NOT ASSESSED |
| (iii) blob attached by a matching; sparse variants | inherited by the core | core surplus larger by 15 − o >= 5 | lifts from the core | none found: one-directional reduction (R falsifier ⇒ core falsifier; cores are not excluded). Sparse variants: one-edge attachments and concentrated contacts excluded; unique-neighbour \|T\| = 4 not excluded |
| (iv) G0 copies; K2,2,2,2 | vacuous | G0: ρ4 = t; K2,2,2,2: 3t or 4t | yes | not falsifiers |

**Classification.** PROVED ANALYTIC (elementary), using standard facts P1, P4, P6, P7 and the RL66 lemmas. **No falsifier found in the tested members.** Family (ii) is not exhausted (poor regime NOT ASSESSED).

**Lesson from (ii).** Root placements that block a rooted K4 do not protect an apex-assisted rooted structure; case (b) needs only a K4 on three roots with a free fourth bag.

## 3. Assessment of C66 (RL66_C66_ASSESSMENT.md)

**Proved lemmas** (all PROVED ANALYTIC, elementary):
- **F′.** τ(M)+1 pairwise disjoint full sets force K6↓5, where M is the missing-root-pair graph. So 5 always suffice, and so do m+1 full components.
- **Contraction formula.** Contracting a root edge xv changes ρ4 − m by 3 − |N(x)∩N(v)|.
- **Lemma P.** If root x has a unique non-root neighbour v, then R/xv is 4-light and K6↓5 lifts.
- **Lemma S.** If s non-roots carry the root contacts, then ρ4 <= C(s,2) + s.
- **Lemma K4r.** In a 3-connected graph, any three vertices lie in distinct bags of a K4 model.
- **E66.** K6↓5 in R ⟺ a K7^- model of R + z' with {z'} a bag. Also ρ4 >= m+7 ⟺ |E(R+z')| >= 4|V(R+z')| − 2.
- **S66.** C66 ⇒ C65 for 5-connected graphs with a vertex of degree 5.
- **B65⁷ precision.** B65 applies C65 only to 7-connected graphs, so U9 needs only C65⁷.

**Outcome. C66: CANDIDATE / NOT ESTABLISHED. OPEN, not falsified.**

**First missing dependency.** A rooted extremal theorem forcing K6↓5 in the reduced core:
- (C1) 1 <= #disjoint full sets <= τ(M) <= 4;
- (C2) a unique non-root neighbour occurs only as a full vertex whose root is adjacent to all other roots;
- (C3) no concentration of root contacts on <= 4 non-roots.

By E66 and S66 this has at least the strength of C65's degree-5 case. That case is not established (no statement in authority supplies it) and is not used by U9 via B65. By the reduction to the core, the dependency is equivalent to C66; no strictly weaker sub-lemma has been isolated.

**Attempted routes and where they stop:**
- iterating F′: there is no packing supply;
- contracting non-root edges: reducible fragments, untreated for K6↓5;
- F1 Thm 2.9 (Level A, attempt only): reaches τ(M) <= 1 for K2,↓5 outcomes. Using only the adjacencies guaranteed by the outcome and R[X], it fails at the G0 pattern.

## 4. Orientation notes (NOT ASSESSED)

- **H67.** In the r = 1 configuration, G' = S1 + z' is a proper minor of G (contract a full component of S2), and |E(G')| >= 4|V(G')| − 2. If G' is 4-bilight, minimality closes r = 1 without C66. F1's 4-bilight definition is not quoted in authority.
- **Extension.** Through F1 Thm 2.9 outcomes W, the same mechanism would reach r <= ρ(W) − 8, i.e. at most 3. It also needs H54⁻ and that S1 ∪ W be a proper minor of G, and adds nothing beyond H67 at r = 1. Its r = 2, 3 content is a pointer only.

## 5. Frontier (FL-064/065/066/067 positions)

| Item | Position after RL66 |
|---|---|
| U1–U8 | certified; unchanged |
| U9 | CONDITIONAL via B65, needing only C65⁷ and F1 Thm 1.6 (Level A); not certified |
| S1 (7-connectivity) | Level B; not used (7-connectivity appears only inside F1 Thm 1.6's conclusion in B65⁷) |
| S2 (delta in {7,8,9}) | Level C; not used |
| S4 / U8 | certified start point; nothing re-derived below it |
| K7^- target (C65) | CONJECTURE. C66 is open and at least as strong as C65's degree-5 case. H67 is the cheaper r = 1 route |
| K7 density-failure examples | not used for K7. Family (ii) reuses the 2-apex shape only as a rooted 4-light test family. No density attempt for K7 |

Open interval for HC7 (unchanged):
- K7 minus any two edges: certified;
- K7^-: open; a conditional bridge is proved, and only C65⁷ is needed;
- K7: open; density is documented to fail.

## 6. Corrections / demotions, and source status

- **Mathematical correction/demotion: NONE.**
- Inherited theorem-classification changes: NONE.
- **Promoted source-status changes: NONE** (no retrieval).
- The RL65 orientation note on a uniform-threshold H65 stays NOT PROMOTED: the RL66 witness has m = 5 and does not test it.

## 7. Route-portfolio effect

| Route | Change |
|---|---|
| R21-K7^- | Stays ACTIVE. C66 is open at C65-degree-5 strength (FL-067). Next is H67 (the r = 1 minimality transfer) |
| R21-K7 | Unchanged: SUSPENDED |
| R04 (S1) | Unchanged; still no consumer |
| others | Unchanged |

## 8. RL67 recommendation (exactly one)

**Selected: RL67 HC7-K7MINUS-R1-MINIMALITY-TRANSFER-GATE.**
- **Candidate H67 (standalone form).** S1 and S2 are 4-light on a common X with disjoint non-roots. ρ4(S1) >= m+7. S2 is quite heavy with ρ4(S2) = 1. S1 ∪ S2 is 4-bilight and K7^- -minor-free. Then S1 + z' is 4-bilight.
- **Payoff.** If H67 holds and G' precedes G in F1's minimality order (to be checked at R1), minimality would close the r = 1 sub-case without C66, conditional on the NOT PROMOTED H54⁻.
- **Bounds.** At most 1 retrieval (the sha-pinned F1 v1 PDF, for the 4-bilight definition and minimality convention); computation 0; one candidate.
- **Why.** It is cheap and decisive, it removes any need for C66 at r = 1, and its outcome prices the chain for the RL70 audit.

**Runner-up: continue C66 on its reduced core.** It loses on two counts:
- S66 makes any standalone proof of C66 settle C65's degree-5 case without the minimality available at its use-site. That case is not established and is not used by U9 via B65 (B65⁷).
- E66 shows the payoff never needs C66's singleton-bag conclusion.

**Not selected:**
- T2.9⁻ at ρ4 >= 2: above Level A; it re-runs F1 §4, whose Lemmas 4.5/4.9 came from AI;
- promotion of H54⁻: needs F1 §5 proof content above Level A;
- Lemma 6.4/6.6: downstream;
- the S1/Mader gate: no consumer.

**Chain-cost weighing** (RL65 drift caution). The F1-interface route to C65 still needs:
- H54⁻;
- r = 1 (C66 or H67);
- r >= 2 (a lighter-side lemma above Level A, or the unassessed extension, which stops at r <= 3);
- the analogues of Lemma 5.9, Lemmas 6.1/6.2, Lemmas 6.4/6.6 and Cor 6.7.

Even complete, it yields K7^-, one edge short of HC7. **Drift rule:** if H67 is assessed and fails or stays open, neither the RL68 nor the RL69 recommendation may extend the chain before the RL70 audit prices it.

**Standing.** The RL70 periodic audit is still owed (after RL69). The ledger FL-001..FL-066 is carried forward untouched, with FL-067 appended (§9).

## 9. FL-067

FL-067 is appended to authoritative/FAILURE_AND_LESSON_LEDGER.md and recorded in RL66_FAILURE_AND_LESSON_LEDGER_APPENDIX.md.

Programme ACTIVE.
