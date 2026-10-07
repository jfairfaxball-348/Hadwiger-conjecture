# L5 — Hadwiger's conjecture for independence number 2, and small-order verifications

Status: WORK IN PROGRESS (RL70 literature phase, non-authoritative scratch notes; NOT PROMOTED).
Session date: 2026-10-06. Worker: literature subagent L5.

Conventions. VERIFIED = statement read in the source text this session (source given).
RECALLED/SECONDARY = from memory, a survey, or a search snippet; not upgraded.
`had`/`h` = Hadwiger number, `alpha` = independence number, `omega` = clique number,
`mu` = matching number, `Gbar` = complement.

## 0. Headline answers (provisional; see sections below for sources)

(a) Every graph G with alpha(G) <= 2 on n vertices has a K_{ceil(n/2)} minor for all n <= 30 and for n = 32;
    a *minimal* counterexample to HC restricted to alpha <= 2 has 31 or >= 33 vertices
    (Carter, arXiv:2211.00259, Corollary 1; VERIFIED). n = 13 and n = 14 are covered WITHOUT computer:
    R(3,4) = 9 forces omega >= 4 = ceil((13+3)/4) = ceil(14/4), and Chudnovsky-Seymour "Packing seagulls" 1.3 applies.
    Hence HC7 restricted to alpha <= 2 is established (proof, not computer) — see section 3 for the exact chain.

## 1. Chudnovsky-Seymour, Packing seagulls (Combinatorica 32 (2012) 251-282)

Source read: author PDF https://web.math.princeton.edu/~pds/papers/seagulls/paper.pdf
("October 4, 2008; revised November 9, 2016"). VERIFIED (symbols alpha, >=, ceil lost in text extraction but unambiguous).

- 1.1 Conjecture: G with alpha(G) <= 2, t = ceil(|V(G)|/2); then G contains K_t as a minor.
  Remark in source: if 1.1 holds for all alpha <= 2 graphs then HC holds for these graphs (they cite PST for the proof).
- 1.2 (Blasiak): alpha <= 2, |V(G)| EVEN; if V(G) is the union of three cliques, or there is a list of k cliques with
  every vertex in strictly more than k/3 of them, then G satisfies 1.1 and its matching version.
- 1.3: "Let G be a graph with alpha(G) <= 2, and let t = ceil(|V(G)|/2). If some clique in G has cardinality at least
  |V(G)|/4, and at least (|V(G)|+3)/4 if |V(G)| is odd, then G has a K_t minor."
- 1.4 (several authors, see PST): alpha <= 2, t = ceil(n/2); if G is not t-connected then G satisfies 1.1 and its matching version.
- 1.5: alpha <= 2, t-connected, largest clique Z with (3/2)ceil(n/2) - n/2 <= |Z| <= t; then t-|Z| disjoint seagulls in V(G)\Z; K_t minor.
- 1.6 (main theorem): alpha <= 2, k >= 0, G not the five-wheel if k = 2. G has k pairwise disjoint seagulls iff
  |V(G)| >= 3k; G is k-connected; every clique has capacity >= k; G has an antimatching of cardinality k.

## 2. Carter, "Hadwiger's Conjecture with Certain Forbidden Induced Subgraphs", arXiv:2211.00259

Source read: ar5iv HTML https://ar5iv.labs.arxiv.org/html/2211.00259. VERIFIED.

- Theorem 1 (prior results as stated by Carter): HC-{K3bar, H} holds for H any graph on five vertices, or H_6, H_7
  [PST03, Kri10], or W_5, complement of K_{1,5}, or K_7 [Bos19].
- Lemma 1 [PST03]: a minimal counterexample to HC-{K3bar} has no dominating edge. ("minimal" = no proper induced subgraph is a counterexample.)
- Lemma 2 [CS12] as stated by Carter: K3bar-free G with omega >= ceil(|G|/4) (|G| even) or ceil((|G|+3)/4) (|G| odd) has h(G) >= chi(G).
  CAUTION: Costa-Luu-Wood-Yip (section 4 below) point out this is a misstatement: the seagull theorem gives h >= |V|/2,
  not h >= chi, for a general graph. For MINIMAL counterexamples (n = 2 chi - 1) the two coincide, so Carter's corollary survives.
