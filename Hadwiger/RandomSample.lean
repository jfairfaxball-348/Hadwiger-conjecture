import Hadwiger.Supersaturation
import Hadwiger.Defs.ConnectedMatching
import Hadwiger.Sanity.Law
import Hadwiger.Sanity.Supersaturation

/-!
# Containers and the random sample (Section 3.2): Proposition 3.4

Paper, Proposition 3.4 (`prop:raw-to-graph`): "Assume the conclusion of Theorem 3.1 at a given
sufficiently large `n`. For `m = 2^{C_0 g N}`, the sampled graph defined in Section 2
satisfies `α(G) ≤ 2`, `cm(G) < m/100` with probability `1 − exp(−Ω(m))`. The implied positive
constant is independent of `n`."

Form, decided by the user on 2026-10-07 (`blueprint/MILESTONES.md`, M4): the proposition is
stated for any finite type with a law and an abstract hole relation, as **an explicit upper
bound on the probability that the graph on positions of the random list has
`cm(G) ≥ m/100`**, with the existence of a good list as a corollary when the bound is below
`1`. The explicit bound, `sampleBound`, was derived by hand from the paper's proof; the
derivation is in `blueprint/FIDELITY.md` (F-BOUND) and **is not a proof**. The user accepted
its form on 2026-10-08 (question Q2 of `blueprint/M4_REVIEW_SHEET.md`) and held the
sign-off of the bound and of this proposition for a second reading (items R-32, R-33).
**Nothing in this file is signed off.**

**The bound is stated here and not proved**: its proof is `sorry` (milestone M4, first
slice, statements only). The corollary has a complete proof body and rests on the bound, so
it is not proved either.

This file imports two files of `Hadwiger/Sanity/` for the general lemmas the corollary uses
(a list law is a law; a set of mass below `1` misses a point; the abstract graph on positions
has `α ≤ 2`).

Blueprint entries: `D-3.bound`, `P-3.4`. Fidelity notes: F-BOUND, P-3.4.
-/

namespace Hadwiger

/-- **The fingerprint length of equation (3.2)** (`eq:fingerprint-length`):
`L_N = 1 + ⌈ D N log 2 / (−log(1 − ε_N)) ⌉`, with the real numbers `B` and `ε` in place of
`2^{DN}` and `ε_N = 2^{-100gN}`; `D N log 2` is `log B`.

It is a natural number: `⌈·⌉₊` is Mathlib's `Nat.ceil`, which is `0` on negative reals. For
`B ≥ 1` and `0 < ε < 1` the quotient is a nonnegative real with a positive denominator, and
this is the paper's `L_N`. For `0 < B < 1` the quotient is negative and the value is `1`.
Outside `0 < ε < 1` the denominator is not positive and the value means nothing; Proposition
3.4 assumes `0 < ε < 1`. -/
noncomputable def fingerprintLength (B ε : ℝ) : ℕ :=
  1 + ⌈Real.log B / (-Real.log (1 - ε))⌉₊

/-- **The number `k = ⌈m/200⌉`** of the proof of Proposition 3.4 ("Let `k = ⌈m/200⌉`"). -/
noncomputable def exceptionSize (m : ℕ) : ℕ :=
  ⌈(m : ℝ) / 200⌉₊

/-- **The explicit bound of Proposition 3.4**, in terms of `n = |Ω|`, the marginal cap `M`,
the joint cap `B`, the conflict bound `ε` and the length `m` of the list:

`(n^2 + 1)^L · ( C(m, k) / M^k + m^{2k} / B^k )`,  `L = fingerprintLength B ε`,
`k = exceptionSize m`.

The three factors are those of the paper's proof: `(|Ω_n|^2 + 1)^{L_N}` bounds the number of
terminal sets; `C(m, k) μ(S)^k ≤ C(m, k) / M^k` bounds the probability that at least `k`
positions have their element in `S`; `m^{2k} 2^{-kDN} = m^{2k} / B^k` bounds the probability
that `k` disjoint ordered pairs of positions lie in `E_0`.

