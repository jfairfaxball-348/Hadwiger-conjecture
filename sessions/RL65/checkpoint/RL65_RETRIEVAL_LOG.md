# RL65 external retrieval log (scratch, non-authoritative)

Budget: at most 3 external retrievals (user instruction and RL65 brief): (1) F1 PDF with sha256 check; (2) [Dvo26] arXiv 2609.13818 abstract page; (3) [Dvo26] PDF only if load-bearing for the chosen locus. Every entry is written BEFORE its call. No mirrors, substitutes or re-routing.

## R1 — F1 PDF (start-gate precondition + pin + new-version check)
Question: (a) is arxiv.org reachable; (b) does the F1 PDF match the pinned sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907; (c) is v1 still the latest version?
Call: `curl -sSL -o <scratchpad>/dl/R1/F1.pdf -w '%{http_code} %{content_type} %{url_effective}' https://arxiv.org/pdf/2609.17760` (unversioned URL serves the latest version, so a hash match proves both (b) and (c)). Saved into a new empty directory (untrusted data).
Decision rule: 403/unreachable => stop before mathematics. Hash mismatch => read only the version stamp, record "new version" or "v1 byte mismatch", block F1 use, stop pending re-admission.
Logged before call: yes (2026-10-06T10:34Z). Counter after call: 1/3.
Outcome (2026-10-06T10:34:15Z): HTTP 200, application/pdf, effective URL https://arxiv.org/pdf/2609.17760 (no redirect), 475875 bytes, sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907 = PINNED VALUE. Margin stamp "arXiv:2609.17760v1 [math.CO] 15 Sep 2026" (F1.txt:4). Hence: (a) arxiv.org reachable — start-gate precondition SATISFIED; (b) byte-identical to the RL64-admitted v1; (c) v1 is still the latest version (no new version). Extracted with pdftotext 24.02.0 -layout -> F1.txt, 1654 lines, sha256 76b7917b56762c2527a79e3b592a34fd100aa049fab904a3e53311a22f13e89d = RL64 R3 extraction hash, so all RL64 F1.txt line references remain valid. F1 admission (Level A, statement) stands unchanged; no re-admission needed.

## R2 — [Dvo26] abstract/version page
Question: (a) pin the version history, authors, title, comments, journal-ref/DOI, licence and withdrawal status of arXiv:2609.13818. This is the Level-B dependency invoked at the chosen locus: Lemma 5.7 uses Lemma 5.6, which uses Thm 2.6 = [Dvo26, Thm 4]; and Thm 2.9 strengthens [Dvo26, Cor 16]. (b) Does the abstract state any rooted-minor density result for targets other than 5-vertex graphs (spanning subgraphs of K5 on the roots)? This bears on the first missing dependency of the repaired K7^- route.
Trigger: plan Phase 4 item 4 (the chosen locus invokes a Dvo26 statement).
Call: `curl -sSL -o <scratchpad>/dl/R2/abs.html -w '%{http_code} %{content_type} %{url_effective}' https://arxiv.org/abs/2609.13818`, saved into a new empty directory (untrusted data). Text is extracted read-only with grep/sed; nothing is executed.
Logged before call: yes (2026-10-06, after F1 locus identification). Counter after call: 2/3.
Outcome (2026-10-06T10:43:26Z): HTTP 200, text/html, effective URL https://arxiv.org/abs/2609.13818 (no redirect), 38019 bytes, sha256 71cbce302e2b8950f4d25a7149500ca5888afc789e09d985ad08cc0eb400e19e.
- Title: "Extremal function for rooted $K_5$ minors". Author: Zdeněk Dvořák (sole author).
- Submission history: only [v1] Sat, 12 Sep 2026 09:03:04 UTC (247 KB). Comments: "85 pages, 6 figures". MSC 05C83 (Primary), 05C35 (Secondary). Licence: CC BY 4.0. No Journal-ref and no DOI field, so it is an unrefereed preprint. No withdrawal notice.
- Abstract (verbatim, citation_abstract meta): "We show that if an n-vertex 5-connected graph has at least 4n-10 edges, then for any choice of five of its vertices, we can contract disjoint connected subgraphs containing these vertices to obtain $K_5$ as a minor. The bound on the number of edges is the best possible."
- Answer to (b): the abstract states a rooted result only for the 5-vertex target K5. It does not mention any 6-vertex rooted target. F1's restatements (Thm 2.6 = [Dvo26, Thm 4] with 5-vertex target classes S_{5,t}; Thm 2.7 = Cor 13 with <=4 roots; Cor 16, vampire/K2,↓5/{K4+K1}) are likewise 5- or 7-vertex rooted targets on 5 roots, with no apex-plus-K5 target.
- Classification effect: RL64-SRC-09 stays Level B for content (statements are only restated in F1; consumption capped at Level B by the user). Abstract-level metadata are now pinned. This is a register note, not a level change.

## R3 — [Dvo26] PDF: NOT FETCHED
Reason: the RL65 locus assessment (RL65_LOCUS_ASSESSMENT.md) refutes the K7^- analogue of F1 Thm 2.9 using only F1's own definitions (F1.txt:280–287, 398–406). No [Dvo26] statement is load-bearing for that outcome. The "first missing dependency" for the repaired route is phrased relative to the statements actually inspected (F1 restatements + the R2 abstract), so the PDF is not needed. Fetching it would be a literature loop.

## Status
Retrievals used: 2/3 (R1 F1 PDF; R2 [Dvo26] abs page). R3 unused. No mirrors, substitutes or re-routing. Nothing downloaded was executed. Downloads stay in the session scratchpad (dl/R1, dl/R2), outside the repository. F1 full text is not copied into the repository (licence).
