# Milestones

Proposed on 2026-10-07. Nothing here has been started except where a status says so.
Statuses of individual results are in `blueprint/BLUEPRINT.md`, never here.

## The single next task

**The rest of M3: the non-vacuity lemma for the hole relation, S-M3.hole-nonvacuous.**
Details under M3 below. The other parts of M3 (Lemma 2.2 and equation (2.3)) were proved on
2026-10-07 on branch `m3-hole-relation`.

M2 was completed on 2026-10-07 on branch `m2-proposition-3-5`: Proposition 3.5 is proved.
From here the final theorem rests on one `sorry` only, Theorem 1.1. Since M3 that is the
only `sorry` in the sources.

M0 was completed on 2026-10-07: every sanity lemma in its list is proved, and every
fidelity note carries the user's "Reviewed by" line. A definition or statement added or
changed from now on needs its own fidelity note and its own sign-off.

M1 was completed on 2026-10-07 on branch `m1-corollary-1-2`: its five `sorry`s were
replaced by proofs and no statement was changed. Statuses are in the blueprint. Whether
the branch has been merged into `main` is a question for `git log main`, not for this file.

## How the size estimates were made

They are estimates, with a wide range, and nothing more.

- Calibration: for five combinatorics papers that `openai/math` formalised in full, the
  Lean source is between 4 and 13 times the size of the paper's TeX source, median about
  7 (`docs/PROVENANCE.md` has the pointers; the figures compare directory sizes). The one
  part of this paper that upstream formalised, Proposition 3.5, came to 682 lines at about
  40 bytes a line, a ratio of about 8.
- A milestone's central estimate is its TeX size times 7, divided by 40 bytes a line. The
  range uses the factors 4 and 13.
- Adjustments by judgement are stated where made: upward where Mathlib lacks the
  prerequisites or the argument is infinitary.
- All of it assumes the paper's proof is correct and can be formalised as written. If a
  proof has a gap, the estimate for that milestone means nothing.

Whole project, central estimate: about 60,000 lines of Lean; plausible range 35,000 to
115,000. Theorem 3.1 (M6 to M17) is about nine tenths of it.

## Overview

| | Milestone | Blueprint entries | Lean lines, central (range) | Needs |
|---|---|---|---|---|
| M0 | Statement layer reviewed | all `DEFINED` entries; T-1.1, C-1.2, P-3.5, T-FINAL | 400 (300–600) | — |
| M1 | Corollary 1.2 from Theorem 1.1 and Proposition 3.5, including `χ_f ≥ \|V\|/α` | S-1.a, S-1.b, S-1.c, P-3.5 (second assertion), C-1.2 | 600 (400–800) | M0 |
| M2 | Proposition 3.5 | P-3.5 (first assertion) | 900 (700–1,200) | M0 |
| M3 | Section 2.1: the hole relation is triangle-free and gives `α ≤ 2` | L-2.2, S-2.3 | 250 (150–400) | — |
| M4 | Proposition 3.4, in abstract form | L-3.2, L-3.3, P-3.4, D-3.unit, D-3.KL | 4,500 (3,000–6,000) | M0, M3 |
| M5 | The construction, and the statement of Theorem 3.1 | D-2.par to D-2.sample, L-2.3, D-A.order, T-3.1 (statement only) | 2,500 (1,500–4,500) | M3 |
| M6 | Section 4: frame laws and peeling | L-4.1 to L-4.6 | 4,800 (2,800–9,000) | M5 |
| M7 | Section 5: moments and mixers | L-5.1 to L-5.5 | 3,400 (1,900–6,300) | M5 |
| M8 | Section 6: gradient realization | L-6.2, T-6.3 | 5,000 (2,900–9,300) | M7 |
| M9 | Section 7: collision criterion | P-7.1 | 2,300 (1,300–4,200) | M6, M8 |
| M10 | Section 8: phase alternative | T-8.2, L-8.3, L-8.4, L-8.5 | 5,700 (3,300–10,700) | M6 |
| M11 | Section 9: status preparation | P-9.2, L-9.3, L-9.4, L-9.5 | 5,300 (3,000–9,800) | M10 |
| M12 | Section 10: histograms and mixed-law estimates | L-10.1 to L-10.11 | 8,000 (4,600–14,800) | M6, M7 |
| M13 | Section 11: weak product testing | T-11.1, L-11.2, L-11.3, C-11.4 | 3,400 (1,900–6,300) | M12 |
| M14 | Section 12: the common limit | L-12.3 to L-12.6, P-12.7 | 6,500 (3,500–11,000) | M11, M13 |
| M15 | Section 13: solving the status constraints | L-13.2 to L-13.6, P-13.7 | 4,800 (2,700–8,900) | M14 |
| M16 | Section 14: the rare option; Theorem 3.1 | L-14.1, L-14.3, P-14.4, T-3.1 | 3,600 (2,100–6,800) | M9, M15 |
| M17 | Appendix A: an admissible parameter tuple exists; Theorem 1.1 | S-A.r0, S-A.M0, S-A.ledger, T-1.1 | 3,400 (2,000–6,300) | M4, M16 |

