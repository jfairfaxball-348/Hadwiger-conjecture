# M4 review sheet — the statement layer of Sections 3.1 and 3.2, signed off in part by the user on 2026-10-08

Prepared on 2026-10-08 in the first slice of milestone M4, on branch `m4-statement-layer`.

**Status update, 2026-10-08, second slice of M4.** Lemma 3.2 (item R-30) has been proved
since: its three statements are `DONE`, and they were not changed. Where this sheet says
that the statements of Lemma 3.2 are `sorry` or not proved, it describes the day it was
written and signed. Lemma 3.3 (R-31) and the bound of Proposition 3.4 (R-33) are still
`sorry`, and items R-32 and R-33 are still held. This paragraph and one line under item R-30
are the only additions; no signed item was rewritten.

**Status update, 2026-10-08, third slice of M4.** The paragraph above describes the state
after the second slice. Since then Lemma 3.3 (item R-31) has been proved too: its statement
is `DONE`, and it was not changed. Where this sheet says that Lemma 3.3 is `sorry` or not
proved, it describes the day it was written and signed. The bound of Proposition 3.4 (R-33)
is still `sorry`, and items R-32 and R-33 are still held. This paragraph and one line under
item R-31 are the only additions of the third slice; no signed item was rewritten.

**What this is.** One item for each new fidelity note of `blueprint/FIDELITY.md` (section
"Milestone M4, first slice"): the paper's own sentences, the Lean
text, what is machine-checked about it, the comparison clause by clause, every difference
in form, and every doubt. Six questions for the user are at the head. It exists so that
the user can sign each item off.

**What this is not.** The sheet is not a review. It was written by the worker (Claude) who
wrote the definitions, the statements and the notes in the same session, so nobody
independent has read them. An item counts as reviewed only through the user's sign-off,
recorded on its sign-off line and then copied into `blueprint/FIDELITY.md` as a "Reviewed
by" line.

**Sign-off.** On 2026-10-08, at the end of the session that wrote this sheet, the user was
asked four things in one prompt. The two that concern the sheet, verbatim:

```text
Question (Sheet Q1-Q6): The review sheet has six questions (Q1 law = real weight function with a predicate; Q2 bound = the form shown above; Q3 abstract relation = a bare structure, not SimpleGraph; Q4 relative entropy = a real number with a junk value where q vanishes; Q5 Proposition 3.4 does not assume μ positive; Q6 Lemma 3.2 keeps the paper's hypotheses as printed). How do you answer them?
  -> Accept all six
Question (Sign-off): Do you sign off the sheet's 13 items (R-21 to R-29 and R-32 are definitions; R-30 Lemma 3.2; R-31 Lemma 3.3; R-33 Proposition 3.4)? A sign-off says the Lean text says what the paper says in the abstract form you decided. It does not say the statements are true.
  -> R-21 to R-31 now; hold R-32, R-33 (Recommended)
```

The descriptions of the chosen options, as shown:

```text
Accept all six: All six recommendations stand. The Lean sources already follow them, so nothing is rewritten; the answers are recorded on the sheet and in the notes.
R-21 to R-31 now; hold R-32, R-33 (Recommended): The definitions and Lemmas 3.2 and 3.3 get 'Reviewed by' lines, so the next two slices can start. The explicit bound and Proposition 3.4 wait for a second reading: the bound is my hand derivation and is not in the paper in that form.
```

So: **items R-21 to R-31 are signed off. Items R-32 and R-33 are not**; they are held for a
second reading. The sign-off lines below were filled in on that instruction. They cover
each item as it stands at the commit that records the sign-off, and nothing changed later.
The rest of the exchange is quoted in `docs/SESSION_LOG.md` (M4 first-slice session).

**What is being signed off.** Ten groups of definitions (R-21 to R-29 and R-32) and three
results (R-30, R-31, R-33). The three results are six Lean statements. Five of them are
**not proved**: each is `sorry`. The sixth, the existence half of Proposition 3.4, is
derived from the bound and is not proved either.
The question for sign-off is only whether each Lean text says what the paper says, in the
abstract form the user decided on 2026-10-07. By that decision no proof is written before
the sign-off. The sanity lemmas were the one exception the user made; they are proved, and
they are checks on definitions, not evidence that the statements are true.

**How this was prepared.** The paper's TeX was read again at the pinned commit
(`build/sections/03-distributions.tex` lines 1 to 205; `02-geometry.tex`, the end of
Section 2.1 and the last paragraph of Section 2.4), after checking the local PDF's sha256
against the pin. Quotations of the paper are verbatim from the TeX, with mathematics
transliterated and citation marks dropped. Lean text is copied from the sources with the
doc comments removed. Each Mathlib definition named below was read in the Mathlib source
at the pinned commit `d13f23b`: `Set.indicator`, `Function.support`, `Convex`, `IsCompact`,
`IsMinOn`, `Nat.ceil`, `Real.log`, `Convexity.StdSimplex`, the deprecated `stdSimplex`,
`PMF`, `InformationTheory.klDiv`. Equation numbers are the PDF's.

**Outcome in one paragraph.** Every definition the instruction asked for exists, is free of
`sorry`, and has a note. The three results are stated, five `sorry`s in all. The explicit
bound was derived by hand from the paper's proof; the derivation is in note F-BOUND and is
not a proof. Every new statement was checked by hand in its degenerate cases: none was
found false, and none is true only for an empty reason in a case that a named hypothesis
does not exclude. Three places in the paper were unclear (PI-007 to PI-009); each has a
reading adopted. Every sanity lemma that was stated is proved; two were left unstated and
have `sanity (planned)` rows.

**Not on this sheet, and reported separately** (`docs/SESSION_LOG.md`, M4 first-slice
session): upstream published Lean for this paper on 2026-10-08; and this repository's
records call the paper's equation (2.2) "equation (2.3)".

