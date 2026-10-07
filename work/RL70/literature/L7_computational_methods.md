# L7 — Computational methods and prior computational work (small-order minor / colouring certificates)

RL70 literature map, worker L7. NON-AUTHORITATIVE working notes. Date: 2026-10-06.
Status of this file: IN PROGRESS (saved early; sections are extended as sources are read).

Verification tags used below:
- **VERIFIED-FROM-SOURCE** = statement read in the primary source text this session (URL given).
- **RECALLED/SECONDARY** = from memory, a search-engine snippet, or a summarising tool; not upgraded.
- **NOT-LOCATED** = looked for, not found.
- **OWN-CHECK (unpromoted)** = a small sanity computation or elementary argument made by this worker; computational evidence only.

Notation: `G > H` (Song–Thomas) means G has an H minor. `K7 u K1` = disjoint union of K7 and an isolated vertex.
`G has no K7 u K1 minor` is equivalent to `G - v has no K7 minor for every vertex v`.
`A + B` = join. `I` = icosahedron.

---

## 1. Prior computer-assisted small-order results on K7 minors and minimum degree 7 (most relevant)

### 1.1 Song–Thomas 2006, Lemma 3.7 — the complete list for n <= 13, delta >= 7, no K7 u K1 minor

Source: Z.-X. Song, R. Thomas, "The extremal function for K9 minors", J. Combin. Theory Ser. B 96 (2006) 240–252.
Text read from the authors' PDF https://thomas.math.gatech.edu/PAP/K9/k9.pdf (text extracted locally with pdftotext; overlines for
complements are lost in extraction, see caveat). **VERIFIED-FROM-SOURCE** (statement), complement bars RECALLED/RECONSTRUCTED.

- Abstract: "The proof of one of our lemmas is computer-assisted."
- Lemma 3.7: for an integer 9 <= n <= 13 and a graph G on n vertices with delta(G) >= 7, either G has a K7 u K1 minor,
  or G satisfies two technical properties (A) and (B).
- Proof of Lemma 3.7 (paraphrase, exact content): by a computer search the graphs G with 9 <= n <= 13, delta(G) >= 7 and
  NO K7 u K1 minor are exactly fourteen graphs:
  K_{1,2,2,2,2}, K_{1,3,3,3}, [K_{3,3}]+[P_4], [K_{3,3}]+C_4, K_{2,2,3,3}, [K_{2,3}]+C_5, C_5+C_5, [K_3]+C_7, K_{3,4,4},
  [K_3]+[V_8], K_1+[P'], [P'], J_1, K_1+J_2
  where P = Petersen graph, P' = Petersen with one edge subdivided, V_8 = C_8 plus the four long diagonals, J_1, J_2 are drawn in
  Fig. 1 of the paper, and square brackets mark places where an overline (complement) is expected but was lost by the text
  extraction (e.g. complement of K_3 + C_7 has 10 vertices and is 7-regular only if K_3 is replaced by its complement, i.e. three
  independent vertices). The exact graphs are unambiguous from the adjacency lists in `listofgraphs` (next item).
- Outline (Section 2): "there are only fourteen such graphs".
- Acknowledgement: McKay supplied "the list of edge-minimal graphs of minimum degree seven on at most 13 vertices"; "only 12 of
  those graphs had no K7 u K1 minor".

Supplementary material page https://thomas.math.gatech.edu/PAP/K9 (**VERIFIED-FROM-SOURCE** via fetch summary + raw file read):
- `k7test.c`: a PRUNE function for nauty 2.2 `geng`; run as `geng -d7 n` for n = 9..13; keeps graphs with delta >= 7 that
  (1) have no K7 u K1 minor and (2) every edge has an end of degree exactly 7. Minor test = recursive edge contraction down to
  t+1 = 8 vertices, then a direct test of the 8-vertex graph. Constants t=7, MAXVERT=14.
- `k7testold.c`: earlier version; a bug in `TestContraction()` was fixed on 7/2/2017 (found while working on K10 minors).
  => the published 2006 computation was run with a buggy tester and re-run later; treat as an *externally inherited
  certificate with a recorded erratum*, not as an independently re-verified result.
- `listofgraphs`: adjacency lists of the 12 edge-minimal survivors: 1 graph of order 9, 5 of order 10, 4 of order 11,
  1 of order 12, 1 of order 13 (read verbatim this session; total 12). The other two of the fourteen are K_{2,2,3,3} and one
  graph obtained from a listed one by adding/deleting an edge (page text; not edge-minimal).
  The order-13 graph is K_1 + (a 6-regular 12-vertex graph); order-12 graph is 7-regular.

**Consequence for HC7 (OWN remark, elementary):** a K7-minor-free graph with delta >= 7 on n <= 13 vertices would in particular
have no K7 u K1 minor, hence would be one of the fourteen graphs. So "every graph with delta >= 7 on at most 13 vertices has a
K7 minor" holds IF AND ONLY IF each of the fourteen listed graphs has a K7 minor (spanning model). Song–Thomas do not state this
corollary. See Section 1.4 for the status of that check.

### 1.2 Rolek–Song–Thomas 2023, Lemma 3.1 (computer-checked, 9 vertices)

