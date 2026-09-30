# RL3 targeted source addendum and gaps

Cutoff/access date: 2026-09-30. Status: **NOT PROMOTED**. The carried 31-source RL2 catalogs are unchanged. RL3-local IDs below supplement them; they do not silently assign new status to an RL2 record.

## Revalidated consumed sources

| Record | Exact location checked | Use and verification limit |
|---|---|---|
| SRC-0018, RES-0030 | [arXiv 2601.15245v1](https://arxiv.org/html/2601.15245v1), Corollary 1.8 and proof in section 5 | Checked the counterexample premise, both alternatives, asymptotic scope and proof's large-t convention. BR-03 records a deliberately weaker epsilon=1/4 consequence. Full proof/dependencies not independently reconstructed; unknown finite threshold remains. |
| SRC-0016, RES-0028 | [ICM 2022 chapter](https://ems.press/content/book-chapter-files/33307), section 2 | Rechecked contraction-critical definition. The elementary reduction is explicitly reconstructed in A1–A2. Toolkit survey references are not new inherited primary theorems. |
| SRC-0012, RES-0011–RES-0012 | [arXiv 2108.01633v5](https://arxiv.org/html/2108.01633v5), Theorem 1.6, Corollary 1.7; Lemmas 5.13–5.15 | Rechecked constants and sharpness limits. Lemma 5.14 requires a K_(2a) minor for rooted order a; this is unavailable at a=t-1 in a K_t-minor-free graph. No independent full-proof certification. Official v5 identity is 2024-03-05; auto-rendered header date is not a new version. |

## Newly consumed primary statements

**RL3-SRC-01:** Anders Martinsson and Raphael Steiner, *Strengthening Hadwiger's conjecture for 4- and 5-chromatic graphs*, [arXiv 2209.00594v1](https://arxiv.org/html/2209.00594v1), official submission 2022-09-01. Checked definition of colorfulness/rooting, Conjecture 1.2, Theorem 1.3 and Corollary 1.4. The paper proves colorful rooted completion at 4 and a singleton-branch consequence at 5. This does not establish colorful completion at 5 or 6. Full proof reconstruction was not performed. The known conjecture supplies BR-01's coordinate; N1 is its six-color instance. Original Holroyd 1997 full text was not inspected; attribution follows the inspected primary successor paper. No novelty is claimed.

**RL3-SRC-02:** Freddie Illingworth and Raphael Steiner, *Disproof of the dominating Hadwiger conjecture*, [arXiv 2609.35361v1](https://arxiv.org/html/2609.35361v1), submitted 2026-09-28. Checked the dominating-model definition and Theorem 1.3: for an absolute delta>0 and all sufficiently large odd m, an N=16^m graph with alpha<=2 lacks a dominating model of order ceil((1/2-delta)N). This is an inherited **preprint statement**, not an independently checked counterexample construction. It warns against substituting all-vertex domination for ordinary adjacency. It was absent from the carried corpus despite being before its cutoff; RL2 explicitly did not guarantee complete discovery. Neither the frozen corpus nor ordinary Hadwiger is invalidated by adding this source.

## Preserved and new source gaps

* **OPEN-0008 / SRC-0014 / RES-0015:** Lin manuscript remains unretrieved/unverified; no new retrieval or theorem promotion in RL3. RES-0010 remains a verified baseline, not a latest-record assertion.
* **OPEN-0005:** fractional frontier remains only as last checked; no new rounding or freshness claim.
* All sixteen RL2 not-directly-checked source records retain their labels, bibliographic ambiguities and access limits. SRC-0026/SRC-0027 are not consumed as unstated universal linkage theorems.
* **RL3-GAP-01:** current six-color Holroyd/Strong Hadwiger status is not established by the checked 2022 paper. Targeted discovery queries did not yield a reliable primary status update; one restricted recency/domain query returned unrelated results and is not a successful verification. N1 must resolve this before a proof attack. No assertion that absence of a retrieved theorem proves openness.
* **RL3-GAP-02:** RL3-SRC-02's introduction cites a Liu–Luo asymptotic coloring improvement. Its original manuscript, exact hypotheses and version were not retrieved. This is a separate lead, not verification of either that bound or the Lin lead. It is not used in any bridge or ranking inference.

The finite/analytic countermodel arguments are written in FALSIFICATION_REPORT.md and are independently checkable; they do not rely on search snippets or uninspected preprint proofs. The source rechecks select consumed statements only; this session did not undertake a general latest-literature sweep.
