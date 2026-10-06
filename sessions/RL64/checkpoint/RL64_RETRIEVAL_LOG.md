# RL64 external retrieval log

Status: RL64 record. CLOSED/FROZEN on promotion at RL64 closeout.

Budget: R1–R6, at most 6 source retrievals (two abstract/version pages, two full texts, two reserve). Every entry is written before its call.
Start-gate access probes (A-entries) request no source page, return no source content, and are disclosed here; they are not counted against the R1–R6 cap.

## A0 — start-gate access probe
Question: is https://arxiv.org reachable from this environment?
Call: `curl -sS -I https://arxiv.org/` (headers only; no paper, abstract or version page requested).
Logged before call: yes (plan file, before execution).
Outcome: `curl: (56) CONNECT tunnel failed, response 403`. The local proxy status records `connect_rejected`, host arxiv.org:443, 2026-10-06T09:44:34.945Z ("gateway answered 403 to CONNECT (policy denial or upstream failure)"). ZERO content. Organization egress-policy denial; not retried, not routed around.

## A0b — re-probe after the user chose "I'll allow arxiv.org"
Question: does the user's network-policy change apply to this running session?
Call: `curl -sS -I https://arxiv.org/` (headers only).
Logged before call: yes (plan file).
Outcome: `CONNECT tunnel failed, response 403`; proxy `connect_rejected`, arxiv.org:443, 2026-10-06T09:51:34.234Z. ZERO content. Not looped.

## A0c — single post-approval re-probe (Phase 0)
Question: has the user's arxiv.org allowance taken effect for this session since A0b?
Call: `curl -sS -I https://arxiv.org/` (headers only). Last probe in this session unless the user reports the setting is saved.
Logged before call: yes.
Outcome: `HTTP/1.1 200 Connection Established` then `HTTP/2 200` at 2026-10-06T09:54:02Z. No new proxy rejection recorded. **Start-gate precondition now SATISFIED** (the user's allowance took effect). Headers only; no source content.

## R1 — F1 abstract/version page
Question: version history (all vN with dates), authors, title, comments, journal-ref/DOI, licence and abstract of arXiv:2609.17760.
Call: `curl -sS https://arxiv.org/abs/2609.17760` saved into a new empty directory (untrusted data).
Logged before call: yes. Counter after call: 1/6.
Outcome (2026-10-06T09:54Z): HTTP 200, 38784 bytes, sha256 cb274d70056f3a8fd269c4a31048348a07b2474cba6002ef7aac2e03b0b2a14f.
- Title: "Every graph with no $K_7^=$ minor is 6-colorable". Authors: Zdeněk Dvořák, Sergey Norin, Neil Rahman.
- Submission history: only [v1] Tue, 15 Sep 2026 19:10:20 UTC (30 KB). Comments: "35 pages, 0 figures". Subjects: math.CO. No Journal-ref or DOI field. Licence: arXiv non-exclusive distribution 1.0. No withdrawal notice.
- Abstract (verbatim): "The first open case of Hadwiger's conjecture states that every $K_7$-minor-free graph is 6-colorable. We prove that this is the case for $K_7^=$-minor-free graphs, where $K_7^=$ denotes the graph obtained from $K_7$ by deleting two independent edges. The proof is based on an independently interesting density result: Every 5-connected $K_7^=$-minor-free graph with $n\ge 6$ vertices has at most $4n-8$ edges."
- Discrepancy with RL63 orientation: RL63 R8 excerpt dated the paper "23 August 2026"; the abstract page shows v1 submitted 15 Sep 2026. The excerpt date was orientation only; the abstract page governs.

## R2 — F2 abstract/version page
Question: same as R1 for arXiv:2507.03244 (including the author list, absent from RL63 excerpts).
Call: `curl -sS https://arxiv.org/abs/2507.03244` saved into a new empty directory (untrusted data).
Logged before call: yes. Counter after call: 2/6.
Outcome (2026-10-06T09:54Z): HTTP 200, 37843 bytes, sha256 860a3d59be979c71a67b4300be195179d98c219c128e6d71202f7147da1f13b1.
- Title: "Every graph with no $K_7^{\vee}$-minor is $6$-colorable". Authors: Sergey Norin, Agnes Totschnig.
- Submission history: only [v1] Fri, 4 Jul 2025 01:34:26 UTC (22 KB). No Comments, Journal-ref or DOI field. Subjects: math.CO. Licence: CC BY 4.0. No withdrawal notice.
- Abstract (verbatim): "Let $K_7^{\vee}$ denote the graph obtained from the complete graph on seven vertices by deleting two edges with a common end. Motivated by Hadwiger's conjecture, we prove that every graph with no $K_7^{\vee}$-minor is $6$-colorable."
- Fills the RL63 gap: the author list (Norin, Totschnig) was absent from RL63 excerpts.

## R3 — F1 full text
Question: exact main theorem, definitions (K7^=, graph, minor), hypotheses, consumed classical inputs with citations, authors' remarks on K7^- / K7, proof architecture and residual configurations.
Call: `curl -sS https://arxiv.org/pdf/2609.17760v1` into a new empty directory; `pdftotext -layout` with paths as arguments.
Logged before call: yes. Counter after call: 3/6.
Outcome (2026-10-06T09:55Z): HTTP 200, application/pdf, 475875 bytes, sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907. 35 pages; PDF creator "arXiv GenPDF". Margin stamp "arXiv:2609.17760v1 [math.CO] 15 Sep 2026"; manuscript date line "23 August 2026" (this explains the RL63 excerpt date). Extracted with pdftotext 24.02.0 -layout -> F1.txt (1654 lines, sha256 76b7917b56762c2527a79e3b592a34fd100aa049fab904a3e53311a22f13e89d). Text clean at every quoted statement; reserve not needed.

## R4 — F2 full text
Question: same as R3 for arXiv:2507.03244v1 (K7^vee).
Call: `curl -sS https://arxiv.org/pdf/2507.03244v1` into a new empty directory; `pdftotext -layout`.
Logged before call: yes. Counter after call: 4/6.
Outcome (2026-10-06T09:55Z): HTTP 200, application/pdf, 333384 bytes, sha256 14c465983a80a6f48e69b92d56c8d1d40c7428e495bc144ab322070478ca1245. 17 pages; margin stamp "arXiv:2507.03244v1 [math.CO] 4 Jul 2025". Extracted with pdftotext -layout -> F2.txt (734 lines, sha256 916b68fd47a996030050aa4987a66c5dadb2a13430e6609b3df3a44351d0fecc). Text clean at every quoted statement; reserve not needed.

## Status
R1–R6 used: 4/6 (R5, R6 reserve unused). Primary texts inspected: 2 (arXiv:2609.17760v1, arXiv:2507.03244v1). Sources promoted: 0 (admission recorded at checkpoint; promotion only at closeout). Mathematical computation: 0. Census: 0.
Untrusted-data handling: each download was saved in its own new empty scratchpad directory (dl/R1..R4); text was extracted by pdftotext with paths as arguments; the scratch parser ran as `python3 -I` from outside those directories. Nothing downloaded was executed.
Licence note: F1 is under the arXiv non-exclusive distribution licence, so its full text is NOT copied into the repository; only short quotations, hashes and line references are recorded. F2 is CC BY 4.0.
No substitute sources were searched; no mirror or alternate fetch channel was used; no RL63 retrieval was replayed.
