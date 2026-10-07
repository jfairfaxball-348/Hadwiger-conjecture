# L3 — Extremal functions for K7 and near-K7 minors (with and without connectivity)

Status: NON-AUTHORITATIVE literature notes (RL70 scratch). Nothing here is promoted.
Worker session date: 2026-10-06. File is rewritten incrementally; see "Progress marker" at the bottom.

Notation. K7^- = K7 minus one edge. K7^= = K7 minus two independent edges. K7^vee = K7 minus two
adjacent edges. `(H1,H2,k)-cockade`: H1 or H2, or obtained from two smaller (H1,H2,k)-cockades by
identifying a k-clique of one with a k-clique of the other; `(H,k)-cockade` when H1 = H2 = H.

Verification tags: **[V]** = VERIFIED-FROM-SOURCE (I read the statement in the source text this session);
**[S]** = RECALLED/SECONDARY (memory, or a secondary citation of the original, or a model-summarised fetch);
**[D]** = my own elementary derivation from tagged statements (not literature; not promoted).

IMPORTANT caveat on "V": Jakobsen's and Mader's original papers (Math. Scand. 1972/1983; Math. Ann. 1968)
were NOT read this session. Their statements are verified only as *quoted in* Song–Thomas (2005 preprint text)
and Rolek–Song (arXiv:1606.05507). Two independent secondary quotations agree word-for-word on hypotheses.

---

## 1. Unconditional extremal theorems

### 1.1 Mader (K_p, p <= 7)
- Statement [V as quoted in Song–Thomas Thm 1.1 and Rolek–Song Thm 2.1]: "For every integer p = 1,2,...,7,
  a graph on n >= p vertices and at least (p-2)n - C(p-1,2) + 1 edges has a K_p minor."
  For p = 7: n >= 7 and e >= 5n - 14 implies a K7 minor; i.e. K7-minor-free and n >= 7 implies e <= 5n - 15.
- Source: W. Mader, Homomorphiesaetze fuer Graphen, Math. Ann. 178 (1968) 154–168.
  (Song–Thomas: p <= 5 first by Dirac; p <= 6 independently by Gyori.)
