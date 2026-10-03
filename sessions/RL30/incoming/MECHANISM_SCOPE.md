# M1 scope freeze — before local consequences

Status: historical scope stated before consequences; assessment completed and frozen as RL4-P01/P02/P03 in RL4_ADMISSIBILITY_REPORT.md. The original pre-assessment text is preserved byte-identically in checkpoint/.

Let Q={q1,q2}. For every finite simple graph P with chi(P)=4, let H=K2 join P with universal clique Q. For every S subseteq V(H), put T=S intersect V(P).

M1 claim: if every proper six-coloring of H uses all six colors on S, then H has six simultaneous nonempty, disjoint, connected, pairwise adjacent branch sets each meeting S. Roots are flexible; T and S have no upper cardinality bound, P has no order bound.

Independent obstruction form to assess: for every such P and every S containing Q, absence of an S-rooted K6 implies existence of a proper six-coloring missing a color on S. The independent input is the inherited checked Martinsson-Steiner rooted-K4 theorem, not CR6 or ordinary order 7.

Proposed sufficiency route: universal vertices use exclusive colors, so Q must be in S and T must be colorful in P; obtain one simultaneous T-rooted K4 in P, then add singleton q1 and q2. Each old-new adjacency is witnessed by universality, and q1q2 is an edge.

Residual coverage: every chi=6 H lacking two universal vertices; no reduction of arbitrary H or a minimal order-7 counterexample to this family is known. All CR_s for s>=7 and ordinary orders t>=8 remain even after universal CR6. No graph census, extrapolation of rooted-K4 structure, or dependent local-lemma program is authorized by M1.

Falsification: a countermodel must satisfy chi(P)=4 and the all-colorings premise while excluding EVERY simultaneous S-rooted K6. An unrooted model, chosen coloring, fixed six roots, or noncolorful CM-R is insufficient.

Original planned operation, now completed: verify both colorfulness factorization directions and simultaneous assembly for arbitrary S; audit the structural coverage restriction. RL4 stopped after this single assessment without a universal six-color obstruction theorem. RL5 is governed only by its own brief.