M1 to M4 are independent of M5 to M17. When M1, M2 and M17 are done, T-FINAL is `DONE`.

## M0 — Statement layer reviewed

- What: (1) a second reading of every note in `blueprint/FIDELITY.md` against the paper,
  ideally by the user; (2) Lean sanity lemmas that pin each new definition from both
  sides, so that a definition that was accidentally too weak or too strong would be
  caught.
- Sanity lemmas to prove:
  - minors: `HasCliqueMinor G t → t ≤ Fintype.card V`; `HasCliqueMinor G (hadwigerNumber G)`;
    `hadwigerNumber ⊤ = n` on `Fin n`; the path on three vertices has Hadwiger number 2 and
    the 4-cycle has 3; `hadwigerNumber` is monotone under adding edges and invariant under
    isomorphism.
  - connected matchings: `2 * connectedMatchingNumber G ≤ Fintype.card V`; the supremum is
    attained; the complete graph on `Fin n` has `cm = n / 2`; two disjoint edges with no
    edge between them have `cm = 1`.
  - fractional colourings: the set of totals is nonempty and bounded below by `0`;
    `χ_f` of the complete graph on `Fin n` is `n`; `χ_f` of the 5-cycle is `5/2`.
- Done when: every sanity lemma is `DONE`, and each fidelity note carries a line saying who
  reviewed it and when.
- Mathlib gaps: none expected. Uses the `SimpleGraph` connectivity, matching and colouring
  API as it is.
- Size: 400 lines (300–600).
- State on 2026-10-07 (statuses are in the blueprint, not here):
  - Part (2) is done. Every lemma listed above was proved as listed; none was false and no
    definition was changed. Some further checks were added, each with its reason in the
    blueprint. The three files under `Hadwiger/Sanity/` come to 809 lines including
    comments, against the estimate of 400 (300–600); the excess is the added checks and
    the supporting lemmas. No Mathlib gap was met.
  - Part (1) is done. A worker re-read every fidelity note against the paper and wrote
    `blueprint/M0_REVIEW_SHEET.md`; that re-read was preparation. The user then signed off
    all 20 items of the sheet on 2026-10-07, and every fidelity note carries the "Reviewed
    by" line.
  - The user answered the sheet's seven questions the same day. In consequence: a
    textbook citation was checked; the second half of equation (2.3) and the falsity of
    the fractional weakening were stated in Lean (blueprint S-2.3, D-1.fHC, S-1.d); and a
    non-vacuity lemma for the hole relation was entered for M3 (S-M3.hole-nonvacuous).

## M1 — Corollary 1.2 from Theorem 1.1 and Proposition 3.5

