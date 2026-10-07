# L1 — Frontier preprints F1, F2 and [Dvo26], read in depth

Non-authoritative RL70 literature note (work/RL70/literature). Written 2026-10-06.
STATUS: sections 0–7 complete; section 8 (follow-ups) = search results as of 2026-10-06.

Verification labels used below:
- **VFS** = VERIFIED-FROM-SOURCE: I read the statement in the source text this session. Method: the
  arXiv HTML full text (arxiv.org/html/<id>v1; for [KM19] the ar5iv render) was loaded in a browser
  and the raw text extracted with the LaTeXML `alttext` of every formula, so statements were read in
  the paper body, not from abstracts or an LLM summary.
- **R/S** = RECALLED/SECONDARY: from memory, a survey, an abstract-level summary, or a search snippet.
- **MY CHECK** = my own verification of a proof step (reasoning or a small script); not a source claim.
- Statements are restated in my own notation (precise paraphrase, all hypotheses kept); they are not
  verbatim quotations unless inside quotation marks.

Notation: K7^- = K7 minus an edge; K7^= = K7 minus two independent edges; K7^vee = K7 minus two
edges with a common end. "k-contraction-critical" = chromatic number k and every proper minor
(k-1)-colourable.

---

## 0. Identity of the three preprints (all three ids RESOLVE) — VFS (arXiv abs pages + HTML)

| key | arXiv id | title | authors | versions (as listed 2026-10-06) | size |
|---|---|---|---|---|---|
| F1 | 2609.17760 | Every graph with no K_7^= minor is 6-colorable | Zdenek Dvorak (Charles Univ.), Sergey Norin (McGill), Neil Rahman (McGill) | v1 only, Tue 15 Sep 2026 19:10:20 UTC | 35 pp, 0 figures; math.CO; MSC 05C15 (05C35, 05C83) |
| F2 | 2507.03244 | Every graph with no K_7^vee-minor is 6-colorable | Sergey Norin, Agnes Totschnig (McGill) | v1 only, Fri 4 Jul 2025 01:34:26 UTC | 22 KB; math.CO |
| Dvo26 | 2609.13818 | Extremal function for rooted K_5 minors | Zdenek Dvorak | v1 only, Sat 12 Sep 2026 09:03:04 UTC | 85 pp, 6 figures; math.CO |

- F1 manuscript date printed in the paper body: 23 August 2026 (arXiv submission 15 Sep 2026).
- F1 abstract (paraphrase): the first open case of Hadwiger is that K7-minor-free graphs are
  6-colourable; this is proved for K7^=-minor-free graphs; the proof rests on a density result:
  every 5-connected K7^=-minor-free graph with n >= 6 vertices has at most 4n-8 edges.
- F2 abstract (paraphrase): every graph with no K7^vee minor is 6-colourable.
- Dvo26 abstract (paraphrase): an n-vertex 5-connected graph with at least 4n-10 edges has, for
  every choice of five of its vertices, a K5 minor rooted at them; the edge bound is best possible.
- All three are arXiv preprints; no journal reference is shown on any of the three abs pages.

---

## 1. F1 — main statements (Sections 1 and 2) — all VFS

Section list of F1: 1 Introduction and main result (1.1 AI usage); 2 Preliminaries;
3 Reducible (<=4)-fragments; 4 Vampires and K_{2,down 5}'s; 5 Restricting the separations;
6 Density of K7^=-minor-free graphs; 7 6-colorability of K7^=-minor-free graphs; References (14 items).

- **Thm 1.1 (F1).** Every K7^=-minor-free graph is 6-colourable.
- **Thm 1.2 (cited from Norin–Totschnig [NT25] = F2 Theorem 6).** G 4-connected, G not isomorphic to
  K_{2,2,2,2}, n >= 5 vertices and |E| >= 4n-8  ==>  G has a K7^vee minor.
- **Thm 1.3 (F1, main technical result).** Every 5-connected graph with n >= 6 vertices and
  |E| >= 4n-7 has a K7^= minor.
- **Conj 1.4 (F1).** Every 5-connected graph with n >= 7 vertices and |E| >= 4n-9 has a K7^= minor.
  (Same as F2 Conj 20 up to how the K6 exception is phrased.)
- **Conj 1.5 (F1).** Every 5-connected graph with n >= 6 vertices and |E| >= 4n-2 has a K7^- minor.
  The authors add that they believe it likely holds even with the 2 replaced by a slightly larger
  constant (i.e. under a weaker edge hypothesis 4n-c, c>2; no value of c is proposed).
- **Thm 1.6 (F1).** G K7^- -minor-free, chi(G) >= 7, every proper minor 6-colourable
  ==> G is 7-connected and |E(G)| >= 4|V(G)| - 2.
- **Thm 2.6 (cited: Dvorak [Dvo26, Theorem 4]).** Every 4-light 5-rooted graph G is
  T_{rho_4(G)}-universal, where the "t-target" classes are
  T_t = S_{5,0} (t<=0), S_{5,1} (t=1), S_{5,3} (t=2), S^-_{5,4} (t=3), S_{5,6} (t=4), S_{5,8} (t=5),
  S_{5,9} (t=6), S_{5,10} (t>=7); S_{k,t} = all graphs on k vertices with <= t edges; S^-_{5,4} =
  S_{5,4} minus the graphs isomorphic to K2 + K3. "C-universal" = for every F in C and every
  bijection V(F) -> roots, F is a rooted minor. [Cross-checked against Dvo26 itself, Section 5 below.]
