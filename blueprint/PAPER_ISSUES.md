# Paper issues

Everything found in the paper that is wrong, missing, or unclear. A finding here is a
**result** of the project. It is recorded exactly and reported to the user; it is never
closed with an axiom or a silently changed statement (`AGENTS.md`).

Kinds (`docs/STATUS_CLASSIFICATIONS.md`): `ERROR` (false as written, with a precise
refutation), `GAP` (a step that does not follow, no repair found), `UNCLEAR` (more than one
reading, or something left out; the reading adopted is recorded), `REPAIRED`.

## Summary

- `ERROR`: none established.
- `GAP`: none established.
- `UNCLEAR`: eight (PI-002 to PI-009). All concern how statements are written, not
  whether they are true. PI-007 to PI-009 were found at the first slice of M4
  (2026-10-08), while Sections 3.1 and 3.2 were being stated in Lean; each has a reading
  adopted, and none stopped a statement from being written.
- Withdrawn: PI-001, which was a mistake by the worker, not a problem in the paper.

**This is not a verification of the paper.** See "How far the paper has been checked".

## How far the paper has been checked

The whole paper was read once, in full, proofs included, on 2026-10-07.

- Sections 1 to 3: the arguments were followed step by step on paper. No error found.
- Sections 4 to 14 and Appendix A: read once. The arithmetic listed under "Spot checks"
  was verified by hand. The proofs were **not** verified: on one reading the worker could
  follow the outline of each, but not confirm every step. The places where the argument
  could not be followed closely enough to form a view are listed under "Steps not
  followed".
- Machine-checked so far (the blueprint has the statuses; `DONE` there is what this
  means): the three unnumbered bounds of Section 1 (M1), Proposition 3.5 with its proof
  (M1 and M2), Lemma 2.2 with its proof and both halves of equation (2.3) (M3), and the
  deduction of Corollary 1.2 from Theorem 1.1 (M1). These are the elementary parts. No
  error or gap was found in them.
- Section 2.1 in particular (Definition 2.1, Lemma 2.2, equation (2.3)) was read again at
  M3 and the Lean proofs follow the paper's sentence by sentence. Every step went through
  as written. One observation, which is not an issue: the six-term sum that proves
  triangle-freeness uses neither that the three elements are distinct nor that the `U_i`
  are injective. Injectivity is used only to exclude loops. The paper's remark "Equal
  elements are adjacent because holes have no loops" is needed there only because its
  Lemma 2.2 speaks of three distinct elements.
- Sections 3.1 and 3.2 (Lemma 3.2, Lemma 3.3, Proposition 3.4, each with its proof), the
  opening of Section 3 and the last paragraphs of Sections 2.1 and 2.4 were read again at
  the first slice of M4 (2026-10-08), and the three results were **stated** in Lean. None
  of the three is proved; each is `sorry`. Two things were done by hand that are not
  proofs: the explicit bound that replaces "probability `1 − exp(−Ω(m))`" in Proposition
  3.4 was derived from the paper's proof, step by step (`blueprint/FIDELITY.md`, F-BOUND);
  and each new statement was checked in its degenerate cases. No step of the paper's
  proofs failed in that reading. Three places were unclear and are PI-007 to PI-009. One
  remark of the paper was machine-checked on the way: "Two disjoint edges fail to touch
  precisely when all four cross pairs are holes" (§2.1, last paragraph; blueprint
  S-M4.touch).
- An observation from that derivation, which is not an issue: the argument for the bound
  on `cm(G)` uses only that the hole relation is symmetric. That it has no loops and no
  triangles is used for `α(G) ≤ 2` and nowhere else in Section 3.
- Another, about the paper's setting and not an issue: the paper's `μ_n` is uniform, so
  `μ^2` is strictly positive, as its definition of relative entropy requires. For a law
  with zeros the argument needs one more step (F-BOUND, step 0).