- What: S-1.a (`|V| ≤ α·k` for a proper `k`-colouring), S-1.b (`|V| ≤ α·χ_f`), S-1.c
  (`χ_f ≤ k`), the second assertion of P-3.5, and the assembly of C-1.2. Afterwards C-1.2
  and T-FINAL depend only on T-1.1 and the first assertion of P-3.5.
- Mathlib gaps: the fractional chromatic number is not in Mathlib; it is defined here.
  Nothing else: double counting over finsets and real arithmetic.
- Size: 600 lines (400–800). Upstream's proof of the `χ` half is about 100 lines; the
  `χ_f` half has no upstream counterpart.
- Available since M0, in `Hadwiger/Sanity/FractionalColoring.lean`:
  `FractionalColoring.card_le_mul_total` (if every independent set has at most `k` vertices
  then `|V| ≤ k · total`), `exists_fractionalColoring_of_family` (weights on a family of
  independent sets give a fractional colouring), `fractionalChromaticNumber_le_total` and
  `le_fractionalChromaticNumber`. S-1.b and S-1.c should be short from these.
- State on 2026-10-07 (statuses are in the blueprint, not here):
  - Done. The five `sorry`s named for M1 were replaced by proofs: S-1.a, S-1.b, S-1.c, the
    second assertion of P-3.5, and C-1.2. No statement was changed and no definition or
    declaration was added. Five `sorry`s remain; none belongs to M1.
  - Afterwards, as planned: C-1.2, and with it T-FINAL, T-NOT-HC and S-1.d, depend only on
    T-1.1 and on the first assertion of P-3.5.
  - The helper lemmas stayed in `Hadwiger/Sanity/FractionalColoring.lean`, which
    `Hadwiger/ChromaticBounds.lean` now imports. Reasons in `docs/SESSION_LOG.md`.
  - Size: about 65 lines of proof, against the estimate of 600 (400–800). Two reasons. M0
    had already proved the counting step and the other general lemmas (about 110 lines in
    `Hadwiger/Sanity/FractionalColoring.lean`). And these five items are short remarks in
    the paper whose Lean proofs are a few lines each, so a ratio taken from whole papers
    overstates them. This says nothing about the estimates for M4 onward, where the
    mathematics is not elementary.
  - No Mathlib gap was met. Used from Mathlib: `Coloring.not_adj_of_mem_colorClass`,
    `IsIndepSet.card_le_indepNum`, `Finset.card_eq_sum_card_fiberwise`,
    `chromaticNumber_le_iff_colorable`, `chromaticNumber_ne_top_iff_exists`.

## M2 — Proposition 3.5

- What: `3·h(G) ≤ m + 4·cm(G) + 2`. From a `K_b` minor model: the two-vertex branch sets
  are edges, the singleton branch sets form a clique and are paired off, and together they
  make one connected matching; the other branch sets have at least three vertices.
- Mathlib gaps: graph minors are not in Mathlib (pull request
  `leanprover-community/mathlib4#36210` was open on 2026-10-07); the definition here is
  used. Needed and probably missing: a connected induced subgraph on two vertices is an
  edge; building a `Subgraph` matching from a finite set of disjoint edges, with its
  `edgeSet.ncard`. The second of these exists since M0:
  `exists_isConnectedMatching_of_family` in `Hadwiger/Sanity/ConnectedMatching.lean`.
- Size: 900 lines (700–1,200). Upstream needed about 580 with a simpler representation of
  matchings; using Mathlib's `Subgraph.IsMatching`, as instructed, costs more.
- Noted at the end of M1, for whoever starts M2:
  - Only the first assertion is left. The second assertion already has its proof body and
    becomes `DONE` the moment the first does; so does everything from C-1.2 to T-FINAL
    except for its dependence on T-1.1.
  - Lemmas M2 is likely to need already exist under `Hadwiger/Sanity/`, proved at M0:
    `hasCliqueMinor_hadwigerNumber` (a `K_t` model with `t = h(G)` exists),
    `MinorModel.exists_injective_rep`, `exists_isConnectedMatching_of_family` and
    `IsConnectedMatching.ncard_le`. By the choice made at M1, import the `Sanity` file
    instead of moving them.
  - The paper's proof, for reference when reading it again: `s` singleton branch sets, `e`
    two-vertex branch sets, `c ≥ e + ⌊s/2⌋`, `m ≥ 3b − 2s − e`, hence
    `3b ≤ m + 2s + e ≤ m + 4c − 3e + 2`. This was checked by hand at the first reading
    (`blueprint/PAPER_ISSUES.md`, spot checks). It is not a Lean proof.
