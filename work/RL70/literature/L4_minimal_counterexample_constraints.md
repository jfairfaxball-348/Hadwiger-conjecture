# L4 - Known structural constraints on a minimal counterexample to HC7

Status: WORK IN PROGRESS (RL70 literature map; non-authoritative scratch notes; NOT PROMOTED).
Worker topic: all known structural constraints on k-contraction-critical graphs / minimal
counterexamples to Hadwiger's conjecture, specialised to k = 7.
Date of web reading: 2026-10-06.

Verification tags:

- **VERIFIED-FROM-SOURCE** = statement read this session in the text of the cited paper. Where the
  statement is an older theorem quoted inside a later paper, this is written
  "VERIFIED (as quoted in X)": the quotation in X was read, the original was not opened.
- **RECALLED/SECONDARY** = from memory, a survey remark, a search snippet or an abstract only.
- **NOT-LOCATED** = source could not be opened/located this session.

Conventions: "minimal HC7 counterexample" G means chi(G) = 7, G has no K7 minor, every proper
minor of G is 6-colourable (G is 7-contraction-critical and not K7). n = |V(G)|, e = |E(G)|.
K7^- = K7 minus an edge; K7^= = K7 minus two independent edges; K7^vee = K7 minus two adjacent edges.

WARNING on notation drift: Rolek-Song (JCTB 2017) write "K_p^=" for K_p minus two edges without
saying adjacent/independent; Norin-Totschnig (2025) and Dvorak-Norin-Rahman (2026) use K7^= for
two INDEPENDENT edges and K7^vee for two ADJACENT edges. See Section 9 (discrepancies).

---

## 1. Dirac: contraction-critical graphs, local independence bound