- **Thm 2.7 (cited: Dvorak [Dvo26, Corollary 13]; said to follow easily from the Fabila-Monroy–Wood
  rooted-K4 characterisation).** G 4-light k-rooted, k <= 4, rho_4(G) > 0 ==> either K_k is a
  rooted minor, or (k=4, no edges among roots, rho_4(G)=1, and G is S_{4,5}-universal).
- **Thm 2.8 (F1; the form actually proved by induction).** G a graph with n >= 3 vertices; if G is
  4-bilight and |E| >= 4n-7 then G has a K7^= minor. (5-connected => no (<=4)-bifragment =>
  4-bilight, so 2.8 => 1.3.)
- **Thm 2.9 (F1; strengthens what F1 calls "basically Corollary 16 from [Dvo26]").** G 4-light
  5-rooted and "quite heavy" ==> G has a vampire or K_{2,down 5} as a rooted minor.

Definitions needed to read these (VFS):
- rooted graph: graph G with root set X_G; n(G) = #non-roots; rho(G) = #edges not inside X_G;
  **4-density** rho_4(G) = rho(G) - 4 n(G). For unrooted G: rho_4(G) = |E| - 4|V|
  (so the hypothesis of 2.8 is rho_4 >= -7).
- root separation (A,B): separation with X_G inside A; right-hand side R_{A,B} = G[B] rooted at A∩B.
- **4-light** (k-rooted G): rho_4(R_{A,B}) <= 0 for every root (<= k-1)-separation. Internally
  k-connected k-rooted graphs are automatically 4-light.
- fragment Y (non-empty vertex set, root-free if G rooted); boundary = vertices outside Y with a
  neighbour in Y; rho_4(G,Y) = #edges with an end in Y - 4|Y|.
- bifragment (S,T): disjoint fragments with no S–T edge; dense if rho_4(G,S) > 0 and rho_4(G,T) > 0;
  **4-bilight** = no dense (<=4)-bifragment.
- **quite heavy** (5-rooted): rho_4 >= 2, or rho_4 = 1 and no non-root vertex adjacent to all 5 roots.
- **vampire**: 7-vertex 5-rooted graph, no root–root edges, non-roots p,q adjacent, and distinct
  roots x1,x2 with p adjacent to all roots except possibly x2, q to all roots except possibly x1.
- **K_{2,down 5}**: 7-vertex 5-rooted graph, non-roots p,q non-adjacent, both adjacent to all roots.
- **dart**: 4-rooted graph with one non-root y adjacent to all roots, roots inducing P3 + K1.
- **reducible (<=4)-fragment Y**: rho_4(G,Y) <= 0; (unrooted case) at least 3 vertices outside Y;
  and R_Y has K_{|boundary|} as rooted minor, or |Y|>=2, |boundary|=4 and R_Y has a dart rooted minor.
- Obs 2.3: rho_4(G) = (1/2) * sum over non-roots v of (deg v + deg^X v - 8).
- Obs 2.4: contracting an edge e with a non-root end changes rho_4 by 3 - t_G(e), where t_G(e) =
  number of triangles on e after completing the roots to a clique.

### 1.a F1 lemma inventory, Sections 3–6 (statements VFS; proofs of Sections 3–5 NOT checked by me)

Section 3: L3.1 (4-light 4-rooted, rho_4>0 => dart rooted minor; uses Menger, induction);
L3.2 (location of a dense (<=4)-bifragment relative to a clique/dart-like set U; AI-provided);
L3.3 (reducing an inclusion-maximal reducible (<=4)-fragment preserves 4-bilightness and does not
decrease rho_4).
Section 4 (proof of Thm 2.9 by minimal counterexample): Obs 4.1, Cor 4.2, L4.3 (no reducible
(<=4)-fragment), L4.4 (no proper root 5-separation with quite heavy right side), L4.5 (G - roots
connected, each non-root adjacent to <= 3 roots, each root degree >= 2; AI-suggested), L4.6, Cor 4.7
(rho_4 = 1), L4.8 (t_G(e) >= 3 ...), L4.9 (AI-suggested, proof replaced), L4.10.
Section 5 (minimal counterexample to Thm 2.8): L5.1 (no reducible (<=4)-fragment), Obs 5.2, Cor 5.3,
L5.4, Cor 5.5, L5.6 (4-light 5-rooted with m missing root–root edges and rho_4 >= ceil((m+3)/2) =>
rooted K5), L5.7 (for a 5-separation exactly one side is quite heavy, with 4-density >= m+2), L5.8,
L5.9, Cor 5.10 (no (<=5)-bifragment with both sides of positive 4-density and quite heavy when of
order 5).
Section 6 (read in full, VFS): L6.1 |E| = 4|V|-7 in a minimal counterexample; L6.2 |V| >= 7 and every
edge lies in >= 4 triangles; Cor 6.3 min degree >= 5; L6.4 for a vertex v of degree <= 7 and every
5-subset S of N(v), G[N(v)] rooted at S has K5^- as rooted minor (human proof of an AI-suggested weaker
form); Cor 6.5; L6.6 components of G - N[v] attach to <= 4 neighbours and have rho_4 <= 0 (AI idea);
Cor 6.7 min degree >= 8, hence |E| >= 4|V|, contradicting L6.1.