**Hand derivation, not a proof**: `blueprint/FIDELITY.md`, F-BOUND. The divisions are honest
only for `M > 0` and `B > 0`, which Proposition 3.4 assumes. -/
noncomputable def sampleBound (n : ℕ) (M B ε : ℝ) (m : ℕ) : ℝ :=
  ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε *
    ((m.choose (exceptionSize m) : ℝ) / M ^ exceptionSize m
      + (m : ℝ) ^ (2 * exceptionSize m) / B ^ exceptionSize m)

section Proposition34

variable {Ω : Type*} [Fintype Ω]

/-- **Proposition 3.4, as an explicit bound.** Let `Ω` be a finite type with a law `μ` and a
hole relation `H`, and suppose that every law on units obeying the three caps (marginal cap
`M`, joint cap `B`) has conflict probability at least `ε`. Then the probability that the
graph on positions of a list of `m` independent `μ`-elements has `cm(G) ≥ m/100` is at most
`sampleBound |Ω| M B ε m`.

Form. `cm(G) ≥ m/100` is stated as `m ≤ 100 · cm(G)`, in the natural numbers. The paper's
statement is about its own `Ω_n`, `μ_n`, `M = 2^1000`, `B = 2^{DN}`, `ε = 2^{-100gN}` and
`m = 2^{C_0 g N}`, and gives the probability as `1 − exp(−Ω(m))`; here the failure
probability is bounded explicitly. `α(G) ≤ 2` is not part of this statement: it holds for
every list (`HoleRel.indepNum_positionGraph_le_two`) and is in the corollary below.

Hypotheses on the numbers. `0 < M`, `0 < B`, `0 < ε`, `ε < 1` are the paper's (its values are
`2^1000`, `2^{DN}`, `2^{-100gN}`); they are needed because `sampleBound` divides by `M^k` and
`B^k` and by `−log(1 − ε)`, and because with `ε ≤ 0` the hypothesis `hsup` is empty. There is
no hypothesis on `m` and none on `μ` beyond its being a law: the bound is claimed for every
`m`, and is at least `1` when it says nothing.

Not proved: `sorry`. -/
theorem mass_listLaw_le_sampleBound (H : HoleRel Ω) {μ : Ω → ℝ} (hμ : IsLaw μ)
    {M B ε : ℝ} (hM : 0 < M) (hB : 0 < B) (hε : 0 < ε) (hε1 : ε < 1) (m : ℕ)
    (hsup : H.Supersaturated μ M B ε) :
    mass (listLaw μ m) {o | m ≤ 100 * connectedMatchingNumber (H.positionGraph o)}
      ≤ sampleBound (Fintype.card Ω) M B ε m := by
  sorry

/-- **Proposition 3.4, existence.** Under the hypotheses of the bound, if
`sampleBound |Ω| M B ε m < 1` then some list of `m` elements has a graph on positions with
`α(G) ≤ 2` and `cm(G) < m/100` (stated as `100 · cm(G) < m`). This is what Theorem 1.1 needs.

Proof: by the bound the lists with `m ≤ 100 · cm(G)` have probability below `1`; the list
law has total mass `1`, so some list is not among them; and `α(G) ≤ 2` holds for every list.
The proof body is complete. It rests on `mass_listLaw_le_sampleBound`, which is `sorry`, so
this theorem is `PROVED_MODULO`, not proved. -/
theorem exists_list_indepNum_le_two_and_connectedMatchingNumber_lt (H : HoleRel Ω)
    {μ : Ω → ℝ} (hμ : IsLaw μ) {M B ε : ℝ} (hM : 0 < M) (hB : 0 < B) (hε : 0 < ε)
    (hε1 : ε < 1) (m : ℕ) (hsup : H.Supersaturated μ M B ε)
    (hlt : sampleBound (Fintype.card Ω) M B ε m < 1) :
    ∃ o : Fin m → Ω, (H.positionGraph o).indepNum ≤ 2 ∧
      100 * connectedMatchingNumber (H.positionGraph o) < m := by
  have hmass := (mass_listLaw_le_sampleBound H hμ hM hB hε hε1 m hsup).trans_lt hlt
  obtain ⟨o, ho⟩ := (isLaw_listLaw hμ m).exists_notMem_of_mass_lt_one hmass
  exact ⟨o, H.indepNum_positionGraph_le_two o, not_le.mp ho⟩

end Proposition34

end Hadwiger
