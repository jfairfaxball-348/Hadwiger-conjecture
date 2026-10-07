# RL64 consolidated HC7 source register

Status: CURRENT consolidated source register after RL64. It supersedes RL63_SOURCE_GAP_REGISTER.md, which is frozen in sessions/RL63/checkpoint/ and sessions/RL64/incoming/. That earlier register's rows are carried here, with the RL64 changes marked.
Root: HC7 only.

## Admission levels (unchanged from RL63)

- **Level A — consumable for HC7-universal promotion.** The exact statement, definitions and hypotheses have been inspected in one of:
  - the original primary source; or
  - a version-pinned primary research text that itself proves the theorem.

  Repository notation must be mapped. Refereed/preprint status must be recorded. Proof reconstruction is not required, but its absence must be stated.
- **Level B — conditional only.** The statement was inspected only as a restatement in a later primary paper that attributes it elsewhere. Consequences are recorded CONDITIONAL.
- **Level C — orientation only.** Search excerpts, seminar abstracts, secondary summaries, memory.

## Register

| ID | Source | Statement relevant to HC7 | Status | Level | Consumers / notes |
|---|---|---|---|---|---|
| SRC-0025 | Kawarabayashi & Toft, "Any 7-chromatic graph has K7 or K4,4 as a minor", Combinatorica 25 (2005) 327–353, DOI 10.1007/s00493-005-0019-1 | chi=7 ⇒ K7 or K4,4 minor | checked_primary at title/abstract statement level (RL54); full proof unread. The catalog entry still says not_directly_checked (stale). Also restated as F2 Thm 3. | A (statement) | U7 (RL54) |
| SRC-0003 / RES-0005 | Robertson, Seymour, Thomas, "Hadwiger's conjecture for K6-free graphs", Combinatorica 13 (1993) 279–361 | K6-minor-free ⇒ 5-colourable | checked_primary statement (RL2) | A (statement) | RL4-P03; S3. Internal lemmas (2.4) and (2.6): see RL64-SRC-03. |
| SRC-0004 | Robertson, Sanders, Seymour, Thomas, "The Four-Colour Theorem" (1997) | planar ⇒ 4-colourable | checked_primary (abstract, §1) | A (statement) | via HC6 |
| RL12-SRC-01 | Lafferty, Liu, Rolek, Yu, "Connectivity of contraction-critical graphs", arXiv:2509.07144v1 | Thm 1.1: for k>=7 every noncomplete k-contraction-critical graph is 7-connected | Restatement of Mader (RL63 clarification) | B | RL13-P00 (conditional). Does not satisfy FL-063. |
| RL63-SRC-01 | W. Mader, "Über trennende Eckenmengen in homomorphiekritischen Graphen", Math. Ann. 175 (1968) 243–252, DOI 10.1007/BF02052726 | 7-connectivity of k-contraction-critical graphs, k>=7 | Original not inspected. **RL64:** restated in F1 Thm 7.1 as "For every k ≥ 7, every k-contraction-critical graph other than Kk is 7-connected." | B (statement via restatements) | S1 / R04 / FL-063 (unsatisfied) |
| RL64-SRC-01 (new) | W. Mader, "Homomorphieeigenschaften und mittlere Kantendichte von Graphen", Math. Ann. 174 (1967) 265–268 | Cited by F2 (Thm 16) for "For all k ≥ 7 every k-contraction-critical graph is 7-connected" | **Attribution discrepancy** with F1, RL12 and RL62 (Math. Ann. 175). F2's wording omits the K_k exception; taken literally it fails for K7, which is harmless in F2's use. Original not inspected. | B | S1 attribution question (SQ3) |
| RL63-SRC-02 | W. Mader, "Homomorphiesätze für Graphen", Math. Ann. 178 (1968) 154–168, DOI 10.1007/BF01350657 | Expected (general knowledge, unverified): extremal function for K_p minors, p<=7; K7-minor-free with n>=6 ⇒ e<=5n−15 | Located, not inspected. **RL64: not cited by either frontier paper.** | C | S2 / R03 (de-prioritised) |
| RL63-SRC-03 | Z. Dvořák, S. Norin, N. Rahman, "Every graph with no K_7^= minor is 6-colorable", **arXiv:2609.17760v1**. v1 submitted 15 Sep 2026; manuscript dated 23 Aug 2026; 35 pp; arXiv non-exclusive licence; PDF sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907 | Thm 1.1: "Every K7= -minor-free graph is 6-colorable." Also stated and proved: Thm 1.3 (5-connected, n>=6, e>=4n−7 ⇒ K7^=); Thm 2.8 (4-bilight version); Thm 1.6 (K7^- -minor-free, chi>=7, all proper minors 6-colourable ⇒ 7-connected and e>=4n−2). Conjecture 1.5 is a conjecture, not a theorem. | **RL64: inspected.** Unrefereed preprint; proof unread. Caveats: §1.1 discloses AI-generated proofs; depends on RL64-SRC-09 (unrefereed). | **A (statement)**, was C | U8 (with RL63-SRC-04); Thm 1.6 is the RL65 bridge input |
| RL63-SRC-04 | **S. Norin, A. Totschnig**, "Every graph with no K_7^{\vee}-minor is 6-colorable", **arXiv:2507.03244v1**. v1 submitted 4 Jul 2025; 17 pp; CC BY 4.0; PDF sha256 14c465983a80a6f48e69b92d56c8d1d40c7428e495bc144ab322070478ca1245 | Thm 4: "Every graph with no K7∨ -minor is 6-colorable." Also stated and proved: Thm 6 (4-connected, e>=4n−8 ⇒ K7^vee unless K2,2,2,2). Conjectures 19, 20, 21 recorded as conjectures. | **RL64: inspected.** Unrefereed preprint; proof unread. | **A (statement)**, was C | U8 |
| RL63-SRC-05 | University of Waterloo Graphs and Matroids seminar listing, A. Totschnig (Feb 2026), "Colouring graphs with forbidden 7-vertex minors" | Announces the K7^vee result | Search excerpt (RL63 R6); consistent with the inspected SRC-04 | C | orientation |
| RL63-GAP-01 | Gallai 1963 (k-critical graphs on <=2k−2 vertices have disconnected complement) | With HC<=6 ⇒ an HC7 counterexample has n>=13 | Not located. **RL64: not cited by either frontier paper.** | C | S3 / R05 |
| RL63-GAP-02 | Jakobsen 1971 | Restated in F2 Thm 2 as "Every graph with no K7∨ -minor and no K7= -minor is 6-colorable". F2 cites it as [Jak71] = "A homomorphism theorem with an application to the conjecture of Hadwiger", Studia Sci. Math. Hungar. 6 (1971) 151–160. F1 attributes the same result to [Jak71b], "Weakenings of the conjecture of Hadwiger for 8- and 9-chromatic graphs", Aarhus Preprint Series 22 (1971), and attributes K7^- -minor-free ⇒ 7-colourable to [Jak71a] (Studia 6). | **RL64:** located via both papers' citations; original not inspected | **B**, was C | Superseded by U8 |
| RL63-GAP-03 | Small-graph verification / order lower bound for HC7 counterexamples | — | Q6 unanswered | — | R20 disproof domain |
| RL64-SRC-02 (new) | G. A. Dirac, "Trennende Knotenpunktmengen und Reduzibilität abstrakter Graphen mit Anwendung auf das Vierfarbenproblem", J. Reine Angew. Math. 204 (1960) 116–131 | k-contraction-critical ⇒ alpha(G[N(v)]) <= deg v − k + 2 (F1 Thm 7.3; F2 Thm 15) | restatement | B | Coincides at k=7 with U4 (RL6-P03), which is already proved in-repo |
| RL64-SRC-03 (new) | RST93, items (2.4) and (2.6) | crossing-paths and rooted-K4 alternatives (F2 Thms 13, 8) | restatement | B | F2 §2–3 |
| RL64-SRC-04 (new) | L. K. Jørgensen, "Contractions to K8", J. Graph Theory 18(5) (1994) 431–448 | 4n−7 ⇒ K4,4 unless K7 (F2 Thm 5); Lemma 16(2), rooted K4^- (F2 Lemma 10); Lemma 17, rooted K4,2 with e<=4n−10 (F2 Thm 11) | restatement | B | F2 §2–3 |
| RL64-SRC-05 (new) | M. Kriesell, S. Mohr, "Kempe chains and rooted minors", arXiv:1911.09998 (2019), Lemma 2 | Kempe-adjacent cycle of distinctly coloured vertices ⇒ rooted C_k model (F1 Thm 7.5; F2 Thm 14) | restatement; the original is open access | B | both papers' exceptional degree-7 case |
| RL64-SRC-06 (new) | Kawarabayashi, Luo, Niu, Zhang, "On the structure of k-connected graphs without Kk-minor", European J. Combin. 26(3) (2005) 293–308 | (k+2)-connected, three k-cliques with \|L1∪L2∪L3\| >= 3k−3 ⇒ K_{k+2} minor (F2 Thm 18) | restatement | B | F2 §4 |
| RL64-SRC-07 (new) | KT05, Lemma 3(i) | 7-contraction-critical, three 5-cliques pairwise meeting exactly in Z with \|Z\|=2 ⇒ K7 minor (F2 Lemma 17) | restatement | B | F2 §4 |
| RL64-SRC-08 (new) | KT05, Section 2 | a 7-vertex graph with alpha<=2 contains K4 or the Moser spindle (F1 Thm 7.4) | restatement | B | F1 Lemma 7.6 |
| RL64-SRC-09 (new) | Z. Dvořák, "Extremal function for rooted K5 minors", arXiv 2609.13818 (2026) | Thm 4 (4-light 5-rooted ⇒ T_{rho4}-universal), Cor 13, Cor 16 (F1 Thms 2.6, 2.7, 2.9) | restatement; itself an unrefereed 2026 preprint | B | F1 Thm 1.3 (load-bearing); likely RL65 input |
| RL64-SRC-10 (new) | R. Fabila-Monroy, D. R. Wood, "Rooted K4-minors", Electron. J. Combin. 20(2) (2013) P64 | source of Dvořák Cor 13 (per F1) | restatement | B | indirect |
| (surfaced, not opened) | arXiv:1402.2806 "Coloration of K_7^- -minor free graphs"; arXiv:1606.05507 Rolek–Song; arXiv:2208.07335; arXiv:2104.13519 | Possibly relevant toolkit papers | Titles only | C | not load-bearing |

