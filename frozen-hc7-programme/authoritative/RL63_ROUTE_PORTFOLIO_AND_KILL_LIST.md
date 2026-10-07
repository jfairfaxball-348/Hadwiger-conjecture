# RL63 route portfolio and kill list

Status: RL63 global-audit record. CLOSED/FROZEN on promotion at RL63 closeout.
Root: HC7 only.

**Disposition labels:** KEEP; KILL/RETIRE; SUSPEND; SOURCE-GATE; COMPUTE-GATE; CONDITIONAL ONLY.

**Scope of a kill.** Killing a route retires it as an HC7 strategy at current scope. It never demotes the valid scoped results the route produced: every result ID named below keeps its recorded classification exactly. A retired route may be reopened only under its recorded FL retry condition **and** the RL63 frontier rule (see below).

## Portfolio

| # | Route (sessions) | Disposition | Reason | Preserved results | Reopen condition |
|---|---|---|---|---|---|
| R01 | Universal minor-minimal baseline U1–U7 (RL3 A1/A2, RL6 star-fold, RL52, RL54) | **KEEP** | The only certified HC7-universal structure. | A1, A2, RL6-P03 star-fold, RL52-C01..C03, SRC-0025 consequence | — |
| R02 | Two-edge-deficient K7 frontier (K7^=, K7^vee minors; arXiv:2609.17760, arXiv:2507.03244) | **SOURCE-GATE (rank 1)** | Orientation (RL63 R6–R8) indicates the literature already forces K7 minus any two edges in every 7-chromatic graph. This supersedes K4,4 and defines the actual open gap: K7^- (one edge removed) and then K7. Open-access arXiv texts, but arxiv.org is blocked in this environment. | — | Inspectable arXiv text (environment allows arxiv.org, or the user supplies the exact versions) |
| R03 | Degree coverage via Mader K7 extremal function, giving delta in {7,8,9} | **SOURCE-GATE (rank 2)** | Converts the unbounded delta>=8 residual into a finite partition. Classical input to the frontier papers. Original (Math. Ann. 178, DOI 10.1007/BF01350657) is paywalled and no open copy was reached. | — | Inspectable original, or a complete proof in an inspectable primary source |
| R04 | 7-connectivity (RL12-SRC-01 restatement; Mader 1968a; RL62) | **SOURCE-GATE (rank 3)** | Narrows the class but creates no partition. Its only repository consumer is the conditional RL13-P00. FL-063 stands: RL63 orientation shows arXiv:2509.07144 restates rather than reproves the k>=7 case. | RL12-SRC-01 record (restatement), RL13-P00 conditional | FL-063 retry condition unchanged |
| R05 | Gallai + HC6 order bound n>=13 | **SOURCE-GATE (low)** | Only useful to bound a computational search domain from below. | — | Primary statement of Gallai's join theorem |
| R06 | "Degree-seven existence" target (RL52 framing, RL53) | **KILL / RETIRE** | Mis-specified coverage target. No evidence it holds; it may be false within the hypothetical class. Superseded by R03, which is the correct finite partition. | RL53 OPEN record | Only with an actual theorem forcing a degree-7 vertex |
| R07 | Early roadmap / CR_6 / Holroyd / rooted-K6 routing / D_cyc helpers (RL3–RL5, RL7–RL11) | **KILL / RETIRE** | General-t or auxiliary-domain routes with no HC7 bridge. Several countermodels lie outside C7. | RL4-P01..P03, RL6-P01/P02/P04, RL7-P01..P04, RL8-P01..P04, RL9-P01..P04, RL11-P01..P04, C2, C3 | FL-001..FL-013 conditions **and** the frontier rule |
| R08 | General-t / asymptotic literature corpus (RL2) | **KILL / RETIRE** (as an HC7 route) | No t=7 content beyond HC6 and the SRC-0025 title. | Corpus as provenance | — |
| R09 | BR-06 separator route (RL12-P01) | **KILL / RETIRE** | Vacuous at t=7 under 7-connectivity, and not unconditionally needed. | RL12-P01 | — |
| R10 | Dcyc7 m=1 resource chain (RL13–RL19) | **KILL / RETIRE** | FL-023 anti-Collatz; no coverage bridge. | RL13-P01/P02, RL14-P01..RL19-P01 | FL-015..FL-023 **and** frontier rule |
| R11 | Dcyc7 m=2 chain (RL21–RL29) | **KILL / RETIRE** | FL-033. | RL21-P01/P02, RL22-P01, RL27-P01/P02, RL28-P01/P02 | FL-024..FL-033 **and** frontier rule |
| R12 | Dcyc7 m=3 terminal core (RL31–RL39) | **KILL / RETIRE** | FL-043. M3-CORE is equivalent to the retained configuration being empty, i.e. a renamed root bridge. | RL31-P01..RL39-P01 | FL-034..FL-043 **and** frontier rule |
| R13 | Fixed RL41 triple / e_0 / {2,6} / pivotal-edge Kempe hierarchy (RL41–RL49) | **KILL / RETIRE** | FL-053. RL47–RL49 rest on an unproved pivotal edge. | RL41-P01/P02, RL42-P01..RL49-P01 | FL-044..FL-053 **and** frontier rule |
| R14 | M3-CLIQUE-SEPARATOR-DICHOTOMY (RL51) | **CONDITIONAL ONLY** (deprioritised) | Valid conditional payoff in a domain no bridge reaches. Its clique-separator alternative is vacuous under 7-connectivity (S1), so under S1 the dichotomy reduces to "S-rooted K6 exists", i.e. the root itself on that slice. | RL51-P01; dichotomy ADMITTED/UNPROVED | A proved coverage chain HC7 ⇒ delta=7 branch ⇒ K7−C7 ⇒ m=3,A=S |
| R15 | Degree-7 local programme as a whole (RL6–RL51) | **CONDITIONAL ONLY** | The degree-7 branch would be one of three exhaustive branches after R03. But the literature (KT 2005, Jakobsen, 2025–26 frontier) has already worked this branch. The repository's local machinery has never closed a named obligation. | all scoped results | R03 admitted, **and** a frontier review shows a specific residual configuration the local machinery addresses |
| R16 | K4,4 minimum-model refinement (RL55–RL59) | **KILL / RETIRE** | FL-056..FL-061; excluded no graph. If R02 is admitted, K4,4 is superseded as near-K7 structure. | RL55-P01, RL56-P01 (conditional), RL56-C01..RL59-C01 NOT ESTABLISHED | FL-062 non-colour-lift mechanism **and** frontier rule |
| R17 | Spanning K4,4 colouring (RL59–RL61) | **KILL / RETIRE** | The RL61 inequality makes the target equivalent to the root contradiction (FL-062). | RL61 barrier | FL-062 |
| R18 | Non-colouring structural uses of K4,4 | **SUSPEND** | No mechanism has been identified. Superseded in expected value by R02. | — | A named mechanism with a proved HC7 payoff |
| R19 | Direct analytic 7-connectivity separator proof (RL62 elementary route) | **SUSPEND** | Stopped at side-colouring compatibility. Mader's proof is the classical solution, so reproving it is low value unless the source gate fails permanently. | — | FL-063 |
| R20 | Explicit counterexample search (finite or heuristic) | **COMPUTE-GATE** | No theorem bounds counterexample order, so no exhaustive disproof domain exists. A verified exhaustive search to order N certifies only n>N. A heuristic search is evidence-only unless it finds a certified counterexample. Zero tooling exists. | — | See the attack map: certificate stack, verifier design and a bounded domain specification first |
| R21 | K7^- (one-edge-deficient) and K7 upgrade beyond the frontier | **SUSPEND** (pending R02) | This is the real NEW-MATHEMATICS target, but it cannot be scoped until the frontier proofs' terminal obstruction has been read from inspected text. | — | R02 admitted with an extracted obstruction map |

## Frontier rule (new, RL63)

No HC7 route may be started or reopened unless its brief:
1. states its position relative to the literature frontier recorded in RL63, namely S1 7-connectivity, S2 delta in {7,8,9}, and S4 minors of K7 minus any two edges, with each item's current gate status;
2. shows that the route does not re-derive frontier facts at lower strength.

This rule addresses the main RL1–RL62 failure mode, where 62 sessions developed local machinery below a literature frontier the programme had never imported.

## Summary counts

| Disposition | Routes |
|---|---|
| KEEP | R01 |
| SOURCE-GATE | R02, R03, R04, R05 |
| KILL/RETIRE | R06, R07, R08, R09, R10, R11, R12, R13, R16, R17 |
| CONDITIONAL ONLY | R14, R15 |
| SUSPEND | R18, R19, R21 |
| COMPUTE-GATE | R20 |