Where K7^= (rather than K7^-) is used essentially — MY CHECK from reading Section 6:
- L6.6: K5^- on S inside N(v), plus v, plus a contracted outside component u adjacent to all of S,
  gives K7 minus {uv, one edge inside S}: two INDEPENDENT missing edges = K7^=. For K7^- one would
  need either full K5 on S or an extra u–v connection; this is the visible local obstruction to
  re-running Section 6 for K7^-.
- Cor 6.7: the degree-7 case ends by finding K7^= inside G[N[v]] with 3 missing edges; again K7^=.
- L6.1 actually derives a K7^- subgraph (stronger than needed) in its last line.

### 1.b F1 remarks on sharpness / small orders (Section 1) — VFS
- Thm 1.2 analogue for K7^= under only 4-connectivity is FALSE: large matching + 4 universal
  vertices is 4-connected, average degree near 9, no K7^= minor. Hence 5-connectivity in Thm 1.3.
- Lower-bound examples for Thm 1.3: (5-connected planar triangulation on n-1 vertices) + universal
  vertex: 6-connected, K6-minor-free hence K7^=-minor-free, 4n-10 edges. K6 itself: n=6, 15 = 4n-9
  edges, K7^=-minor-free; the authors call this apparently an isolated example. This is the only
  small-order remark in Section 1 (it explains n >= 7 in Conj 1.4 versus n >= 6 in Thm 1.3).
- For K7 itself a density statement analogous to Thm 1.3 is FALSE: (5-connected planar
  triangulation on n-2 vertices) + two universal vertices is K7-minor-free, 7-connected, with
  5n-15 edges. The authors conclude the last step from K7^- to K7 would be substantially harder.
- F1 does NOT state any lower bound on the order of a minimal K7^- -minor-free 7-chromatic graph
  (nothing in Sections 1, 2, 6 or 7). The only order facts in F1 are about minimal counterexamples
  to the DENSITY theorem 2.8 (|V| >= 7, L6.2), not about colouring counterexamples.
- F1 does not mention Jakobsen's/Mader's unconditional extremal functions ((9n-24)/2 for K7^-,
  5n-14 for K7) anywhere; these thresholds do not appear in F1 or F2.

### 1.c F1 on what remains (Section 1) — VFS
- Whether K7^- -minor-free graphs are 6-colourable is stated as OPEN (Jakobsen: 7-colourable).
- Whether K7-minor-free graphs are even 7-colourable is stated as OPEN (8-colourable: Jakobsen;
  Albar–Goncalves).
- Conj 1.5 + Thm 1.6 would give: every K7^- -minor-free graph is 6-colourable (the same two-line
  argument as the proof of Thm 1.1 in Section 7).
- The authors say they see no fundamental obstruction to running their approach for K7^- instead
  of K7^=, but a number of technical issues would have to be worked out; they did not attempt it.
- HC7 proper (K7-minor-free): the density route is blocked by the 5n-15 examples above.

---

## 2. F1 Section 1.1 "AI usage" — VFS

Paraphrase of what the authors report:
- Main ideas, statements of all major results and key technical lemmas: from the human co-authors.
- AI was used to obtain the proofs from an outline of the expected approach; extra guidance
  (suggested intermediate lemmas) was needed several times.
- Ideas credited to AI: (i) the AI's difficulty proving the technical statements led the authors to
  realise that "every (<=4)-separation has a light side" was insufficient, and they then introduced
  the consistency (bilight) assumption of Thm 2.8; (ii) Lemma 3.2 (separations after contracting to a
  dart) was provided by AI; (iii) Lemma 4.5 (neighbourhoods of roots) suggested by AI; (iv) Lemma 4.9
  suggested by AI, proof replaced by a simpler human one; (v) a weaker form of Lemma 6.4 (K5^=
  instead of K5^-) suggested by AI, current proof human; (vi) the idea for small separations in the
  final part (Lemma 6.6) from AI.
- AI produced an initial write-up which the authors heavily edited (length more than halved); AI
  also used for proofreading.
- Their overall assessment: AI contribution "analogous to what could be expected from a strong
  Master's student"; AI not listed as co-author to match current practice.
- **Verification reported: none beyond the authors' own rewriting.** Section 1.1 names no AI system
  and mentions no formal verification (no Lean/Coq/Isabelle), no computer check, no independent
  referee. The paper is a v1 preprint (not peer reviewed as of 2026-10-06).
- Contrast: Dvo26 Section 1.1 ("AI usage declaration") says AI was used only for proofreading (VFS).
- Section 7 (the part relevant to Thm 1.6) is NOT among the items attributed to AI; it follows the
  human-written template of F2 Section 4 / Kawarabayashi–Toft.

---

## 3. F1 Section 7 — proof architecture of Theorem 1.6 — VFS, with step-by-step MY CHECK

Section 7 is short (about 9 kB of text). Its whole content:

| item | statement (precise paraphrase) | attribution | used by |
|---|---|---|---|
| Thm 7.1 | for every k >= 7, every k-contraction-critical graph other than K_k is 7-connected | Mader [Mad68] (Math. Ann. 175 (1968) 243–252) — cited, no proof | 7.2, 7.7, 1.6 |
| Lemma 7.2 | G 7-contraction-critical and K7^- -minor-free ==> no K6^- subgraph | F1, proved | 7.7 |
| Thm 7.3 | k-contraction-critical G, any vertex v: alpha(G[N(v)]) <= deg v - k + 2; if G != K_k then min degree >= k | Dirac [Dir60] (J. Reine Angew. Math. 204 (1960) 116–131) — cited, no proof | 7.6 |
| Thm 7.4 | H a 7-vertex graph with alpha(H) <= 2 ==> H contains K4 or the Moser spindle as a subgraph | Kawarabayashi–Toft [KT05, Section 2] (Combinatorica 25 (2005) 327–353) — cited, no proof | 7.6 |
| Thm 7.5 | phi a proper colouring of G, v_1..v_k with pairwise distinct colours, v_i and v_{i+1} phi-Kempe-adjacent for all i cyclically ==> G rooted at {v_1..v_k} has the k-cycle v_1...v_k as an id-rooted minor | Kriesell–Mohr [KM19, Lemma 2] (arXiv:1911.09998) — cited, no proof | 7.6 |
| Lemma 7.6 | G 7-contraction-critical and K7^- -minor-free ==> every vertex of degree 7 lies in a K5 | F1, proved | 1.6 |
| Lemma 7.7 | G 7-contraction-critical and K7^- -minor-free ==> G has at most one K5 | F1, proved | 1.6 |
| Thm 1.6 | see Section 1 | F1, proved | 1.1 |
| Thm 1.1 | see Section 1 | F1, proved (1.6 + 1.3) | — |

"Moser spindle" as defined in F1: 5-cycle v1..v5 plus v2' adjacent to v1,v2,v3 and v4' adjacent to
v3,v4,v5 (7 vertices, 11 edges; the usual Moser spindle: two K4^- glued at v3 with the far vertices
v1,v5 joined). "phi-Kempe-adjacent": differently coloured u,v joined by a path using only the
colours phi(u), phi(v).

### 3.a Step-by-step assessment (MY CHECK)