- Sharpness / extremal examples for p = 7 [V, Dvorak–Norin–Rahman arXiv:2609.17760 Section 1]:
  a 5-connected plane triangulation on n-2 vertices plus two universal vertices is K7-minor-free, 7-connected,
  with 5n - 15 edges. (General remark in Thomas's slides [V]: G \ X planar with |X| = t-5 implies no K_t minor.)
- Full characterisation of the 5n-15 extremal graphs: NOT LOCATED in a source this session (see section 6).

### 1.2 Jakobsen (K7^-)  — CONFIRMED with a correction to the exception list
- Statement [V as quoted in Song–Thomas 2005 intro; and Rolek–Song Thm 3.1]: for p = 5,6,7, every graph on
  n >= p vertices with at least (p - 5/2)n - (p-3)(p-1)/2 edges has a K_p^- minor, or is a
  (K_{p-1}, p-3)-cockade (p != 7), or p = 7 and G is a **(K_{2,2,2,2}, K6, 4)-cockade**.
  For p = 7: n >= 7, e >= (9n - 24)/2 = 4.5n - 12.
- CORRECTION to the task's expectation: the exceptional class is the mixed (K_{2,2,2,2}, K6, 4)-cockades
  (pieces K_{2,2,2,2} AND K6, glued along K4's), not only (K_{2,2,2,2},4)-cockades.
- Sources: I. T. Jakobsen, On certain homomorphism properties of graphs I, Math. Scand. 31 (1972) 379–404;
  II, Math. Scand. 52 (1983) 229–261. (Rolek–Song attribute p = 7 to the 1983 paper.)
- [D] Every (K_{2,2,2,2},K6,4)-cockade on n vertices has exactly (9n-24)/2 edges
  (K6: 15 = (54-24)/2; K_{2,2,2,2}: 24 = (72-24)/2; gluing on K4: n = n1+n2-4, e = e1+e2-6). So any graph with
  e > (9n-24)/2 and n >= 7 has a K7^- minor outright.

### 1.3 Jakobsen ("K7 minus two edges") — CORRECTION: it is a theorem about the FAMILY {K7^=, K7^vee}
- Statement [V as quoted in Rolek–Song Thm 4.1]: for 5 <= p <= 8, every graph with n >= p vertices and at
  least (p-3)n - (p-1)(p-4)/2 edges either contains a "K_p^= minor" or is a (K_{p-1}, p-4)-cockade.
  For p = 7: e >= 4n - 9, exception (K6,3)-cockades.
  In Rolek–Song "K_p^=" means K_p with two edges removed without specifying which two; Song–Thomas [V] say
  "the extremal functions for the graphs obtained from K_p by deleting two edges were determined in [Jakobsen 1971,
  1972] when p = 7 or 8" (plural "graphs").
- Chang–Deng–Tang–Yang arXiv:2609.26041 [S: model-summarised fetch of the HTML] state explicitly that Jakobsen's
  theorem concerns the family consisting of K7^= and K7^vee: every graph on n >= 6 vertices with >= 4n-9 edges
  contains one of the two as a minor or is a (K6,3)-cockade.
- Why it cannot be a theorem about K7^= alone [V, DNR Section 1, attributing the observation to Norin–Totschnig]:
  an arbitrarily large matching plus four universal vertices is 4-connected, has average degree close to 9, and
  has no K7^= minor. [D] That graph is a (K6,4)-cockade with (9n-24)/2 edges; so ex(n, K7^=) = (9n-24)/2 whenever
  n is even, n >= 6 (upper bound from 1.2 since K7^= is a subgraph of K7^-).
- [D] Likewise K_{2,2,2,2} (n = 8, e = 24 = 4n-8) has no K7^vee minor [V, Norin–Totschnig Thm 6 exception] but
  K_{2,2,2,2}/e is exactly K7^=.
- Sources: Jakobsen, A homomorphism theorem with an application to the conjecture of Hadwiger, Studia Sci. Math.
  Hungar. 6 (1971) 151–160; and Math. Scand. 31 (1972) 379–404.

### 1.4 Context: K8, K8^-, K9 (not load-bearing for HC7)
- Jorgensen [V as quoted in Song–Thomas Thm 1.2]: every graph on n >= 8 vertices and at least 6n - 20 edges has a
  K8 minor or is a (K_{2,2,2,2,2}, 5)-cockade. (J. Graph Theory 18 (1994) 431–448.)
- Song [V as quoted in Song–Thomas]: every graph on n >= 8 vertices and at least (11n-35)/2 edges has a K8^-
  minor or is a (K_{1,2,2,2,2}, K7, 5)-cockade. (J. Combin. Theory Ser. B 95 (2005).)
- Song–Thomas [V, Thm 1.3]: every graph on n >= 9 vertices and at least 7n - 27 edges has a K9 minor, or is a
  (K_{1,2,2,2,2,2}, 6)-cockade, or is isomorphic to K_{2,2,2,3,3}. (J. Combin. Theory Ser. B 96 (2006) 240–252;
  text read from the 6 July 2005 preprint on Thomas's page.)
- Seymour–Thomas conjecture [V, Song–Thomas Conj. 1.5]: for every p there is N(p) such that every
  (p-2)-connected graph on n >= N vertices with at least (p-2)n - C(p-1,2) + 1 edges has a K_p minor.
- Jorgensen [V as quoted in Song–Thomas]: every 4-connected graph on n >= 8 vertices and at least 4n-7 edges has
  a K_{4,4} minor. (Graphs Combin. 17 (2001).)

---

## 2. Extremal results under connectivity hypotheses (the 2025–2026 line)

- Norin–Totschnig [V as quoted in DNR Thm 1.2]: "Let G be a 4-connected graph not isomorphic to K_{2,2,2,2}.
  If G has n >= 5 vertices and at least 4n-8 edges, then it contains K7^vee as a minor."
  (S. Norin, A. Totschnig, Every graph with no K7^vee-minor is 6-colorable, arXiv:2507.03244, 2025.)
- Dvorak–Norin–Rahman, "Every graph with no K7^= minor is 6-colorable", arXiv:2609.17760v1 (17 Sep 2026) [V]:
  - Thm 1.1: every K7^=-minor-free graph is 6-colourable.
  - Thm 1.3: "Every 5-connected graph with n >= 6 vertices and at least 4n-7 edges contains K7^= as a minor."
  - Sharpness remarks: universal vertex + 5-connected plane triangulation on n-1 vertices is 6-connected,
    K7^=-minor-free (indeed K6-minor-free), with 4n-10 edges; K6 has 15 = 4n-9 edges.
  - Conj. 1.4: 5-connected, n >= 7, >= 4n-9 edges implies K7^= minor.
  - **Conj. 1.5: "Every 5-connected graph with n >= 6 vertices and at least 4n-2 edges contains K7^- as a minor."**
    They state this "would be sufficient to prove that K7^- -minor-free graphs are 6-colorable".
  - Thm 1.6 [S: wording from a model-summarised fetch; consistent with its use in the proof of Thm 1.1, which I
    read verbatim]: if G is K7^- -minor-free, not 6-colourable, and every proper minor is 6-colourable, then G is
    7-connected and |E(G)| >= 4|V(G)| - 2.
  - Remark [V]: no analogue for K7: two universal vertices + 5-connected plane triangulation on n-2 vertices is
    K7-minor-free, 7-connected, with 5n-15 edges.
- Chang–Deng–Tang–Yang, "A sharp density bound for 5-connected graphs with no K7^= minor", arXiv:2609.26041v1
  (22 Sep 2026) [V: abstract]: every 5-connected graph on n >= 7 vertices with at least 4n-9 edges contains a
  K7^= minor (settles DNR Conj. 1.4; sharp). Stronger: every 4-bilight graph on n >= 4 vertices with >= 4n-9 edges
  has a K7^= minor or a K6 subgraph.

---

## 3. Large highly connected graphs with no K_t minor

- Norin–Thomas (announced) [V from Robin Thomas's slides "K_t minors in large t-connected graphs",
  thomas.math.gatech.edu/SLIDE/ktminors.pdf]: MAIN THM (with Norin): for every t there is N_t such that every
  t-connected graph on >= N_t vertices with no K_t minor has a set X of at most t-5 vertices with G \ X planar.
  Slide notes: gives an iff; t-connectivity and |X| <= t-5 best possible; "N_t needed for t > 7"; previously
  proved for 31t/2-connected graphs (Kawarabayashi–Maharry–Mohar). Corollary on the slides: such G has
  |E| <= (t-2)n - (t-1)(t-2)/2.
  Publication status: see section 5 (to be completed).

---

## Progress marker
- Done: sections 1, 2, 3 (first pass). Pending: KEY QUESTION write-up (section 4), publication status of
  Norin–Thomas and KNTW (section 5), Mader extremal-graph characterisation (section 6), Rolek K9^= and K8^=
  context, search for 7-connected K7^- -minor-free examples.
