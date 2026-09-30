# RL4 source status, exact scopes and retrieval limits

Access/cutoff: 2026-09-30. **Source assessment; NOT AUTHORITATIVE.** Stable RL4 IDs supplement the unchanged RL2/RL3 records. A checked statement is not independent certification of its entire proof.

## Source-status verdict for RL3-GAP-01

No checked current primary resolution of CR_6 was recovered. **Current resolution status remains UNVERIFIED, not certified open.** The following primary statements and failures refine the gap. A recent crawl of a 2022 article is not a 2026 mathematical status update. Neither an author's selected publication list nor finite discovery queries exhaust all publications.

## Checked primary sources

| ID | Identity and exact inspected scope | Verification limit / relevance |
|---|---|---|
| RL4-SRC-01 = recheck of RL3-SRC-01 | Martinsson–Steiner, [arXiv 2209.00594v1](https://arxiv.org/html/2209.00594v1): Conjecture 1.2 matches the colorful-set formulation; Theorem 1.3 is F_4 implies R_4. Corollary 1.4: every 5-vertex-critical G and every v admits a K5 model with {v} a branch; every 5-chromatic graph admits one singleton branch. Lemma 3.1: for every 3-connected H and S of size at least four, if S meets both exclusive sides of every order-3 separation and R_4 fails, H with one new vertex adjacent exactly to S is planar. | Checked statements and proof architecture: separator reduction, root distribution, planar extension, coloring contradiction. Full proof not independently reconstructed. No six-color obstruction theorem is supplied. |
| RL4-SRC-02 | Fabila-Monroy–Wood, [Rooted K4-Minors](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v20i2p64/pdf/), Electronic Journal of Combinatorics 20(2), P64, published 2013-06-30. Theorem 15, printed p.10: every graph with four nominated distinct vertices either has their rooted K4 or is a spanning subgraph of a member of classes A–F. Lemma 14 makes the alternatives exclusive. | Primary theorem statement and four-root domain checked; the complete six obstruction-class definitions/proofs were not reconstructed or used as a six-root theorem. Only a provenance check for the rooted-K4 precedent. |
| RL4-SRC-03 | [Kempe Chains and Rooted Minors, arXiv 1911.09998v2](https://arxiv.org/html/1911.09998v2), introduction/property (*) and Theorem 2: K7 lacks property (*). That property universally quantifies over a given proper coloring and transversal and asks to realize the routing graph defined by bichromatic connections as a rooted minor. The source exhibits a 14-vertex seven-terminal construction with complete routing graph. | Negative applies to a routing relaxation with a prescribed transversal, not the CR_6 premise. Optimality and colorfulness over all optimal colorings are not supplied by this theorem. Introduction also warns that a nonoptimal Kempe coloring cannot substitute for chromatic number. Checked statements; construction not independently certified. |
| RL4-SRC-04 = recheck of RL3-SRC-02 | Illingworth–Steiner, [Disproof of the dominating Hadwiger conjecture, arXiv 2609.35361v1](https://arxiv.org/html/2609.35361v1), definition and Theorem 1.3: there is an absolute delta>0 such that every sufficiently large odd m admits an N=16^m graph with alpha<=2 and no dominating model of order ceil((1/2-delta)N). | Checked preprint statement, not independently verified construction. A dominating model requires each vertex of a later branch to have a neighbor in each earlier branch. Ordinary rooted models do not impose this. This negative does not resolve CR_6, ordinary order 6, or ordinary order 7. |

RL4-SRC-01 version identity: the [official abstract/history](https://arxiv.org/abs/2209.00594) lists v1 submitted 2022-09-01 only. The auto-rendered HTML date is 2026-08-24; it is not a new arXiv version. The [author's research page](https://sites.google.com/view/raphael-mario-steiner/research) lists the journal publication as JCTB 164 (2024), pp.1–16. The journal full text was not recovered here. Original Holroyd attribution remains through the checked successor.

## Primary retrieval failures

| Requested resource | Observed result | What remains unverified |
|---|---|---|
| [Holroyd DOI/Wiley](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/S0024609396002159) | Primary-page open returned Internal Error; search returned bibliographic metadata. | Original 1997 full text, theorem numbers and original proof were not inspected. |
| [Holroyd Oxford page](https://academic.oup.com/blms/article/29/2/139/261452) | Open returned Internal Error. | Same full-text gap. |
| [Holroyd Cambridge page](https://www.cambridge.org/core/journals/bulletin-of-the-london-mathematical-society/article/abs/strengthening-hadwigers-conjecture/D0D8F7B1EC28087C472FB6DC38368CBD) | Open returned Internal Error. | Same full-text gap; an abstract/search listing is not direct checking of the proof. |
| [Martinsson–Steiner journal page](https://www.sciencedirect.com/science/article/pii/S0095895623000692) | Open returned Internal Error. | Published-version full-text comparison. Primary arXiv v1 remains the consumed theorem source. |
| [ETH journal-copy download](https://www.research-collection.ethz.ch/bitstreams/783d2bbb-794b-490b-b68d-72bb652e0033/download) | Open returned Internal Error despite indexed theorem snippets. | Published-version full text not recovered. Snippets were not consumed as proof. |

An initial guessed ScienceDirect identifier S0095895623001024 also returned Internal Error. It was not established as this article and is not a source; the later discovered correct identifier is the row above.

## Bounded discovery log

Both available search engines were used, in different batches. Query text is retained so a fresh worker can distinguish a real theorem recovery from a failed status search. Searches were for discovery; mathematical claims rely on opened primary text only.

| Batch | Exact requested queries | Material outcome / limit |
|---|---|---|
| A, stronger engine | Holroyd colorful sets rooted clique minors strong Hadwiger conjecture counterexample six chromatic (730-day recency); "Strengthening Hadwiger" "6" "colorful"; "Holroyd" "conjecture" "counterexample" graph | Recovered the 2022 primary, author listing, original-Holroyd lead and numerous unrelated variants/name collisions. No current CR_6 resolution. The recency query is not a freshness certificate. |
| B, second engine | "Holroyd" "Hadwiger" "disproof"; "colorful set" "Hadwiger" "6"; "Strong Hadwiger" "counterexample"; "rooted K6" obstruction colorful | Mainly unrelated/variant results and inherited leads; no applicable positive or negative theorem recovered. |
| C, stronger engine | "Holroyd" "Hadwiger" "colorful" after:2022-09-01 (1460-day recency); "Strong Hadwiger's conjecture" "disproved"; "colorful" "rooted" "6-chromatic" Hadwiger; "colorful set" "K6" minor | Recovered journal/ETH listings and Kempe-routing primary. Multiple queries returned unrelated results despite restrictive terms; record as retrieval limits, not resolution evidence. |
| D, second engine | "Rooted K4-minors" Fabila Monroy Wood arxiv; "Holroyd" "colorful" graph minor conjecture 2025 2026; "Strengthening Hadwiger's Conjecture" "Holroyd" 1997 pdf | Recovered original-Holroyd publisher leads and the open EJC rooted-K4 primary. Other colorful-minor algorithmic/search collisions were not promoted as proper-coloring results. |
| E, stronger engine | "Holroyd" "Hadwiger" colorful (requested arxiv.org/combinatorics.org/drops.dagstuhl.de domains; 1460-day recency); "Strong Hadwiger" six negative (requested arxiv.org/combinatorics.org domains) | Again returned the old primary and out-of-domain, unrelated Holroyd pages. Requested filtering did not yield reliable cutoff coverage. No inference of openness is drawn. |

The current author page was inspected only for primary publication identity and fresh relevant leads; it is a selected list and its omission of a resolution proves nothing. Full citation-network enumeration, all language variants, all databases, unpublished results, and publications not returned by these queries remain uncovered. No claim of comprehensive discovery through 2026-09-30 is made.

## Preserved obligations

RL3-GAP-01 remains: recover a current primary proof/countermodel or a reliable primary status statement whose exact scope includes CR_6. The 2022 conjecture label alone cannot establish current openness. Original full-text and journal-version retrieval limits above are retained as RL4 access limits, not changes to the sixteen RL2 labels.

OPEN-0005, OPEN-0008 / SRC-0014 / RES-0015, all sixteen inherited unchecked-source limits and RL3-GAP-02 are unchanged. Incidental discovery of the Liu–Luo bibliographic lead was not pursued or consumed; it does not close RL3-GAP-02 or verify the Lin manuscript. The inherited odd/list/subdivision negatives retain their original corpus scopes. No source-gap closure is claimed beyond the exact primary statements inspected above.