**Thm 7.1 (Mader).** External classical result (German original; I did not read Mader's paper).
Universally used in this literature (Kawarabayashi–Toft, Rolek–Song, F2). Risk: low, but it is an
INHERITED input, not checked here. Bibliographic discrepancy: F2 (its Theorem 16) attributes the same
statement to [Mad67] = Mader, "Homomorphieeigenschaften und mittlere Kantendichte von Graphen",
Math. Ann. 174 (1967) 265–268, and omits the "other than K_k" exception; F1 cites [Mad68] = "Über
trennende Eckenmengen in homomorphiekritischen Graphen", Math. Ann. 175 (1968) 243–252, with the
exception. The 1968 paper is the standard reference for 7-connectivity (R/S); the F2 citation looks
like a slip. The K_k exception matters only formally (K7 is 7-contraction-critical but has 7 vertices).

**Lemma 7.2.** Proof: take any 6-set W. 7-connectivity => G - W connected and every vertex of W has a
neighbour outside W; contracting G - W to one vertex gives a vertex adjacent to all of W, so a K6^-
on W would give a K7^- subgraph of a minor. CHECKED: correct (needs |V| >= 8, implied by
7-connectivity). Uses only 7.1.

**Thm 7.3 (Dirac).** External classical result; standard. For deg v = 7, k = 7: alpha(G[N(v)]) <= 2.
Not re-proved here. (The underlying argument is the usual one: contract v with an independent set in
N(v) and extend a 6-colouring; low risk.)

**Thm 7.4 (KT05 Section 2).** External; F2 says it can be verified by moderately routine case
analysis. MY CHECK by exhaustive computation (script `check_kt_moser.py`, numpy, run this session,
scratch only): of the 2^21 labelled graphs on 7 vertices, 133,501 have alpha <= 2; 13,842 of those
are K4-free; ALL 13,842 contain one of the 630 labelled copies of the Moser spindle (as defined
above) as a subgraph; their edge counts range from 11 to 15. So Thm 7.4 is TRUE as stated.
Status of this check: computational evidence from an unreviewed 40-line script (exhaustive, but not a
promoted certificate).

**Thm 7.5 (Kriesell–Mohr Lemma 2).** VFS against the source (ar5iv render of arXiv:1911.09998):
KM19 Lemma 2 says every cycle has "property (*)"; property (*) for a graph K (KM19 Definition 1):
for every graph G, every colouring C of G with exactly |V(K)| colour classes and every transversal T
of C such that K is isomorphic to a spanning subgraph H of the routing graph H(G,C,T) (s,t adjacent
iff in a common Kempe chain), G has a rooted H-certificate (= rooted H-minor with t in its own bag).
Two remarks:
 (a) KM19 requires the colouring to have exactly |V(K)| colours. F1's Thm 7.5 is stated for an
     arbitrary proper colouring; the reduction is immediate (restrict to the subgraph induced by the
     k colour classes of v_1..v_k; a 2-coloured path between two of them stays inside), and F1's
     only application (inside Lemma 7.6) performs exactly this restriction (G'' = colours 1..4).
     No gap.
 (b) KM19 Lemma 2 holds for every cycle length; the colouring need NOT be a Kempe colouring (only
     the cyclically consecutive pairs must share a Kempe chain). I read its proof (minimal
     counterexample; reduce to the case where all colour classes have equal size d and peel off the
     transversal); it is a short self-contained induction and I found no problem.
 (c) KM19 also has Theorem 4: every graph on at most four vertices has property (*) (i.e. K4 has
     it, derived from Fabila-Monroy–Wood). F1 could have used that directly; instead it uses the
     4-cycle from Lemma 2 plus two actual edges. Either route works.
 KM19 also proves: K7 does NOT have property (*) (its Theorem 2) and every graph with at most one
 cycle has property (*) (Theorem 5); every 5-vertex graph with <= 6 edges has it (Theorem 7).
 Publication status of KM19: F1 and F2 both cite it only as an arXiv preprint (2019); journal
 version not checked this session.

**Lemma 7.6.** Proof structure and MY CHECK:
 1. v of degree 7, H = G[N(v)]; alpha(H) <= 2 by 7.3; by 7.4 H has a K4 (then v is in a K5, done) or
    a Moser spindle subgraph. Assume no K4. Then v1v3 is a non-edge (else {v1,v2,v2',v3} is a K4:
    the other five pairs are spindle edges). CHECKED.
 2. Contract the path v1 v v3 to a vertex u; G' is a proper minor so 6-colourable; pull back to a
    6-colouring phi of G - v with phi(v1) = phi(v3) = 6 (proper because v1v3 is a non-edge and every
    neighbour of v1 or v3 other than v is a neighbour of u). CHECKED.
 3. All six colours appear on N(v) (else colour v); as |N(v)| = 7 and v1,v3 share colour 6, the five
    vertices v2, v2', v4, v4', v5 carry colours 1..5 bijectively. CHECKED.
 4. Any two of those five are phi-Kempe-adjacent in G - v: otherwise swap the two colours on the
    Kempe component of x; then colour phi(x) is absent from N(v) (x was its only occurrence there, and
    the only other vertex of N(v) with one of the two colours is y, which is not in the component), so
    v can be coloured: contradiction with chi(G) = 7. CHECKED.
 5. Restrict to G'' = (G - v)[colours 1..4] (contains v2, v2', v4, v4'; excludes v1, v3, v5). By 7.5
    the 4-cycle v2 v4 v2' v4' is an id-rooted minor of G''; the two "diagonals" v2v2' and v4v4' are
    edges of H, so G'' has an id-rooted K4 on {v2, v2', v4, v4'}. CHECKED.
 6. Branch sets {v}, {v1, v5}, {v3}, and the four K4 bags: pairwise adjacent except possibly
    {v1,v5}–{v3} (v1v3 is a non-edge, v3v5 unknown). Every other pair is covered by spindle edges
    (v3 ~ v2, v2', v4, v4'; v1 ~ v2, v2'; v5 ~ v4, v4'; v1 ~ v5) and v ~ all. So K7^- is a minor:
    contradiction. CHECKED (20 of the 21 adjacencies verified explicitly).
 Verdict: correct given 7.3, 7.4, 7.5. Note this is slightly different from, and stronger than,
 F2 Claim 4.4 (which contracts v with the two primed vertices and uses a rooted 5-cycle to get only
 K7^vee). The K7^- strength comes from K4-property of four Kempe-linked vertices.
 What it does NOT give: nothing for a K7-minor-free graph (the construction produces K7^-, and the
 missing pair {v1,v5}–{v3} cannot be closed by this argument).

**Lemma 7.7.** Proof structure and MY CHECK:
 1. Two distinct 5-cliques L1, L2 with k = |L1 ∩ L2|. k = 4 would give K6^- on L1 ∪ L2, excluded by
    7.2; so k <= 3. CHECKED.
 2. Menger in the 7-connected graph: five disjoint L1–L2 paths P1..P5, the first k trivial on the
    intersection; so P4, P5 are non-trivial. P5 has ends u in L1, v in L2. CHECKED.
 3. Z = (L1 - u) + v has 5 vertices; G - Z is connected; take a path Q0 in G - Z from u to L2 - Z;
    it ends on one of P_{k+1},...,P_4. Take a minimal subpath Q (the text has a typo: "minimal segment
    of Q" should read Q0) from P5 to P_{k+1} ∪ ... ∪ P_4, w.l.o.g. ending on P4; u' = L1-end of P4.
    Since u', v are in Z, Q avoids them, and Q is internally disjoint from all P_i. CHECKED.
 4. Contract P_{k+1},...,P_3 to single vertices, P4 - u' to a vertex a, P5 - v to a vertex b, and Q to
    an edge ab. The seven vertices (three "shared" vertices S, u', a, b, v) are pairwise adjacent
    except possibly u'v: S is a triangle joined to everything via L1 and L2; u' ~ a (path edge),
    u' ~ b (b contains u in L1); v ~ a (a contains the L2-end of P4), v ~ b (path edge); a ~ b (Q).
    So K7^- is a minor: contradiction. CHECKED.
 Verdict: correct. Uses 7.1 (twice: Menger and connectivity of G - Z) and 7.2. Compare F2 Claim 4.6
 (the same idea, only for k = 3, giving |L1 ∩ L2| <= 2 under K7^vee-freeness); F1 pushes it to all
 k <= 3 because K7^- rather than K7^vee is being built.

**Proof of Thm 1.6.** G - v is a proper minor so 6-colourable, hence chi(G) = 7 and G is
7-contraction-critical; G != K7 (K7 contains K7^-), so 7-connected (7.1), min degree >= 7; at most one
K5 (7.7) and every degree-7 vertex is in a K5 (7.6), so at most 5 vertices of degree 7; hence
2|E| >= 7*5 + 8(n-5) = 8n - 5, i.e. |E| >= ceil((8n-5)/2) = 4n - 2. CHECKED (arithmetic correct).

**Proof of Thm 1.1.** Minimal (|V|+|E|) K7^=-minor-free graph with chi >= 7: every proper minor is
6-colourable; it is K7^- -minor-free (K7^- contains K7^=); so by 1.6 it is 7-connected with
|E| >= 4n-2 >= 4n-7, and n >= 8 >= 6; Thm 1.3 gives a K7^= minor: contradiction. CHECKED (given 1.3).

### 3.b Where a gap could hide (my assessment)
- Theorem 1.6 itself: I found NO gap. Its proof is one page, elementary, and I re-derived every step.
  Its external inputs are Mader (7-connectivity), Dirac (neighbourhood independence), the 7-vertex
  Moser-spindle fact (independently confirmed by exhaustive computation above), Kriesell–Mohr Lemma 2
  (statement and proof read), and Menger. The only inputs not re-verified from primary text are Mader
  1968 and Dirac 1960 (classical, German originals).
- Minor textual issue only: "minimal segment of Q" should be "of Q0" in Lemma 7.7.
- The risk in F1 as a whole sits in Theorem 1.3/2.8 (Sections 3–6, ~25 pages, partly AI-derived
  proofs, rewritten by the authors) and in its dependence on Dvo26 (85 pages, single author, v1
  preprint; its Theorem 4 and Corollaries 13, 16 are consumed as black boxes). Section 6 (which I read
  in full) is locally coherent; Sections 3–5 and Dvo26's proof were NOT checked by me.
- For RL70 purposes: **Theorem 1.6 does not depend on Theorem 1.3, on Dvo26, or on any AI-derived
  lemma.** It can be treated as an independently checkable result about K7^- -minor-free
  7-contraction-critical graphs (classification suggestion: externally inherited, re-derived at
  proof-sketch level here; a repository-level promoted proof would need Mader/Dirac as stated inputs).
- Scope warning: Theorem 1.6 and Lemmas 7.2, 7.6, 7.7 are about **K7^- -minor-free** graphs. A minimal
  HC7 counterexample is only K7-minor-free and may contain K7^- minors, so none of 7.2/7.6/7.7/1.6
  applies to it. (For K7-minor-free 7-contraction-critical graphs the available inputs remain Mader,
  Dirac, Kawarabayashi–Toft-type clique lemmas, etc.)

### 3.c Simple corollaries of Section 7 not stated in F1 (MY CHECK; derived, not from source)
Let G be K7^- -minor-free and 7-contraction-critical (a "minimal counterexample to F2 Conj 21"):
- the degree-7 vertices form a clique of size <= 5, all inside the unique K5 (if any);
- if G has no K5 then min degree >= 8 and |E| >= 4n;
- omega(G) <= 5 and G has no K6^- subgraph;
- |E| >= 4n - 2 in all cases, with equality only if exactly five degree-7 vertices form a K5 and all
  other vertices have degree 8 (so n >= 5 + (number of outside neighbours)...; no order bound is
  claimed here).

---

## 4. F2 (Norin–Totschnig, arXiv:2507.03244v1) — VFS (full text read)

Sections: 1 Introduction; 2 Rooted models; 3 Proof of Theorem 6; 4 Proof of Theorem 4;
5 Concluding remarks; References (24 items). Numbering is global (Theorems/Conjectures 1–26) plus
Claims 3.1–3.15 and 4.1–4.10.

Main statements:
- Conj 1 = Hadwiger. Thm 2 (Jakobsen [Jak71]): no K7^vee and no K7^= minor => 6-colourable.
  Thm 3 (Kawarabayashi–Toft): no K7 and no K_{4,4} minor => 6-colourable.
- **Thm 4 (F2 main).** Every graph with no K7^vee minor is 6-colourable.
- Thm 5 (Jorgensen [Jo94]): every 4-connected G with |E| >= 4|V|-7 has a K_{4,4} minor unless G = K7.
- **Thm 6 (F2 main technical).** Every 4-connected G with |E| >= 4|V|-8 has a K7^vee minor unless
  G = K_{2,2,2,2}. (K_{2,2,2,2}: n=8, 24 = 4n-8 edges.)
- Obs 7; Thm 8 (RST93 (2.6), rooted K4 structure); **Lemma 9**: (G,Z) internally 4-connected, |Z|=4,
  no Z-rooted K4 model => |E| <= 3|V|-7; Lemma 10 (Jorgensen Lemma 16(2)): |V| >= 6, internally
  4-connected => Z-rooted K4^- model; Thm 11 (Jorgensen Lemma 17): no Z-rooted K_{4,2} model =>
  |E| <= 4|V|-10; **Lemma 12**: same bound for K*_{4,2} (K_{4,2} plus the edge between the two
  unrooted vertices); Thm 13 (RST93 (2.4), two crossing paths / planarity in a disc).
- Thm 14 (Kriesell–Mohr [KM19, Lemma 2]): the rooted-cycle statement (same as F1 Thm 7.5).
- Thm 15 (Dirac [Dir60]): independent sets in the neighbourhood of v have size <= deg v - k + 2
  (F2 writes G[N[v]], closed neighbourhood; immaterial).
- **Thm 16 (Mader, cited as [Mad67]).** For all k >= 7 every k-contraction-critical graph is
  7-connected. [See the citation discrepancy in 3.a; and K_k is not excluded in F2's wording.]
- Lemma 17 (KT05 Lemma 3(i)): 7-contraction-critical G with three 5-cliques pairwise meeting exactly
  in the same 2-set Z => K7 minor.
- Thm 18 (Kawarabayashi–Luo–Niu–Zhang [KLNZ05]): G (k+2)-connected, k >= 5, three k-cliques with
  union of size >= 3k-3 => K_{k+2} minor.
- **Conj 19**: no K7^= minor => 6-colourable. [Now F1 Thm 1.1.]
- **Conj 20**: every 5-connected G with |E| >= 4|V|-9 has a K7^= minor unless G = K6. [F1 Thm 1.3
  proves the 4n-7 version; F1 Conj 1.4 restates the 4n-9 version with n >= 7.]
- **Conj 21**: every graph with no K7^- minor is 6-colourable. F2 comments that its strategy would
  need a corresponding extremal result, and that possibly a variant of Conj 20 holds for K7^- minors
  with a longer list of small exceptional graphs. [F1 Conj 1.5 is such a variant, with threshold 4n-2
  and NO exceptional list beyond n >= 6.]
- Thms 22–26: Lafferty–Song (K8 minus 4 edges => 7-colourable; K9 minus 6 edges => 8-colourable),
  Rolek–Song (no K8^vee and no K8^= => 8-colourable; no K8^- => 9-colourable), Rolek (K9 analogue).

Proof architecture of F2 Thm 6 (minor-minimal "enemy" G): Claim 3.1 |V| >= 9 (explicit treatment of
n = 7, 8 — the only small-order analysis in F2; it is about the density theorem, not colouring);
3.2–3.3 no 4-separation with both sides >= 2; 3.4 no contraction to K_{2,2,2,2}; 3.5–3.6 5-connected;
3.7 every edge in >= 4 triangles; 3.8 |E| = 4|V|-8; 3.9–3.11 min degree exactly 6; 3.12–3.15 and the
final planarity/disc argument via RST93 (2.4).

Proof architecture of F2 Thm 4 (minor-minimal counterexample G, 7-contraction-critical):
4.1 7-connected (Mader); 4.2 no K6^vee subgraph; **4.3 at least 18 vertices of degree 7** (from
|E| <= 4n-9 by Thm 6 and min degree >= 7); 4.4 every degree-7 vertex is in a K5 (Dirac + Moser spindle
+ Kriesell–Mohr rooted C5); 4.5 the union of all 5-cliques has >= 18 vertices; 4.6 two 5-cliques meet
in <= 2 vertices; 4.7 three 5-cliques cover <= 11 vertices (Thm 18, since no K7 minor); 4.8–4.10
intersection pattern; final contradiction: the "intersection-size-2" graph on the set of 5-cliques
would be bipartite with no independent triple, so at most 4 cliques, but >= 5 are needed.

Extremal thresholds appearing in F2: 4n-7 (Jorgensen, K_{4,4}, 4-connected), 4n-8 (Thm 6, K7^vee,
4-connected, exception K_{2,2,2,2}), 3n-7 (rooted K4), 4n-10 (rooted K_{4,2} / K*_{4,2}), the
4n + floor(n/2) - 12 matching example (no K7^= minor, 4-connected), 4n-10 (apex of a 5-connected
planar triangulation), 4n-9 (Conj 20). No (9n-24)/2, no 5n-14.

F2 says nothing about AI usage. F2 says nothing about a lower bound on the order of a minimal
counterexample to Conj 21; its only remark toward K7^- is the one after Conj 21 quoted above.

---

## 5. Dvo26 (arXiv:2609.13818v1) — statements VFS (Sections 1–2 read; proofs NOT read)

Sections: 1 Introduction (1.1 AI usage declaration: AI used only for proofreading); 2 Generalization
and proof ideas; 3 Preliminaries; 4 The (<=4)-rooted case; 5 K_* and K_*^- -universal separations;
6 Connectivity; 7 (Nearly) saturated separations; 8 Novas; 9 Splits; 10 Degrees of vertices.
- Thm 1 (Wollan): general linear bound for rooted minors in |V(H)|-connected graphs.
- **Thm 2 (main).** G 5-rooted, 5-connected, |E| >= 4|V|-10 ==> K5 is a rooted minor.
  Sharpness example: 6-connected, 4n-11 edges, no rooted K5 (apex over a near-triangulation with one
  4-face whose four vertices plus the apex are the roots).
- **Thm 3.** Same with "5-connected" replaced by "4-light".
- **Thm 4.** Every 4-light 5-rooted graph is "universal" (S-universal for S = its rho_4-target; the
  target table is exactly the one in F1 Thm 2.6). Stated to be tight in every row (its Figure 1).
- Cor 6: rho_4(G) >= t (0 <= t <= 10) => S_{5,t}-universal.
- **Cor 13** = F1 Thm 2.7 (matches). **Cor 16**: detailed structure for 4-light 5-rooted graphs with
  rho_4 > 0 (K_{1,4}-universal and either (K4+K1)-universal or one of the listed rho_4 = 1, 2, 3
  outcomes including a vampire rooted minor); F1 Thm 2.9 removes the (K4+K1)-universal outcome under
  "quite heavy".
- Dvo26 also records in its introduction: Mader's bound (k-2)n - C(k-1,2) for K_k-minor-free graphs,
  k <= 7 (so K7-minor-free => |E| <= 5n-15); Jorgensen for K8; Song–Thomas for K9; and that F1
  ([DNR26] there) was obtained with Thm 2 plus further tools.
- Numbering check: F1's citations "[Dvo26, Theorem 4]", "[Dvo26, Corollary 13]", "[Dvo26, Corollary
  16]" all match Dvo26 v1.

---

## 6. Extremal thresholds — consolidated (who states what)

| threshold | statement | where | status |
|---|---|---|---|
| \|E\| >= 4n-2, 5-connected, n >= 6 => K7^- minor | F1 Conj 1.5 | CONJECTURE (open) |
| \|E\| >= 4n-2 | holds for every K7^- -minor-free 7-contraction-critical graph | F1 Thm 1.6 | proved in F1 Section 7; re-checked here |
| \|E\| >= 4n-7, 5-connected, n >= 6 => K7^= minor | F1 Thm 1.3 (from Thm 2.8: 4-bilight, n >= 3) | preprint theorem; proof not checked here |
| \|E\| >= 4n-9, 5-connected, n >= 7 => K7^= minor | F1 Conj 1.4 / F2 Conj 20 (exception K6) | CONJECTURE (open) |
| \|E\| >= 4n-8, 4-connected, not K_{2,2,2,2} => K7^vee minor | F2 Thm 6 | preprint theorem |
| \|E\| >= 4n-7, 4-connected, not K7 => K_{4,4} minor | Jorgensen 1994 (cited in F2 as Thm 5) | published |
| \|E\| >= 4\|V\|-10, 5-connected (or 4-light) 5-rooted => rooted K5 | Dvo26 Thm 2/3 | preprint theorem |
| \|E\| <= 3\|V\|-7 if no rooted K4 (internally 4-connected) | F2 Lemma 9 (via RST93; also FMW13) | preprint lemma |
| \|E\| <= 4\|V\|-10 if no rooted K_{4,2} / K*_{4,2} | Jorgensen Lemma 17 / F2 Lemma 12 | published / preprint |
| 4n-10 edges, 6-connected, K6-minor-free | apex + 5-connected planar triangulation | example in F1, F2 |
| 5n-15 edges, 7-connected, K7-minor-free | two apices + 5-connected planar triangulation | example in F1 (blocks density route for K7) |
| 4n + floor(n/2) - 12 edges, 4-connected, no K7^= minor | 4 universal vertices + matching | example in F2 (and F1) |
| (9n-24)/2 (Jakobsen, K7^-, unconditional) and 5n-14 (Mader, K7) | NOT mentioned in F1 or F2 | R/S only; Dvo26 mentions Mader's (k-2)n - C(k-1,2) |

Small orders / order lower bounds:
- F1 and F2 give NO lower bound on the order of a minimal K7^- -minor-free 7-chromatic graph and no
  remark on small orders of colouring counterexamples.
- What their results imply trivially (MY CHECK): such a graph is 7-connected with min degree >= 7 and
  is not K7, so n >= 8; with |E| >= 4n-2 <= C(n,2) one gets n >= 9 (n = 8 would need >= 30 > 28 edges).
  Nothing stronger follows from the papers themselves.

---

## 7. What remains to reach K7^- and K7 (as stated in the sources) — VFS

- To get "K7^- -minor-free => 6-colourable" (F2 Conj 21): by F1 Thm 1.6 it SUFFICES to prove F1 Conj
  1.5 restricted to 7-connected graphs (indeed any statement "7-connected, |E| >= 4n-2 => K7^- minor"
  suffices, since the minimal counterexample is 7-connected) — MY CHECK of the logical shape; F1
  states the 5-connected version.
- F1's view: no fundamental obstruction for K7^-; technical issues unresolved; constant possibly
  improvable.
- To get HC7 itself: F1 explicitly says the analogous density statement fails (5n-15 examples) and
  that the final step would be substantially more difficult. Neither paper proposes a route.
- F2's stated hope: that the techniques can be applied further to approach Hadwiger for small t.

---

## 8. Follow-ups / citing papers (searches of 2026-10-06)

(see end of file; filled in below)

