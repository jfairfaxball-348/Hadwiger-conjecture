# RL63 source gap register (consolidated HC7 source register)

Status: RL63 global-audit record. CLOSED/FROZEN on promotion at RL63 closeout.
Root: HC7 only.

## Why this register exists

There is currently no source register in authority:
- the RL2 SOURCE_CATALOG was last carried in `sessions/RL30/incoming/background/` and was never updated;
- SRC-0025's checked_primary status exists only in prose in current authority;
- RL12-SRC-01 was dropped from authority at the RL30 closeout reset.

This file consolidates every HC7-relevant source and its exact status. RL63 promotes no source. Source-status changes in RL63: **NONE**. There is one classification clarification (RL12-SRC-01) and there are new *located-only* records.

## Admission levels (consistent with RL54/RL62 practice; proposed for RL64 briefs)

- **Level A — consumable for HC7-universal promotion.** The exact statement, definitions and hypotheses have been inspected in one of:
  - the original primary source; or
  - a version-pinned primary research text that itself proves the theorem.

  Repository notation must be mapped. Refereed/preprint status must be recorded. Proof reconstruction is not required, but its absence must be stated, as for SRC-0025.
- **Level B — conditional only.** The statement was inspected only as a restatement in a later primary paper that attributes it elsewhere. Consequences are recorded CONDITIONAL.
- **Level C — orientation only.** Search excerpts, seminar abstracts, secondary summaries, memory.

## Register

| ID | Source | Statement relevant to HC7 | Status | Level | Consumers / notes |
|---|---|---|---|---|---|
| SRC-0025 | Kawarabayashi & Toft, "Any 7-chromatic graph has K7 or K4,4 as a minor", Combinatorica 25 (2005) 327–353, DOI 10.1007/s00493-005-0019-1 | chi=7 ⇒ K7 or K4,4 minor | checked_primary at title/abstract statement level (RL54); full proof unread. Catalog entry still says not_directly_checked (stale). | A (statement) | U7 (RL54) |
| SRC-0003 / RES-0005 | Robertson, Seymour, Thomas, "Hadwiger's conjecture for K6-free graphs" (1993) | K6-minor-free ⇒ 5-colourable | checked_primary statement (RL2) | A (statement) | RL4-P03; S3. Absent from current authority. |
| SRC-0004 | Robertson, Sanders, Seymour, Thomas, "The Four-Colour Theorem" (1997) | planar ⇒ 4-colourable | checked_primary (abstract, §1) | A (statement) | via HC6 |
| RL12-SRC-01 | Lafferty, Liu, Rolek, Yu, "Connectivity of contraction-critical graphs", arXiv:2509.07144v1 | Thm 1.1: for k>=7 every noncomplete k-contraction-critical graph is 7-connected | RL12: "inherited statement checked in a primary research paper; original Mader proof unread". RL63 orientation (R3): the paper presents this as Mader's long-standing result; its own new results are 8/9/10-connectivity for k>=17/29/41. | **B (clarified, RL63)** | RL13-P00 (conditional, unchanged). Does not satisfy FL-063. |
| RL63-SRC-01 | W. Mader, "Über trennende Eckenmengen in homomorphiekritischen Graphen", Math. Ann. 175 (1968) 243–252, DOI 10.1007/BF02052726 | 7-connectivity of k-contraction-critical graphs, k>=7 (as restated) | Located (RL62). Springer landing page shows metadata only. Not inspected. No open copy reached in RL63 (eudml.eu, arxiv.org blocked). | C | S1 / R04 / FL-063 |
| RL63-SRC-02 | W. Mader, "Homomorphiesätze für Graphen", Math. Ann. 178 (1968) 154–168, DOI 10.1007/BF01350657 | Expected (general knowledge, unverified): extremal function for K_p minors p<=7; K7-minor-free with n>=6 ⇒ e<=5n−15 | Located (RL63 R4). Not inspected. | C | S2 / R03 |
| RL63-SRC-03 | Z. Dvořák, S. Norin, N. Rahman, "Every graph with no K_7^= minor is 6-colorable", arXiv:2609.17760 (dated 23 Aug 2026 per excerpt) | K7^= = K7 minus two independent edges; no K7^= minor ⇒ 6-colourable | Located by search (R7, R8). Not inspected (arxiv.org blocked). Preprint. | C | S4 / R02 |
| RL63-SRC-04 | "Every graph with no K_7^{\vee}-minor is 6-colorable", arXiv:2507.03244 (author not in excerpt; consistent with the A. Totschnig Feb 2026 Waterloo seminar announcement) | Thm 4 per excerpt: K7^vee = K7 minus two edges sharing a vertex; no K7^vee minor ⇒ 6-colourable; strengthens Jakobsen | Located by search (R7, R8). Not inspected. Preprint. | C | S4 / R02 |
| RL63-SRC-05 | University of Waterloo Graphs and Matroids seminar listing, A. Totschnig (Feb 2026), "Colouring graphs with forbidden 7-vertex minors" | Announces the K7^vee result; "extending KT and proving a new edge-extremal bound" | Search excerpt (R6) | C | orientation |
| RL63-GAP-01 | Gallai 1963 (k-critical graphs on <=2k−2 vertices have disconnected complement) | With HC<=6 ⇒ HC7 counterexample has n>=13 | Not located (general knowledge; no retrieval budget) | C | S3 / R05 |
| RL63-GAP-02 | Jakobsen (1970s; K7 minus two edges) | chi=7 ⇒ K7 minus two (arbitrary) edges minor | Mentioned in excerpts (R6, R7); not located | C | superseded by S4 if S4 is admitted |
| RL63-GAP-03 | Small-graph verification / order lower bound for HC7 counterexamples | — | Q6 UNANSWERED (retrieval cap) | — | R20 disproof domain |
| (surfaced, not opened) | arXiv:1402.2806 "Coloration of K_7^- -minor free graphs"; arXiv:1606.05507 Rolek–Song "Coloring graphs with forbidden minors"; arXiv:2208.07335 "Properties of 8-contraction-critical graphs with no K7 minor"; arXiv:2104.13519 | Possibly relevant toolkit papers | Titles only | C | not load-bearing |