- Nothing else has been machine-checked. For everything else the absence of an `ERROR` or
  `GAP` entry means "none found on one reading", not "found correct". In particular
  Theorem 1.1 and all of Sections 4 to 14 are in that state.

The upstream repository says of its own collection that unformalised results "could have
issues". At the pin, Theorem 3.1 was unformalised upstream. On 2026-10-08 upstream's
catalogue lists this paper as having a formalised main result (`docs/PROVENANCE.md`,
"Upstream after the pin"). This project has not built, read or checked that code, and
nothing in this file relies on it.

### Spot checks (by hand; all consistent)

| Where | What was checked |
|---|---|
| Corollary 1.2 | `26m/75 + 2/3 < m/2` exactly when `m > 100/23`, so for `m ≥ 5`. (Machine-checked since M1, for `m ≥ 5`.) |
| Lemma 2.2 | The six-term sum over a triangle: left sides cancel in pairs by sharing, bilinear terms by symmetry, leaving `1 + 1 + 1 = 1` in `F_2`. (Machine-checked since M3: the Lean proof of triangle-freeness is this sum, term for term.) |
| Lemma 3.3 | The cut capacity `Mμ(L_0) + Mμ(R_0) + 2^{DN} μ^2(E_0) < 1` gives both bounds. |
| Proposition 3.4 | Entropy increment `≥ −log(1 − ε_N)` per recording; `(2C_0 g − D) = −2C_0 g`; fingerprint log-count `O(N^3 2^{100gN}) = o(2^{1000gN})`; fewer than `m/200 + m/200` matching edges. Again at the first slice of M4, in full and with general `B`, `ε`, `μ`: the fingerprint has at most `1 + ⌊log B/(−log(1−ε))⌋` units, which is at most the paper's `L_N`; the replay argument; `C(m,k) μ(S)^k` and `m^{2k} μ^2(E_0)^k`; and `2(k − 1) < m/100` for `k = ⌈m/200⌉` (`blueprint/FIDELITY.md`, F-BOUND). By hand; the inequality `200k < m + 200` is machine-checked (S-M4.bound). |
| Proposition 3.5 | `3b ≤ m + 2s + e ≤ m + 4c − 3e + 2`; tight for `K_1` and `K_3`. (Machine-checked since M2: the inequality, and equality for every complete graph of odd order, which includes `K_1` and `K_3`.) |
| Lemma 4.4 | `g^2/4 > 2D` and `8D/g = 32000 < g` for `D = 4000g`, `g = 10^9 + 1`. |
| Lemma 4.5 | `(ζ − ε)u < D + ζ` with `ε < ζ/4` gives `u < K_1`; the second-peeling total stays below `K`. |
| Lemma 5.2 | A flat triple of levels exists because `j_* ≥ 6R_* + 4`; the central binomial coefficient exceeds `2R_*`. |
| Theorem 6.3 | Tester coefficient `1 + a(v) + b_t(v) = η_S(w_t)` when `χ_*(w) = 1`; `(g−1) a_t = 0` since `g` is odd; the requirement `970 r_0 > 28J\|E\| + D_quo + 2K + 4B_lin`. |
| Proposition 7.1 | `−(1−2ζ)(k+t) + (k+.01) ≤ −.95t`; `2 \|K_n\| L_n τ_n ≤ 2^{1 + Cn − .01N}`; `2^{-s_n}(1 − 2^{s_n − .45N}) ≥ 2^{-.02N}`. |
| Theorem 8.2 | The Markov step: the two moment terms against `2^{s L_θ}` give `2^{-ΓN}` with `Γ = D + 2r + 10`, which beats the `2^{2rN}` union and the `2^{(D+.01)N}` density. |
| Lemma 8.5 | An incompatible family makes `(1+F) ⊙ (1+F)^T = I`, so its size is at most `(1 + d_0 N)^2`; the four even characters give exactly one quarter. |
| Lemma 9.5, Appendix A | The tester-room inequality reduces to `((g − 20000)/2) r_0 > 4JK_1 + 1/(g−1)` in both places. |
| Lemma 13.6 | `B_0 + 900 < B_*`. |
| Section 14.4 | `100g − (56(g−1) + .03) = 44g + 55.97`. |