---

## The six questions, and the user's decisions

The user answered on 2026-10-08 by choosing the option "Accept all six":

| # | Item | The question | Decision | What was done |
|---|---|---|---|---|
| Q1 | R-22 | How is a law represented? | (a): a real weight function with the predicate `IsLaw` | Recorded in F-LAW. No change to the sources. |
| Q2 | R-32, R-33 | What is the exact form of the explicit bound? | (A): `(n^2 + 1)^L (C(m,k)/M^k + m^{2k}/B^k)` | Recorded in F-BOUND. This fixes the form proposed. **It is not a sign-off of R-32 or R-33**, which are held. |
| Q3 | R-21 | How is the abstract relation represented? | (a): the bare structure `HoleRel` | Recorded in F-HOLEREL. |
| Q4 | R-28, R-30 | Is relative entropy a real number with a junk value? | (a): yes | Recorded in F-KL. |
| Q5 | R-33 | Does Proposition 3.4 assume `μ` positive? | (a): no | Recorded in note P-3.4. The item itself is held. |
| Q6 | R-30 | Does Lemma 3.2 keep the paper's hypotheses as printed? | (a): yes | Recorded in note L-3.2. |

In every question the decision is the alternative the worker had recommended. The text of
the questions below is as it was put to the user.

Each has the alternatives considered and a recommendation. The recommendation is the
worker's, and the Lean sources follow it. Choosing another alternative means rewriting the
items named.

### Q1 — How is a law represented? (fixed in advance by the user)

Affects every item. Detail in R-22.

| | Alternative | For | Against |
|---|---|---|---|
| (a) | **A function `α → ℝ` with the predicate `IsLaw` (weights `≥ 0`, sum `1`); finite sums.** This is what the sources do. | A set of laws is a subset of the vector space `α → ℝ`, so Lemma 3.2's "compact convex set" is Mathlib's `IsCompact` and `Convex ℝ` as they are. Differences of entropies are real subtraction. Lemma 3.3's capacities are real. No measure theory. Same style as the signed-off `FractionalColoring`. | A law is a function plus a hypothesis, not one object. New definitions for mass, marginals and products. |
| (b) | A bundled structure of this repository carrying the function and the two proofs | One object | A set of them is not a subset of a vector space; convexity and compactness would have to be transported |
| (c) | Mathlib's `Convexity.StdSimplex ℝ α` | Mathlib's own bundled law; it has a topology and a convex-space structure. Proved here to have exactly the laws of (a) as weight functions | New in Mathlib (the set it replaces was deprecated on 2026-08-29); weights are finitely supported functions; convexity is in a new framework, not `Convex ℝ` |
| (d) | Mathlib's `PMF α` | Standard for discrete laws | Values in `ℝ≥0∞`; no topology and no convex structure in Mathlib; no finite product |
| (e) | Mathlib's `Measure α` or `ProbabilityMeasure α`, with `klDiv` | Mathlib's relative entropy comes with it | Values in `ℝ≥0∞`; measurable-space instances on finite types; convexity and compactness only through the weak topology; truncated subtraction in Lemma 3.2 |

**Recommended: (a).**

### Q2 — What is the exact form of the explicit bound? (fixed in advance by the user)

Affects R-32 and R-33. With `n = |Ω|`, `k = ⌈m/200⌉`, `δ = −log(1 − ε)`:

| | Bound on the probability that `m ≤ 100·cm(G)` | Relation to (A) |
|---|---|---|
| (A) | **`(n^2 + 1)^L · ( C(m,k)/M^k + m^{2k}/B^k )`, `L = 1 + ⌈log B / δ⌉`.** This is what the sources state. | Each factor is the first expression the paper writes for it |
| (B) | `(n^2 + 1)^L · ( (200e/M)^k + (m^2/B)^k )` | The paper's next estimate. Weaker; follows from (A) by `C(m,k) ≤ (em/k)^k`; puts `e` in the statement |
| (C) | (A) with `L = 1 + ⌈log B / ε⌉` | Weaker (uses `δ ≥ ε`); no `log(1 − ε)`, and the hypothesis `ε < 1` would go |
| (D) | (A) with a floor in `L`, and the number of sets of at most `L` units in place of `(n^2 + 1)^L` | Stronger; further from the paper's formulas |
| (E) | (A) multiplied through by `M^k B^k`, so that nothing is divided | Equivalent for `M, B > 0`; hard to read |

Hypotheses on the numbers in every form: `0 < M`, `0 < B`, `0 < ε` (and `ε < 1`, except in
(C)); all are the paper's. No hypothesis on `m`.

**Recommended: (A).** It is the sharpest form the paper's proof gives without further
estimates, the others follow from it, and for the paper's `M = 2^1000` the crude
`C(m,k) ≤ 2^m` already makes its first term at most `2^{-4m}`.

### Q3 — How is the abstract relation represented?

Affects R-21 and everything built on it.

- (a) **A bare structure `HoleRel`: a relation with proofs that it is symmetric, has no
  loops and is triangle-free.** The sources do this.
- (b) Mathlib's `SimpleGraph Ω` (a symmetric relation with no loops) with `CliqueFree 3`.

**Recommended: (a).** With (b) there would be a "hole graph" beside the graph on positions,
with opposite meanings of adjacency; the graph on positions is not a pullback of its
complement (positions with the same element must be adjacent); and `CliqueFree 3` would
need its own argument that it is the "any three elements" form of Lemma 2.2. Reasons in
full in note F-HOLEREL.

### Q4 — Is relative entropy a real number with a junk value, or an extended number?

Affects R-28 and R-30.

- (a) **`relEntropy ρ q : ℝ`, the paper's finite sum.** Where `q` vanishes and `ρ` does not,
  the value is a junk value and not `+∞`; each statement that uses it must exclude that
  case. The sources do this; Lemma 3.2 excludes it by `q > 0` and by its own first
  assertion.
