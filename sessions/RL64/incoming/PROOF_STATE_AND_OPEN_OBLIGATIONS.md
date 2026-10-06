# HC7 proof state and open obligations

Status: CURRENT after RL63.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.
Counterexample target: a rigorously verified finite simple graph with chi(G)=7 and h(G)<=6.

## RL63 classification summary

| Item | RL63 result |
|---|---|
| Correction/demotion | NONE |
| Inherited mathematical theorem-classification changes | NONE |
| Promoted source-status changes | NONE |
| Source-classification clarification | RL12-SRC-01 (arXiv:2509.07144, Thm 1.1) is a Level-B restatement of Mader's theorem (see RL63_SOURCE_GAP_REGISTER.md). No result changes. |
| Packaging repairs | PK-1: FL-001..FL-042 restored to the consolidated ledger. PK-3: FL-055 divergence note appended. |

## Certified HC7-universal frontier (unchanged by RL63)

For every hypothetical minor-minimal HC7 counterexample G:

| ID | Statement | Justification |
|---|---|---|
| U1 | G is finite simple, chi(G)=7, has no K7 minor, and every proper minor is 6-colourable (full-C7 critical). | — |
| U2 | Every proper subgraph is 6-colourable; G is connected; delta>=6. | — |
| U3 | A2: every 6-colouring of G−v uses all six colours on N(v). | RL3 |
| U4 | alpha(G[N(v)])<=d(v)−5 for every v. | RL6-P03 star-fold context |
| U5 | delta(G)>=7. | RL52 |
| U6 | Exhaustive split: some degree-seven vertex exists, or delta(G)>=8. | Degree-seven existence is retired as a target (RL63, route R06); the split itself remains valid. |
| U7 | G contains a K4,4 minor. | SRC-0025, checked_primary at title/abstract statement level; the full proof was not reconstructed. |

The last genuine universal narrowing was RL54.

## Source-gated frontier items (NOT consumed)

| ID | Statement | Gate status |
|---|---|---|
| S1 | G is 7-connected | Level B via RL12-SRC-01 only. Mader 1968a original not inspected (FL-063). HC7-CRITICAL-7-CONNECTIVITY remains CANDIDATE / NOT ESTABLISHED. |
| S2 | delta in {7,8,9}; 3n7+2n8+n9>=30; 7n/2<=e<=5n−15; n>=10 | Mader 1968b (Math. Ann. 178, DOI 10.1007/BF01350657) K7 extremal function. Located, not inspected. |
| S3 | n>=13 | Gallai's theorem plus HC6. Not located. |
| S4 | G contains K7^= and K7^vee minors, i.e. K7 minus any two edges | F1 arXiv:2609.17760 (Dvořák–Norin–Rahman) and F2 arXiv:2507.03244. Located at orientation level only. This is the RL64 admission target. |

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

## Route state (RL63 portfolio)

Full table: RL63_ROUTE_PORTFOLIO_AND_KILL_LIST.md.

| Disposition | Routes |
|---|---|
| KEEP | R01 (universal baseline) |
| SOURCE-GATE | R02 two-edge-deficient frontier (rank 1, RL64); R03 Mader extremal / delta in {7,8,9} (rank 2); R04 7-connectivity (rank 3); R05 Gallai order bound |
| KILL/RETIRE at current scope | R06 degree-seven-existence target; R07–R09 early routes; R10–R13 m=1, m=2, m=3 terminal-core and fixed-triple Kempe chains; R16 K4,4 minimum-model; R17 spanning K4,4 colouring (FL-062) |
| CONDITIONAL ONLY | R14 M3 dichotomy; R15 degree-7 programme |
| SUSPEND | R18 K4,4 non-colouring uses; R19 elementary 7-connectivity proof; R21 K7^- / K7 beyond the frontier |
| COMPUTE-GATE | R20 certified counterexample search (no exhaustive domain; current tooling NONE) |

**Frontier rule (FL-064).** No route may start or reopen without stating its position relative to S1, S2 and S4 and their gate status.

## Open obligations

- **O1 (RL64).** Admit or reject F1/F2 from inspected arXiv text. Extract the classical inputs they consume (Level B) and the documented obstruction to K7^- / K7.
- **O2.** Run the Level-A gate for whichever classical input the frontier proofs show to be load-bearing. Candidates: S2 or S1.
- **O3.** New mathematics at the documented frontier obstruction. Cannot be scoped before O1.
- **O4.** HC7 itself: open. Disproof capability: none. RL70 periodic audit: still owed.

FL-001 through FL-064 and every retry condition remain in force.

Programme ACTIVE.
