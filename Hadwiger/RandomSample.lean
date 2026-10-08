module

public import Hadwiger.Supersaturation
public import Hadwiger.Defs.ConnectedMatching
public import Hadwiger.Sanity.Law
public import Hadwiger.Sanity.Supersaturation

@[expose] public section

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

**Proposition 3.4 is not stated here any more** (withdrawn on 2026-10-08; see the note at the end
of the file).

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

/-! ### Proposition 3.4

This file used to state Proposition 3.4 as an explicit bound
(`mass_listLaw_le_sampleBound`, proof `sorry`) with an existence statement derived from it.
Both were withdrawn on 2026-10-08, when the project turned to the upstream formalisation for
Theorem 1.1 (`AGENTS.md`): the bound was this project's own hand derivation, it was never
proved, and nothing needs it any more. The statements are in git history
(`git show 4c48aad:Hadwiger/RandomSample.lean`). The three definitions above and their sanity
lemmas remain. -/

end Hadwiger