- State on 2026-10-07 (statuses are in the blueprint, not here):
  - Done. The first assertion is proved, with its statement unchanged, so P-3.5 has no
    `sorry` beneath it. Four `sorry`s remain: Theorem 1.1 and the three of M3.
  - The proof is the paper's, with its steps as eight lemmas in
    `Hadwiger/MatchingMinor.lean` (blueprint S-M2.pair-edge, S-M2.count, S-M2.matching).
    No definition was added.
  - Both Mathlib gaps named above were real and small. "A connected induced subgraph on
    two vertices is an edge" took nine lines (`adj_of_connected_induce_pair`); the matching
    from a family of disjoint edges was already there from M0.
  - Size: `Hadwiger/MatchingMinor.lean` grew from 71 lines to 310, comments included; 169
    of the added lines are Lean code. The estimate was 900 (700–1,200). As at M1, M0 had
    already supplied the general lemmas, and the argument is elementary. M1 and M2 both came
    in several times under their estimates, so the ratio used for the estimates overstates
    elementary combinatorics. That is no evidence about M4 onward.
  - Observation, recorded in the doc comment and the blueprint: the Lean proof does not
    use the hypothesis that the graph is nonempty.
  - One sanity check was added, in a commit of its own: the bound is attained by every
    complete graph of odd order (blueprint S-M2.tight). It is not in the paper.

## M3 — Section 2.1

- What: the two open parts of L-2.2 (no loops; triangle-free) and S-2.3 (`α ≤ 2` for the
  graph on positions). Symmetry is already proved.
- Also, on the user's decision of 2026-10-07: S-M3.hole-nonvacuous, a sanity lemma showing
  that some `HoleData` has a hole between two of its elements. A hand example to
  formalise is on `blueprint/M0_REVIEW_SHEET.md` under R-10.
- The second half of equation (2.3) is already stated, with a complete proof body from
  the first half and S-1.a; it becomes `DONE` when M3 and S-1.a (M1) are. S-1.a has been
  `DONE` since M1, so only M3 is outstanding for it.
- Noted at the end of M2, for whoever starts M3:
  - Three `sorry`s: `HoleData.not_hole_self`, `HoleData.not_hole_triangle`,
    `HoleData.indepNum_positionGraph_le_two`. The fourth declaration,
    `le_two_mul_chromaticNumber_positionGraph`, already has its proof body.
  - S-M3.hole-nonvacuous has no Lean statement yet. It will be a new statement, so it
    needs a blueprint row and, being a check on a definition and not a statement of the
    paper, no fidelity note of its own; say in the report that it is new.
  - M3 touches nothing that M1 and M2 touched. Finishing it does not change the status of
    the final theorem, which rests on Theorem 1.1 alone.
