# RL63 external retrieval log (frozen)

Budget: at most 8 retrievals; one web_search or web_fetch call = one retrieval. Nothing retrieved was promoted in RL63. Q2/Q3 were access/location checks only.

## R1 (Q1) — planned
Question: in arXiv:2509.07144 (Lafferty–Liu–Rolek–Yu, "Connectivity of contraction-critical graphs"), is Theorem 1.1 (noncomplete k-contraction-critical, k>=7, is 7-connected) proved in the paper or cited from Mader (which paper/theorem number)? Which classical k=7 facts (extremal function 5n-15, degree results, Jakobsen, KT, Gallai) are stated with citations?
Why ranking-changing: decides whether the runner-up (7-connectivity) has an open self-contained proof (FL-063 retry route) and supplies exact citations for Q2/Q5.
Changed from RL12: RL12 checked only the statement of Thm 1.1; R1 asks about proof/attribution and citations.
Call: web_fetch https://arxiv.org/abs/2509.07144 and https://arxiv.org/html/2509.07144 (one call).
Outcome of first R1 attempt: Parallel Search web_fetch returned a free-tier rate-limit error; ZERO content obtained. Tool/access defect, not a retrieval of source content. Conservatively counted as one attempt against the cap (attempt counter 1/8).
R1 retry (same question, changed tool): WebFetch https://arxiv.org/abs/2509.07144 (single URL; counts as attempt 2/8).
Outcome of attempt 2: WebFetch arxiv.org -> EGRESS_BLOCKED by the session's network egress policy (organization policy denial; not retried, not routed around). ZERO content. Access/environment defect, not mathematical evidence. Attempt counter 2/8.

