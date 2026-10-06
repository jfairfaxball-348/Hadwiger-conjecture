# HC7 proof state and open obligations

Status: CURRENT after RL64.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.

## RL64 classification summary

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
| K7^- minor in every chi>=7 graph (U9 candidate) | OPEN | It suffices to prove F1 Conjecture 1.5: every 5-connected graph with n>=6 and e>=4n−2 has a K7^- minor. The bridge is F1 Thm 1.6 (Level A statement): a K7^- -minor-free graph with chi>=7 whose proper minors are 6-colourable is 7-connected with e>=4n−2. |
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

## Route state (RL63 portfolio with RL64 updates)

Full RL63 table: RL63_ROUTE_PORTFOLIO_AND_KILL_LIST.md. The RL64 updates below override it where they differ.

| Disposition | Routes |
|---|---|
| KEEP | R01 (universal baseline, now U1–U8) |
| RESOLVED | R02 two-edge-deficient frontier (admitted RL64 → U8) |
| ACTIVE (RL65) | R21-K7^-: the K7^- density candidate C65 = F1 Conjecture 1.5 |
| SOURCE-GATE | R04 7-connectivity (rank 1 source gate; attribution discrepancy); R03 Mader extremal / delta in {7,8,9} (de-prioritised: unused by the frontier); R05 Gallai order bound (low) |
| KILL/RETIRE at current scope | R06 degree-seven-existence target; R07–R09 early routes; R10–R13 m=1, m=2, m=3 terminal-core and fixed-triple Kempe chains; R16 K4,4 minimum-model (also superseded by U8); R17 spanning K4,4 colouring (FL-062) |
| SUPERSEDED | R18 non-colouring uses of K4,4 (superseded by U8 as near-K7 structure) |
| CONDITIONAL ONLY | R14 M3 dichotomy; R15 degree-7 programme (the literature already performs degree-7 analysis at K7^- / K7^vee strength) |
| SUSPEND | R19 elementary 7-connectivity proof; R21-K7 (K7 beyond K7^-: density documented false, no scoped mechanism) |
| COMPUTE-GATE | R20 certified counterexample search (no exhaustive domain; current tooling NONE) |

**Frontier rule (FL-064, extended by FL-065).** No route may start or reopen without stating its position relative to:
- S1, S2 and S4/U8;
- the K7^- target (C65);
- the K7 density-failure examples.

It must also show that it does not re-derive frontier facts at lower strength.

## Open obligations

- **O1 (RL65).** Assess C65 = F1 Conjecture 1.5:
  - prove the bridge B65 (C65 + F1 Thm 1.6 ⇒ U9);
  - test the named falsifier families;
  - formulate and assess the K7^- analogue at the first F1 deficiency locus (Thm 2.9 or Lemma 6.4/6.6).
- **O2.** A Level-A gate for Mader 7-connectivity (S1). It was the RL64 runner-up. It needs an inspectable original and a resolution of the 174/175 attribution discrepancy (FL-063).
- **O3.** A non-density mechanism for K7^- → K7. Unscoped; the authors' examples rule out density.
- **O4.** HC7 itself: open. Disproof capability: none. RL70 periodic audit: still owed.

FL-001 through FL-065 and every retry condition remain in force.

Programme ACTIVE.