- Mathlib gaps: none. Linear maps over `ZMod 2` and a six-term sum in characteristic 2.
- Size: 250 lines (150–400).
- State on 2026-10-07 (statuses are in the blueprint, not here):
  - The three `sorry`s named above are replaced by proofs, each of them the paper's:
    `not_hole_self` (injectivity, then `a(λ) + a(λ) = 0` in `F_2`), `not_hole_triangle`
    (the six-term sum) and `indepNum_positionGraph_le_two` (an independent triple of
    positions gives a hole triangle). No statement was changed and no declaration was
    added. One `sorry` remains in the sources: Theorem 1.1.
  - `le_two_mul_chromaticNumber_positionGraph` now rests on nothing open. Its statement
    and its proof were not changed; one sentence of its doc comment, which said that it
    was `PROVED_MODULO`, was corrected.
  - The paper's proof of Lemma 2.2 went through as written. No paper issue was found.
  - No Mathlib gap was met. Used from Mathlib: `CharTwo.add_self_eq_zero`,
    `LinearMap.congr_fun`, `SimpleGraph.exists_isNIndepSet_indepNum`,
    `Finset.two_lt_card`.
  - Size: `Hadwiger/HoleRelation.lean` grew from 129 lines to 204, comments included; the
    Lean code in it grew by 41 lines. The estimate of 250 (150–400) also covered the
    non-vacuity lemma. As at M1 and M2, an elementary argument came in well under a
    ratio taken from whole papers; that is no evidence about M4 onward.

## M4 — Proposition 3.4, abstractly

- What: Lemma 3.2 (information projection), Lemma 3.3 (terminal cut), and Proposition 3.4
  (fingerprints, then the union bound). Proposed form: **abstract**. For any finite set
  `Ω` with a probability law `μ` and a symmetric, loopless, triangle-free relation, and
  any numbers `M`, `D'`, `ε`, `m` satisfying explicit numerical inequalities, if every law
  on units obeying the three caps has conflict probability at least `ε`, then some list of
  `m` elements has position graph with `cm < m/100`. The construction is not needed, so M4
  does not wait for M5.
- A recorded difference from the paper: Proposition 3.4 states probability
  `1 − exp(−Ω(m))` with a constant uniform in `n`. Theorem 1.1 uses only positive
  probability. The proposal is to prove existence. That is weaker than the proposition as
  printed and must be recorded as such in the blueprint when stated.
- Mathlib gaps, the main cost of this milestone:
  - max-flow/min-cut is not in Mathlib. Lemma 3.3 needs it with real capacities on a
    three-layer network. Options: prove that special case directly from a maximiser on a
    compact polytope, as the paper does; or derive it from Mathlib's hyperplane separation
    for cones.
  - the information-projection lemma (Csiszár) is not in Mathlib. Mathlib's `klDiv` is
    measure-theoretic and extended-real valued; a finite-sum relative entropy with its
    convexity and one-sided derivative will be needed.
  - Kleitman–Winston fingerprints: nothing in Mathlib; the deterministic procedure and its
    replay argument are written from scratch.
  - available: compactness of the simplex, product measures on finite types, the union
    bound, `Nat.choose` estimates.
- Size: 4,500 lines (3,000–6,000). The TeX is short (about 10 KB) but three pieces of
  missing infrastructure sit underneath it, so the ratio is taken well above the median.

## M5 — The construction and the statement of Theorem 3.1

- What: every `D-2.*` construction (tags, blocks, `B`, point moments, `W`, `W_l`, the cut
  space `X`, testers, `a`, `a_t`, `b_t`, `T^0`, `T^1`, `E`, raw vertices, `Ω_n`, `μ_n`,
  `U_o`, `u_o`), Lemma 2.3, the identities `T(x,x) = a(x)`, `⟨E,w⟩ = η(w)`, `u_o U_o = 0`,
  injectivity of `U_o`, nonemptiness and size of `Ω_n`; the parameter structure of
  Appendix A; and then the **statement** of Theorem 3.1.
- Why it is a milestone of its own: Theorem 3.1 cannot even be stated until all of this
  exists, and its statement is an existential over the parameter structure (PI-005). This
  is the first gate on the hard part of the paper.
- Mathlib gaps: none fundamental. Matrices, tensor products and bilinear forms over
  `ZMod 2` exist. Uniform laws on finite sets exist. The cost is bookkeeping.
- Size: 2,500 lines (1,500–4,500).

## M6 to M17 — Theorem 3.1, section by section

One milestone per section. For each: what it contains is in the overview table and the
blueprint; below are the Mathlib gaps and what makes it hard.

