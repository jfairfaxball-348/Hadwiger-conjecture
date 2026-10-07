# Blueprint — single source of truth

Paper: "A counterexample to Hadwiger's conjecture", OpenAI, 23 September 2026
(provenance, hash and licence in `docs/PROVENANCE.md`).

This file has one entry for every definition, lemma, proposition, theorem and corollary of
the paper, plus the unnumbered claims that the main results rely on. For each entry it
records where it is in the paper, what it depends on, its Lean name, and its status.

The last section, "Sanity checks (not in the paper)", is different in kind: its entries
(`S-M0.*`) are checks on this repository's definitions, not statements of the paper.

**It replaces the old proof-state file. If this file and anything else disagree about what
is stated or proved, this file is wrong and must be fixed; nothing else is authority.**
`python scripts/axiom_audit.py` checks every status in it against the actual build.

## How to read an entry

| Column | Meaning |
|---|---|
| ID | `T-` theorem, `P-` proposition, `L-` lemma, `C-` corollary, `D-` definition or construction, `S-` unnumbered statement made in running text. Numbers follow the paper (`L-2.2` is Lemma 2.2). IDs of the form `S-M0.<name>` are the sanity checks of milestone M0; they are not in the paper. |
| Kind | What the paper calls it. |
| Paper location | Section, number, and the TeX label in the paper's source. |
| Statement | A short paraphrase. The paper is the authority for the exact statement. |
| Depends on | Blueprint IDs used in the paper's proof (or in the definition). |
| Lean | Fully qualified Lean name(s) in backticks, or `—`. |
| Status | See below. |

Statuses (full definitions in `docs/STATUS_CLASSIFICATIONS.md`):

| Status | Meaning |
|---|---|
| `NOT_STATED` | No Lean statement or definition yet. |
| `MATHLIB` | Definition: Mathlib's own definition is used unchanged. |
| `DEFINED` | Definition: new Lean definition in this repository, with a fidelity note. |
| `STATED` | Result: the Lean statement compiles; its proof is `sorry`. |
| `PROVED_MODULO` | Result: the proof body is complete, but something it depends on is still `sorry`. |
| `DONE` | Result: compiles, no `sorry` anywhere beneath it, and `#print axioms` shows only `propext`, `Classical.choice`, `Quot.sound`. |

An entry with several Lean names has the weakest status among them.

Paper-side problems (gaps, errors, ambiguities) are not statuses. They are recorded in
`blueprint/PAPER_ISSUES.md` and cited in the entry's Statement column as `[PI-n]`.

---

## Section 1 — Introduction

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-1.alpha | definition | §1 ¶1 | Independence number `α(G)`. | — | `SimpleGraph.indepNum` | MATHLIB |
| D-1.chi | definition | §1 ¶1 | Chromatic number `χ(G)`. | — | `SimpleGraph.chromaticNumber` | MATHLIB |
| D-1.minor | definition | §1 ¶1 (used, not spelled out) | `G` contains a `K_t` minor. Formalised through minor models (branch sets). | — | `Hadwiger.MinorModel`, `Hadwiger.IsMinor`, `Hadwiger.HasCliqueMinor` | DEFINED |
| D-1.h | definition | §1 ¶1 | Hadwiger number `h(G)`: the largest `t` with a `K_t` minor. | D-1.minor | `Hadwiger.hadwigerNumber` | DEFINED |
| D-1.HC | definition | §1 ¶2 | Hadwiger's conjecture: `h(G) ≥ χ(G)` for every finite nonempty simple graph. | D-1.h, D-1.chi | `Hadwiger.HadwigerConjecture` | DEFINED |
| D-1.touch | definition | §1 ¶3 | Two disjoint edges touch if an edge joins their endpoint sets. | — | `Hadwiger.EdgesTouch` | DEFINED |
| D-1.cm | definition | §1 ¶3 | Connected matching: a matching whose edges pairwise touch. `cm(G)` is its maximum size. | D-1.touch | `Hadwiger.IsConnectedMatching`, `Hadwiger.connectedMatchingNumber` | DEFINED |
| T-1.1 | theorem | §1, Theorem 1.1 (`thm:main`) | For arbitrarily large `m` there is an `m`-vertex graph with `α(G) ≤ 2` and `cm(G) < m/100`. Proved at the end of §14.4 ("Proof of Theorem 1.1"): Proposition 3.4 applied to Theorem 3.1 at every large `n`, with `m = 2^{C_0 g N}` unbounded. | P-3.4, T-3.1 | `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` | STATED |
| S-1.a | statement | §1, after Theorem 1.1 | Every colour class has size at most `α(G)`, so `χ(G) ≥ \|V\|/α(G)`. | D-1.alpha, D-1.chi | `Hadwiger.card_le_indepNum_mul_of_colorable` | STATED |
| D-1.fcol | definition | §1, after Theorem 1.1 | Fractional colouring: nonnegative weights on independent sets covering every vertex with total at least 1. | D-1.alpha | `Hadwiger.FractionalColoring`, `Hadwiger.FractionalColoring.total` | DEFINED |
| D-1.chif | definition | §1, after Theorem 1.1 | Fractional chromatic number `χ_f(G)`: least total weight of a fractional colouring. | D-1.fcol | `Hadwiger.fractionalChromaticNumber` | DEFINED |
| S-1.c | statement | §1, after Theorem 1.1 | `χ_f(G) ≤ χ(G)`: a proper colouring is a fractional colouring with unit weights. | D-1.chif, D-1.chi | `Hadwiger.fractionalChromaticNumber_le_of_colorable` | STATED |
| S-1.b | statement | §1, proof of Corollary 1.2 | `χ_f(G) ≥ \|V\|/α(G)`, by summing the vertex constraints. | D-1.chif, D-1.alpha | `Hadwiger.card_le_indepNum_mul_fractionalChromaticNumber` | STATED |
| C-1.2 | corollary | §1, Corollary 1.2 (`cor:hadwiger`) | Graphs of arbitrarily large order `m` with `h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`. | T-1.1, P-3.5, S-1.b, S-1.c | `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` | STATED |
| T-FINAL | theorem | abstract; §1, Corollary 1.2 | Finite simple graphs of arbitrarily large order whose chromatic number exceeds their Hadwiger number. This is the project's final theorem. | C-1.2 | `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber` | PROVED_MODULO |
| T-NOT-HC | theorem | §1, Corollary 1.2, last sentence | Hadwiger's conjecture is false. | T-FINAL, D-1.HC | `Hadwiger.not_hadwigerConjecture` | PROVED_MODULO |
| S-1.d | statement | §1, Corollary 1.2, last sentence | The fractional weakening `χ_f(G) ≤ h(G)` is false. Immediate from C-1.2. | C-1.2 | — | NOT_STATED |
| S-1.e | statement | §1, after Corollary 1.2 | Reed and Seymour's convention (rational weights, coverage exactly one, total at most `p`) gives colourings admissible in D-1.fcol, so their prediction fails with `p = h(G)`. Commentary on the literature; not a formalisation target unless the user asks. | C-1.2 | — | NOT_STATED |

