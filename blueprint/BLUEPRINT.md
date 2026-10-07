# Blueprint — single source of truth

Paper: "A counterexample to Hadwiger's conjecture", OpenAI, 23 September 2026
(provenance, hash and licence in `docs/PROVENANCE.md`).

This file has one entry for every definition, lemma, proposition, theorem and corollary of
the paper, plus the unnumbered claims that the main results rely on. For each entry it
records where it is in the paper, what it depends on, its Lean name, and its status.

**It replaces the old proof-state file. If this file and anything else disagree about what
is stated or proved, this file is wrong and must be fixed; nothing else is authority.**
`python scripts/axiom_audit.py` checks every status in it against the actual build.

## How to read an entry

| Column | Meaning |
|---|---|
| ID | `T-` theorem, `P-` proposition, `L-` lemma, `C-` corollary, `D-` definition or construction, `S-` unnumbered statement made in running text. Numbers follow the paper (`L-2.2` is Lemma 2.2). |
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