- Theorem 2: HC-{K3bar, H} holds for 33 graphs H'_1..H'_33 on 7, 8, 9 vertices (computer-assisted).
- Theorem 3: "HC-{K3bar, K8} holds."
- Corollary 1: "A minimal counterexample to HC-{K3bar} has either 31 vertices or at least 33 vertices."
  Proof in source: by Thm 3 a minimal counterexample contains K8; fewer than 31 vertices or exactly 32 -> Lemma 2 applies.
- Text before Theorem 3: "all graphs with 26 or fewer vertices have large enough clique number to satisfy the hypothesis of
  Lemma 2 due to the exact known values of the Ramsey numbers R(3,k) with k <= 7"; R(3,8) = 28; there are 477142
  {K3bar,K8}-free graphs on 27 vertices [BGSP12 = Brinkmann-Goedgebeur-Schlage-Puchta].
- Appendix C, Proposition 2: of the 477142 graphs, 455344 have a dominating edge and the remaining 21798 have a connected
  dominating matching of two edges; code k8.py at github.com/dcartermath/hc-forbidden-subgraphs (NetworkX 2.8.3 + igraph;
  graph file from McKay's Ramsey page). Theorem 3 follows from Prop. 2 + Lemma 12 [PST03: minimal counterexample has no
  connected dominating matching] + HC-{K3bar,K7}. Source also says: HC-{K3bar,K7} "implies ... that any counterexample to
  HC-{K3bar} has at least 27 vertices."

## 3. Bosse, "A note on Hadwiger's Conjecture for W5-free graphs with independence number two", arXiv:1901.06985 (Discrete Math. 2019)

Source read: ar5iv HTML https://ar5iv.labs.arxiv.org/html/1901.06985 (full text). VERIFIED.

- Thm 1.2 (attributed to PST): alpha(G) = 2: h(G) >= chi(G) iff h(G) >= ceil(|G|/2). [CLWY: per-graph "iff" is a misreading of PST; true at the level of the class / minimal counterexamples.]
- Thm 1.3 (PST): alpha <= 2 and H-free with |H| = 4, alpha(H) <= 2, or H = C5, or H = H7 => h >= chi.
- Thm 1.4 (Kriesell 2010): alpha <= 2 and H-free with |H| = 5, alpha(H) <= 2, or H = H6 => h >= chi.
- Thm 1.5 (Bosse): alpha <= 2 and W5-free => h >= chi. Cor 1.8: alpha <= 2 and co-K_{1,5}-free => h >= chi.
- Thm 1.6 (CS as quoted): alpha <= 2, omega >= |G|/4 (even) or (|G|+3)/4 (odd) => h >= chi. [same caveat]
- Remark 1.7 (verbatim): "Let G be a K_t-free graph with alpha(G) <= 2, where t <= 7. Then h(G) >= chi(G)."
  Argument in source: K6-free counterexample would have n <= 17 (R(3,6) = 18) and contain K5; K7-free counterexample
  n <= 22 (R(3,7) = 23) and contain K6; then CS applies. Pure proof, no computer.
- Also quoted there: Song-Thomas 2017 (SIAM J. Discrete Math. 31, 1572-1580): alpha(G) >= 3 and
  {C4, C5, ..., C_{2 alpha(G) - 1}}-free => h(G) >= chi(G).

## 4. Costa, Luu, Wood, Yip, "Verifying Hadwiger's Conjecture for Examples of Graphs with alpha(G) = 2", arXiv:2512.17114v1 (Dec 2025)

Source read: arXiv HTML https://arxiv.org/html/2512.17114v1 (sections 1-2.3). VERIFIED. This is the best current survey of the alpha = 2 case.