## Source questions

| Q | Question | Status after RL64 |
|---|---|---|
| SQ1 | Exact F1/F2 statements, inputs and obstruction | **RESOLVED (RL64)** |
| SQ2 | Inspectable Mader 178 / proof of e<=5n−15 | Open. De-prioritised: not consumed by the frontier. |
| SQ3 | Inspectable Mader 7-connectivity original | Open (FL-063). New: the frontier papers disagree on which Mader paper (174/1967 vs 175/1968). |
| SQ4 | Gallai statement | Open, low priority |
| SQ5 | Small-graph / order bounds | Open, low priority |
| SQ6 | F1 §2–6 lemma level and Dvořák arXiv 2609.13818, as needed for a K7^- density attack | **RL65 task** |

## Environment and retrieval accounting

- RL63: 8/8 attempts, with arxiv.org blocked.
- RL64:
  - probes A0 and A0b were blocked (403);
  - A0c reached arxiv.org (200, 2026-10-06T09:54:02Z) after the user allowed it;
  - retrievals 4/6;
  - 2 primary texts inspected.

Full log: sessions/RL64/checkpoint/RL64_RETRIEVAL_LOG.md.

**Licence.** The full text of F1 is not stored in the repository (arXiv non-exclusive licence). Only quotations, line references and hashes are recorded.