Source: M. Rolek, Z.-X. Song, R. Thomas, "Properties of 8-contraction-critical graphs with no K7 minor", European J. Combin.
110 (2023) 103711; arXiv:2208.07335. Read via ar5iv HTML summary. **VERIFIED-FROM-SOURCE (fetch summary; not line-by-line)**.

- Lemma 3.1: if |H| = 9, delta(H) >= 5 and H is K4-free, then H has a K6 minor or H is isomorphic to [K_3]+C_6
  (complement bar on K_3). "This can be checked by computers"; code in the paper's appendix, modelled on the Song–Thomas
  `k7test.c` program.
- Main Theorem 1.2: an 8-contraction-critical graph with no K7 minor has 8 <= delta <= 9, at most one vertex of degree 8,
  at least 28 vertices of degree 9, plus a neighbourhood-structure statement.
- Quoted: Mader — for all k >= 7 every k-contraction-critical graph is 7-connected (Theorem 1.8 there).
- Quoted: Mader extremal function — n >= p, e >= (p-2)n - C(p-1,2) + 1 forces a K_p minor for p <= 7
  (for p = 7: e >= 5n - 14).

### 1.3 Fijavž–Wood 2010 — minimal minimum-degree graphs

Source: G. Fijavž, D. R. Wood, "Graph minors and minimum degree", Electron. J. Combin. 17 (2010) #R151; arXiv:0812.1064.
Read via ar5iv. **VERIFIED-FROM-SOURCE (fetch summary)**.

- D_k = graphs all of whose minors have min degree <= k; \hat D_k = its minor-minimal obstructions.
- Prop 2.2: \hat D_2 = {K_4}. Prop 2.3: \hat D_3 = {K_5, K_{2,2,2}}.
- Prop 2.4: \hat D_4 is NOT determined; nine members are known: K_6, I (icosahedron), C_5 * [K_3], K_{1,2,2,2}, G_1, G_2,
  D_1, D_2, D_3; "verified by computer".
- Quoted Mader 1968: every graph with min degree >= 5 has a minor in {K_6, I, C_5 * [K_3], K_{2,2,2,1} - e}.
- Thm: every (k+1)-regular graph with fewer than (4/3)(k+2) vertices is in \hat D_k.
- No list for \hat D_6 (the class relevant to "min degree >= 7 forces which minors") exists in this paper. **The analogue of
  Mader's list for min degree 7 is not known in the literature located so far.**

### 1.4 Do the fourteen Song–Thomas graphs have K7 minors? (status)

- K_{1,2,2,2,2}: 9 vertices, 32 edges >= 5*9-14 = 31, so K7 minor by Mader (also directly: contract two disjoint edges that
  together meet all four non-edges). OWN-CHECK (elementary).
- K_{1,3,3,3}: 10 vertices, 36 edges >= 36, K7 minor by Mader. OWN-CHECK (elementary).
- C_5 + C_5: 10 vertices, 7-regular (35 edges, below Mader's bound). Direct model: singletons a1,a2 (adjacent in first C5),
  b1,b2 (adjacent in second C5), and pairs {a3,b3},{a4,b4},{a5,b5}. OWN-CHECK (elementary).
- Remaining graphs: TO BE CHECKED by an exact search (see Section 6); until then the statement
  "delta >= 7 and n <= 13 implies K7 minor" is **OPEN OBLIGATION / not located as a stated theorem**.

---

## 2. Enumeration data (counts)

| Object | n | Count | Source | Tag |
|---|---|---|---|---|
| triangle-free graphs | 13 | 20,797,002 | OEIS A006785 | VERIFIED-FROM-SOURCE |
| triangle-free graphs | 14 | 467,871,369 | OEIS A006785 | VERIFIED-FROM-SOURCE |
| triangle-free graphs | 15 | 14,232,552,452 | OEIS A006785 | VERIFIED-FROM-SOURCE |
| triangle-free graphs | 16 | 581,460,254,001 | OEIS A006785 | VERIFIED-FROM-SOURCE |
| triangle-free graphs | 17 | 31,720,840,164,950 | OEIS A006785 | VERIFIED-FROM-SOURCE |
| connected 7-regular graphs | 8 | 1 | OEIS A014377 | VERIFIED-FROM-SOURCE |
| connected 7-regular graphs | 10 | 5 | OEIS A014377 | VERIFIED-FROM-SOURCE |
| connected 7-regular graphs | 12 | 1,547 | OEIS A014377 | VERIFIED-FROM-SOURCE |
| connected 7-regular graphs | 14 | 21,609,301 | OEIS A014377 | VERIFIED-FROM-SOURCE |
| connected 7-regular graphs | 16 | 733,351,105,934 | OEIS A014377 (Kimberley, 325 CPU-days) | VERIFIED-FROM-SOURCE |
| connected 7-regular graphs | 18 | 42,700,033,549,946,250 | OEIS A014377 (Howroyd, counted not generated) | VERIFIED-FROM-SOURCE |

(more rows to follow)

---

## 3. SAT Modulo Symmetries — (to be filled)

## 4. Exact K_t-minor testing in practice — (to be filled)

## 5. Tooling without a C compiler on Windows — (to be filled)

## 6. Certificate design recommendation — (to be filled)