## Section 2 — The hole relation and its tensor realization

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-2.0 | definition | §2.1 ¶1 | Linear data: `F_2`-spaces `X`, `V`; functional `a`; symmetric bilinear `T`; `r(x) = a + T(x,·)`; for each `i ∈ Ω` an injective `U_i : X → V` and a functional `u_i` on `V`. | — | `Hadwiger.HoleData`, `Hadwiger.HoleData.r` | DEFINED |
| D-2.1 | definition | §2.1, Definition 2.1 (`def:hole`) | Hole between `i` and `j`: witnesses `λ_i, λ_j` with `U_i λ_i = U_j λ_j`, `u_j U_i = r(λ_i)`, `u_i U_j = r(λ_j)`, `a(λ_i) + a(λ_j) = 1`. | D-2.0 | `Hadwiger.HoleData.Hole` | DEFINED |
| L-2.2 | lemma | §2.1, Lemma 2.2 (`lem:hole-triangle-free`) | The hole relation is symmetric, has no loops, and is triangle-free. Symmetry is proved; the other two parts are `sorry`. | D-2.1 | `Hadwiger.HoleData.Hole.symm`, `Hadwiger.HoleData.not_hole_self`, `Hadwiger.HoleData.not_hole_triangle` | STATED |
| D-2.G | definition | §2.1, after Lemma 2.2 | Graph on the positions of a list `o_1, …, o_m`: distinct positions are adjacent when their elements have no hole. | D-2.1 | `Hadwiger.HoleData.positionGraph` | DEFINED |
| S-2.3 | statement | §2.1, equation `eq:sample-independence` | For the graph on positions, `α(G) ≤ 2` and `χ(G) ≥ ⌈m/2⌉`. The Lean statement is the first half; the second half is the first half combined with S-1.a. | L-2.2, D-2.G, S-1.a | `Hadwiger.HoleData.indepNum_positionGraph_le_two` | STATED |
| D-2.par | construction | §2.2, equations `eq:early-constants`, `eq:parameter-order` | Parameters: `C_0 = 1000`, `g = 10^9 + 1` (odd), `D = 4 C_0 g`, `M = 2^1000`; later choices `j_*`, `b`, `J`, `r_0`, `h = 1000 r_0`, and last `M_0`; `N = M_0 n`, `m = 2^{C_0 g N}`. `n` is the only asymptotic parameter. The full order of choices is Appendix A. | D-A.order | — | NOT_STATED |
| D-2.tags | construction | §2.3 ¶1 | Tags `I = Z/g`, components `E = (I choose 2)`, intervals `I_d`; base variable blocks `O_{d,t}`, `S`, `#`, `Z` of `n` bits each (`g^2 + 3` blocks); a selector of `b` bits whose values are labels. | D-2.par | — | NOT_STATED |
| D-2.B | construction | §2.3, equation `eq:point-evaluation` | `p_* = Σ_{j ≤ j_*} (b choose j)`; coefficient space `B = F_2^{p_*} ⊗ F_2^{1 + (g^2+3)n}`; point evaluation `v(s,z) = p_s ⊗ (1,z)`. | D-2.tags | — | NOT_STATED |
| D-2.W | construction | §2.3 | `W`, the span of the point moments `v v^T` in `B ⊗ B`; `W_l` (moments whose `O_{d,t}` vanish when `l ∉ I_d`); `W_*` (all `O`-blocks zero). | D-2.B | — | NOT_STATED |
| D-2.X | construction | §2.3, equation `eq:cut-profile-space` | Cut-profile space `X`: tuples `x_{{l,l'}} = w_l + w_{l'}` with `w_l ∈ W_l`; a representation of `x` is such a tuple `w`. | D-2.W | — | NOT_STATED |
| L-2.3 | lemma | §2.3, Lemma 2.3 (`lem:cut-kernel`) | The intersection of the `W_l` over any strict majority of tags is `W_*`; two representations of one cut profile differ by a constant tuple with value in `W_*`. | D-2.W, D-2.X | — | NOT_STATED |
| D-2.eta | construction | §2.3, equation `eq:cut-functionals` | Testers `η_{d,t}`, `η_S`, `η_O`, `η` on moments; functionals `a_t`, `a`, `b_t` on `X` (well defined by L-2.3) and `χ_*` on representations. | L-2.3 | — | NOT_STATED |
| D-2.T | construction | §2.3, equations `eq:T-zero`, `eq:T-one`, `eq:T-diagonal` | `T^0 = a⊗a + Σ_t (a_t⊗b_t + b_t⊗a_t)`; mixers `L_j^{ef}`, `R_j^{ef}` on `B`; `B^1`, `T^1`, `T = T^0 + T^1`; the identity `T(x,x) = a(x)`. This supplies `a` and `T` of D-2.0. | D-2.eta, L-5.5 | — | NOT_STATED |
| D-2.E | construction | §2.3, equations `eq:E-sharp`, `eq:E-moments` | Self-frame Gram matrix `E`: the tester matrices for `η` plus `E^#`; the identity `⟨E, w⟩ = η(w)` for `w ∈ W`. | D-2.eta, L-5.5 | — | NOT_STATED |
| D-2.raw | construction | §2.4, equations `eq:raw-frame-law`, `eq:raw-space-size` | Raw vertex (orientation): maps `P_e, Q_e` on `B` and `X_e, Y_e` on `F_2^h` into `V_e^±`, with `[P_e,X_e]`, `[Q_e,Y_e]` injective, `P_e^T Q_e = E`, `X_e^T Q_e = 0`, `P_e^T Y_e = 0`. `Ω_n` is the set of raw vertices, `μ_n` the uniform law; `Ω_n` is nonempty for large `n` and `log_2 \|Ω_n\| = O(N^2)`. | D-2.E, D-2.par | — | NOT_STATED |
| D-2.U | construction | §2.4, equations `eq:raw-embedding`, `eq:self-contraction-zero` | Ambient space `V = ⊕_e V_e^+ ⊗ V_e^-`; `U_o x = (P_e x_e Q_e^T)_e` and `u_o(ξ) = Σ_e ⟨Y_e X_e^T, ξ_e⟩`; each `U_o` is injective and `u_o U_o = 0`. This supplies `U`, `u` of D-2.0, so L-2.2 applies to `Ω_n`. | D-2.raw, D-2.X | — | NOT_STATED |
| D-2.sample | construction | §2.4, last paragraph | The sampled graph: `m` independent raw vertices with law `μ_n`, and the graph on their positions. `α(G) ≤ 2` holds deterministically. | D-2.U, D-2.G, S-2.3 | — | NOT_STATED |

## Section 3 — From supersaturation to a finite graph

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-3.unit | definition | §3 ¶1 | Unit: an ordered pair of raw vertices with no hole between them (endpoints may be dependent, and may coincide). Two units conflict when all four cross pairs are holes. | D-2.1, D-2.raw | — | NOT_STATED |
| T-3.1 | theorem | §3, Theorem 3.1 (`thm:raw-supersaturation`); proof at the end of §14.4 | Raw supersaturation: for the fixed construction parameters and all sufficiently large `n`, every law `σ` on units with `σ_1 ≤ Mμ`, `σ_2 ≤ Mμ`, `σ ≤ 2^{DN} μ^2` gives two independent units all four cross holes with probability at least `2^{-100gN}`. | L-4.5, L-5.5, P-7.1, P-9.2, P-13.7, P-14.4, D-A.order | — | NOT_STATED |
| D-3.KL | definition | §3.1 | Relative entropy `D(ρ‖q) = Σ ρ log(ρ/q)` on a finite set, natural logarithm, `q` strictly positive. | — | — | NOT_STATED |
| L-3.2 | lemma | §3.1, Lemma 3.2 (`lem:entropy-support`) | Information projection: a minimiser `ρ` of `D(·‖q)` on a nonempty compact convex set `P` of laws is positive on the union of supports of `P`; `D(ρ'‖q) − D(ρ‖q) ≥ D(ρ'‖ρ)`; and if `ρ'` is supported on `S` this is at least `−log ρ(S)`. | D-3.KL | — | NOT_STATED |
| L-3.3 | lemma | §3.1, Lemma 3.3 (`lem:terminal-cut`) | Terminal cut: if no law supported on `R ⊆ Ω_n^2` satisfies the three caps, there are `S` with `μ(S) < 1/M` and `E_0` with `μ^2(E_0) < 2^{-DN}` such that every pair in `R` has an endpoint in `S` or lies in `E_0`. Proved by max-flow/min-cut with real capacities. | — | — | NOT_STATED |
| P-3.4 | proposition | §3.2, Proposition 3.4 (`prop:raw-to-graph`) | Assuming the conclusion of T-3.1 at a given large `n`: the sampled graph on `m = 2^{C_0 g N}` positions has `α(G) ≤ 2` and `cm(G) < m/100` with probability `1 − exp(−Ω(m))`. Entropy-controlled fingerprints (containers), then a union bound over terminal sets. | T-3.1, L-3.2, L-3.3, L-2.2, D-2.sample, D-3.unit, D-1.cm | — | NOT_STATED |
| P-3.5 | proposition | §3.3, Proposition 3.5 (`prop:matching-minor`) | `h(G) ≤ (m + 4 cm(G) + 2)/3` for every finite nonempty graph of order `m`; and if `α(G) ≤ 2`, `cm(G) < m/100`, `m ≥ 5`, then `h(G) < 26m/75 + 2/3 < m/2 ≤ χ(G)`. | D-1.h, D-1.cm, S-1.a | `Hadwiger.three_mul_hadwigerNumber_le`, `Hadwiger.hadwigerNumber_lt_of_indepNum_le_two` | STATED |