- **M6, Section 4.** Orbits of `GL(V)` on pairs of frames with a fixed Gram matrix
  (Lemma 4.1); counting uniform `F_2` vectors and matrices under rank and Gram
  constraints; the peeling procedure. Gaps: rank statistics of uniform matrices over a
  finite field are not in Mathlib. Lemma 4.6 (Walsh) is elementary; Mathlib's additive
  characters help.
- **M7, Section 5.** Lemma 5.2 is a flat-extension argument with commuting idempotent
  operators on a quotient by the radical of a form. Lemma 5.5 is a probabilistic existence
  argument over uniform matrices. Gaps: none named in Mathlib; everything is from scratch.
- **M8, Section 6.** Theorem 6.3: a 400-line deterministic linear-algebra proof with many
  nominal spaces, quotients and rank bounds. No Mathlib gap; long, and its statement must
  first be made precise (PI-004).
- **M9, Section 7.** Proposition 7.1: pruning, a character expansion and Lemma 4.6. First
  place where the `2^{-o(N)}` statements must be given explicit form (PI-002).
- **M10, Section 8.** A high-moment argument (Lemma 8.3), covers, and Lemma 8.5, which
  uses the rank of an entrywise product of matrices and binary entropy. Gaps: the
  Hadamard-product rank bound may be missing; `binEntropy` exists.
- **M11, Section 9.** Lemma 9.3 needs "a nonzero Boolean polynomial of degree `k` is
  nonzero with probability at least `2^{-k}`". Lemma 9.5 is the synthetic-array argument
  (not followed on first reading; see `PAPER_ISSUES.md`).
- **M12, Section 10.** The longest section. Method of types, Pinsker's inequality, the
  entropy chain rule, uniform integrability, a martingale-difference bound, and a
  compactness argument for nets. Gaps: Pinsker and the method of types are probably not in
  Mathlib; uniform integrability and conditional expectation are.
- **M13, Section 11.** A weak-regularity (energy increment) lemma with Gram twists, proved
  in the paper, and a four-copy Cauchy–Schwarz argument. Gaps: Mathlib has Szemerédi
  regularity for graphs, not this; from scratch.
- **M14, Section 12.** The proof leaves finite probability: limits of laws on compact
  sequence spaces along subsequences, almost-everywhere densities, random conditional
  laws, Fubini. Gaps to check at the pinned Mathlib: compactness of (sub)probability
  measures on a compact metrizable space under weak convergence; the rest
  (Radon–Nikodym, product measures, `L^2` conditional expectation) exists. This milestone
  carries the largest uncertainty; its estimate is raised by about a third over the ratio.
- **M15, Section 13.** Finite-dimensional duality and a careful list construction, but
  carried out inside the limiting experiment of M14, and Lemma 13.3 transfers a limiting
  object back to finite `n`.
- **M16, Section 14.** A second, one-law limiting argument (Lemma 14.1), a net lemma, and
  the two closing proofs.
- **M17, Appendix A.** Showing that the finitely many requirements on the parameters can
  be met in the stated order, with explicit, very large constants (`g = 10^9 + 1`,
  `M = 2^1000`). Arithmetic, not mathematics, but the requirements on `M_0` must first be
  collected from every earlier proof (PI-005). Then Theorem 1.1 from M4 and Theorem 3.1.

## Order and gates

Recommended order: M0, then M1, M2, M3 (small, independent, and they make everything
except Theorem 1.1 `DONE`), then M4, then M5.

Gate before M6: once M5 is done and Theorem 3.1 is stated, re-read Sections 4 to 14
slowly against the six "steps not followed" in `PAPER_ISSUES.md`, and decide with the user
whether to continue. About nine tenths of the effort lies beyond this gate, the proof
beyond it is unverified by anyone as far as this project knows, and the upstream authors,
whose README says that many but not all of their manuscripts have been formalised, have
not published a formalisation of this theorem.

Upstream may publish a formalisation of the rest at any time; the project rules say to
tell the user if it does.