- (b) A value in `ℝ≥0∞` or `EReal`, equal to `+∞` in that case (or Mathlib's `klDiv`).

**Recommended: (a).** The paper only ever uses finite values, Lemma 3.2 subtracts two of
them, and (b) makes that subtraction awkward. The price is the junk value, which is
recorded in the definition's doc comment, in note F-KL and in PI-008.

### Q5 — Does Proposition 3.4 assume that `μ` is positive everywhere?

Affects R-33.

- (a) **No: `μ` is any law.** The sources do this. It is the form decided on 2026-10-07
  ("a finite set `Ω` with a probability law `μ`"). The paper's proof takes entropy against
  `μ^2`, which must be strictly positive; the paper's `μ_n` is uniform, so it is. For a law
  with zeros the proof needs one more step that is not in the paper (F-BOUND, step 0),
  which will be recorded as a departure when the proof is written.
- (b) Add the hypothesis `∀ x, 0 < μ x`. Then the proof follows the paper without the extra
  step. The paper's instance satisfies it. The statement would be weaker than (a).

**Recommended: (a).** By hand the statement is true without the hypothesis, and (a) is what
was decided.

### Q6 — Does Lemma 3.2 keep hypotheses its conclusions may not need?

Affects R-30.

- (a) **Keep the paper's hypotheses as printed**: `P` compact, and `q` a probability
  measure (total mass one), as well as strictly positive. The sources do this.
- (b) Drop "compact" and "total mass one". The paper's proof of the three assertions does
  not seem to use them: a minimiser is given, and the proof uses only that `q` is positive.
  The Lean statements would then be more general than the paper's.

**Recommended: (a)**, and record at the proof stage whether they were used, as was done for
`[Nonempty V]` in Proposition 3.5.

---

## Definitions

### R-21 — a hole relation in the abstract; its graph on positions — D-3.rel, note F-HOLEREL

- **Paper** (Lemma 2.2): "The hole relation is symmetric, has no loops, and is
  triangle-free." (§2.4, last paragraph): "By Lemma 2.2, their hole relation on `Ω_n` is
  symmetric, loopless, and triangle-free." (§2.1): "Given any list `o_1, …, o_m ∈ Ω`, form
  a graph `G` on its *positions*: two distinct positions are adjacent when their elements
  have no hole." The paper has no definition of an abstract relation; this item exists
  because of the user's decision of 2026-10-07.
- **Lean** (`Hadwiger/Defs/HoleRel.lean`, `Hadwiger/Supersaturation.lean`, new):

  ```lean
  structure HoleRel (Ω : Type*) where
    Rel : Ω → Ω → Prop
    symm : ∀ {i j : Ω}, Rel i j → Rel j i
    irrefl : ∀ i : Ω, ¬ Rel i i
    triangle_free : ∀ {i j k : Ω}, Rel i j → Rel j k → Rel i k → False

  def HoleRel.positionGraph (H : HoleRel Ω) {m : ℕ} (o : Fin m → Ω) : SimpleGraph (Fin m) where
    Adj p q := p ≠ q ∧ ¬ H.Rel (o p) (o q)
    symm := ⟨fun _ _ h => ⟨h.1.symm, fun h' => h.2 (H.symm h')⟩⟩
    loopless := ⟨fun _ h => h.1 rfl⟩

  def HoleData.holeRel (D : HoleData X V Ω) : HoleRel Ω where
    Rel := D.Hole
    symm := Hole.symm
    irrefl := D.not_hole_self
    triangle_free := D.not_hole_triangle
  ```
- **Machine-checked here:** `D.holeRel.positionGraph o = D.positionGraph o`, by `rfl`
  (S-M4.rel); with no holes among the elements the graph is complete (S-M4.rel); the graph
  on positions has `α(G) ≤ 2` (S-M4.support). `HoleData.holeRel` uses the three proved parts
  of Lemma 2.2, so nothing beneath it is open. The signed-off `HoleData.positionGraph` is
  unchanged (the `pp.all` comparison of the session log).
- **Compared clause by clause:** "symmetric": `symm`. "has no loops": `irrefl`.
  "triangle-free": `triangle_free`, for any three elements. "two distinct positions are
  adjacent when their elements have no hole": `Adj p q := p ≠ q ∧ ¬ H.Rel (o p) (o q)`.
- **Differences in form:** abstract; `Ω` not assumed finite by the structure;
  triangle-freeness without "distinct", as in the signed-off Lean Lemma 2.2.
- **Doubts:**
  1. Q3: a bare structure, where Mathlib's `SimpleGraph` with `CliqueFree 3` would also do.
  2. The hand derivation of the bound of Proposition 3.4 seems to use only symmetry. The
     statements are nevertheless about a `HoleRel`, as decided. Nothing is lost for the
     paper, whose relation has all three properties.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

### R-22 — laws and the mass of a set — D-3.law, note F-LAW

- **Paper:** no definition. (Theorem 3.1): "every probability law `σ` on units"; "The
  inequalities in (3.1) are pointwise inequalities of measures on the finite raw spaces."
  (§2.4): "Take the uniform distribution on this finite frame set, independently over
  components. Let `Ω_n` be the raw vertex space and `μ = μ_n` this distribution." (§3.1):
  "probability measures on a finite set". Masses are written `μ(S)`, `μ^2(E_0)`, `ρ(S)`.
- **Lean** (`Hadwiger/Defs/Law.lean`, new; `α` is a `Fintype`):

  ```lean
  structure IsLaw [Fintype α] (p : α → ℝ) : Prop where
    nonneg : ∀ x, 0 ≤ p x
    sum_eq_one : ∑ x, p x = 1

  noncomputable def mass [Fintype α] (p : α → ℝ) (S : Set α) : ℝ :=
    ∑ x, S.indicator p x
  ```

  Mathlib: `Set.indicator S p x` is `p x` if `x ∈ S` and `0` otherwise.
- **Machine-checked here:** a function is a law exactly when it is the weight function of
  an element of Mathlib's `Convexity.StdSimplex ℝ α`; a point mass is a law; uniform weights
  on a nonempty type are a law; a law needs a nonempty type (S-M4.law). `mass` is `0` on
  the empty set, `∑ p` on the whole type (`1` for a law), `p a` on `{a}`, nonnegative and
  monotone for nonnegative weights, at most `1` for a law (S-M4.mass).
- **Compared clause by clause:** "probability law on a finite set": nonnegative weights with
  sum one. "`μ(S)`": the sum of the weights of the points of `S`.
- **Differences in form:** none in content.
- **Doubts:**
  1. Q1: the representation.
  2. `IsLaw` is a predicate on a bare function, so a statement about a law has the function
     and the hypothesis as two arguments.
  3. There is no law on an empty type. Every statement below that assumes a law therefore
     excludes the empty type; that is intended and is the named hypothesis for that case.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

### R-23 — marginals and the product law — D-3.marg, note F-MARG

- **Paper** (equation (3.1)): "`σ_1 ≤ Mμ`, `σ_2 ≤ Mμ`, `σ ≤ 2^{DN} μ^2`". `σ_1`, `σ_2` and
  `μ^2` are not defined further.
- **Lean** (new):

  ```lean
  def marginalFst [Fintype β] (σ : α × β → ℝ) (x : α) : ℝ := ∑ y, σ (x, y)
  def marginalSnd [Fintype α] (σ : α × β → ℝ) (y : β) : ℝ := ∑ x, σ (x, y)
  def prodLaw (p : α → ℝ) (q : β → ℝ) : α × β → ℝ := fun z => p z.1 * q z.2
  ```
- **Machine-checked here:** the first marginal of `p ⊗ q` is `p` and the second is `q`
  (when the other factor has total one); the product of two laws is a law; both marginals
  of a law are laws (S-M4.marg).
- **Compared clause by clause:** `σ_1` is the law of the first endpoint, `σ_2` of the
  second; `μ^2` is `prodLaw μ μ`.
- **Differences in form:** defined for arbitrary weight functions, and `prodLaw` for two
  functions on two types.
- **Doubts:** none. That `σ_1` is the marginal on the *first* endpoint is a reading of the
  subscript; the three caps are symmetric in the two marginals, so nothing depends on it.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

### R-24 — the three caps of equation (3.1) — D-3.caps, note F-CAPS

- **Paper** (Theorem 3.1): "`σ_1 ≤ Mμ`, `σ_2 ≤ Mμ`, `σ ≤ 2^{DN} μ^2`" and "The inequalities
  in (3.1) are pointwise inequalities of measures on the finite raw spaces."
- **Lean** (new):

  ```lean
  structure SatisfiesCaps [Fintype α] (μ : α → ℝ) (M B : ℝ) (σ : α × α → ℝ) : Prop where
    fst : ∀ x, marginalFst σ x ≤ M * μ x
    snd : ∀ y, marginalSnd σ y ≤ M * μ y
    joint : ∀ z, σ z ≤ B * prodLaw μ μ z
  ```
- **Machine-checked here:** for every law `μ`, `μ^2` satisfies the caps with `M = B = 1`;
  if laws `μ`, `σ` satisfy the caps then `1 ≤ M` and `1 ≤ B` (S-M4.caps).
- **Compared clause by clause:** three inequalities, three fields, in the paper's order.
  "Pointwise inequalities of measures": on a finite set an inequality of measures holds for
  all sets exactly when it holds at all points; the fields are the inequalities at points.
- **Differences in form:** `M` and `B` are arbitrary real numbers, as instructed; the
  paper's are `2^1000` and `2^{DN}`.
- **Doubts:** none.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

### R-25 — units and conflicts — D-3.unit, note F-UNIT

- **Paper** (§3, first paragraph): "A *unit* is an ordered pair of raw vertices with no
  hole between its endpoints. The endpoints of a unit may be dependent. When two units are
  sampled independently, their four endpoints need not be independent within either unit.
  The event of interest is that all four cross pairs have holes". (Proof of Proposition
  3.4): "two units are adjacent when they give all four cross holes. There are no loops,
  since a repeated unit would require a hole from a raw vertex to itself."