## Section 4 — Frame laws and preparation of unit laws

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| L-4.1 | lemma | §4.1, Lemma 4.1 (`lem:paired-frame-orbit`) | For injective `A, A' : U → V` and `B, B' : W → V*` over `F_2` with `B^T A = B'^T A'`, some `L ∈ GL(V)` has `LA = A'` and `L^{-T} B = B'`. | — | — | NOT_STATED |
| L-4.2 | lemma | §4.1, Lemma 4.2 (`lem:gram-frame-normalization`) | For `p` uniform plus and `q` uniform minus vectors in `F_2^N`, `p + q ≤ N`, a prescribed Gram matrix together with injectivity of both frames has probability between `2^{-pq}(1 − 2^{p−N})(1 − 2^{p+q−N})` and `2^{-pq}`. | — | — | NOT_STATED |
| L-4.3 | lemma | §4.1, Lemma 4.3 (`lem:frame-images`) | For large `n`: (a) the structure of the raw frame law (uniform injective plus frame; conditional law of minus columns; channel laws; failure bounds); (b) images of independent coefficient tuples are uniform subject to injectivity and Gram constraints; (c) the image cap `eq:reference-image-cap`: prescribed images of a tuple of nominal rank `t` have `μ^2`-probability at most `2^{-(1−ε)tN}`, for every `t`. | L-4.1, L-4.2, D-2.raw | — | NOT_STATED |
| D-4.rank | definition | §4.2 | Total component rank of a matrix profile: `Σ_e rank x_e`. | D-2.X | — | NOT_STATED |
| L-4.4 | lemma | §4.2, Lemma 4.4 (`lem:raw-intersections`) | For `σ` with the joint cap, outside `σ`-probability `2^{-Ω(N)}`: `Σ_e dim(im P_{1,e} ∩ im P_{2,e}) ≤ 2D`; any `U_1 λ_1 = U_2 λ_2` has both `λ_i` of total component rank at most `2D`, each with a unique representation vanishing at a strict majority of tags, with at most `4D/g` nonzero coordinates and `χ_*(w_1) = χ_*(w_2)`. | L-4.3, L-2.3, D-2.E, D-4.rank | — | NOT_STATED |
| D-4.pin | definition | §4.3 | Nominal coefficient spaces `L_{O,e}`, `R_{O,e}` of a unit; pin space (a subspace with prescribed exact images of a basis); rank modulo the pins. | D-2.raw, D-3.unit | — | NOT_STATED |
| D-4.budgets | construction | §4.3, equations `eq:pin-budgets`, `eq:law-budgets` | `k_max = 56(g−1)`, `ζ = 1/(1000 k_max)`, `K_1 = ⌈4(D+1)/ζ⌉`; `r = 2K_1 + 2`, `L_0 = ⌈100(D+10)⌉`, `d_0 = 4rL_0`, `u_0 = 10(K_1 + d_0 + 1)`, `K = ⌈10(D + K_1 + u_0 + 10)/ζ⌉`. | D-2.par | — | NOT_STATED |
| L-4.5 | lemma | §4.3, Lemma 4.5 (`lem:peeling`) | Two peelings. (a) A capped law is partitioned, up to mass `2^{-ζN}` and the L-4.4 exception, into leaves with pin spaces of total dimension at most `K_1` on which any exact-image constraint of rank `t` modulo the pins has probability at most `2^{-(1−ζ)tN}`; leaf laws are `2^{O(N)} μ^2`. (b) Restrictions of relative mass `2^{-o(N)}` keep the bound with `1 − 2ζ`. (c) Pinning at most `u_0` further directions and peeling again keeps total pin dimension at most `K`. | L-4.4, L-4.3, D-4.pin, D-4.budgets | — | NOT_STATED |
| L-4.6 | lemma | §4.4, Lemma 4.6 (`lem:walsh`) | Walsh estimates. (a) `\|E f(x) g(y) (−1)^{B(x,y)}\| ≤ 2^{-d/2}` for a bilinear form of rank `d` and independent uniform `x, y`. (b) The same sum against subprobability measures with point masses at most `p_1, p_2` is at most `2^{d/2} (p_1 p_2)^{1/2}`. (c) A cross-pairing character with coefficient matrix `C` on `N`-bit slots has bit rank `N · rank C`. | — | — | NOT_STATED |