## R3 (Q1 orientation via search engine; changed channel)
Question: same as R1, via search-result excerpts only (orientation, not proof admission).
Call: WebSearch "Lafferty Liu Rolek Yu Connectivity of contraction-critical graphs Mader 7-connected". Attempt 3/8.
Outcome R3 (search excerpt; orientation only, secondary): arXiv:2509.07144 is by Michael Lafferty, Runrun Liu, Martin Rolek, Gexin Yu. Search-engine summary: "It is a long-standing result of Mader that k-contraction-critical graphs are 7-connected for k >= 7. The paper shows that k-contraction-critical graphs are 8-connected for k >= 17, 9-connected for k >= 29, and 10-connected for k >= 41"; corollary: every 30-connected graph is 4-linked. Inference (orientation): Thm 1.1 restates Mader's classical theorem; the paper's own new theorems concern k>=17 and do not touch k=7. Hence RL12-SRC-01 is, for the k=7 statement, a modern restatement of Mader (secondary for Mader's theorem). Whether the paper reproves the k>=7 case could not be inspected (arxiv.org blocked). Related titles surfaced (not opened): arXiv:2208.07335 "Properties of 8-contraction-critical graphs with no K7 minor"; arXiv:1606.05507 Rolek–Song "Coloring graphs with forbidden minors"; arXiv:1809.05975 "Graphs with no K9^= minor are 10-colorable". Attempt counter 3/8.

## R4 (Q2+Q3 access/location only)
Question: is there an open inspectable primary copy (GDZ / DigiZeitschriften / EuDML) of W. Mader 1968 papers in Mathematische Annalen 175 (connectivity) and 178 "Homomorphiesätze für Graphen" (K7 extremal function)? Location only; no consumption.
Call: WebSearch "Mader Homomorphiesätze für Graphen Mathematische Annalen 178 1968 digizeitschriften OR gdz OR eudml". Attempt 4/8.
Outcome R4 (search results; location only): Mader, "Homomorphiesätze für Graphen", Math. Ann. 178 (1968) 154–168, DOI 10.1007/BF01350657 (Springer). No GDZ/DigiZeitschriften hit returned; one EuDML record (https://www.eudml.eu/doc/162392) appeared among results with unidentified content. Springer access for this DOI not attempted (FL-063-type subscription barrier expected; not consumed). Attempt counter 4/8.

## R5 (Q2/Q3 access check of the EuDML hit)
Question: is https://www.eudml.eu/doc/162392 a Mader 1968 Math. Ann. record with an open full-text (GDZ) link? Location only.
Call: WebFetch https://www.eudml.eu/doc/162392. Attempt 5/8.
Outcome attempt 5: WebFetch www.eudml.eu -> EGRESS_BLOCKED by session network policy. ZERO content. Not retried, not routed around. Attempt counter 5/8.
Access conclusion for Q2/Q3 in THIS environment: no open inspectable primary copy of Mader 1968 (Math. Ann. 175 or 178) was reachable; the Springer DOIs are located (BF02052726 for 175:243–252; BF01350657 for 178:154–168). Direct fetches to arxiv.org and www.eudml.eu are blocked by environment egress policy. This is an access/environment limitation, not evidence about the theorems.

## R6 (Q4 status)
Question: has HC7 (Hadwiger's conjecture for t=7 / 7-chromatic graphs) been claimed proved or disproved 2022–2026?
Call: WebSearch "Hadwiger conjecture K7 minor 7-chromatic proof 2025 2026". Attempt 6/8.
Outcome R6 (search excerpts; orientation only, secondary/announcement level): no claimed proof or disproof of HC7 found. Excerpt: "the cases k at least 7 remain open". University of Waterloo Graphs and Matroids seminar listing (Agnes Totschnig, McGill, Feb 2026, "Colouring graphs with forbidden 7-vertex minors"): any 7-chromatic graph has as a minor K7 with two ADJACENT edges removed, extending Kawarabayashi–Toft and proving a new edge-extremal bound; improves Jakobsen's result (K7 minus two arbitrary edges). Also surfaced (not opened): arXiv:2104.13519 "Hadwiger conjecture for 8-coloring graph"; Lafferty colloquium: every graph with no K8^{-4} minor is 7-colorable. Classification: seminar-abstract/search-summary orientation only; nothing consumed. Q4 decision rule: no credible HC7 resolution => winner unchanged. Attempt counter 6/8.

## R7 (Q5 degree exclusion)
Question: is there a published theorem that a 7-contraction-critical K7-minor-free graph (minimal HC7 counterexample) has no vertex of degree 7 (delta>=8), or other degree exclusions / neighbourhood classifications for degree 7, 8, 9?
Call: WebSearch "7-contraction-critical graph no K7 minor minimum degree 8 vertex of degree 7". Attempt 7/8.
Outcome R7 (search excerpts; orientation only): no theorem excluding degree-7 vertices surfaced. Surfaced primary-preprint titles (not opened; arxiv.org blocked): arXiv:2507.03244 "Every graph with no K_7^{\vee}-minor is 6-colorable"; arXiv:2609.17760 "Every graph with no K_7^= minor is 6-colorable". Excerpts restate Mader's theorem (k>=7 contraction-critical => 7-connected) and a Kawarabayashi–Toft lemma (7-contraction-critical G with |Z|=2 and three 5-cliques pairwise meeting exactly in Z => K7 minor), and state KT: no K7 and no K4,4 minor => 6-colorable. Q5 answer: NOT FOUND (no admissible delta>=8 theorem located). Attempt counter 7/8.

## R8 (reserve used: pin frontier statements)
Question: exact statements/authors/dates of arXiv:2507.03244 and arXiv:2609.17760 (which two-edge-deleted K7 each excludes), to decide whether the literature frontier (K7 minus two edges) supersedes the repository's K4,4/delta frontier and should be the RL64 admission target.
Call: WebSearch "arXiv 2507.03244 K7 two adjacent edges removed minor 6-colorable Totschnig abstract". Attempt 8/8 (cap reached after this).
Outcome R8 (search excerpts; orientation only — primary texts NOT inspected because arxiv.org is blocked):
- arXiv:2609.17760, "Every graph with no K_7^= minor is 6-colorable", Zdeněk Dvořák, Sergey Norin, Neil Rahman (dated 23 August 2026 per excerpt); K_7^= = K7 minus two independent edges.
- arXiv:2507.03244, "Every graph with no K_7^{\vee}-minor is 6-colorable"; main theorem (Theorem 4) per excerpt; K_7^{\vee} = K7 minus two edges incident with the same vertex; strengthens Jakobsen. (Author not given by excerpt; the Feb 2026 Waterloo seminar by Agnes Totschnig announces the same statement.)
- Excerpt: Hadwiger k=7 "remains widely open", and even whether all K7-minor-free graphs are 7-colorable is unresolved.
- Also surfaced (not opened): arXiv:1402.2806 "Coloration of K_7^- -minor free graphs".
Combined orientation: the published-preprint frontier claims every 7-chromatic graph contains K7 minus any two edges as a minor (both isomorphism types). NOT CONSUMED; NOT PROMOTED. Attempt counter 8/8 — CAP REACHED. Q6 (order lower bound / small-graph verification) UNANSWERED by retrieval.

## Retrieval summary
Attempts: 8/8 (2 blocked by egress policy, 1 rate-limited: zero content in those 3). Content-bearing: 5 search-engine result sets (orientation only). Primary texts inspected: 0. Sources promoted: 0. Mathematical computation: 0. Census: 0.