- **Lean** (`Hadwiger/Defs/HoleRel.lean`, new):

  ```lean
  def HoleRel.IsUnit (H : HoleRel Ω) (u : Ω × Ω) : Prop :=
    ¬ H.Rel u.1 u.2

  def HoleRel.Conflict (H : HoleRel Ω) (u v : Ω × Ω) : Prop :=
    H.Rel u.1 v.1 ∧ H.Rel u.1 v.2 ∧ H.Rel u.2 v.1 ∧ H.Rel u.2 v.2
  ```
- **Machine-checked here:** `(x, x)` is a unit; unit-ness does not depend on the order; in
  the example of `exists_holeData_hole` the pair `(0, 1)` is not a unit and `(0, 0)` is
  (S-M4.unit). Conflict is symmetric; no ordered pair conflicts with itself; no unit
  conflicts with itself, by a second argument that does not use the absence of loops; two
  units can conflict (S-M4.conflict). In the graph on positions, two pairs of positions
  with distinct cross pairs fail to touch exactly when their pairs of elements conflict
  (S-M4.touch), which is the paper's sentence at the end of §2.1.
- **Compared clause by clause:** "an ordered pair": `u : Ω × Ω`. "no hole between its
  endpoints": `¬ H.Rel u.1 u.2`. "all four cross pairs have holes": the four conjuncts,
  one endpoint from each pair.
- **Differences in form:** abstract relation; `Conflict` is defined for any two ordered
  pairs, not only units.