## Section 5 — Low-rank moments and mixing forms

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-5.par | construction | §5 ¶2, equation `eq:moment-parameters` | `R_* = 2(K + 20)`, `j_* ≥ 10(K+1)(R_* + 20)`; `d_b = (g^2+3)n` base coordinates, constant coordinate indexed `0`. | D-4.budgets | — | NOT_STATED |
| L-5.1 | lemma | §5.1, Lemma 5.1 (`lem:base-moments`) | The span of the `(1,z)(1,z)^T` is exactly the symmetric matrices with `Z_{ii} = Z_{0i}`; the evaluation vectors `p_s` of any `u` distinct selectors are independent if `j_* ≥ u − 1`. | D-2.B | — | NOT_STATED |
| L-5.2 | lemma | §5.1, Lemma 5.2 (`lem:label-support`) | Label support: every `w ∈ W` of rank at most `R_*` is `Σ_{s ∈ L} (p_s ⊗ I) Z_s (p_s ⊗ I)^T` with `\|L\| ≤ R_*`, each `Z_s` symmetric with `(Z_s)_{ii} = (Z_s)_{0i}`, and `Σ rank Z_s ≤ R_*`. Flat-extension argument with commuting idempotent multiplication operators. | L-5.1, D-5.par | — | NOT_STATED |
| D-5.S | definition | §5.2 ¶1 | Projected pin spaces `S_{i,e}^±` (projections of the pin spaces onto an endpoint's primal block); label support of a sparse expansion `Σ_s p_s ⊗ z_s`. | D-4.pin | — | NOT_STATED |
| L-5.3 | lemma | §5.2, Lemma 5.3 (`lem:sparse-pin-labels`) | With `L_0^lab = R_* + 14`: at an endpoint, the labels occurring in vectors of the `S_{i,e}^±` expressible on at most `L_0^lab` labels number at most `B_0 = 2\|E\|K(R_* + 14)`. | L-5.1, D-5.S, D-5.par | — | NOT_STATED |
| D-5.b | construction | §5.2, equation `eq:selector-size` | `B_* = 10(B_0 + 10000g + 1)`; the selector size `b` with `2^{b − 2j_*} > 100g(B_* + 1)`. | L-5.3 | — | NOT_STATED |
| D-5.C | definition | §5.2, equations `eq:effective-space`, `eq:effective-bounds` | Effective test space `C_i = {x ∈ X : x_e ∈ S_{i,e}^+ ⊗ S_{i,e}^- for all e}`; `dim C_i ≤ K^2` and `Σ_e rank x_e ≤ K` on it. | D-5.S, D-2.X | — | NOT_STATED |
| D-5.4 | definition | §5.2, Definition 5.4 (`def:atom`) | Atoms `a_l(s,z) ∈ X` (a single point moment at tag `l`), their diagonal bit `q` and role bit; flavors (generic, shared-only, pure); parameter test; tester summary. | D-2.X, D-2.eta, D-5.C | — | NOT_STATED |
| D-5.mix | construction | §5.3, equation `eq:mixer-parameters` | `A = 10(K+1) p_* (g^2+5)`, `s_0 = 4⌈A⌉`, `J > 100(s_0 + K^2 + 1)`; fixed before `r_0`, `h`, `M_0`. | D-5.par, D-5.b | — | NOT_STATED |
| L-5.5 | lemma | §5.3, Lemma 5.5 (`lem:generic-mixers`) | For large `n` the mixers `L_j^{ef}`, `R_j^{ef}` and the matrices in `E^#` can be chosen so that (i) for every nonzero `x ∈ X` of total component rank at most `K`, `T(x, a_l(s,z))` as a quadratic in the `Z` bits has polar rank at least `2(J − s_0)`; (ii) for two distinct labels every nonzero parity of ordered `L`, `R` (and `E`) evaluations has bilinear rank at least `n/5`. Probabilistic existence by a union bound. [PI-003] | D-5.mix, D-5.4, D-2.T, D-2.E | — | NOT_STATED |
| R-5.6 | remark | §5.3, Remark 5.6 (`rem:Z-reparametrization`) | The raw frame law is invariant under a common `GL_n(2)` change of the `Z` coordinates at one vertex. Used later in unary probability estimates. | D-2.raw, D-2.E | — | NOT_STATED |

## Section 6 — Recipes and realization of the gradients

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-6.keys | definition | §6.1 ¶1 | Paired witnesses: for each cross pair `i, z`, one to seven atoms at each, matched preserving tag and diagonal bit, labels distinct and outside the L-5.3 exclusions; `v_{iz}` the sum of the list; nominal key direction, vector key, matching keys; `p_i = u_{i'} U_i`. | D-5.4, L-5.3, D-2.U | — | NOT_STATED |
| D-6.1 | definition | §6.1, Definition 6.1 (`def:small-table`) | Small table for two leaves: the cross bilinear forms on the table spaces `J_{O,e}^±`; admissible (agrees with actual cross Grams on pin arguments); private complements `H_{i,1}^±`; injecting (`eq:table-injection`). | D-5.S, D-4.pin | — | NOT_STATED |
| D-6.recipe | definition | §6.1, equation `eq:recipe-scalars` | Starred contractions `(u_z U_i)^*` on `C_i`; scalar recipe: `Σ q = 1` on each list, `a(v_{iz}) + a(v_{zi}) = 1`, `T(v_{iz},·) = a + (u_z U_i)^*` on `C_i`, and `(p_i + a)(v_{iz}) = (p_{i'} + a)(v_{i'z})`. | D-6.keys, D-6.1, D-5.C | — | NOT_STATED |
| L-6.2 | lemma | §6.1, Lemma 6.2 (`lem:small-tables`) | (i) Admissibility is an intersection of two unary orientation filters, with `O(n)`-bit description. (ii) Key directions at a unit are independent modulo its table spaces. (iii) Given the scalar recipe there are binary `L`, `R` prescriptions making `r(v_{iz})` take the values `eq:recipe-gradients` on the listed atoms. | L-5.3, L-5.5, D-6.recipe, D-2.T | — | NOT_STATED |
| T-6.3 | theorem | §6.2, Theorem 6.3 (`thm:gradient-realization`) | Gradient realization (deterministic): given lists satisfying the recipe, the binary prescriptions, equal matched keys and an admissible injecting table, there are abstract cross bilinear forms extending all frozen entries with `u_z U_i = r(v_{iz})` on all of `X`; at most `16\|E\| h dim B = O(n)` primal-channel entries need prescribing; agreement of the actual cross Grams with them gives all four cross holes. Needs `970 r_0 > 28J\|E\| + D_quo + 2K + 4B_lin`. [PI-004] | L-5.2, L-5.3, L-6.2, D-6.1, D-6.recipe, D-2.U, D-2.1 | — | NOT_STATED |

## Section 7 — From overlapping key distributions to four holes

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-7.query | definition | §7.1, equations `eq:key-rank-budget`, `eq:key-space-size` | Numerical template (shape of all lists, numerical unary statuses, binary prescriptions, optional table and filters); query (fresh point parameters, accepted keys as subprobability measures); `k ≤ 56(g−1) = k_max` vector slots; key space `K_n` with uniform measure `ν_n`, `\|K_n\| ≤ 2^{kN}`; accepted key densities `d_A`, `d_B`. | D-6.keys, D-6.recipe, L-6.2 | — | NOT_STATED |
| P-7.1 | proposition | §7.1, Proposition 7.1 (`prop:collision`) | Collision criterion: for a restriction of relative mass `2^{-o(N)}` of a law as in T-3.1, decomposed into leaves, if `E ∫ d_A d_B dν_n ≥ 2^{-o(N)}` over independent leaf pairs, then two independent units of the original law have all four cross holes with probability at least `2^{-(k_max + .03)N − o(N)}`; and `k_max + .03 < 100g`. [PI-002] | T-6.3, L-6.2, L-4.5, L-4.6, D-7.query | — | NOT_STATED |

## Section 8 — Phase estimates before key collisions

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-8.mark | definition | §8 ¶2, equation `eq:delta-phase` | Marked unit: a unit with marks `λ_i ∈ C_i^old`; `Δ_O = U_1 λ_1 + U_2 λ_2` (total component rank at most `2K_1`, budget `r = 2K_1 + 2`); `u_{O,S} = Σ_{i ∈ S} u_i`; the four phase bits `u_{B,j}(Δ_A)`, `u_{A,i}(Δ_B)`. | D-5.C, D-2.U, D-4.budgets | — | NOT_STATED |
| D-8.1 | definition | §8, Definition 8.1 | Componentwise cover: subspaces `T_e^± ⊆ V_e^±`; it covers `ξ` if `ξ_e ∈ T_e^+ ⊗ V_e^- + V_e^+ ⊗ T_e^-` for all `e`; mode dimensions and total dimension. | D-2.U | — | NOT_STATED |
| T-8.2 | theorem | §8, Theorem 8.2 (`thm:phase-alternative`); proof after Lemma 8.3 | Phase alternative: for a marked-unit law of mass at least `10^{-12}` in an admissible law with `Δ_O ≠ 0`, a sublaw of fixed positive relative mass has either (i) every nontrivial phase mean `E(−1)^{u_{B,S}(Δ_A) + u_{A,R}(Δ_B)}` below `.005` in absolute value, or (ii) a componentwise cover of total dimension at most `d_0` covering every `Δ_O`, with every mean having `\|S\| = 1` or `\|R\| = 1` equal to `2^{-Ω(N)}`. Imposes lower bounds on `h` (`eq:early-h-moment`, `eq:early-h-probes`). [PI-002] | L-8.3, L-4.3, L-4.6, D-8.mark, D-8.1, D-4.budgets | — | NOT_STATED |
| L-8.3 | lemma | §8, Lemma 8.3 (`lem:no-cover-rank`) | Rank growth without a cover: for `s ≥ 2^{100r+10}` a power of two and independent copies `T_1..T_s` of a random tensor of total component rank at most `r`, if every fixed cover of dimension at most `rs` per mode has probability less than `p`, then `P{rank(Σ T_j) < q_r s/4} ≤ 4^s p^{q_r s/2}` with `q_r = 2^{-100r-10}`. | D-8.1, D-4.rank | — | NOT_STATED |
| L-8.4 | lemma | §8, Lemma 8.4 (`lem:injection`) | Injection on accepting pairs: for a prepared marked-unit law (pins at most `K`, marginals at most `M 2^{o(N)} μ`) and a pair event of probability at least `N^{-c_0}` whose accepting sets lie in a fixed family of size at most `2^{C_s N}`, taking `h` large makes the proportion of accepting pairs failing the small-table injection conditions at most `ε`. [PI-002] | D-6.1, L-4.3 | — | NOT_STATED |
| L-8.5 | lemma | §8, Lemma 8.5 (`lem:tiny-cover`) | Consequences of a tiny cover, with `F(A,B) = u_{B,{1,2}}(Δ_A)`: (a) `rank F ≤ d_0 N`; if `P{F(A,B) + F(B,A) = 0} → 0` a restriction of mass `2^{-o(N)}` makes the alternating part vanish; (b) if `F(A,A) = 0` throughout, all four phase bits equal a prescribed `c` with probability at least `c_1 N^{-4}`; (c) a second peeling with at most `4K_1 + 2d_0 < u_0` extra pins makes that event a function of the two leaves. [PI-002] | T-8.2, L-4.5, D-8.mark | — | NOT_STATED |
| R-8.6 | remark | §8, Remark 8.6 (`rem:tiny-accepting-family`) | The four-phase event, or a condition on `F(A,B) + F(B,A)`, has an accepting family of log-size `C_s N` with `C_s ≤ 100(r + d_0 + 1)`, independent of `h`. Used with L-8.4. | L-8.5 | — | NOT_STATED |

## Section 9 — Preparation of the two-endpoint statuses

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-9.ref | definition | §9 ¶2 | Standing setting: a sequence of admissible unit laws violating T-3.1, passing to subsequences; first peeling done; `C_i^old`; the single-key reference law `Ω_{l,q,n}` (uniform on the vector slots of the star of tag `l` with paired diagonal `q`). | L-4.5, L-4.4, D-6.keys | — | NOT_STATED |
| D-9.1 | definition | §9.1, Definition 9.1 (`def:prediction`); equations `eq:status-class`, `eq:phase-compatibility` | Common prediction: common binary functions `f_{i,n}(l,q,·)` on `Ω_{l,q,n}`, a unit set of mass at least `10^{-6}`, and marks `λ_i`, `α_i`, exception sets `E_i` of size at most `B_*`, with `p_i(x) = T(λ_i,x) + α_i a(x) + f_{i,n}(l,q,key(x))` up to error `ε_n → 0`. Prediction classes `e_i = (1 + α_i, [f_i])`. Phase compatibility conditions on a small table. [PI-002] | D-9.ref, D-5.4, D-5.b, D-8.mark | — | NOT_STATED |
| P-9.2 | proposition | §9.1, Proposition 9.2 (`prop:status-preparation`); proof in §9.4 | Status preparation: along a subsequence, at relative mass cost `2^{-o(N)}` and with final pin dimension at most `K`, one of: (i) no prediction, and admissible injecting tables on pair mass above `.99`; (ii) a retained prediction, and admissible injecting tables satisfying phase compatibility on positive pair mass; (iii) both classes zero, exact identities `p_i = T(λ_i,·) + a` on `X`, and compatible injecting tables with filter masses at least `a_0` on leaf-pair mass at least `c_2 N^{-4}`. [PI-002] | L-4.5, T-8.2, L-8.4, L-8.5, R-8.6, D-9.1, L-9.3, L-9.5, D-2.1 | — | NOT_STATED |
| L-9.3 | lemma | §9.2, Lemma 9.3 (`lem:empty-status`) | If `e_1 = e_2 = 0`, deleting `o(1)` unit mass makes `p_i = T(λ_i,·) + a` exact on all of `X`. Uses that a nonzero Boolean polynomial of degree `k` is nonzero with probability at least `2^{-k}`. | D-9.1, L-4.3, D-5.b | — | NOT_STATED |
| L-9.4 | lemma | §9.3, Lemma 9.4 (`lem:synthetic-slice`) | Affine-slice comparison: for a random affine coefficient map conditioned on its internal Gram, the empirical average of any common bounded test of the image column arrays has variance `O(2^{-N/2} + 2^{2d+1−n})` around its reference mean, uniformly in the test. | L-4.3, L-4.6 | — | NOT_STATED |
| L-9.5 | lemma | §9.3, Lemma 9.5 (`lem:zero-delta`) | On a predicted branch with `Δ = 0` throughout, `α_1 = α_2`. Synthetic-array argument: `g` matrices of rank at most `2s_1` cannot sum to the identity of size `2g s_1 + 1`. | L-9.4, L-4.4, D-9.1 | — | NOT_STATED |
| R-9.6 | remark | §9.4, Remark 9.6 (`rem:preparation-accuracies`) | Order-of-choice remark: injection tolerances are fixed before `h`; the flag bound `a_0 = 1/(2Q)` never feeds back into the choice of `h`. | P-9.2 | — | NOT_STATED |

## Section 10 — Leaf histograms and mixed-law estimates

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-10.q | definition | §10.1 | Position, query, keys `K_j(O,z_j)`; reference laws `Ω̄_n = ⊗_j Ω_{l_j,q_j,n}`, `ω_n` (no Gram conditions), `ν_n` (uniform on `K_n`); common key tests, common input-and-key tests, flags; histograms. | D-7.query, D-9.ref | — | NOT_STATED |
| L-10.1 | lemma | §10.2, Lemma 10.1 (`lem:histogram-control`); proof in §10.5 | Uniform histogram control for leaf laws `π ≤ 2^{C_L N} μ^2`: (i) uniform absolute continuity of averaged key laws against `ω_n`-small sets; (ii) for `F` flags, the family of filtered key densities has an `L^1(ω_n)` `ε`-net of size bounded independently of `n` and the leaf; (iii) both persist on `K_n` relative to `ν_n`, giving uniform integrability. Entropy increment and a compactness (subsequence) argument. [PI-002] | L-10.5, D-10.q | — | NOT_STATED |
| L-10.2 | lemma | §10.3, Lemma 10.2 (`lem:histogram-gram-normalization`) | Gram normalization for `a + b ≤ N/2`: the probability is `2^{-ab}(1 + O(2^{-N+a+b}))`. | L-4.2 | — | NOT_STATED |
| L-10.3 | lemma | §10.3, Lemma 10.3 (`lem:histogram-batch-comparison`) | Two bounded batches of nominally independent columns: joint raw expectation of bounded `F`, `G` differs from the product of expectations by `O(‖F‖ ‖G‖ 2^{-N/2})`. | L-4.3, L-4.6, L-10.2 | — | NOT_STATED |
| L-10.4 | lemma | §10.3, Lemma 10.4 (`lem:reference-product`) | Under `ν_n`, `∫ Π_j f_{j,n}(k_j) = Π_j ∫ f_{j,n} dΩ_{l_j,q_j,n} + O(2^{-N/2})`, uniformly in the functions. | L-4.6, D-10.q | — | NOT_STATED |
| L-10.5 | lemma | §10.4, Lemma 10.5 (`lem:histogram-many-queries`) | Many queries: repeating a query `ℓ = ⌊c_1 n⌋` times at one orientation, the raw probability that query `j` lies in cell `A_j` is at most `2^{c_2 ℓ} Π w_j`, for cells of a bounded partition with weights bounded below. | L-10.2, L-4.6 | — | NOT_STATED |
| R-10.6 | remark | §10.5, Remark 10.6 | A leaf may have strongly nonuniform histograms; the entropy constant may depend on the leaf density exponent and `M_0`. | L-10.1 | — | NOT_STATED |
| L-10.7 | lemma | §10.6, Lemma 10.7 (`lem:typicality`) | Typicality: under the mixed caps `ρ_n ≤ 2^{CN} μ^2`, `(ρ_n)_i ≤ M 2^{a_n N} μ`, the empirical average of a bounded common input-and-key test is within `ε` of its raw mean outside `ρ_n`-mass `2^{-Ω(n)}`. | L-10.2, L-10.3 | — | NOT_STATED |
| R-10.8 | remark | §10.6, Remark 10.8 | Uniformity in the test is per test, not simultaneous over all tests; restrictions of reciprocal mass `2^{o(n)}` preserve the mixed caps. | L-10.7 | — | NOT_STATED |
| L-10.9 | lemma | §10.7, Lemma 10.9 (`lem:binary-mixing`) | Binary mixing: with the off-position Gram zeros and a consistent specification of within-endpoint `L`, `R` evaluations (indicator `A_n`), outside an exponentially small set of orientations `E_z A_n Π_j w_j = κ Π_j E w_j + O(2^{-cn})`, uniformly over unary weights. | L-5.5, L-4.6, L-4.3 | — | NOT_STATED |
| L-10.10 | lemma | §10.8, Lemma 10.10 (`lem:histogram-quadratic-bias`) | A quadratic function on a binary space with polar rank `2r` has sign bias at most `2^{-r}`; on an affine subspace of codimension `c`, at most `2^{-r+c}`. | — | — | NOT_STATED |
| L-10.11 | lemma | §10.8, Lemma 10.11 (`lem:unary-positivity`) | Unary reference law and base-status positivity: empirical conditional key frequencies match `Ω_{l,q,n}` on finitely many common key tests; every basis assignment on a space `C_i` has conditional fraction at least `(7/8) 2^{-dim C_i}` on a key cell of reference mass at least `δ`; the uniform constant `β = 2^{-K^2-1} 4^{-(g^2+1)}`. | L-10.7, L-10.10, L-5.5, R-5.6, L-4.3 | — | NOT_STATED |
| R-10.12 | remark | §10.8, Remark 10.12 | The key-only hypothesis in L-10.11 cannot be dropped; countably many cell inequalities are passed through a diagonal subsequence. | L-10.11 | — | NOT_STATED |

## Section 11 — Weak product testing

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-11.tw | definition | §11, equation `eq:twisted-cut-norm` | Twists `T_{I,J}` (products of inter-position global Gram signs, equal to one on `K_n`); the twisted cut norm `‖D‖_{□,T}` of a function on the keys of `I ∪ J`. | D-10.q | — | NOT_STATED |
| T-11.1 | theorem | §11, Theorem 11.1 (`thm:weak-product`); proof after Lemma 11.3 | Weak product comparison: a bounded sequence of key functions `W_n` on `K_n` is approximated by `S_n = Σ_{a ≤ L} c_{a,n} Π_j f_{a,j,n}(k_j)` with `L`, `C` independent of `n`, so that (i) against arbitrary unary tests under `ν_n` the error is at most `ε`, and (ii) on actual queries under a mixed law, outside an exponentially small set of orientations, the error against the binary indicator `A_n` and arbitrary orientation-dependent unary weights is at most `ε`. [PI-002] | L-11.2, L-11.3, D-11.tw, L-10.9 | — | NOT_STATED |
| L-11.2 | lemma | §11, Lemma 11.2 (`lem:product-twisted-regularity`) | Finite twisted regularity: `W = Σ_{a ≤ L'} c_a f_a(k_I) g_a(k_J) τ_a + D` with `‖D‖_{□,T} ≤ δ`, `‖D‖_∞ ≤ 2B`, and `L'` bounded in terms of `B`, `δ` and the twist count. Energy increment. | D-11.tw | — | NOT_STATED |
| L-11.3 | lemma | §11, Lemma 11.3 (`lem:product-terminal-remainder`) | Terminal remainder on actual inputs: for `D_n` of small twisted cut norm and a crossing sign `ψ_n`, outside exponentially small mixed mass `sup_{f,g} \|E D_n ψ_n f g\| ≤ (C_3 δ + ρ + o(1))^{1/4}`. Four-copy Cauchy–Schwarz and a character expansion. | L-10.7, L-4.3, L-4.6, L-10.2, D-11.tw | — | NOT_STATED |
| C-11.4 | corollary | §11, Corollary 11.4 (`cor:weak-product-factorized-integration`) | Factorized integration: `E_z A_n S_n Π_j w_j = κ Σ_a c_{a,n} Π_j E[f_{a,j,n}(K_j) w_j] + o(1)` outside exponentially small mixed mass. | L-10.9, T-11.1 | — | NOT_STATED |
| R-11.5 | remark | §11, Remark 11.5 | What the two comparisons do not assert: weak testing error, not `L^1` error; no unprescribed joint input filter is allowed. | T-11.1 | — | NOT_STATED |

## Section 12 — A common limit for successful queries

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-12.1 | definition | §12.1, Definition 12.1 (`def:limit-option`); equations `eq:limit-success-format`, `eq:limit-option-overlap`, `eq:limit-vanishing-overlap` | Numerical option (recipe shape with one to seven positions per cross edge and all its numerical data); usable option `U_ω(L_A,L_B)`; admissibility flags; the successful-query format; the option overlap `I_n(ω)`; the vanishing-overlap hypothesis `I_n(ω) → 0` for every option. | D-7.query, D-6.recipe, D-6.1, P-9.2 | — | NOT_STATED |
| R-12.2 | remark | §12.1, Remark 12.2 | Two classes of flags: the nets cover arbitrary orientation filters; the factorisation uses only the successful-query format. | D-12.1, L-10.1 | — | NOT_STATED |
| L-12.3 | lemma | §12.2, Lemma 12.3 (`lem:limit-global-projection`) | Global projections: given per-leaf `L^1` nets of bounded size for truncated subdensities, there are deterministic partitions of bounded size such that `E\|⟨f,g⟩ − ⟨P_n f, P_n g⟩\| ≤ η` for members chosen adaptively from independent leaves, and for every refinement. Hilbert-space (trace and eigenfunction) argument. | — | — | NOT_STATED |
| D-12.sig | definition | §12.3 ¶1–2 | Signatures (sequences of common binary test values), cylinders; the orientation array `θ_n` of empirical status-cylinder masses and metadata; the leaf-pair record `Z_n` storing the two conditional laws. | D-12.1, D-10.q | — | NOT_STATED |
| L-12.4 | lemma | §12.3, Lemma 12.4 (`lem:limit-model`) | Common signature model: along a subsequence there is a limiting experiment with compact signature spaces `Ξ_{l,q}`, `Υ` and reference laws `m_{l,q}`, `ρ` (unary projections independent); measurable status densities `h^θ_{t,υ}` summing to one, with positive lower bounds for generic role and basis assignments; a limiting record `Z` given which the two orientation records are independent; all discrete table, injection and compatibility assertions retained with their masses. [PI-002] | P-9.2, L-10.4, L-10.7, L-10.11, T-11.1, L-12.3, D-12.sig | — | NOT_STATED |
| L-12.5 | lemma | §12.4, Lemma 12.5 (`lem:limit-zero-product`) | Under vanishing overlap, for almost every `Z` the limiting successful-query measures of every usable option are absolutely continuous with respect to `ρ` and their densities have product zero almost everywhere. | L-10.1, L-12.3, L-12.4 | — | NOT_STATED |
| L-12.6 | lemma | §12.5, Lemma 12.6 (`lem:limit-density`) | For almost every `Z`, the full limiting successful-query measure has density `G_Z(u) = κ ∫ Π_ℓ h^θ_{t_ℓ,υ_ℓ}(ξ_ℓ(u)) dα_Z(θ)` with respect to `ρ`. | T-11.1, L-10.9, L-10.7, L-12.4 | — | NOT_STATED |
| P-12.7 | proposition | §12.5, Proposition 12.7 (`prop:limit-overlap`) | Limiting overlap obstruction: under vanishing overlap, almost every sampled pair of orientation records has no usable option whose two flags pass and whose unary status overlap `∫ h^{θ_A} h^{θ_B} dm_{l,q}` is positive at every matched position. | L-12.4, L-12.5, L-12.6 | — | NOT_STATED |

## Section 13 — Solving the status constraints

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-13.1 | definition | §13.1, Definition 13.1 (`def:status-generator`); equations `eq:status-full-projection`, `eq:status-local-targets`, `eq:status-coupled-targets` | Available generator on a cross edge (a numerical vector `(q, h_{A,i}, h_{B,j}, x_{A,i}, x_{B,j}, p_{A,i}, p_{B,j})` with a certificate of positive overlap); span `V_{ij}`, base projection onto `B_{ij}` (surjective, kernel of dimension at most 2); the scalar system: local targets and coupled targets, which are the scalar recipe equations. | L-12.4, D-6.recipe, P-12.7 | — | NOT_STATED |
| L-13.2 | lemma | §13.1, Lemma 13.2 (`lem:status-duality`) | Dual relations: any obstruction to the scalar system has nonzero weights `(s_1,s_2,r_1,r_2)` giving the relation `eq:status-dual-relation` on every edge span; the system is soluble if every such relation vanishes on the local targets. Finite-dimensional duality. | D-13.1 | — | NOT_STATED |
| L-13.3 | lemma | §13.2, Lemma 13.3 (`lem:status-global-prediction`) | On the no-prediction alternative, the iid base arrays are obstructable with probability less than `.1`; otherwise a common prediction on unit mass above `10^{-6}` could be extracted and transferred back to finite `n`. [PI-002] | D-9.1, P-9.2, L-12.4, L-13.2 | — | NOT_STATED |
| L-13.4 | lemma | §13.3, Lemma 13.4 (`lem:status-predicted`) | Predicted scalar compatibility: for a predicted pair with a table satisfying the phase compatibility conditions, the scalar system is soluble, robustly under further bounded label exclusions. | P-9.2, L-9.3, L-13.2, D-9.1 | — | NOT_STATED |
| L-13.5 | lemma | §13.3, Lemma 13.5 (`lem:status-span`) | In each positive-mass alternative of P-9.2 the common experiment has positive mass of passed injecting tables for which the scalar system is soluble, robustly under the needed exclusions. | P-9.2, L-12.4, L-13.2, L-13.3, L-13.4 | — | NOT_STATED |
| L-13.6 | lemma | §13.4, Lemma 13.6 (`lem:fresh-lists`) | Fresh lists: every scalar solution can be realised by between one and seven available generators per edge with all labels at an endpoint distinct; `1 + 3 + 3 = 7`. | L-13.5, D-13.1, D-5.b | — | NOT_STATED |
| P-13.7 | proposition | §13.5, Proposition 13.7 (`prop:positive-overlap`) | Positive-mass overlap: for every positive-mass alternative of P-9.2 some fixed numerical option has expected successful-query overlap bounded below along a subsequence, so the overlap criterion of P-7.1 holds. | P-12.7, L-12.4, L-12.6, L-13.5, L-13.6, L-6.2, P-7.1, P-9.2 | — | NOT_STATED |

## Section 14 — The inverse-polynomial option and completion of the proof

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-14.base | definition | §14.1, equations `eq:rare-base-beta`, `eq:rare-hit-threshold` | Base query (at most four generic atom positions in one unit, no `p_i`-status filter); accepted measure `Q_{ω,r}`; feasible request; `β`, `κ_min`, `s_max = 4`, `c_hit(δ) = κ_min β^{s_max} δ / 4`. | D-7.query, L-10.9, L-10.11 | — | NOT_STATED |
| L-14.1 | lemma | §14.1, Lemma 14.1 (`lem:rare-large-set-hit`) | Uniform large-set hit estimate: for every fixed `p`, the probability that a feasible request has `Q_{ω,r}(W_n) < c_hit(δ)` is `o(n^{-p})`, uniformly over the finitely many requests and deterministic sets `W_n` of reference measure at least `δ`. Proved by contradiction through a one-law limiting density identification. [PI-002] | L-10.4, L-10.7, L-10.9, L-10.11, T-11.1, L-12.6, D-14.base | — | NOT_STATED |
| R-14.2 | remark | §14.1, Remark 14.2 | A restriction of polynomial mass need not preserve per-leaf density caps; L-14.1 does not need them. | L-14.1 | — | NOT_STATED |
| L-14.3 | lemma | §14.2, Lemma 14.3 (`lem:rare-superlevel-nets`) | Superlevel sets from all-filter nets: for a filtered base-query density of mass at least `b_0` on a prepared leaf, a bounded family of reference sets (independent of the filter) contains `W` with `ν(W) ≥ δ_0/2` and `ν{k ∈ W : d(k) < t/4} ≤ 4ε/t`. | L-10.1 | — | NOT_STATED |
| P-14.4 | proposition | §14.3, Proposition 14.4 (`prop:rare-overlap`) | In the inverse-polynomial alternative of P-9.2 the overlap criterion holds with lower bound `Ω(N^{-4})`. | P-9.2, L-6.2, T-6.3, P-7.1, L-10.9, L-10.11, L-14.1, L-14.3 | — | NOT_STATED |

The proofs of Theorem 3.1 and Theorem 1.1 are the two closing paragraphs of §14.4; their
entries are T-3.1 and T-1.1 above.

## Appendix A — Parameters, ranks, and probability scales

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| D-A.order | construction | §A.1, equations `eq:ledger-early` to `eq:ledger-final-dimensions` | The acyclic order of choices: `(C_0, g, D, M, k_max, ζ, K_1)` → `(r, L_0, d_0, u_0, K, early tolerances c_s, q_0, δ_cov, ϑ, Γ, p_0)` → `(R_*, j_*, B_0, B_*, b, p_*, A, s_0, J)` → `(r_0, h = 1000 r_0)` → `M_0` → `n ≥ 2r_0`; mixers chosen separately at each large `n` by L-5.5. [PI-005] | D-2.par, D-4.budgets, D-5.par, D-5.b, D-5.mix | — | NOT_STATED |
| S-A.r0 | statement | §A.1 list; §A.2, equations `eq:ledger-h-moment-demand`, `eq:ledger-injection-demand`, `eq:ledger-realization-demand`, `eq:ledger-pure-tester-demand` | The five demands on `r_0` (moment demand; transpose-injection errors in T-8.2; accepting-family estimate in L-8.4; residual ranks in T-6.3; tester rank inequality in L-9.5) depend only on earlier constants and are met by taking `r_0` large. | D-A.order, T-8.2, L-8.4, T-6.3, L-9.5 | — | NOT_STATED |
| S-A.M0 | statement | §A.4, equations `eq:ledger-column-dimension` to `eq:ledger-collision-bit-slacks` | `dim B / N` and every `O(n)` scalar-record count can be made a prescribed small fraction of `N` by choosing `M_0` last: record cells at most `2^{C_rec n + C_rec,0}` with `log_2 < .005N`; tested Gram bits at most `16\|E\| h dim B < .01N`. [PI-005] | D-A.order, P-7.1, T-6.3, L-4.3 | — | NOT_STATED |
| S-A.ledger | statement | §A.3 (table) | Pin, atom and tensor-rank ledger: `4K_1 + 2d_0 < u_0`; `dim C_i ≤ K^2`; at most 14 atoms per endpoint; `2(K+14) ≤ R_*`; at most 28 positions and `k_max = 56(g−1)` key-vector slots per unit; `8(g−1)` in rare queries. | D-A.order, D-5.C, D-7.query | — | NOT_STATED |
| S-A.scales | statement | §A.5 (table and text) | Probability scales: which errors (`2^{-Ω(n)}`, `2^{-Ω(n^2)}`, `o(n^{-p})`, `Ω(N^{-4})`) survive which density inflations; the final margin `100g − (56(g−1) + .03) = 44g + 55.97 > 0`; the sampling scales used in P-3.4. A summary of estimates proved elsewhere. | P-7.1, L-8.5, L-10.7, L-14.1, P-3.4 | — | NOT_STATED |

## Sanity checks (not in the paper)

**None of these is a statement of the paper, and a `DONE` here says nothing about any
result of the paper.** They were proved at milestone M0 to pin the new definitions of the
statement layer from both sides: a definition that was accidentally too weak or too strong
would make one of them false. Lean files: `Hadwiger/Sanity/Minor.lean`,
`Hadwiger/Sanity/ConnectedMatching.lean`, `Hadwiger/Sanity/FractionalColoring.lean`.

Kinds used in this section:

- `sanity (M0 list)`: a lemma named in the M0 section of `blueprint/MILESTONES.md`;
- `sanity (extra)`: a further check added at M0, with the reason in its Statement cell;
- `support`: lemmas used to prove the others. They are listed so that every declaration in
  `Hadwiger/Sanity/` is audited.

"Finite" below means the vertex type has a `Fintype` instance.

### Minors and the Hadwiger number

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| S-M0.minor-le-card | sanity (M0 list) | not in the paper | A `K_t` minor of a finite graph needs `t ≤ \|V\|`. | D-1.minor | `Hadwiger.HasCliqueMinor.le_card` | DONE |
| S-M0.hadwiger-attained | sanity (M0 list) | not in the paper | A finite graph `G` has a `K_t` minor with `t = h(G)`: the supremum in D-1.h is a maximum, not a junk value. | D-1.h, S-M0.minor-le-card, S-M0.minor-zero-one | `Hadwiger.hasCliqueMinor_hadwigerNumber` | DONE |
| S-M0.hadwiger-top | sanity (M0 list) | not in the paper | `h(K_n) = n` for the complete graph on `Fin n`, every `n` including `0`. | D-1.h, S-M0.hadwiger-complete-iff | `Hadwiger.hadwigerNumber_top` | DONE |
| S-M0.hadwiger-path3 | sanity (M0 list) | not in the paper | The path on three vertices (Mathlib's `pathGraph 3`) has Hadwiger number `2`. | D-1.h, S-M0.minor-edge, S-M0.hadwiger-complete-iff | `Hadwiger.hadwigerNumber_pathGraph_three` | DONE |
| S-M0.hadwiger-cycle4 | sanity (M0 list) | not in the paper | The 4-cycle (Mathlib's `cycleGraph 4`) has Hadwiger number `3`. The `K_3` minor has branch sets `{0,1}`, `{2}`, `{3}`: a branch set with two vertices is exercised. | D-1.h, S-M0.hadwiger-complete-iff | `Hadwiger.hadwigerNumber_cycleGraph_four`, `Hadwiger.hasCliqueMinor_cycleGraph_four` | DONE |
| S-M0.hadwiger-mono | sanity (M0 list) | not in the paper | Adding edges on a fixed finite vertex type does not decrease the Hadwiger number: `G ≤ G'` gives `h(G) ≤ h(G')`. | D-1.h, S-M0.minor-support | `Hadwiger.hadwigerNumber_mono` | DONE |
| S-M0.hadwiger-iso | sanity (M0 list) | not in the paper | Isomorphic graphs have the same Hadwiger number. No finiteness is assumed. | D-1.h, S-M0.minor-support | `Hadwiger.hadwigerNumber_congr` | DONE |
| S-M0.minor-zero-one | sanity (extra) | not in the paper | Every graph has a `K_0` minor; a graph has a `K_1` minor exactly when it has a vertex. Added because `blueprint/FIDELITY.md` (F-MINOR) asserts both edge cases. | D-1.minor | `Hadwiger.hasCliqueMinor_zero`, `Hadwiger.hasCliqueMinor_one_iff` | DONE |
| S-M0.hadwiger-largest | sanity (extra) | not in the paper | For a finite graph, `G` has a `K_t` minor exactly when `t ≤ h(G)`; in particular a `K_t` minor gives a `K_s` minor for `s ≤ t`, and `h(G) ≤ \|V\|`. Added because the paper defines `h(G)` as "the largest `t`". | D-1.h, S-M0.hadwiger-attained | `Hadwiger.hasCliqueMinor_iff_le_hadwigerNumber`, `Hadwiger.HasCliqueMinor.of_le`, `Hadwiger.HasCliqueMinor.le_hadwigerNumber`, `Hadwiger.hadwigerNumber_le_card` | DONE |
| S-M0.hadwiger-complete-iff | sanity (extra) | not in the paper | For a finite graph, `h(G) = \|V\|` exactly when `G` is complete: a `K_{\|V\|}` minor forces every branch set to be a single vertex. Added as the upper-side pin used for the two small graphs. | D-1.h, S-M0.hadwiger-attained, S-M0.minor-support | `Hadwiger.hadwigerNumber_eq_card_iff`, `Hadwiger.eq_top_of_hasCliqueMinor_card`, `Hadwiger.hadwigerNumber_top_card`, `Hadwiger.hasCliqueMinor_top_card`, `Hadwiger.hadwigerNumber_lt_card_of_ne_top` | DONE |
| S-M0.minor-edge | sanity (extra) | not in the paper | An edge is a `K_2` minor. | D-1.minor, S-M0.minor-support | `Hadwiger.HasCliqueMinor.of_adj` | DONE |
| S-M0.minor-support | support | not in the paper | Representatives of branch sets are injective, so a minor model of `H` in `G` gives `\|V(H)\| ≤ \|V(G)\|`; a model is carried along an injective homomorphism (covers adding edges and isomorphisms); an injective homomorphism is a model with singleton branch sets; a `K_t` model may be given by branch sets checked for `i < j` only; the set of `t` is bounded for a finite graph. | D-1.minor | `Hadwiger.MinorModel.exists_injective_rep`, `Hadwiger.MinorModel.card_le`, `Hadwiger.MinorModel.map`, `Hadwiger.MinorModel.ofInjective`, `Hadwiger.hasCliqueMinor_of_branch`, `Hadwiger.HasCliqueMinor.map`, `Hadwiger.HasCliqueMinor.mono`, `Hadwiger.hasCliqueMinor_congr`, `Hadwiger.bddAbove_setOf_hasCliqueMinor` | DONE |
| S-M0.final-finite | sanity (extra) | not in the paper | For a finite graph, `h(G) < χ(G)` in `ℕ∞` holds exactly when `χ(G)` is a natural number `k` with `h(G) < k`. So T-FINAL cannot be true through an infinite chromatic number. Added because `blueprint/FIDELITY.md` (T-FINAL) names it as an M0 item. | D-1.h, D-1.chi | `Hadwiger.hadwigerNumber_lt_chromaticNumber_iff` | DONE |

### Connected matchings

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| S-M0.cm-le-half | sanity (M0 list) | not in the paper | `2·cm(G) ≤ \|V\|` for a finite graph. | D-1.cm, S-M0.cm-attained, S-M0.cm-support | `Hadwiger.two_mul_connectedMatchingNumber_le_card` | DONE |
| S-M0.cm-attained | sanity (M0 list) | not in the paper | A finite graph has a connected matching with exactly `cm(G)` edges: the supremum in D-1.cm is a maximum, not a junk value. | D-1.cm, S-M0.cm-support | `Hadwiger.exists_isConnectedMatching_ncard_eq` | DONE |
| S-M0.cm-top | sanity (M0 list) | not in the paper | `cm(K_n) = ⌊n/2⌋` for the complete graph on `Fin n` (natural-number division). | D-1.cm, S-M0.cm-le-half, S-M0.cm-support | `Hadwiger.connectedMatchingNumber_top` | DONE |
| S-M0.cm-two-disjoint-edges | sanity (M0 list) | not in the paper | The graph on `Fin 4` whose only edges are `0–1` and `2–3` has `cm = 1`: the two edges are a matching that is not connected. This is the check that "touching" is really required. | D-1.cm, D-1.touch, S-M0.cm-le-half, S-M0.cm-attained, S-M0.cm-support | `Hadwiger.connectedMatchingNumber_two_disjoint_edges` | DONE |
| S-M0.cm-support | support | not in the paper | A matching of a finite graph has `2\|E(M)\| ≤ \|V\|`; `k` pairwise disjoint, pairwise touching edges form a connected matching with exactly `k` edges; the empty subgraph is a connected matching; the set of sizes is bounded for a finite graph; every connected matching has at most `cm(G)` edges. | D-1.cm, D-1.touch | `Hadwiger.two_mul_ncard_edgeSet_le_card`, `Hadwiger.exists_isConnectedMatching_of_family`, `Hadwiger.isConnectedMatching_bot`, `Hadwiger.bddAbove_setOf_connectedMatching`, `Hadwiger.IsConnectedMatching.ncard_le` | DONE |

### Fractional colourings

| ID | Kind | Paper location | Statement | Depends on | Lean | Status |
|---|---|---|---|---|---|---|
| S-M0.chif-totals | sanity (M0 list) | not in the paper | The set of totals of fractional colourings of a finite graph is nonempty and has `0` as a lower bound. So `χ_f` is a genuine infimum, never the junk value `sInf ∅ = 0`. | D-1.fcol, D-1.chif, S-M0.chif-support | `Hadwiger.range_total_nonempty`, `Hadwiger.zero_mem_lowerBounds_range_total` | DONE |
| S-M0.chif-top | sanity (M0 list) | not in the paper | `χ_f(K_n) = n` for the complete graph on `Fin n`, every `n` including `0`. | D-1.chif, S-M0.chif-totals, S-M0.chif-support | `Hadwiger.fractionalChromaticNumber_top` | DONE |
| S-M0.chif-cycle5 | sanity (M0 list) | not in the paper | `χ_f(C_5) = 5/2` for Mathlib's `cycleGraph 5`. Not an integer, so the definition is not the ordinary chromatic number in disguise (`χ(C_5) = 3`). | D-1.chif, S-M0.chif-totals, S-M0.chif-support | `Hadwiger.fractionalChromaticNumber_cycleGraph_five`, `Hadwiger.card_le_two_of_isIndepSet_cycleGraph_five` | DONE |
| S-M0.chif-attained | sanity (extra) | not in the paper | The infimum defining `χ_f` is attained by some fractional colouring. Added because the paper says "minimum" and D-1.chif is defined with `sInf`; with this lemma the two agree by proof, not by remark. | D-1.chif, S-M0.chif-totals, S-M0.chif-support | `Hadwiger.exists_fractionalColoring_total_eq` | DONE |
| S-M0.chif-support | support | not in the paper | Totals are nonnegative; `χ_f` is at most every total and at least every lower bound of the totals; `0 ≤ χ_f ≤ \|V\|`; nonnegative weights on a finite family of independent sets covering every vertex give a fractional colouring with the same total; if every independent set has at most `k` vertices then `\|V\| ≤ k·total` for every fractional colouring. The last is the counting step of the paper's proof of Corollary 1.2 for an arbitrary bound `k`; it is not S-1.b, which is about `α(G)` and is still `STATED`. | D-1.fcol, D-1.chif | `Hadwiger.FractionalColoring.total_nonneg`, `Hadwiger.bddBelow_range_total`, `Hadwiger.fractionalChromaticNumber_le_total`, `Hadwiger.le_fractionalChromaticNumber`, `Hadwiger.fractionalChromaticNumber_nonneg`, `Hadwiger.fractionalChromaticNumber_le_card`, `Hadwiger.exists_fractionalColoring_of_family`, `Hadwiger.FractionalColoring.card_le_mul_total` | DONE |
