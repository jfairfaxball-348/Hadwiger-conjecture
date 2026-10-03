# RL5 primary-source gate: inspection and limits

Access date: 2026-09-30. Status: **RL5 CLOSED/FROZEN — checked source update, inherited by RL6.**
The incoming [RL4 source log](SOURCE_STATUS_AND_SEARCH_LOG.md) is retained unchanged. New IDs supplement it and do not change the RL2 catalogs.

## Named new primary resource and scope before assessment

**RL5-SRC-01:** Zdeněk Dvořák and Jan M. Swart, *A note on extendable sets of colorings and rooted minors*.

* [Official arXiv history](https://arxiv.org/abs/2504.07764): v1 submitted 2025-04-10 14:03:41 UTC; no later arXiv version is listed. The manuscript's internal January 2025 date is not a submission or later-version date.
* [Version-pinned primary HTML](https://arxiv.org/html/2504.07764v1): definitions in section 1, Theorem 3, following Holroyd discussion/Conjecture 4, Observation 5 and section 2 construction inspected. The figures render partly as Asymptote source; their drawings were not visually inspected or consumed as proof.
* [Journal Version of Record](https://onlinelibrary.wiley.com/doi/full/10.1002/jgt.70110): Journal of Graph Theory, DOI 10.1002/jgt.70110, first published online 2026-08-05, Early View. Primary HTML sections 1 and 2, including the definitions, Theorem 3, Holroyd paragraph, Conjecture 4 and construction's concluding minor-exclusion argument inspected. The journal and v1 statements agree at these locations; no byte-level or complete editorial comparison is claimed.

### Exact checked statement

Restricting to finite graphs and finite root sets: fix k >= 3, finite X, and C subseteq [k]^X invariant under every permutation of [k]. There exists a finite graph J containing X with no X-rooted K_(k+1) minor and no ordinary K_(k+2) minor, such that, for each f:X -> [k], f extends to a proper k-coloring of J exactly when f belongs to C. C may be empty.

The journal introduction restates Holroyd's all-colorings/flexible-root conjecture, recalls the cases k=3,4 and presents a weaker realization conjecture. It does not state a six-color resolution. This is a dated primary discussion, not certification of CR_6's status at the cutoff.

### Gate assessment — logical scope comparison, not a new proof attack

| Instantiation | Why it does not settle CR_6 |
|---|---|
| k=6 | Excludes rooted K7, not rooted K6. Even choosing nonempty C consisting of surjections does not supply the required exclusion or model. |
| k=5, C nonempty | The realizing graph is 5-colorable, so cannot meet chi=6. |
| k=5, C empty | Non-5-colorability does not establish exact chi=6 and colorfulness on X in every six-coloring. Neither required fact is furnished by this statement. |

The realization theorem is independent literature, but is not an accepted sufficient input for arbitrary H without universal vertices. No critical case is newly certified to have all six branches and fifteen adjacencies. No finite negative witness is extracted. The conclusions concern a differently indexed target, and the inspected paper itself distinguishes that target from Holroyd's conjecture.

**Verification classification:** checked primary statements and textual proof architecture; no independent full-proof reconstruction, dependency verification, formal check, gadget computation or external review. The cited DeVos-Seymour original was not retrieved or independently checked. This entry neither adds an RL2 theorem record nor resolves an inherited unchecked-source label.

## Concrete discovery bounds and executed queries

Before discovery, the work-unit resume record bounded the gate to two targeted batches, six queries and at most six named resource families, with passage/version follow-ups confined to those leads. Actual discovery used exactly two batches and six queries. Five families were inspected or pursued: original Holroyd; published Martinsson-Steiner/ETH access; Martinsson author page; Steiner author page; the new Dvořák-Swart article and its author's access routes. No RL4 broad query batch was repeated.

| Batch | Exact queries | Concrete reason and outcome |
|---|---|---|
| A: second engine | `"Strengthening Hadwiger's conjecture" "Holroyd" author pdf`; `"S0095895623000692" "pdf"`; `"Strengthening Hadwiger's conjecture for 4- and 5-chromatic graphs" counterexample -site:sciencedirect.com -site:arxiv.org/abs/2209.00594` | Test original-author and exact published-identifier access alternatives, and primary work mentioning the precise inherited article. Recovered RL5-SRC-01, two author-page URLs and an ETH repository DOI lead. No original-author Holroyd full text was located by these queries. |
| B: stronger engine | `"A note on extendable sets of colorings and rooted minors"`; `"Fred Holroyd" "S0024609396002159" pdf`; `"10.3929/ethz-b-000636400"` | Resolve the named new paper's primary identity and publication version; verify original-author identity and the specific ETH lead. Recovered arXiv 2504.07764 and the new journal full-text resource. Other results included unrelated PDF/software/legal pages, which were not consumed. |

The citing-work query explicitly included counterexamples. RL5-SRC-01's limitation result was audited for a possible negative at its actual indices. The inherited Kempe-routing, dominating, odd/list/subdivision negatives remain at their own scopes; none was reinterpreted as a CR_6 or ordinary-Hadwiger counterexample.

## Actual access attempts and inspection limits

| Resource requested | Actual result | Limit retained |
|---|---|---|
| [New article, author-hosted PDF](https://staff.utia.cas.cz/swart/papers/extend_color.pdf) | 502 Bad Gateway | PDF bytes and page images not inspected. |
| [New article, author preprint index](https://staff.utia.cas.cz/swart/res_index.html) | Internal Error | Index not inspected; discovery snippet is not primary checking. |
| [New article, unversioned arXiv HTML](https://arxiv.org/html/2504.07764) | DisabledError | Corrected version-pinned HTML succeeded; not treated as a mathematical defect. |
| [New article, arXiv v1 PDF](https://arxiv.org/pdf/2504.07764v1) | Internal Error | PDF not inspected; primary checking used version-pinned and journal HTML. |
| [ETH repository DOI for Martinsson-Steiner](https://doi.org/10.3929/ethz-b-000636400) | Internal Error | Journal-version full text remains unrecovered. Its indexed bitstream metadata is not proof checking. |
| [Martinsson ETH author page](https://as.inf.ethz.ch/people/members/maanders/index.html) | Open succeeded; publication/preprint list inspected | Relevant entry links to the already inherited arXiv paper. Page still calls it a preprint; a recent crawl does not establish that its content or status is current. No omission inference. |
| [Steiner ETH author page](https://people.math.ethz.ch/~rsteine/mathematical-research) | Open succeeded; selected list inspected | Lists the inherited paper as JCTB 164 (2024), 1-16, with arXiv link. No new applicable resolution was identified in this selected list; it is not exhaustive. |

An attempted guessed ETH `entities/publication/10.3929/ethz-b-000636400` URL also returned Internal Error. It was not established as a valid repository record URL and is not a source. No resource or journal theorem is inferred from that guess.

RL4's original Holroyd Wiley/Oxford/Cambridge full-text failures, correct Martinsson-Steiner ScienceDirect identifier and failed ETH bitstream route remain recorded. RL5 did not merely replay those failed opens. The exact-identity searches found bibliographic/abstract material but no verified replacement original full text. The original-Holroyd proof, theorem-number and journal-comparison limits remain.

## Source-status verdict and uncovered discovery

The August 2026 primary discussion is newer than RL4's consumed 2022 formulation and is a material checked source update. Neither it nor the inspected author lists provides a resolution of the exact six-color statement. **RL3-GAP-01 remains UNVERIFIED; current openness is not certified.** The generic conjecture label cannot establish the status of every individual k, and publication date is not a theorem of exhaustive cutoff coverage.

Uncovered: complete citation-network traversal, all primary databases and languages, unpublished work, material absent from returned queries, updates after the located discussion, and inaccessible original/published texts. No claim of complete discovery through 2026-09-30 is made.

RL3-GAP-02, OPEN-0005, OPEN-0008 / SRC-0014 / RES-0015 and all sixteen inherited unchecked-source limits are unchanged. The new article's references do not directly check those originals. No resolution or independently sufficient new input passed the bounded gate; further research stops.