- Lemma 2.1: alpha(G) = 2 => chi(G) = |V(G)| - mu(Gbar).
- Thm 2.2 (Gallai): every vertex-critical G with |V(G)| < 2 chi(G) - 1 is decomposable (complement disconnected).
- Lemma 2.3 (= PST Thm 3.3): alpha = 2 => had(G) >= (omega(G) + |V(G)|)/3; and if |V(G)| >= 2k-1 and omega(G) >= k-2 then had(G) >= k.
- Thm 2.6 (= PST Thm 3.4): connected G, alpha = 2, kappa(G) <= |V(G)|/2 => non-empty connected dominating matching.
- Thm 2.8 + Table 1: properties of a minimal (induced-subgraph-minimal) / minimum (order-minimum) counterexample G to HC_{alpha=2}:
  (1) chi-vertex-critical; (2) not decomposable; (3) |V(G)| = 2 chi(G) - 1; (4) G-x-y is (chi-1)-critical for every non-edge xy;
  (5) Gbar - v has a perfect matching for all v (Gbar factor-critical); (6) no non-empty connected dominating matching;
  (7) alpha(G - xy) = 3 for every edge xy; (8) kappa >= chi; (9) delta >= chi; (10) Hamiltonian; (11) G - v has a perfect matching;
  (12) diam(Gbar) = 2; (13) non-adjacent x,y have a common neighbour; (14),(15) local structure; (16) every non-adjacent pair lies in an induced C5;
  (17) chi(G) >= 7 [from Robertson-Seymour-Thomas only]; (18) kappa >= 7; (19) omega(G) <= chi(G) - 3; (20) delta >= chi + 1;
  (21) for a non-edge xy: 2 <= |N(x)\N(y)|, |N(y)\N(x)| <= chi - 4 and 5 <= |N(x) cap N(y)| <= 2 chi - 7;
  minimum only: (22) chi(G - xy) < chi(G) for every edge; (23) every proper minor has smaller chi.
  NOTE: Table 1 records only chi >= 7; it does NOT fold in Carter's Corollary 1 (>= 31 vertices, i.e. chi >= 16). See section 6.
- Section 2.2: all known HC_{alpha=2}-unavoidable induced-maximal graphs: Carter's H_1..H_33, B_7 (PST's seven-vertex graph), K_8 (Carter),
  and co-K_{1,6} (Zhou and Li [66]). "It is not known if every graph on six vertices is ... unavoidable."
- Thm 2.16 = CS main theorem; Thm 2.17 = CS 1.3 in the form had(G) >= |V(G)|/2 (i.e. HC_{n/2}).
  The paper states that Bosse Thm 1.6, Carter Lemma 2, and Zhou-Li Thm 2.2 "wrongly conclude" HC_{alpha=2} instead of HC_{n/2}
  for the individual graph; and likewise that [11, Thm 1.2], [66, Thm 1.3] misread the PST equivalence.
- Conjecture 10 (CDM): every connected alpha = 2 graph has a non-empty connected dominating matching;
  "We have computationally verified Conjecture 10 (CDM) for all graphs up to 11 vertices."
  CDM => SHC_{alpha=2} (Seymour's strengthening, branch sets of size <= 2) => HC_{alpha=2} (their Thm 2.10).
- Cambie [13]: HC_{alpha=2} implies the Furedi-Gyarfas-Simonyi 4t-1 connected-matching conjecture (as cited there).

## 5. Scully and Song, "Dominating Hadwiger's Conjecture for graphs G with alpha(G) = 2", arXiv:2510.12564v2

Source read: arXiv HTML (abstract, Thm 1.6-Cor 1.10). VERIFIED.

- Thm 1.6: n-vertex G with alpha <= 2 and 2 omega(G) >= ceil(n/2) + 1 has h_d(G) >= ceil(n/2) (dominating K minor; a dominating
  K_t minor is in particular a K_t minor). Proof uses Chudnovsky-Seymour seagull packing.
- Cor 1.7: alpha <= 2 and omega(G) <= 6 => h_d(G) >= ceil(n/2) (uses R(3, omega+1) <= 4 omega - 1 for omega <= 6).
- Cor 1.8 (verbatim): "Let G be a graph on n vertices with alpha(G) <= 2. If n <= 26, then h_d(G) >= ceil(n/2)."
  This is an explicit, computer-free small-order statement; it implies had(G) >= ceil(n/2) for all alpha <= 2 graphs on n <= 26 vertices.
- Thm 1.9 / Cor 1.10: dominating version for H-free alpha <= 2 graphs, H in a list including W5, K7, K7^-, K7^<, and all H != K2 u K3 on <= 5 vertices.
- Thm 1.3 (Song-Tibbetts, cited): every 2K2-free graph satisfies h_d(G) >= chi(G).

(to be continued)
