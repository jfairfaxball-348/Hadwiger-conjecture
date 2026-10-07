# L6 — Recency sweep 2023–2026: Hadwiger at small t, clique-minus-edges minors, contraction-critical graphs, computer/AI-assisted results

Status: WORK IN PROGRESS (partial save 1). Non-authoritative scratch literature notes for RL70.
Worker date: 2026-10-06. Nothing here is promoted; nothing here is new mathematics.

Verification labels used below:

- **VERIFIED-FROM-SOURCE** = read this session in the source itself (arXiv abs page, arXiv HTML/PDF text, journal page).
- **RECALLED/SECONDARY** = from model memory, a survey, a search-engine snippet, or another paper's citation of it.
- **NOT-LOCATED** = searched for, not found / id did not resolve.

Caveat on tooling: most pages were read through a fetch tool that summarises pages with a small model. Where an
exact statement is load-bearing I either read raw extracted text (pdftotext of the arXiv PDF, raw abs-page text
returned by a second fetch tool) or say so. Items read only via the summarising fetch are marked "(via summarising fetch)".

---

## 0. Headline: what is newer than arXiv:2609.17760 (15 Sep 2026)

| arXiv id | Date | Authors | Title | Supersedes F1 (2609.17760)? |
|---|---|---|---|---|
| 2609.26041 | 22 Sep 2026 (v1) | Caibing Chang, Zijian Deng, Qinfei Tang, Caihong Yang | A sharp density bound for 5-connected graphs with no K7^= minor | **Sharpens F1's density theorem** (4n-7 -> 4n-9, settles F1 Conj. 1.4). Does NOT change the colouring frontier: still K7^= / K7^vee; K7^- remains open. |
| 2610.05291 | 4 Oct 2026 (v1) | Sergey Norin, Raphael Steiner | A Proof of the Linear Hadwiger Conjecture | No (asymptotic: K_t-minor-free => Ct-colourable for an unspecified absolute C). Not a t=7 result. |
| 2609.35361 | Sep 2026 | Illingworth, Steiner | Disproof of the dominating Hadwiger conjecture | No (a strengthening of HC is false; irrelevant to HC7 truth, but see §5). |

As of 2026-10-06 I found **no** arXiv item claiming "every K7^- -minor-free graph is 6-colourable", and none claiming HC7.
(Searches performed: arXiv full-text-search "Hadwiger" sorted by announce date; arXiv search `"K_7" minor` sorted by date;
general web searches listed in §9.)

---

## 1. The two-edge-deficient frontier (t = 7)

### 1.1 Dvořák–Norin–Rahman, arXiv:2609.17760v1 (15 Sep 2026; manuscript dated 23 August 2026), 35 pp. — VERIFIED-FROM-SOURCE (pdftotext of arXiv PDF, read this session)

Notation in the paper: K_k^- = K_k minus one edge; K_k^vee = minus two edges at a common vertex; K_k^= = minus two independent edges.

- **Theorem 1.1.** "Every K7^=-minor-free graph is 6-colorable."
- **Theorem 1.2 (Norin–Totschnig [NT25]).** Let G be a 4-connected graph not isomorphic to K_{2,2,2,2}. If G has n >= 5 vertices
  and at least 4n-8 edges, then it contains K7^vee as a minor.
- Counterexample to the K7^= analogue of 1.2 under 4-connectivity (stated in the intro): an arbitrarily large matching plus four
  universal vertices is 4-connected, average degree close to 9, with no K7^= minor.
- **Theorem 1.3.** Every 5-connected graph with n >= 6 vertices and at least 4n-7 edges contains K7^= as a minor.
- Near-tightness examples (intro): universal vertex + 5-connected plane triangulation on n-1 vertices gives a 6-connected
  K7^=-minor-free graph with 4n-10 edges; K6 is K7^=-minor-free with 15 = 4n-9 edges.
- **Conjecture 1.4.** Every 5-connected graph with n >= 7 vertices and at least 4n-9 edges contains K7^= as a minor.
  (Now claimed proved: see 1.3 below.)
- **Conjecture 1.5.** Every 5-connected graph with n >= 6 vertices and at least 4n-2 edges contains K7^- as a minor.
  Authors' remark: "likely even with 2 replaced by a slightly larger constant"; they say there is no apparent
  fundamental obstruction to running their approach for K7^-.
- **Theorem 1.6.** Let G be a K7^- -minor-free graph of chromatic number at least seven. If every proper minor of G is
  6-colourable, then G is 7-connected and |E(G)| >= 4|V(G)| - 2. (The inequality sign was lost in my pdftotext output; ">="
  is fixed by the proof of Thm 1.1 at the end of §7, which combines 1.6 with 1.3, and by the arXiv HTML rendering.)