### Steps not followed

These are places where, on one reading, the worker could not follow the argument closely
enough to say whether it is complete. They are not claims of error. Each is where a
formalisation is most likely to stall, and each should be read again, slowly, before its
milestone starts.

1. **Theorem 6.3, step 1** (§6.2): the annihilator argument, in particular "the cut
   relation on any triangle of tags separates label by label" and the passage from "killed
   in the two quotients" to membership in `C_i`.
2. **Lemma 9.5** (§9.3): the synthetic array. The claim that the slice law "is also the
   marginal of the corresponding slice in the full synthetic array, by restricted frame
   transitivity", and that finitely many slice events can be imposed simultaneously on one
   array.
3. **Lemma 10.1** (§10.5): the compactness step in the net argument (limits of reference
   weights and of the laws of conditional histogram vectors along a refinement tree, with
   zero-weight cells deleted in the limit).
4. **Lemma 12.4** (§12.3): the construction of the limiting experiment. The countable
   closure of test lists, the storage of conditional laws as random coordinates ("there is
   no need to interchange disintegration and weak convergence"), and the passage of the
   positivity bounds of Lemma 10.11 to almost-everywhere density bounds.
5. **Lemma 13.3** (§13.2): the transfer of limiting signature functions back to a
   prediction at finite `n`, through cylinder approximation and a strict-error open event.
6. **Lemma 14.1** (§14.1): the uniformity over deterministic sets `W_n`, obtained by
   contradiction after restricting the law to a bad event of polynomial mass.

Items 3 to 6 share one feature: the proof leaves finite combinatorics and works with a
limiting probability space obtained by compactness.

---

## PI-001 — WITHDRAWN: "Theorem 1.1 has no proof of its own"

- Status: **withdrawn on 2026-10-07. The paper is not at fault.**
- What was claimed (commit `b014739`): that the paper states Theorem 1.1 in the
  introduction and never returns to it.
- Why that was wrong: the paper proves Theorem 1.1 explicitly, in the last paragraph of
  §14.4 ("Proof of Theorem 1.1": apply Proposition 3.4 to Theorem 3.1; the orders
  `m = 2^{C_0 g N}` are unbounded). The claim was written after reading only Sections 1 to
  3 and was an error by the worker.
- How it was found: by the full read of the paper later the same day.
- Lesson: do not record a finding about what a paper lacks before reading all of it.
- What survives, as a note for milestone M4 and not as a paper issue: Theorem 1.1 uses
  only that the probability in Proposition 3.4 is positive at each large `n`. The rate
  `1 − exp(−Ω(m))` and its uniformity in `n` are more than Theorem 1.1 needs.

## PI-002 — Asymptotic statements whose quantifiers are implicit

- Kind: `UNCLEAR`.
- Where: throughout Sections 4 and 7 to 14. Examples: Proposition 7.1 ("relative mass at
  least `2^{-o(N)}`", "`≥ 2^{-o(N)}`"), Theorem 8.2 ("for all sufficiently large `n`",
  "`2^{-Ω(N)}`"), Lemma 8.4, Lemma 8.5, Definition 9.1 ("a prediction along a
  subsequence", "`ε_n → 0`"), Proposition 9.2 ("along a subsequence … one of the following
  descriptions applies"), Lemma 10.1, Theorem 11.1, Lemma 12.4, Lemma 13.3, Lemma 14.1.
- What is unclear: these are statements about a sequence of laws indexed by `n`. The order
  of quantifiers — which constants are fixed before which, what a bound is uniform over,
  whether a conclusion holds for the given sequence or only for a subsequence — is given
  in prose around the statement and in Appendix A, not in the statement.
- What is not unclear: the top-level logic. Theorem 3.1 is proved by contradiction. A
  violating sequence of laws is assumed; subsequences are extracted; a lower bound
  `2^{-(k_max + .03)N − o(N)}` on the four-hole probability contradicts the assumed upper
  bound `2^{-100gN}`.
- Reading adopted: none yet, statement by statement. Each such statement must be given an
  explicit quantifier form before it is written in Lean, and that form recorded in
  `blueprint/FIDELITY.md`. Where two forms are possible, the one the proof of Theorem 3.1
  actually uses is the one to state.
- Consequence: none of these results can be marked `STATED` until this is done for it.
- Blueprint entries: P-7.1, T-8.2, L-8.4, L-8.5, D-9.1, P-9.2, L-10.1, T-11.1, L-12.4,
  L-13.3, L-14.1.

## PI-003 — The matrices of `E^#` have two names

- Kind: `UNCLEAR` (notation).
- Where: §2.3, equation `eq:E-sharp`, calls them `M_ρ` for `ρ = 1, …, b`. Lemma 5.5 refers
  to "the matrices `L_j^{ef}`, `R_j^{ef}` and `M_a` in Section 2", and its proof writes
  `A_{s,s'} = Σ_{a=1}^b (s_a + s'_a) M_a`.
- Reading adopted: `M_a` in Lemma 5.5 is `M_ρ` of §2.3. The formulas agree.
- Note: the proof of Lemma 5.2 also uses `M_a`, for a different object (multiplication
  operators on a quotient space).
- Blueprint entries: D-2.E, L-5.5.

## PI-004 — Theorem 6.3 is not stated in self-contained terms

- Kind: `UNCLEAR`.
- Where: §6.2, Theorem 6.3 (`thm:gradient-realization`).
- What is unclear: the conclusion is "there are abstract cross bilinear forms on the full
  nominal spaces, extending all these frozen entries, whose primal-versus-channel entries
  satisfy `u_z U_i = r(v_{iz})` on `X`", followed by "agreement of the actual cross Grams
  with these entries produces all four cross holes". "Nominal space", "frozen entry",
  "abstract cross bilinear form" and "primal-versus-channel entry" are introduced in
  running text. The statement moves between abstract forms and the actual maps of two
  given orientations without saying which object `u_z U_i` denotes in each clause.
- Reading adopted: provisional. Read as: for the given data there exist bilinear forms
  `Φ` on the cross nominal spaces, agreeing with the actual cross Gram on every pair with
  a pin or key argument, such that any two orientations whose actual cross Gram agrees
  with `Φ` on the listed primal-channel entries have holes on all four cross pairs, with
  witnesses `(v_{iz}, v_{zi})`. To be confirmed against the proof before stating.
- Blueprint entries: T-6.3.

## PI-005 — The parameters of Theorem 3.1 are constrained in many places

- Kind: `UNCLEAR`.
- Where: Theorem 3.1 ("for the construction parameters specified in Sections 2 and
  Appendix A"); §2.2; §4.3; §5; §8; Appendix A.
- What is unclear: the theorem is about one fixed tuple of parameters, but several of them
  (`j_*`, `b`, `J`, `p_0`, `r_0`, `M_0`, the early tolerances) are "chosen sufficiently
  large" or "sufficiently small" subject to requirements that arise inside later proofs.
  Appendix A gives the order of choice and lists the five requirements on `r_0`. For
  `M_0` it says only that it meets "every earlier coefficient/codimension slack" and that
  "the smaller image and pin-count slacks form a finite collection"; that collection is
  not written out. The mixers are chosen separately for each large `n` (Lemma 5.5).
- Reading adopted: Theorem 3.1 asserts that **there exists** a choice of parameters, made
  in the order of Appendix A, and for each large `n` a choice of mixers, such that the
  conclusion holds. Theorem 1.1 needs nothing more than existence.
- Consequence: the Lean statement of Theorem 3.1 is an existential over a parameter
  structure. The complete list of constraints on `M_0` has to be assembled from the
  individual proofs; until it is, "the construction parameters" is not a fully specified
  object.
- Blueprint entries: T-3.1, D-A.order, S-A.M0.

## PI-006 — Heavily overloaded notation

- Kind: `UNCLEAR` (notation). Not a mathematical problem; a hazard for formalisation.
- Where: throughout. The same letter denotes different objects in different sections:
  - `M`: the marginal cap `2^1000`; `M_0` the dimension multiplier; `M_ρ`, `M_a` matrices
    in `E^#`; `M_a` multiplication operators (§5.1); `M_{i,e}` representing matrices (§6.2).
  - `r`: the affine-gradient map `r(x)`; the rank budget `r = 2K_1 + 2` (the paper notes
    this clash); the number of positions in Theorem 11.1; the number of cells in §10.5;
    weights `r_i` in §13.
  - `h`: the channel dimension; role bits `h_{A,i}` in §13 (the paper notes this clash);
    densities `h^θ` in §12 and §14.
  - `q`: the diagonal bit; a key `q ∈ K_n` in §7; also `q_0`, `q_r`, `q_*`, `q_λ`.
  - `D`: the density exponent `4C_0 g`; relative entropy; pin spaces `D_{O,e}^±`;
    remainders `D_n`; data `D_2` in §10.6, where `D_2` is also relative entropy in bits.
  - `K`: the pin budget; keys `K_j`; a kernel `K_0`. `E`: the Gram matrix; the component
    set; events `E_0`, `E_s`. `C_i`: the effective space, and in Lemma 10.11 any space with
    the same bounds. `L`: leaves, label sets, and several constants.
- Reading adopted: each use is disambiguated by its section. The blueprint names the
  object in words wherever the letter is ambiguous.
- Blueprint entries: all of Sections 4 to 14.

## PI-007 — "A probability law on units", and whether a unit may repeat an element

- Kind: `UNCLEAR`. Found at the first slice of M4 (2026-10-08).
- Where: §3, first paragraph, and Theorem 3.1 (`thm:raw-supersaturation`); used again in
  Lemma 3.3 and in the proof of Proposition 3.4.
- What is unclear, first point: Theorem 3.1 speaks of "every probability law `σ` on units"
  and then compares it with measures on other sets: `σ_1 ≤ Mμ` and `σ_2 ≤ Mμ` on `Ω_n`,
  and `σ ≤ 2^{DN} μ^2` on `Ω_n^2`. A law on the set of units is not literally a measure on
  `Ω_n^2`.
- Reading adopted: `σ` is a law on all of `Ω_n^2` that vanishes off the units. Why: the
  third cap is called a pointwise inequality "of measures on the finite raw spaces", which
  only makes sense for `σ` as a measure on `Ω_n^2`; Lemma 3.3 speaks in the same way of a
  "probability law supported on `R`" for `R ⊆ Ω_n^2`; and the proof of Proposition 3.4
  applies that lemma with `R` a set of units. The two descriptions give the same laws.
- What is unclear, second point: "an ordered pair of raw vertices with no hole between its
  endpoints" does not say whether the two endpoints may be the same raw vertex. The next
  sentence, "The endpoints of a unit may be dependent", is about a random unit and does
  not settle it.
- Reading adopted: they may. Why: `(x, x)` has no hole between its endpoints, since the
  hole relation has no loops, so it satisfies the definition as written; and the proof of
  Proposition 3.4 needs it, because two positions with the same raw vertex are adjacent
  ("Equal elements are adjacent"), a matching edge may join them, and "the set of raw unit
  types thereby realized" then contains `(x, x)`.
- Lean: `Hadwiger.HoleRel.IsUnit`, `Hadwiger.HoleRel.Supersaturated`; notes F-UNIT, F-SUP.
- Blueprint entries: D-3.unit, D-3.sup, T-3.1, L-3.3, P-3.4.

## PI-008 — Relative entropy against a measure that is not strictly positive

- Kind: `UNCLEAR`. Found at the first slice of M4 (2026-10-08).
- Where: §3.1. The definition: "`D(ρ‖q) = ∑_x ρ(x) log(ρ(x)/q(x))`. Here `q` is a strictly
  positive probability measure and `0 log 0 = 0`." Lemma 3.2 then uses `D(ρ'‖ρ)`, and its
  proof `D(ρ'‖ρ(·|S))`, where `ρ` and `ρ(·|S)` are not strictly positive in general.
- What is unclear: what `D(ρ'‖ρ)` means when `ρ` vanishes somewhere.
- Reading adopted: the same sum, taken over the points where `ρ' > 0`. By the first
  assertion of Lemma 3.2, `ρ` is positive at every such point (for `ρ' ∈ P`), so every
  term is finite, and the convention `0 log 0 = 0` disposes of the others. For
  `ρ(·|S)` the same holds when `ρ'` is supported on `S`. This is the standard meaning of
  relative entropy for `ρ'` absolutely continuous with respect to `ρ`, and it is what the
  paper's proof computes with.
- Consequence for Lean: `Hadwiger.relEntropy ρ q` is defined for all weight functions and
  gives a junk value, not `+∞`, where `q` vanishes and `ρ` does not (note F-KL). In the
  second and third assertions of Lemma 3.2 the term `relEntropy ρ' ρ` is the honest value
  because of the first assertion (note L-3.2). Nothing was added to the statements.
- Blueprint entries: D-3.KL, L-3.2.

## PI-009 — The quantifiers of Proposition 3.4

- Kind: `UNCLEAR`. Found at the first slice of M4 (2026-10-08); the first part was noted
  when PI-001 was withdrawn.
- Where: §3.2, Proposition 3.4 (`prop:raw-to-graph`): "Assume the conclusion of Theorem 3.1
  at a given sufficiently large `n`. For `m = 2^{C_0 g N}`, the sampled graph … satisfies
  `α(G) ≤ 2`, `cm(G) < m/100` with probability `1 − exp(−Ω(m))`. The implied positive
  constant is independent of `n`."
- What is unclear: the statement is about one `n` ("a given … `n`") and also asymptotic
  ("sufficiently large", "`Ω(m)`", "independent of `n`"). It does not say what "sufficiently
  large" depends on, or over what the constant is uniform.
- Reading adopted: there are a constant `c > 0` and a threshold `n_0`, both depending only
  on the construction parameters, such that for every `n ≥ n_0` at which the conclusion of
  Theorem 3.1 holds, the probability is at least `1 − exp(−c m)` with `m = m(n)`. Why:
  the proof bounds the failure probability by `exp(o(m))` terminal sets (equation (3.3),
  which needs `n` large) times `(200e/M)^k + 2^{-2C_0 g N k}` with `k ≥ m/200`; the first
  term gives a rate `log(M/(200e))/200` that does not depend on `n`, and the count is
  absorbed for large `n`. "Sufficiently large" is also needed for the construction to exist
  at all (§2.4: "For all large `n`, `N ≥ 2(d + h)`"). "With probability `1 − exp(−Ω(m))`"
  is read as "at least".
- What Theorem 1.1 needs: only that the probability is positive at each large `n`
  (noted under PI-001).
- Consequence for Lean, by the user's decision of 2026-10-07: Proposition 3.4 is stated as
  an explicit bound on the failure probability for each instance, with no `n`, no constant
  and no "sufficiently large" (`Hadwiger.mass_listLaw_le_sampleBound`; notes F-BOUND and
  P-3.4). The asymptotic statement, under the reading above, is left to M17.
- Blueprint entries: P-3.4, D-3.bound.