- **Doubts:**
  1. PI-007, second point: the endpoints of a unit may be the same element. Adopted because
     the definition as written allows it and the proof of Proposition 3.4 needs it.
  2. "The endpoints of a unit may be dependent" is read as a remark about a law on units,
     with nothing to formalise.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

### R-26 — the conflict probability — D-3.confl, note F-CONFLPROB

- **Paper** (Theorem 3.1): "two independent units drawn from `σ` have all four cross holes
  with probability at least `2^{-100gN}`."
- **Lean** (`Hadwiger/Supersaturation.lean`, new):

  ```lean
  noncomputable def HoleRel.conflictProb (H : HoleRel Ω) (σ : Ω × Ω → ℝ) : ℝ :=
    mass (prodLaw σ σ) {z : (Ω × Ω) × (Ω × Ω) | H.Conflict z.1 z.2}
  ```
- **Machine-checked here:** it equals `∑ u, ∑ v, if H.Conflict u v then σ u * σ v else 0`;
  it is nonnegative for nonnegative weights and at most `1` for a law (S-M4.conflprob).
- **Compared clause by clause:** "two independent units drawn from `σ`": the pair has law
  `σ ⊗ σ`. "have all four cross holes": the event `Conflict`. "with probability": `mass`.
- **Differences in form:** defined for any weight function.
- **Doubts:** none. The sum includes the pairs `(u, u)`, which contribute nothing.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

### R-27 — the conclusion of Theorem 3.1 as a hypothesis — D-3.sup, note F-SUP

- **Paper** (Theorem 3.1): "For the construction parameters specified in Sections 2 and
  Appendix A, for all sufficiently large `n`, every probability law `σ` on units satisfying
  [(3.1)] has the following property: two independent units drawn from `σ` have all four
  cross holes with probability at least `2^{-100gN}`." (Proposition 3.4): "Assume the
  conclusion of Theorem 3.1 at a given sufficiently large `n`."
- **Lean** (new):

  ```lean
  def HoleRel.Supersaturated (H : HoleRel Ω) (μ : Ω → ℝ) (M B ε : ℝ) : Prop :=
    ∀ σ : Ω × Ω → ℝ, IsLaw σ → Function.support σ ⊆ {u | H.IsUnit u} →
      SatisfiesCaps μ M B σ → ε ≤ H.conflictProb σ
  ```

  Mathlib: `Function.support σ = {u | σ u ≠ 0}`.
- **Machine-checked here:** in an example on two elements it holds, with a law that
  satisfies the caps, exactly for `ε ≤ 1/2`; it is weaker for smaller `ε`; it holds for
  every relation when `ε ≤ 0`; it holds for an empty reason when `M < 1` or `B < 1`
  (S-M4.sup).
- **Compared clause by clause:** "every probability law `σ` on units": `IsLaw σ` and
  support in the units. "satisfying (3.1)": `SatisfiesCaps μ M B σ`. "with probability at
  least `2^{-100gN}`": `ε ≤ H.conflictProb σ`.
- **Differences in form:** abstract relation and real numbers `M`, `B`, `ε`. The
  quantification over parameters and over large `n` is not part of it.
- **Doubts:**
  1. PI-007, first point: "a law on units" is read as a law on all ordered pairs that
     vanishes off the units.
  2. **Theorem 3.1 is not stated**, and stays `NOT_STATED`. This definition is its
     conclusion only. It was written so that the statement of Theorem 3.1 at M5 can be
     `Supersaturated` for the paper's relation, law and numbers; whether that will read
     well cannot be checked before the construction exists.
  3. The property can hold for an empty reason. Statements that assume it are examined for
     that in R-33.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

### R-28 — relative entropy — D-3.KL, note F-KL

- **Paper** (§3.1): "Relative entropy is taken with natural logarithms:
  `D(ρ‖q) = ∑_x ρ(x) log(ρ(x)/q(x))`. Here `q` is a strictly positive probability measure
  and `0 log 0 = 0`."
- **Lean** (`Hadwiger/Defs/RelEntropy.lean`, new):

  ```lean
  noncomputable def relEntropy [Fintype α] (ρ q : α → ℝ) : ℝ :=
    ∑ x, ρ x * Real.log (ρ x / q x)
  ```
- **Machine-checked here:** `D(ρ‖ρ) = 0`; `D(δ_a‖q) = −log q(a)`; against the uniform law on
  `n` points that is `log n` (S-M4.kl).
- **Compared clause by clause:** the formula is the paper's. "natural logarithms":
  `Real.log`. "`0 log 0 = 0`": the term is `0 * Real.log 0 = 0`. "`q` is a strictly positive
  probability measure": **not part of the definition**; it is a hypothesis of the statements
  that use it.
- **Differences in form:** defined for all pairs of weight functions.
- **Doubts:**
  1. Q4: where `q x = 0 < ρ x` the Lean value is a junk value, not `+∞`. Statements must
     guard against it; Lemma 3.2 does (R-30).
  2. PI-008: the paper itself writes `D(ρ'‖ρ)` with `ρ` not strictly positive.
  3. Agreement with Mathlib's `klDiv` is not proved (S-M4.kl-mathlib, `NOT_STATED`).
  4. Nonnegativity is not proved here; the paper proves it inside the proof of Lemma 3.2.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

### R-29 — the law of a list of independent elements — D-3.list, note F-LIST

- **Paper** (§2.4, last paragraph): "Sample `m` raw vertices independently with law `μ_n`,
  and form the graph on their positions as above."
- **Lean** (`Hadwiger/Defs/Law.lean`, new):

  ```lean
  def listLaw (μ : α → ℝ) (m : ℕ) : (Fin m → α) → ℝ :=
    fun o => ∏ i, μ (o i)
  ```

  The probability of an event `E` about the list is `mass (listLaw μ m) E`.