- Consequence stated by the authors: Conjecture 1.5 + Theorem 1.6 => every K7^- -minor-free graph is 6-colourable.
- **Barrier stated by the authors for the last step K7^- -> K7:** graphs obtained from 5-connected (n-2)-vertex plane
  triangulations by adding two universal vertices are K7-minor-free, 7-connected, and have 5n-15 edges; so no
  density theorem of the 1.3 type exists for K7 itself.
- Dependency: the proof "is heavily influenced by" and applies Dvořák [Dvo26] = arXiv:2609.13818 (rooted K5 minors).
- §1.1 "AI usage": main ideas/statements from the authors; "AI was used to obtain the proofs of these results based on an
  outline"; several lemmas (3.2, 4.5, 4.9, weak form of 6.4, idea of 6.6) originated with the AI; AI wrote the initial
  write-up, which the authors heavily edited. No AI system is named in the lines I read.
- Reference list of the paper (complete, 13 items): [AG18] Albar–Gonçalves JGT 88 (2018); [Dir60] Dirac; [Dvo26] arXiv:2609.13818;
  [FMW13] Fabila-Monroy–Wood, Rooted K4-minors, EJC 20(2) P64; [Had43]; [Jak71a] Jakobsen, Studia Sci. Math. Hungar. 6 (1971)
  151–160; [Jak71b] Jakobsen, Aarhus preprint 22 (1970/71); [KM19] Kriesell–Mohr, Kempe chains and rooted minors, arXiv:1911.09998;
  [KT05] Kawarabayashi–Toft, Combinatorica 25 (2005); [Mad68] Mader, Math. Ann. 175 (1968); [NT25] arXiv:2507.03244; [RST93]; [Wag37].
  No computer search is cited.

### 1.2 Dvořák, "Extremal function for rooted K5 minors", arXiv:2609.13818v1 (12 Sep 2026), 85 pp., 6 figs — VERIFIED-FROM-SOURCE (abs page, via summarising fetch)

Abstract: if an n-vertex 5-connected graph has at least 4n-10 edges then for any five of its vertices one can contract
disjoint connected subgraphs containing them to get K5 (a rooted K5 minor); the edge bound is best possible.
Relevance: this is the engine behind F1's Theorem 1.3 and a ready-made **tool** for handling 5-separations (rooted K5 across a 5-cut).

### 1.3 Chang–Deng–Tang–Yang, "A sharp density bound for 5-connected graphs with no K7^= minor", arXiv:2609.26041v1 (22 Sep 2026) — VERIFIED-FROM-SOURCE (raw abs-page text)

Abstract claims:
- every 5-connected graph on n >= 7 vertices with at least 4n-9 edges contains a K7^= minor, "settling Conjecture 1.4" of
  arXiv:2609.17760v1; "The bound is sharp."
- stronger statement: every "4-bilight" graph on n >= 4 vertices with at least 4n-9 edges contains a K7^= minor or a K6 subgraph;
- strengthened rooted-minor theorem: every "4-light" 5-rooted graph of rooted 4-density at least two has a model with two
  non-root vertices and at most one missing edge incident with them.
Status: unrefereed preprint, one week after F1.
Relevance to HC7: **pre-empts** any attempt to sharpen F1's constant for K7^=; it does **not** address Conjecture 1.5 (K7^-) in the abstract.

#### 1.3a Body of arXiv:2609.26041v1 (pdftotext of the arXiv PDF; intro, AI declaration, references read) — VERIFIED-FROM-SOURCE

- **Theorem 1.1.** Every 5-connected graph G with n >= 7 vertices and e(G) >= 4n-9 contains K7^= as a minor.
- Definition (taken, they say, from F1): for nonempty Y, boundary ∂Y = N(Y) \ Y and rho_4(G,Y) = e(G[Y]) + e(Y, ∂Y) - 4|Y|.
  G is **4-bilight** if there are no disjoint, nonadjacent, nonempty Y, Z with |∂Y|, |∂Z| <= 4 and rho_4(G,Y) > 0, rho_4(G,Z) > 0.
  Every 5-connected graph is 4-bilight.
- **Theorem 1.2.** A 4-bilight graph with n >= 4 vertices and at least 4n-9 edges contains K7^= as a minor or K6 as a subgraph.
- **Theorem 1.3.** Every 4-bilight graph with n >= 3 vertices and at least 4n-8 edges contains K7^= as a minor.
- Derivation 1.2 => 1.1 (in the paper): a K6 subgraph C plus a component U of G-C with |N(U) ∩ C| >= 5 gives a K7^- minor, which contains K7^=.
- Sharpness: G_l = P3 ∨ C_l (join), l >= 4: n = l+3, e = 4n-10, 5-connected, apex-over-planar hence no K6 minor, hence no K7^= minor.
  Necessity of the K6 exception in 1.2: F_t = K4 ∨ (K2 ⊔ tK1), n = t+6, e = 4n-9, 4-bilight, no K7^= minor.