## Named high-leverage source questions carried forward

| Q | Question | Target ID | Resolves | Status after RL63 |
|---|---|---|---|---|
| SQ1 | Do the inspected arXiv texts of 2609.17760 and 2507.03244 state F1/F2 exactly as excerpted, for finite simple graphs, with the standard minor relation? What classical inputs do they consume, and with what exact citations? What obstruction do the authors record for K7^- / K7? | RL63-SRC-03/04 | R02, and the scope of R21 | **RL64 task** |
| SQ2 | Is an open, inspectable copy of Math. Ann. 178 available, or a complete modern proof of e<=5n−15? | RL63-SRC-02 | R03 | Open. SQ1's citations will pin the exact Mader statement at Level B. |
| SQ3 | Same question for Math. Ann. 175 | RL63-SRC-01 | R04 | Open (FL-063) |
| SQ4 | Gallai statement | RL63-GAP-01 | R05 | Open, low priority |
| SQ5 | Small-graph / order bounds | RL63-GAP-03 | R20 | Open, low priority |

## Environment note (access, not mathematics)

The RL63 session environment's network egress policy blocked arxiv.org and www.eudml.eu, and one search tool was rate-limited. These are access defects, not evidence about any theorem.

RL64 has a precondition: arxiv.org must be reachable, for example by adding it to the environment's allowed domains, or the user must supply the exact arXiv versions.

## RL63 retrieval accounting

- 8 of 8 attempts used.
- 3 returned zero content (2 egress blocks, 1 rate limit).
- 5 search result sets, used for orientation only.
- 0 primary texts inspected.
- 0 sources promoted.

Full log: sessions/RL63/checkpoint/RL63_RETRIEVAL_LOG.md.