- **Machine-checked here:** for a law `μ` it is a law (total mass `1`); the list of length
  `0` has weight `1`; the probability that all `m` elements lie in `S` is `μ(S)^m`
  (S-M4.list).
- **Compared clause by clause:** "`m` raw vertices": `o : Fin m → α`. "independently with
  law `μ_n`": weight `∏ μ(o_i)`.
- **Differences in form:** any weight function on any type.
- **Doubts:** none.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08

---

## Stated results

Each of these compiles with `sorry`. The question for sign-off is whether the Lean
statement says what the paper says, in the abstract form decided.

### R-30 — Lemma 3.2 — L-3.2

- **Paper** (Lemma 3.2): "Let `P` be a nonempty compact convex set of probability measures
  on a finite set, and let `ρ` minimize `D(·‖q)` on `P`. Then `ρ` is positive on the union
  of the supports of measures in `P`. For every `ρ' ∈ P`,
  `D(ρ'‖q) − D(ρ‖q) ≥ D(ρ'‖ρ)`. If `ρ'` is supported on a set `S`, the right side is at
  least `−log ρ(S)`."
- **Lean** (`Hadwiger/EntropyAndCuts.lean`; `α` is a `Fintype`):

  ```lean
  theorem relEntropy_minimizer_pos {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
      (hconv : Convex ℝ P) (hcomp : IsCompact P)
      {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
      {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q) :
      ∀ x ∈ ⋃ ρ' ∈ P, Function.support ρ', 0 < ρ x

  theorem relEntropy_le_sub_of_minimizer {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
      (hconv : Convex ℝ P) (hcomp : IsCompact P)
      {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
      {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q)
      {ρ' : α → ℝ} (hρ' : ρ' ∈ P) :
      relEntropy ρ' ρ ≤ relEntropy ρ' q - relEntropy ρ q

  theorem neg_log_mass_le_relEntropy_of_minimizer {P : Set (α → ℝ)} (hP : ∀ p ∈ P, IsLaw p)
      (hconv : Convex ℝ P) (hcomp : IsCompact P)
      {q : α → ℝ} (hq : IsLaw q) (hqpos : ∀ x, 0 < q x)
      {ρ : α → ℝ} (hρ : ρ ∈ P) (hmin : ∀ ρ' ∈ P, relEntropy ρ q ≤ relEntropy ρ' q)
      {ρ' : α → ℝ} (hρ' : ρ' ∈ P) {S : Set α} (hS : Function.support ρ' ⊆ S) :
      -Real.log (mass ρ S) ≤ relEntropy ρ' ρ
  ```
- **Machine-checked here:** that the three statements type-check. Nothing else: all three
  are `sorry`.
- **Compared clause by clause:** see note L-3.2. In short: `P` with `hP`, `hconv`, `hcomp`
  is the compact convex set of probability measures; "nonempty" follows from `hρ`; `hρ`
  and `hmin` say `ρ` minimises; `hq` and `hqpos` say `q` is a strictly positive
  probability measure; the first conclusion is positivity on the union of the supports;
  the second is the inequality, written with the smaller side first; the third is the
  bound by `−log ρ(S)` for `ρ'` supported on `S`.