- Background recalled there: Jakobsen's extremal theorem "in the formulation recalled by Rolek" (J. Graph Theory 94 (2020) 206–223):
  every graph on n >= 6 vertices with at least 4n-9 edges contains K7^= or K7^vee as a minor or is a (K6,3)-cockade. (SECONDARY for Jakobsen — quoted from this preprint, not from Jakobsen/Rolek.)
- AI declaration (end of paper): "OpenAI Codex contributed ideas and suggested a proof strategy for Theorem 3.3"; also used for editing and
  diagram code (captions say "OpenAI Codex (GPT-6)"); authors state they checked all results and proofs.
- The paper says **nothing** about a K7^- density theorem, Conjecture 1.5 of F1, or colouring. Its 10 references are: Dvořák 2609.13818; DNR 2609.17760;
  Fabila-Monroy–Wood; Jørgensen "Contractions to K8" (JGT 18 (1994)); Mader 1968 (Math. Ann. 178); Norin–Totschnig; Rolek "The extremal function for
  K9^= minors" (JGT 94 (2020)); Song "The extremal function for K8^- minors" (JCTB 95 (2005)); Song–Thomas K9 (JCTB 96 (2006)); Thomason (JCTB 81 (2001)).
- Observation for RL70 (not a claim of the paper): the response time from F1 (15 Sep) to this sharpening (22 Sep) was **one week**, with AI assistance on
  both sides. Conjecture 1.5 of F1 (K7^-, 5-connected, 4n-2 edges) is an explicitly advertised, apparently unobstructed target; it should be assumed
  to be under active attack by several groups.

### 1.4 Norin–Totschnig, "Every graph with no K7^vee-minor is 6-colorable", arXiv:2507.03244v1 (4 Jul 2025) — VERIFIED-FROM-SOURCE (abs page; density theorem as quoted in F1 Thm 1.2)

Abstract: graphs with no K7^vee minor (K7 minus two edges sharing an endpoint) are 6-colourable.
Talk record: A. Totschnig, "Colouring graphs with forbidden 7-vertex minors", Waterloo Graphs & Matroids seminar,
23 Feb 2026 — abstract mentions only the K7^vee result and "a new edge-extremal bound" (VERIFIED-FROM-SOURCE, seminar page).

---

## 2. Other verified 2025–2026 items (first pass — details to be extended)

- **Norin–Steiner, arXiv:2610.05291v1 (4 Oct 2026), "A Proof of the Linear Hadwiger Conjecture"** — VERIFIED-FROM-SOURCE (raw abs-page text).
  Abstract, in full: there exists C in N such that K_t-minor-free graphs are Ct-colourable; "The proof was found by GPT-6 Astra,
  following the directions by the authors." Two days old at time of writing; unrefereed; C not specified in the abstract.
- **Kawarabayashi–Yu, arXiv:2606.01586v2 (1/4 Jun 2026)**, "Connectivities for k-knitted graphs and for minimal counterexamples to
  Hadwiger's Conjecture" — VERIFIED-FROM-SOURCE (abs page, via summarising fetch). Every 8l-connected graph is l-knitted; minimal
  counterexamples to HC(k) have connectivity >= ceil(k/8) (previous: ceil(2k/27)). Comments field: corrects a gap in
  Kawarabayashi–Yu (2013) and proves a claim stated without proof in Liu–Rolek–Yu (2019). For k = 7 this is far weaker than Mader's 7-connectivity.
- **Lafferty–Liu–Rolek–Yu, arXiv:2509.07144v1 (8 Sep 2025)**, "Connectivity of contraction-critical graphs" — VERIFIED-FROM-SOURCE
  (abs page, via summarising fetch). k-contraction-critical graphs are 8-connected for k >= 17, 9-connected for k >= 29,
  10-connected for k >= 41; also every 30-connected graph has a certain linkage property. **Nothing new for k = 7** (Mader's
  7-connectivity for k >= 7 is still the state of the art at k = 7).
- **Lin, arXiv:2609.08713v1 (8 Sep 2026)**, "Coloring Small K_t-Minor-Free Graphs", 8 pp. — VERIFIED-FROM-SOURCE (abs page). Asymptotic:
  improves Delcourt–Postle O(t log log t) to O(t sqrt(log log t)). Not a small-t result despite the title.
- **Girão–Norin–Tamitegama–Tan, arXiv:2608.12126v1 (12 Aug 2026)**, "Two Relaxations of the Dominating Hadwiger's Conjecture" —
  VERIFIED-FROM-SOURCE (abs page). Average degree C t (log t)^2 forces a dominating K_t-model; defective-colouring relaxation.

(continued in later saves)
