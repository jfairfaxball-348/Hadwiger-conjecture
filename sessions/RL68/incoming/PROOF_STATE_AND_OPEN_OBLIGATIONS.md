# HC7 proof state and open obligations

Status: CURRENT after RL67.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.

## RL67 classification summary

| Item | RL67 result |
|---|---|
| Correction | **C67-1** (scope remark in the RL67 brief's falsification condition; not a theorem demotion). Any H67 instance refutes (2.8⁻) and C66, and refutes C65 if 5-connected. P66a/P66b stay valid |
| Theorem demotions; inherited theorem-classification changes | NONE |
| Promoted source-status changes | NONE. Register note: F1 v1 re-pinned at RL67 R1 (sha256 = pin; extraction hash unchanged); its 4-bilight definition and minimality convention are now quoted (RL67_H67_ASSESSMENT.md §1) |
| New certified universal item | NONE |
| H67 | OPEN: CANDIDATE / NOT ESTABLISHED, not refuted. Minimality-assisted form Var OPEN (equivalent to closing r = 1 under H54⁻); H67^G NOT ASSESSED beyond G* |
| New proved items | P67 (conditional on H67 and H54⁻); Lemma R67; Proposition V67; counterpattern G* (H67 without K7^- -freeness is false; weak: S1* contains K8); the minimality-derived implication "G^x is not 4-bilight" (RL67 records) |
| Drift rule | Triggered: neither RL68 nor RL69 may extend the F1-interface lemma chain before the RL70 audit |

## RL66 classification summary (carried)

| Item | RL66 result |
|---|---|
| Correction/demotion | NONE |
| Inherited mathematical theorem-classification changes | NONE |
| Promoted source-status changes | NONE (no retrieval) |
| New certified universal item | NONE |
| C66 | OPEN: CANDIDATE / NOT ESTABLISHED, not falsified. Strength: C66 ⇒ C65 for 5-connected graphs with a degree-5 vertex (S66) |
| New proved items | P66a (conditional on C66) and P66b (conditional on C66 and H54⁻); Step 0 identity; Lemmas F′, P, S, K4r; E66; S66; the falsification record for families (i)–(iv); precision B65⁷ (RL66 records) |

## RL65 classification summary (carried)

| Item | RL65 result |
|---|---|
| Correction/demotion | NONE |
| Inherited mathematical theorem-classification changes | NONE |
| Promoted source-status changes | NONE. Register note: [Dvo26] arXiv 2609.13818 v1 metadata pinned (RL65_REPORT.md §7); RL64-SRC-09 content stays Level B. F1 v1 re-pinned, sha256 unchanged. |
| New certified universal item | NONE. U9 is recorded as CONDITIONAL (below). |
| New proved items | B65 (conditional bridge); the falsification record; G0 refuting T2.9⁻; Lemma D (RL65 records) |

## RL64 classification summary (carried)

| Item | RL64 result |
|---|---|
| Correction/demotion | NONE |
| Inherited mathematical theorem-classification changes | NONE |
| Promoted source-status changes | RL63-SRC-03 (F1) C→A; RL63-SRC-04 (F2) C→A; RL63-GAP-02 (Jakobsen) C→B; new Level-B rows RL64-SRC-01..10 (RL64_SOURCE_REGISTER.md) |
| New universal item | U8 (below), Level A source-consumed at statement level |
| Orientation notes superseded | EX-1..EX-4 (RL64_REPORT.md §6): Level-C RL63 expectations, not recorded claims |
| RL63 classification items (unchanged) | RL12-SRC-01 is a Level-B restatement. PK-1 and PK-3 packaging repairs stand. |

## Certified HC7-universal frontier

For every hypothetical minor-minimal HC7 counterexample G (U8 holds for every HC7 counterexample, minimal or not):

| ID | Statement | Justification |
|---|---|---|
| U1 | G is finite simple, chi(G)=7, has no K7 minor, and every proper minor is 6-colourable (full-C7 critical). | — |
| U2 | Every proper subgraph is 6-colourable; G is connected; delta>=6. | — |
| U3 | A2: every 6-colouring of G−v uses all six colours on N(v). | RL3 |
| U4 | alpha(G[N(v)])<=d(v)−5 for every v. | RL6-P03 star-fold context (equals Dirac 1960 at k=7; see RL64-SRC-02) |
| U5 | delta(G)>=7. | RL52 |
| U6 | Exhaustive split: some degree-seven vertex exists, or delta(G)>=8. | Degree-seven existence is retired as a target (RL63, route R06); the split itself remains valid. |
| U7 | G contains a K4,4 minor. | SRC-0025, checked_primary at title/abstract statement level; full proof not reconstructed. |
| **U8** | **G contains K7−{e,f} as a minor for every pair of distinct edges e,f of K7, i.e. both K7^= and K7^vee.** | **F1 (arXiv:2609.17760v1, Thm 1.1) and F2 (arXiv:2507.03244v1, Thm 4), Level A statement; two unrefereed preprints; proofs unread. F1 discloses AI-generated proofs. Any two distinct edges of K7 share one end or are disjoint (RL64_ADMISSION_RECORD.md).** |

Notes on U8:
- U8 does not imply U7 (K4,4 has 8 vertices) and does not give K7^- (K7 minus one edge).
- The last genuine universal narrowing is now RL64 (U8). Before it, RL54 (U7).

## Conditional universal items (NOT certified)

| ID | Statement | Status |
|---|---|---|
| U9 | Every HC7 counterexample (indeed every graph with chi >= 7) contains K7^- as a minor. | CONDITIONAL via B65 (RL65_B65_BRIDGE.md). It needs C65 = F1 Conjecture 1.5 (CONJECTURE / NOT ESTABLISHED) and F1 Thm 1.6 at Level A statement (unrefereed; AI-assisted proofs disclosed; proof unread; internally uses Level-B Mader 7-connectivity). **RL66 precision (B65⁷):** B65 applies C65 only to 7-connected graphs, so C65⁷ (every 7-connected graph with n >= 8 vertices and at least 4n − 2 edges has a K7^- minor; implied by C65) suffices. U9 ⇒ U8; strictness is not claimed. |

## Source-gated frontier items (NOT consumed)

| ID | Statement | Gate status |
|---|---|---|
| S1 | G is 7-connected | Level B: RL12-SRC-01, F1 Thm 7.1, and F2 Thm 16, where the frontier papers cite different Mader originals (Math. Ann. 175 (1968) vs 174 (1967)). Originals not inspected (FL-063). Load-bearing inside both frontier proofs; not needed by U8. HC7-CRITICAL-7-CONNECTIVITY remains CANDIDATE / NOT ESTABLISHED. |
| S2 | delta in {7,8,9}; 3n7+2n8+n9>=30; 7n/2<=e<=5n−15; n>=10 | Mader 1968b (Math. Ann. 178, DOI 10.1007/BF01350657). Located, not inspected; Level C. **Not used by either frontier proof.** |
| S3 | n>=13 | Gallai's theorem plus HC6. Not located; Level C. Not used by the frontier. |
| S4 | K7 minus any two edges | **Resolved in RL64: certified as U8.** |

## Documented frontier obstructions (RL64_FRONTIER_OBSTRUCTION_MAP.md)

| Target | Status | Documented obstruction |
|---|---|---|
| K7^- minor in every chi>=7 graph (U9) | OPEN (U9 CONDITIONAL) | It suffices to prove C65 = F1 Conjecture 1.5: every 5-connected graph with n>=6 and e>=4n−2 has a K7^- minor. The bridge B65 is proved (RL65), conditional on C65 and F1 Thm 1.6 at Level A. No falsifier was found among the named families (RL65). The F1 proof interface is blocked at its first deficiency locus: T2.9⁻ is refuted by G0 (FL-066). The heavy-side repair C66 is OPEN and at least as strong as C65's degree-5 case (RL66, FL-067). The r = 1 minimality transfer H67 is OPEN; its obstruction is the root-split two-dense-halves configuration (RL67, FL-068). Only C65⁷ is needed for U9; RL68 assesses it directly. |
| K7 (HC7) | OPEN | The density method is documented false. Two universal vertices over a 5-connected planar triangulation give 7-connected K7-minor-free graphs with 5n−15 edges. A non-density mechanism is needed. |

## Retained scoped results

These results keep their exact classifications:
- **K4,4 model results.**
  - RL55-P01: proved analytic at minimum-total-size K4,4-model scope.
  - RL56-P01: conditional double-apex payoff only.
  - RL56-C01, RL57-C01, RL58-C01, RL59-C01: NOT ESTABLISHED / NOT PROMOTED.
  - The RL57 three-vertex-path pattern is a method barrier only.
- **Degree-seven local results.** All degree-seven / Dcyc7 / resource / Kempe / M3 results (RL6–RL51) remain conditional at their recorded scopes.
  - RL51-P01 is a scoped conditional payoff.
  - M3-CLIQUE-SEPARATOR-DICHOTOMY is ADMITTED / UNPROVED.
  - M3-CORE is NOT CERTIFIED; RL31-P01 makes it equivalent to emptiness of the retained configuration.
- **Pre-pivot general-C_t results with no root payoff:** A1/A3/A7, RL4-P03 (conditional on the HC6 source), RL6 C2/C3, RL12-P01 and RL14-P01.
- **RL65 results** (RL65 records):
  - B65: PROVED ANALYTIC, CONDITIONAL on C65 and on F1 Thm 1.6 (Level A).
  - The falsification record for the five named families: PROVED ANALYTIC (elementary). No falsifier.
  - T2.9⁻ (the K7^- analogue of F1 Thm 2.9 at the quite-heavy threshold): FALSE, by the explicit counterpattern G0. This is PROVED ANALYTIC and is a METHOD BARRIER at lemma level.
  - Lemma D: PROVED ANALYTIC.
  - NOT PROMOTED reading-level observations: the K7^- analogue of F1 Lemma 5.4; the expected failure of a uniform-threshold H65.
- **RL66 results** (RL66 records):
  - Step 0 counting identity: PROVED ANALYTIC.
  - P66a (C66 ⇒ no K7^- -minor-free graph has a 5-separation with both sides 4-light, one side at ρ4 >= m+7 and the other at ρ4 >= 1): PROVED ANALYTIC, CONDITIONAL on C66.
  - P66b (C66 + H54⁻ ⇒ the r = 1 both-quite-heavy sub-case cannot occur in a minimal (2.8⁻)-counterexample): PROVED ANALYTIC, CONDITIONAL on C66 and on the NOT PROMOTED H54⁻.
  - Lemma F′ (τ(M)+1 disjoint full sets ⇒ K6↓5): PROVED ANALYTIC.
  - Contraction formula and Lemma P (unique non-root neighbour): PROVED ANALYTIC.
  - Lemma S (concentrated root contacts ⇒ ρ4 <= C(s,2)+s): PROVED ANALYTIC.
  - Lemma K4r (three-rooted K4 in 3-connected graphs): PROVED ANALYTIC (textbook Menger/fan facts).
  - E66 (K6↓5 ⟺ singleton-bag K7^- model in R + z'; C66 threshold = C65 density): PROVED ANALYTIC.
  - S66 (C66 ⇒ C65 for 5-connected graphs with a degree-5 vertex): PROVED ANALYTIC.
  - Precision B65⁷: PROVED ANALYTIC, CONDITIONAL exactly as B65.
  - Falsification record, families (i)–(iv): PROVED ANALYTIC (elementary). No falsifier found in the tested members. The all-components-poor regime of family (ii) is NOT ASSESSED. Family (iii) reduces one-directionally to cores of larger surplus.
  - C66: CANDIDATE / NOT ESTABLISHED (open, not falsified). First missing dependency: a rooted extremal theorem forcing K6↓5 in the reduced core (RL66_C66_ASSESSMENT.md §3).
  - NOT ASSESSED orientation notes:
    - H67, assessed in RL67 (open);
    - the Thm 2.9-outcome extension of the minimality mechanism (r <= ρ(W) − 8). It also needs H54⁻ and a proper minor, adds nothing beyond H67 at r = 1, and its r = 2, 3 content is a pointer only.
- **RL67 results** (RL67 records):
  - F1 4-bilight definition and minimality convention quoted (R1; Level A text). F1 is an unrefereed preprint whose §1.1 (F1.txt:154–182) discloses AI-obtained proofs.
  - P67 (H67 + H54⁻ ⇒ the r = 1 configuration cannot occur in a minimal (2.8⁻)-counterexample): PROVED ANALYTIC implication, CONDITIONAL on H67 (open) and H54⁻ (NOT PROMOTED), with the F1 definitions at Level A.
    - G' = S1 + z' precedes G in F1's lexicographic (|V|, |E|) order, transported as a scope convention.
  - Lemma R67 (structure of a dense (≤4)-bifragment of S1 + z'): PROVED ANALYTIC.
  - Proposition V67 (an H67 instance makes G a (2.8⁻)-counterexample and S1 a C66 counterexample): PROVED ANALYTIC.
  - Counterpattern G* (H67 without K7^- -freeness is false): PROVED ANALYTIC.
    - Scope: it constrains exclusion arguments only.
    - It is weak: S1* contains K8, so ω <= 7 excludes it, and it is not edge-minimal.
  - Minimality-derived implication: PROVED ANALYTIC. In a minimal (2.8⁻)-counterexample with an r = 1 5-separation whose lighter side has a full component (guaranteed under H54⁻), G^x is not 4-bilight for every root x with deg_X(x) <= 3.
  - H67 (with the same root edges on both sides; exact statement in RL67_H67_ASSESSMENT.md §3): CANDIDATE / NOT ESTABLISHED (open).
    - First missing dependency: a K7^- -forcing or reduction lemma for the root-split two-dense-halves configuration.
    - That lemma is equivalent to the minimality-assisted form Var, hence to closing r = 1 under H54⁻. No reduction is claimed.
  - Correction C67-1 (scope remark).

## Route state (RL63 portfolio with RL64 updates)

Full RL63 table: RL63_ROUTE_PORTFOLIO_AND_KILL_LIST.md. The RL64 updates below override it where they differ.

| Disposition | Routes |
|---|---|
| KEEP | R01 (universal baseline, now U1–U8) |
| RESOLVED | R02 two-edge-deficient frontier (admitted RL64 → U8) |
| ACTIVE (RL68) | R21-K7^-, pursued directly through C65⁷ = C68 (RL68), the 7-connected density statement that U9 needs. The F1-interface lemma chain is HELD under the drift rule until the RL70 audit prices it: T2.9⁻ blocked (FL-066), C66 open (FL-067), H67 open (FL-068). |
| SOURCE-GATE | R04 7-connectivity (rank 1 source gate; attribution discrepancy); R03 Mader extremal / delta in {7,8,9} (de-prioritised: unused by the frontier); R05 Gallai order bound (low) |
| KILL/RETIRE at current scope | R06 degree-seven-existence target; R07–R09 early routes; R10–R13 m=1, m=2, m=3 terminal-core and fixed-triple Kempe chains; R16 K4,4 minimum-model (also superseded by U8); R17 spanning K4,4 colouring (FL-062) |
| SUPERSEDED | R18 non-colouring uses of K4,4 (superseded by U8 as near-K7 structure) |
| CONDITIONAL ONLY | R14 M3 dichotomy; R15 degree-7 programme (the literature already performs degree-7 analysis at K7^- / K7^vee strength) |
| SUSPEND | R19 elementary 7-connectivity proof; R21-K7 (K7 beyond K7^-: density documented false, no scoped mechanism) |
| COMPUTE-GATE | R20 certified counterexample search (no exhaustive domain; current tooling NONE) |

**Frontier rule (FL-064, extended by FL-065..FL-068).** No route may start or reopen without stating its position relative to:
- S1, S2 and S4/U8;
- the K7^- target (C65);
- the K7 density-failure examples.

It must also show that it does not re-derive frontier facts at lower strength.

## Open obligations

- **O1 (RL68).** Assess C68 = C65⁷: every 7-connected graph with n >= 8 and at least 4n − 2 edges contains K7^- as a minor. By B65⁷ (RL66), C68 + F1 Thm 1.6 (Level A) ⇒ U9. The task lies outside the F1-interface chain. Mader's extremal functions (Level C) may not be consumed.
- **O1d (unscheduled; drift rule; FL-068 retry condition).** H67 and its minimality-assisted form Var (equivalent to closing r = 1 under H54⁻). The first missing dependency is a K7^- -forcing or reduction lemma for the root-split two-dense-halves configuration. Held until the RL70 audit.
- **O1a (unscheduled; FL-067 retry condition).** C66 itself. It is open, and at least as strong as C65 for 5-connected graphs with a degree-5 vertex (S66).
- **O1a′ (unscheduled; low priority).** The all-components-poor regime of falsification family (ii) (RL66_FALSIFICATION_TEST.md).
- **O1b (unscheduled).** The r >= 2 sub-cases of that Lemma 5.7 analogue. Each needs one of:
  - T2.9⁻ at threshold ρ4 >= r on the lighter side;
  - C66 at threshold m+8−r on the heavier side;
  - for r = 2, 3 only, the NOT ASSESSED minimality extension through F1 Thm 2.9 outcomes (RL66_C66_ASSESSMENT.md §4). It is a pointer only and needs an authorizing brief.
- **O1c (unscheduled; downstream).** The K7^- analogues of:
  - F1 Lemma 5.9 (reading level, NOT PROMOTED: it would need C66, a linkage variant of Lemma D, and a 5-path analogue, given a Lemma 5.7 analogue);
  - Lemmas 6.1/6.2;
  - Lemma 6.4/6.6 (rooted K5 in place of K5^-);
  - Cor 6.7.

  These are not assessed.
- **O2.** A Level-A gate for Mader 7-connectivity (S1). It needs an inspectable original and a resolution of the 174/175 attribution discrepancy (FL-063). It still has no consumer.
- **O3.** A non-density mechanism for K7^- → K7. Unscoped. The 2-apex examples rule out density (re-proved in RL65).
- **O4.** HC7 itself: open. Disproof capability: none. The RL70 periodic audit is still owed (after RL69); it must price the F1-interface chain (FL-068).

FL-001 through FL-068 and every retry condition remain in force. The drift rule (FL-068) binds RL68 and RL69.

Programme ACTIVE.