- **Differences in form:** three theorems for three assertions; the minimiser spelled out
  (it is Mathlib's `IsMinOn`, unfolded); the third assertion is for the `ρ' ∈ P` of the
  second.
- **Degenerate cases** (by hand): empty type and empty `P` are excluded by `hρ` with `hP`;
  `q` with a zero by `hqpos`; `S` empty by `hS` with `hP`; for `P = {ρ}` the assertions
  read `0 ≤ 0`. The length `m`, the caps, the conflict bound and the relation do not occur.
- **Doubts:**
  1. Q6: "compact" and "`q` has total mass one" are kept as printed though the conclusions
     may not need them.
  2. PI-008 and Q4: `relEntropy ρ' ρ` has a second argument that may vanish. It is the
     honest value because of the first assertion; this was checked by hand and is not in
     Lean.
  3. `IsCompact` is with respect to the product topology on `α → ℝ`. For a finite type that
     is the usual topology of `ℝ^α`, which is what "compact" means for a set of probability
     measures on a finite set.
  4. Whether the third assertion should also be available for a `ρ'` that is not in `P`
     (it is true for any law `ρ'` that vanishes where `ρ` does). The paper states it for
     `ρ' ∈ P`, and that is what is stated.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08
- **Status update after the sign-off** (2026-10-08, second slice of M4): all three are
  proved, by the paper's proof, with the statements unchanged. On the doubts. 1: neither
  hypothesis is used by the proof of the first assertion, and the other two proofs use them
  only to call the first; both are kept. 2: it is in Lean now, by hypothesis and proof. 4:
  the more general form is proved as a helper lemma,
  `Hadwiger.neg_log_mass_le_relEntropy`; the statement of Lemma 3.2 is as the paper has it.
  Details: note L-3.2 and `docs/SESSION_LOG.md` (M4 second-slice session).

### R-31 — Lemma 3.3 — L-3.3

- **Paper** (Lemma 3.3): "Let `R ⊆ Ω_n^2`. If no probability law supported on `R`
  satisfies (3.1), there are sets `S ⊆ Ω_n` and `E_0 ⊆ Ω_n^2` such that `μ(S) < 1/M`,
  `μ^2(E_0) < 2^{-DN}`, and every pair in `R` either has an endpoint in `S` or belongs to
  `E_0`."
- **Lean** (`Hadwiger/EntropyAndCuts.lean`; `Ω` is a `Fintype`):

  ```lean
  theorem exists_terminal_cut {μ : Ω → ℝ} (hμ : IsLaw μ) (M B : ℝ) (R : Set (Ω × Ω))
      (hR : ¬ ∃ σ : Ω × Ω → ℝ, IsLaw σ ∧ Function.support σ ⊆ R ∧ SatisfiesCaps μ M B σ) :
      ∃ (S : Set Ω) (E₀ : Set (Ω × Ω)),
        M * mass μ S < 1 ∧ B * mass (prodLaw μ μ) E₀ < 1 ∧
          ∀ z ∈ R, z.1 ∈ S ∨ z.2 ∈ S ∨ z ∈ E₀
  ```
- **Machine-checked here:** that it type-checks. It is `sorry`.
- **Compared clause by clause:** `R`; `hR` ("no probability law supported on `R` satisfies
  (3.1)"); `S` and `E₀`; `M * mass μ S < 1` for `μ(S) < 1/M`;
  `B * mass (prodLaw μ μ) E₀ < 1` for `μ^2(E_0) < 2^{-DN}`; the covering clause.
- **Differences in form:** abstract (`Ω` any finite type with a law; `M`, `B` real); no
  division, as instructed; no hole relation.
- **Degenerate cases** (by hand): empty type excluded by `hμ`; for `M < 1` take `S`
  everything and `E_0` empty; for `B < 1` take `S` empty and `E_0` everything; `R` empty
  gives empty `S` and `E_0`; the content is `M ≥ 1`, `B ≥ 1`, where the paper's capacities
  are nonnegative. Not false in any case.
- **Doubts:**
  1. There is no sign condition on `M` and `B`. The statement is claimed for all real
     numbers, by the case split above. The paper has positive values only.
  2. "Either … or" is read inclusively.
- **Sign-off:** ☑ accepted ☐ change requested — by John Fairfax-Ball on 2026-10-08
- **Status update after the sign-off** (2026-10-08, third slice of M4): proved, by the
  paper's proof, with the statement unchanged. On the doubts. 1: the proof covers all real
  `M` and `B`. It splits at zero: for `M < 0` and for `B < 0` the trivial choices above
  serve and the hypothesis on `R` is not used; for `0 ≤ M` and `0 ≤ B` it is the paper's
  proof. 2: nothing new. Of "`μ` is a law" only the nonnegativity of the weights is used.
  Details: note L-3.3 and `docs/SESSION_LOG.md` (M4 third-slice session).

### R-32 — the explicit bound — D-3.bound, note F-BOUND

- **Paper** (proof of Proposition 3.4): equation (3.2),
  "`L_N = 1 + ⌈ DN log 2 / (−log(1 − ε_N)) ⌉ = O(1 + DN 2^{100gN})`"; "The number of
  possible fingerprints, and hence terminal sets, is at most `(|Ω_n|^2 + 1)^{L_N}`"; "Let
  `k = ⌈m/200⌉`. The probability that at least `k` sampled positions have raw type in `S`
  is at most `C(m,k) μ(S)^k ≤ (em/(kM))^k ≤ (200e/M)^k = exp(−Ω(m))`"; "There are at most
  `m^{2k}` such collections, so the probability that one exists is at most
  `m^{2k} 2^{-kDN} = 2^{(2C_0 g − D)Nk} = 2^{-2C_0 g N k}`" (equation (3.4)); "Union over the
  `exp(o(m))` terminal sets".
- **Lean** (`Hadwiger/RandomSample.lean`, new):

  ```lean
  noncomputable def fingerprintLength (B ε : ℝ) : ℕ :=
    1 + ⌈Real.log B / (-Real.log (1 - ε))⌉₊

  noncomputable def exceptionSize (m : ℕ) : ℕ :=
    ⌈(m : ℝ) / 200⌉₊

  noncomputable def sampleBound (n : ℕ) (M B ε : ℝ) (m : ℕ) : ℝ :=
    ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε *
      ((m.choose (exceptionSize m) : ℝ) / M ^ exceptionSize m
        + (m : ℝ) ^ (2 * exceptionSize m) / B ^ exceptionSize m)
  ```
- **Machine-checked here** (S-M4.bound, S-M4.eps-needed): `m ≤ 200k < m + 200` for
  `k = exceptionSize m`; `k = 0` at `m = 0`, `k = 1` for `1 ≤ m ≤ 200`, `k ≤ m`; the length
  is at least `1`, is `1` at `B = 1`, is `3` at `B = 4`, `ε = 1/2`; the bound is
  `2(n^2+1)^L > 1` at `m = 0`, is `(n^2+1)^L (m/M + m^2/B)` for `1 ≤ m ≤ 200`, and is at
  least `1` for `0 < M ≤ 1` and for `0 < B ≤ 1`; and with `ε = 0` the inequality of
  Proposition 3.4 fails in an example. **None of this is evidence that the bound holds.**
- **Compared clause by clause:** `fingerprintLength` is equation (3.2) with `log B` for
  `DN log 2` and `ε` for `ε_N`. `exceptionSize` is "`k = ⌈m/200⌉`". The first factor of
  `sampleBound` is `(|Ω_n|^2 + 1)^{L_N}`; the first summand is `C(m,k) μ(S)^k` with
  `μ(S) < 1/M`; the second is `m^{2k} 2^{-kDN}` with `2^{DN} = B`.
- **Differences in form:** the paper never writes one bound; it estimates each piece
  further and takes logarithms. The bound is assembled from the pieces by the hand
  derivation of note F-BOUND, which is not a proof.
- **Doubts:**
  1. Q2: the form.
  2. The derivation is by hand. Its steps are numbered in F-BOUND so that each can be
     checked; steps 1 to 3 (the procedure, the length, the replay count) carry the weight.
  3. Junk values: the definitions are meaningful only for `M > 0`, `B > 0`, `0 < ε < 1`.
     Outside that range they still return numbers. Proposition 3.4 assumes the range, and
     S-M4.eps-needed shows it must.
  4. `⌈·⌉₊` is `0` on negative reals, so for `0 < B < 1` the length is `1`. Harmless by step
     2 of the derivation.
- **Sign-off:** ☐ accepted ☐ change requested — **not signed**: held by John Fairfax-Ball on 2026-10-08 for a second reading

### R-33 — Proposition 3.4 — P-3.4

- **Paper** (Proposition 3.4): "Assume the conclusion of Theorem 3.1 at a given sufficiently
  large `n`. For `m = 2^{C_0 g N}`, the sampled graph defined in Section 2 satisfies
  `α(G) ≤ 2`, `cm(G) < m/100` with probability `1 − exp(−Ω(m))`. The implied positive
  constant is independent of `n`."
- **Lean** (`Hadwiger/RandomSample.lean`; `Ω` is a `Fintype`):

  ```lean
  theorem mass_listLaw_le_sampleBound (H : HoleRel Ω) {μ : Ω → ℝ} (hμ : IsLaw μ)
      {M B ε : ℝ} (hM : 0 < M) (hB : 0 < B) (hε : 0 < ε) (hε1 : ε < 1) (m : ℕ)
      (hsup : H.Supersaturated μ M B ε) :
      mass (listLaw μ m) {o | m ≤ 100 * connectedMatchingNumber (H.positionGraph o)}
        ≤ sampleBound (Fintype.card Ω) M B ε m

  theorem exists_list_indepNum_le_two_and_connectedMatchingNumber_lt (H : HoleRel Ω)
      {μ : Ω → ℝ} (hμ : IsLaw μ) {M B ε : ℝ} (hM : 0 < M) (hB : 0 < B) (hε : 0 < ε)
      (hε1 : ε < 1) (m : ℕ) (hsup : H.Supersaturated μ M B ε)
      (hlt : sampleBound (Fintype.card Ω) M B ε m < 1) :
      ∃ o : Fin m → Ω, (H.positionGraph o).indepNum ≤ 2 ∧
        100 * connectedMatchingNumber (H.positionGraph o) < m
  ```
- **Machine-checked here:** the second follows from the first (its proof body is complete),
  by `isLaw_listLaw`, `IsLaw.exists_notMem_of_mass_lt_one` and
  `HoleRel.indepNum_positionGraph_le_two`. The first is `sorry`, so the second is
  `PROVED_MODULO` and neither is proved. With `ε = 0` in place of `0 < ε` the first is
  false (S-M4.eps-needed).
- **Compared clause by clause:** "Assume the conclusion of Theorem 3.1": `hsup`. "the
  sampled graph": `H.positionGraph o`, `o` with law `listLaw μ m`. "`cm(G) < m/100`":
  `100 * connectedMatchingNumber … < m`; the event bounded is its failure. "`α(G) ≤ 2`":
  in the second statement. "with probability `1 − exp(−Ω(m))`": the failure probability
  is at most `sampleBound …`.
- **Differences in form:** abstract; an explicit bound in place of the asymptotic one; two
  statements; no division (`m ≤ 100·cm` for `cm ≥ m/100`). All by the user's decision of
  2026-10-07. The second statement gives exactly the form of Theorem 1.1:
  `G.indepNum ≤ 2 ∧ 100 * connectedMatchingNumber G < m` for a graph on `Fin m`.
- **Hypotheses:** `hμ`, `hM`, `hB`, `hε`, `hε1`, `hsup` are all the paper's (table in note
  P-3.4). None was added. Two of the paper's are weakened: `μ` is any law, and `m` is any
  number.
- **Degenerate cases** (by hand; note P-3.4 has each): empty type excluded by `hμ`;
  `m = 0`: true, bound at least `2`, existence statement empty; `1 ≤ m ≤ 200`: covered by
  the derivation, not excluded; `ε ≤ 0`, `ε ≥ 1`, `M ≤ 0`, `B ≤ 0`: excluded by named
  hypotheses; `M ≤ 1` or `B ≤ 1`: bound at least `1`; no holes: the hypothesis forces
  `M < 1` or `B < 1`, where the bound is at least `1`. In no case false.
- **Doubts:**
  1. **The bound is a hand derivation of a statement that is not in the paper in this
     form.** If it is wrong, the Lean statement is false and its proof will fail; that would
     be an error of this repository and not of the paper. It is the item on this sheet that
     most deserves a second reading.
  2. Q5: `μ` is not assumed positive, though the paper's argument needs it and gets it from
     uniformity. The proof will need an extra step.
  3. PI-009: the paper's "sufficiently large `n`" and "constant independent of `n`" have no
     counterpart here; they are left to M17.
  4. The bound is useless unless it is below `1`. For the paper's parameters that needs
     `(|Ω_n|^2 + 1)^{L_N}` to be far below `M^k` and `(B/m^2)^k`, which is the paper's
     equation (3.3). It is not checked here and belongs to M17.
  5. Theorem 1.1 is not derived from the second statement. Nothing of M4 changes the status
     of the final theorem.
- **Sign-off:** ☐ accepted ☐ change requested — **not signed**: held by John Fairfax-Ball on 2026-10-08 for a second reading

---

## What the sanity lemmas do and do not establish

They establish that the new definitions behave correctly on the checks listed in the
blueprint under "Section 3: laws, relative entropy, the abstract hole relation, the
explicit bound": laws are Mathlib's; masses, marginals and products are what their names
say; the caps hold for `μ^2` at `1, 1` and fail for every law below `1`; the list law is a
law and makes the elements independent on product events; relative entropy has the right
values on three examples; the signed-off graph on positions is an instance of the abstract
one; units and conflicts have the properties the paper uses, and agree with the signed-off
notion of touching; the supersaturation hypothesis can hold, can fail, and is empty in the
cases named; and the bound is what it should be in its degenerate cases.

They do not establish that the definitions are the right ones in general. That rests on
the notes and on the user's judgement. They say nothing about whether Lemma 3.2, Lemma 3.3
or Proposition 3.4 is true, and in particular nothing about whether the explicit bound is
correct.