**D1 (Dirac's neighbourhood bound).** If G is k-contraction-critical then for every v,
alpha(G[N(v)]) <= d(v) - k + 2. In particular if G != K_k then delta(G) >= k.

- Original: G. A. Dirac, "Trennende Knotenpunktmengen und Reduzibilitaet abstrakter Graphen mit
  Anwendung auf das Vierfarbenproblem", J. Reine Angew. Math. 204 (1960) 116-131. NOT opened.
- Read in: Rolek-Song-Thomas arXiv:2208.07335v2 Lemma 1.6; Rolek-Song arXiv:1606.05507v3
  Lemma 1.6(i) (they call it "a folklore result which is an extension of Dirac's initial work");
  Norin-Totschnig arXiv:2507.03244v1 Theorem 15 (stated for independent sets in G[N[v]]);
  Dvorak-Norin-Rahman arXiv:2609.17760v1 Theorem 7.3 (includes "if G != K_k then G has minimum
  degree at least k").
- Proof idea (RST): contract v with a maximum independent set of N(v); (k-1)-colour the minor.
- Tag: VERIFIED (as quoted in four later papers).

**D2 (no clique cutset).** No minimal separating set of a k-contraction-critical graph is a clique.

- Read in: Rolek-Song arXiv:1606.05507v3 Lemma 1.6(ii) (attributed to Dirac 1960);
  Lafferty-Liu-Rolek-Yu arXiv:2509.07144v1 p.2 ("Dirac [3] showed that separating sets in a
  contraction-critical graph cannot be a clique").
- Tag: VERIFIED (as quoted).

**D3 (5-connectivity).** Every k-contraction-critical graph is 5-connected for k >= 5.

- Read in: Kawarabayashi-Yu arXiv:2606.01586v2 Introduction; Lafferty-Liu-Rolek-Yu
  arXiv:2509.07144v1 Introduction ("Dirac ... proved that h(k) >= 5 for k >= 5"). Both cite the
  1960 Crelle paper.
- Tag: VERIFIED (as quoted). Superseded for k >= 6 by Mader.

k = 7 specialisation: delta(G) >= 7; a degree-7 vertex has alpha(N(v)) <= 2; a degree-8 vertex has
alpha(N(v)) <= 3; a degree-9 vertex has alpha(N(v)) <= 4.

## 2. Mader: which paper contains what

Three Mader papers are cited in this area. Attribution as found in the reference lists read this
session:

| Paper | Content (as cited) | Where read |
|---|---|---|
| W. Mader, "Homomorphieeigenschaften und mittlere Kantendichte von Graphen", Math. Ann. 174 (1967) 265-268 | Existence of a linear extremal function: for every graph H there is c with e(G) <= c n for H-minor-free G (Seymour survey Thm 3.2 cites [58,59] = this paper and the 178 paper) | Seymour survey (see below), refs 58-59 |
| W. Mader, "Ueber trennende Eckenmengen in homomorphiekritischen Graphen", Math. Ann. 175 (1968) 243-252 | **7-connectivity** of k-contraction-critical graphs, k >= 7; 6-connectivity for k = 6; the lemma "S with |S| <= k, alpha(G[S]) >= |S|-3 does not separate a (k+1)-contraction-critical graph" | RST ref [18]; Rolek-Song ref [15]; Lafferty-Liu-Rolek-Yu ref [10]; Dvorak-Norin-Rahman [Mad68]; Seymour survey ref [60] |
| W. Mader, "Homomorphiesaetze fuer Graphen", Math. Ann. 178 (1968) 154-168 | **Extremal function for K_p minors, p <= 7**: n >= p and e >= (p-2)n - C(p-1,2) + 1 forces a K_p minor (for p = 7: e >= 5n - 14) | RST Thm 1.3 ref [17]; Rolek-Song Thm 2.1 ref [14]; Kawarabayashi-Pedersen-Toft ref [15]; Seymour survey Thm 3.3 ref [59] |

**M1 (Mader 1968, Math. Ann. 175).** Non-complete 6-contraction-critical graphs are 6-connected and
non-complete k-contraction-critical graphs are 7-connected for every k >= 7.

- Read in: Lafferty-Liu-Rolek-Yu arXiv:2509.07144v1 Theorem 1.1; RST arXiv:2208.07335v2 Theorem
  1.8; Rolek-Song arXiv:1606.05507v3 Theorem 1.8; Dvorak-Norin-Rahman arXiv:2609.17760v1 Theorem
  7.1; Seymour, "Hadwiger's conjecture" survey, text after 10.3 ("if G is a minimal counterexample
  to HC(t) then G is 6-connected, and 7-connected if t >= 6", HC(t) = K_{t+1}-minor-free => t-col.).
- Tag: VERIFIED (as quoted in five later sources; German original not opened).
- No improvement for k = 7 is known: Lafferty-Liu-Rolek-Yu state the conjecture h(k) >= k
  "holds for k <= 7 and remains wide open for k >= 8" (Conjecture 1.2 and following sentence).
  So **7-connected is the best known connectivity for a minimal HC7 counterexample, and it is
  also the conjecturally correct value k = 7**.

**M2 (Mader's separating-set lemma, Math. Ann. 175).** If G is (k+1)-contraction-critical, S a
vertex set with |S| <= k and alpha(G[S]) >= |S| - 3, then G - S is connected.

- Read in: Lafferty-Liu-Rolek-Yu arXiv:2509.07144v1 Theorem 1.5 (attributed to Mader 1968 [10]),
  with the remark that Mader observed that replacing |S| <= k by |S| <= k+1 "would imply the Four
  Color Theorem".
- Tag: VERIFIED (as quoted).
- k = 7 reading (k+1 = 7, so k = 6): in a 7-contraction-critical graph no set S with |S| <= 6 and
  alpha(G[S]) >= |S| - 3 separates. (For |S| <= 6 this is already implied by 7-connectivity; the
  lemma is the engine of the proof, not an extra constraint at k = 7.)

**M3 (generalisation, 2025).** Lafferty, Liu, Rolek, Yu, "Connectivity of contraction-critical
graphs", arXiv:2509.07144v1 (8 Sep 2025):
Theorem 1.6: for k >= 1, t >= 3, k >= s + 2^{t-1} - t, if G is k-contraction-critical, |S| <= s and
alpha(G[S]) >= |S| - t then G - S is connected. Corollary 1.7: for t >= 6, k-contraction-critical
graphs are t-connected when k >= 2^{t-4} + 2. Theorem 1.3: 8-connected for k >= 17, 9-connected for
k >= 29, 10-connected for k >= 41.

- Tag: VERIFIED-FROM-SOURCE.
- k = 7 reading: with k = 7, t = 3 the hypothesis is 7 >= s + 1, i.e. s <= 6 (Mader's case). With
  t = 4: 7 >= s + 4, s <= 3. Nothing new at k = 7; **no result gives 8-connectivity for k < 17**.

**M4 (Mader's extremal function, Math. Ann. 178).** For p in {1,...,7}, every graph on n >= p
vertices with at least (p-2)n - C(p-1,2) + 1 edges has a K_p minor.

- Read in: RST arXiv:2208.07335v2 Theorem 1.3; Rolek-Song arXiv:1606.05507v3 Theorem 2.1 (they add:
  first shown by Dirac for p <= 5, by Mader for p = 6, 7); Seymour survey Theorem 3.3.
- Tag: VERIFIED (as quoted).
- k = 7: a K7-minor-free graph has **e <= 5n - 15**. Hence delta <= 9 for a minimal HC7
  counterexample. Tightness for 7-connected graphs: Dvorak-Norin-Rahman arXiv:2609.17760v1 p.3
  note that a 5-connected (n-2)-vertex plane triangulation plus two universal vertices is
  K7-minor-free, 7-connected and has 5n - 15 edges (VERIFIED-FROM-SOURCE), so no density
  improvement is available from 7-connectivity alone.

## 3. Toft: edge connectivity

**T1.** Every k-contraction-critical graph is k-edge-connected.

- Original: B. Toft, "On separating sets of edges in contraction-critical graphs", Math. Ann. 196
  (1972) 129-147. NOT opened.
- Read in: Lafferty-Liu-Rolek-Yu arXiv:2509.07144v1 p.2 ("Toft [15] has shown that any
  k-contraction-critical graph is k-edge-connected"); Kawarabayashi-Yu arXiv:2606.01586v2
  Introduction.
- Tag: VERIFIED (as quoted). At k = 7 this is implied by 7-connectivity.

## 4. Kawarabayashi; Kawarabayashi-Yu; later linear bounds (not binding at k = 7)

**K1 (Kawarabayashi 2007).** Every minimal k-chromatic counterexample to Hadwiger's conjecture is
ceil(2k/27)-connected; every MINIMUM counterexample to HC(t) is ceil((t+1)/3)-connected.

- Paper: K. Kawarabayashi, "On the connectivity of minimum and minimal counterexamples to
  Hadwiger's conjecture", J. Combin. Theory Ser. B 97 (2007) 144-150. NOT opened directly.
- Read in: Kawarabayashi-Yu arXiv:2606.01586v2 Theorem 1 (2k/27 part); Seymour survey Theorem
  10.3 (both parts, in HC(t) indexing: minimal ceil(2(t+1)/27), minimum ceil((t+1)/3)).
- Tag: VERIFIED (as quoted).
- k = 7: ceil(14/27) = 1 and ceil(7/3) = 3. Both weaker than Mader's 7.

**K2 (Kawarabayashi-Yu 2013, and its 2026 correction).**
JCTB 103 (2013) 320-326 claimed ceil(k/9)-connectivity. The same authors posted
arXiv:2606.01586 (v1 1 Jun 2026, v2 4 Jun 2026), same title, whose abstract says the proof
"corrects a gap in the argument of Kawarabayashi-Yu (2013) and establishes the claim stated without
proof in Liu-Rolek-Yu (2019)", and whose Theorem 3 states: every k-chromatic minimal counterexample
to Hadwiger's conjecture is ceil(k/8)-connected. The body says: "in [6], we claimed a proof ... for
|S| = l < k/9. However, we later discovered a gap in the argument, arising from an overly strong
conclusion asserted in Theorem 6."

- Tag: VERIFIED-FROM-SOURCE (arXiv:2606.01586v2 abstract, Theorems 1-3 and surrounding text).
- k = 7: ceil(7/8) = 1. Not binding.

**K3 (Chen-Hu-Song, k/6).** Rolek-Song arXiv:1606.05507v3 p.5 say "Chen, Hu and Song [2] recently
improved the bound further by showing that any minimal such graph is ceil(k/6)-connected", citing
"G. Chen, Z. Hu, F. Song, A new connectivity bound for linkages and its application to the
Hadwiger's conjecture, submitted."

- Tag: RECALLED/SECONDARY (only the citing sentence was read; note that the 2025/2026 papers of
  Yu et al. do NOT list k/6 as established and describe k/9 -> k/8 as the state of the art, so the
  k/6 claim should be treated as unconfirmed). Irrelevant at k = 7.

## 5. Local structure and clique structure for 7-contraction-critical graphs

Everything in 5.1 holds for EVERY non-complete 7-contraction-critical graph with no K7 minor,
i.e. for a minimal HC7 counterexample. Items in 5.2 need an additional excluded minor and do NOT
transfer; they are recorded because they are the closest known results and are easy to mis-cite.

### 5.1 Transferable to a minimal HC7 counterexample

**L1 (clique number).** A 7-contraction-critical graph other than K7 has clique number at most 5
(no K6 subgraph).

- Read in: Dvorak-Norin-Rahman arXiv:2609.17760v1, sentence after Theorem 7.1 ("Theorem 7.1 easily
  implies that a 7-contraction-critical graph G other than K7 has clique number at most five").
  Reason: 7-connected, so G - W is connected and every vertex of a 6-clique W has a neighbour
  outside; contracting G - W gives K7.
- Tag: VERIFIED-FROM-SOURCE. (More generally, the RST argument of Lemma 2.2(c), which uses only
  7-connectivity and Menger, shows no subgraph on at most 7 vertices has a K6 minor; RST state it
  for 8-contraction-critical graphs with no K7 minor. Transfer to k = 7 is by the same proof and
  is a worker remark, not a quoted statement.)

**L2 (7-vertex Ramsey-type lemma).** If H is a 7-vertex graph with alpha(H) <= 2 then H contains
K4 or the Moser spindle as a subgraph.

- Attributed to Kawarabayashi-Toft [Combinatorica 25 (2005) 327-353, Section 2].
- Read in: Dvorak-Norin-Rahman arXiv:2609.17760v1 Theorem 7.4; Norin-Totschnig arXiv:2507.03244v1
  proof of Claim 4.4 ("as shown in [KT05, Section 2], and can be verified using moderately routine
  case analysis").
- Tag: VERIFIED (as quoted). Purely finite statement; trivially machine-checkable.
- Consequence for HC7: for a degree-7 vertex v, G[N(v)] contains K4 (so v lies in a 5-clique) or
  contains the Moser spindle.

**L3 (three 5-cliques through a common pair).** Let G be 7-contraction-critical, |Z| = 2, and
L1, L2, L3 three 5-cliques with L1 n L2 = L2 n L3 = L1 n L3 = Z. Then G has a K7 minor.

- Attributed to Kawarabayashi-Toft 2005, Lemma 3(i).
- Read in: Norin-Totschnig arXiv:2507.03244v1 Lemma 17.
- Tag: VERIFIED (as quoted).

**L4 (three 5-cliques with large union).**
(a) Kawarabayashi-Toft form: G 7-connected, |G| >= 19, three 5-cliques with |L1 u L2 u L3| >= 12
    => K7 minor. Read in RST arXiv:2208.07335v2 Theorem 1.5.
(b) Kawarabayashi-Luo-Niu-Zhang form (European J. Combin. 26 (2005) 293-308): G (k+2)-connected,
    k >= 5, three k-cliques with |L1 u L2 u L3| >= 3k - 3 => K_{k+2} minor. Read in Norin-Totschnig
    arXiv:2507.03244v1 Theorem 18. For k = 5: 7-connected + three 5-cliques with union >= 12
    => K7 minor, with NO lower bound on |G|.
- Tag: VERIFIED (as quoted). NOTE the hypothesis difference (|G| >= 19 in (a), none in (b)).
- Consequence for HC7: any three 5-cliques of a minimal counterexample have union of size <= 11.

**L5 (Rolek-Song Kempe-path lemma).** Let G be k-contraction-critical, k >= 4, x a vertex of degree
k + s with alpha(G[N(x)]) = s + 2, S an independent (s+2)-set in N(x), and M a set of missing
edges of G[N(x) \ S]. Then for each uv in M there is a u-v path P_uv with interior in G \ N[x],
and P_uv, P_wz are vertex-disjoint whenever u, v, w, z are distinct. (General version with "stars"
of missing edges and the size condition r_1 + ... + r_m + m <= k - 2 is Lemma 1.7 of Rolek-Song.)

- Read in: Rolek-Song, "Coloring graphs with forbidden minors", arXiv:1606.05507v3 Lemma 1.7 with
  full proof (JCTB 127 (2017) 14-31); restated as RST arXiv:2208.07335v2 Lemma 1.7.
- Tag: VERIFIED-FROM-SOURCE.
- k = 7, s = 0: for a degree-7 vertex x and a non-edge {a,b} in N(x), every matching of missing
  edges in N(x) \ {a,b} is realised by disjoint paths outside N[x]. This uses no connectivity.

**L6 (Kriesell-Mohr rooted-cycle lemma).** If phi is a proper colouring of G and v_1..v_k are
vertices of pairwise distinct colours with v_i, v_{i+1} Kempe-adjacent for all i (cyclically), then
the subgraph on the colour classes of v_1..v_k contains the k-cycle v_1...v_k as a rooted minor.

- Source: M. Kriesell, S. Mohr, "Kempe chains and rooted minors", arXiv:1911.09998v2 (29 Nov 2022),
  Lemma 2 ("Every cycle has property (*)"), Theorem 4 (every graph on at most four vertices has
  property (*)), Theorem 5 (graphs with at most one cycle), Theorem 7 (5-vertex graphs with at
  most 6 edges), **Theorem 2: K7 does not have property (*)**.
- Tag: VERIFIED-FROM-SOURCE (statements read in the arXiv text; restated as Dvorak-Norin-Rahman
  Theorem 7.5 and Norin-Totschnig Theorem 14).
- Relevance: this is the tool that converts Kempe-adjacency around a degree-7 vertex into rooted
  minors. Its hard limit is recorded by Theorem 2 (K7 fails) - a METHOD BARRIER for pure
  Kempe-chain rooted-minor arguments at exactly k = 7; whether K5 and K6 have property (*) is
  stated there as open ("it must be one of 4, 5, 6").

**L7 (Seymour's list).** In any minimal counterexample to HC(t) [K_{t+1}-minor-free, not
t-colourable]: no vertex has degree <= t; no vertex of degree t+1 has three pairwise nonadjacent
neighbours; there is no one-way clique cutset; G cannot be made planar by deleting t - 4 vertices.

- Read in: P. Seymour, "Hadwiger's conjecture" (survey; in Open Problems in Mathematics, Springer
  2016; author PDF web.math.princeton.edu/~pds/papers/hadwiger/paper.pdf), Section 10, bullets
  before 10.7.
- Tag: VERIFIED-FROM-SOURCE.
- HC7 (t = 6): delta >= 7; a degree-7 vertex has no independent triple of neighbours; no one-way
  clique cutset (a cutset C that can be turned into a clique by contractions on one side);
  G - {x, y} is non-planar for all x, y.

**L8 (not double-critical).** Every double-critical 7-chromatic graph has a K7 minor
(Kawarabayashi, Pedersen, Toft, "Double-critical graphs and complete minors", Electron. J. Combin.
17 (2010) #R87, Theorem 7.1; also Theorem 5.1: non-complete double-critical k-chromatic graphs are
6-connected; Proposition 3.9: minimum degree >= k+1; Theorem 3.1: no two vertices of degree k+1
are adjacent).

- Tag: VERIFIED-FROM-SOURCE.
- Consequence: a minimal HC7 counterexample has an edge xy with chi(G - x - y) = 6 (it is not
  double-critical). The local results of that paper concern double-critical graphs only.

### 5.2 NOT transferable (need a further excluded minor) - closest known results

**N1 (Dvorak-Norin-Rahman 2026).** arXiv:2609.17760v1 (15 Sep 2026), "Every graph with no K7^=
minor is 6-colorable". For a 7-contraction-critical **K7^- -minor-free** graph G:
Lemma 7.2 no K6^- subgraph; Lemma 7.6 every degree-7 vertex lies in a 5-clique; Lemma 7.7 G has at
most one 5-clique; Theorem 1.6: G is 7-connected and e >= 4n - 2 (at most five degree-7 vertices).
Theorem 1.3: every 5-connected graph with n >= 6 and e >= 4n - 7 has a K7^= minor.
Conjecture 1.5: every 5-connected graph with n >= 6 and e >= 4n - 2 has a K7^- minor (would give
6-colourability of K7^- -minor-free graphs via Theorem 1.6).

- Tag: VERIFIED-FROM-SOURCE.
- Why it does not transfer: each contradiction is a K7^- minor, not a K7 minor. The authors state
  that the density analogue "is false for K7-minor-free graphs" (triangulation + 2 apices, 5n-15
  edges, 7-connected) and that the final step "would be substantially more difficult".

**N2 (Norin-Totschnig 2025).** arXiv:2507.03244v1, "Every graph with no K7^vee-minor is
6-colorable". For a minimal counterexample (K7^vee-minor-free): Claim 4.2 no K6^vee subgraph;
Claim 4.3 at least 18 vertices of degree 7; Claim 4.4 every degree-7 vertex lies in a 5-clique
inside N[v]; Claims 4.6-4.10 on intersections of 5-cliques. Theorem 6: every 4-connected graph with
e >= 4n - 8 has a K7^vee minor unless it is K_{2,2,2,2}.

- Tag: VERIFIED-FROM-SOURCE (pypdf text, superscripts checked).
- Why it does not transfer: Claim 4.4's contradiction is "a minor of G which induces K7^vee".

**N3 (Kawarabayashi-Toft 2005).** Every 7-chromatic graph has K7 or K4,4 as a minor. The proof
uses Jorgensen's bound for K4,4 (4-connected, e >= 4n - 7 => K4,4 minor unless K7; as quoted in
Norin-Totschnig Theorem 5) to get many degree-7 vertices. The degree-7 counting needs
K4,4-minor-freeness; only L2, L3, L4(a) above are the parts independent of it.

- Tag: main theorem VERIFIED (as quoted in several papers read); the body of the Combinatorica
  paper was NOT opened (paywalled).

**N4 (Rolek-Song-Thomas, 8-contraction-critical).** arXiv:2208.07335v2 (European J. Combin. 110
(2023) 103711 per publisher listing - RECALLED/SECONDARY for the journal reference). For an
8-contraction-critical graph with no K7 minor: Theorem 1.2 (i) 8 <= delta <= 9; (ii) n_8 <= 1 and
n_9 >= 30 - 2 n_8 >= 28; (iii) each 9-vertex v has a 5-clique in G[N[v]] or alpha(G[N(v)]) = 3 and
1 <= delta(G[N(v)]) <= 4. Lemma 2.2(c): no subgraph on <= 7 vertices has a K6 minor; (d): N(v) of
an 8-vertex contains two disjoint 4-cliques. Lemma 2.4: two 5-cliques sharing exactly three
vertices force K7.

- Tag: VERIFIED-FROM-SOURCE.
- Why it does not transfer: this is about chi = 8 with no K7 minor (the "7-colourability of
  K7-minor-free graphs" problem), one colour above HC7. Lemma 2.4's proof uses chi(G) = 8 (if
  G minus the 3 common vertices were planar then chi(G) <= 7). **There is no published analogue
  "properties of 7-contraction-critical graphs with no K7 minor" giving a bound on the number of
  degree-7 vertices** - see Section 8.

(Sections 6-10 follow below.)
