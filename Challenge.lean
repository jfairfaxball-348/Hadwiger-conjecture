module

public import Mathlib

@[expose] public section

/-!
# A counterexample to Hadwiger's conjecture: the statements

This file states, with deliberate `sorry`, the results that the repository proves. It
imports Mathlib only. Everything a reader has to trust in order to read the statements is in
this file: three notions that Mathlib does not have (graph minors and the Hadwiger number,
connected matchings, the fractional chromatic number) and the conjecture itself.

Source: OpenAI, *A counterexample to Hadwiger's conjecture*, 23 September 2026.

## What is claimed

Hadwiger's conjecture (1943) says that every finite graph `G` satisfies `h(G) ≥ χ(G)`: a graph
with chromatic number `χ` has the complete graph `K_χ` as a minor. Here `h(G)`, the Hadwiger
number, is the largest `t` such that `K_t` is a minor of `G`.

* `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` is Theorem 1.1 of the
  paper: there are arbitrarily large `m` and graphs `G` on `m` vertices with independence
  number at most `2` and no connected matching with `m/100` or more edges.
* `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` is Corollary 1.2: for such
  graphs `h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`.
* `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber` is the consequence in one line: there
  are finite graphs of arbitrarily large order with `h(G) < χ(G)`.
* `Hadwiger.not_hadwigerConjecture` and `Hadwiger.not_fractionalHadwigerConjecture`: the
  conjecture, and its weakening with the fractional chromatic number in place of the
  chromatic number, are false.

## Who proved what

The proof of Theorem 1.1, which is almost the whole paper, is **not** the work of this
repository. It is the Lean formalisation published by the paper's authors
(`https://github.com/openai/math`, commit `fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb`), ported
here to Lean's module system and to this toolchain. This repository's own work is the
definitions and statements of this file, the proof of the clique-minor bound
`3 h(G) ≤ m + 4 cm(G) + 2` (Proposition 3.5 of the paper), the bounds on `χ` and `χ_f` by the
independence number, the deduction of the other four statements from Theorem 1.1, and the
comparison between its definition of the connected matching number and upstream's.
`formalization.yaml` and the README say this in full.
-/

namespace Hadwiger

/-! ### Minors and the Hadwiger number -/

section Minor

variable {V W : Type*}

/-- A *minor model* of `H` in `G`: a family of vertex sets of `G` ("branch sets"), one for
each vertex of `H`, such that

* each branch set induces a connected subgraph of `G` (Mathlib's `Connected` includes
  nonemptiness),
* distinct branch sets are disjoint, and
* whenever two vertices of `H` are adjacent, some edge of `G` joins their branch sets.

Contracting each branch set to a point and deleting everything else exhibits `H` as a minor
of `G`; conversely every minor arises this way. This is the standard definition of a minor
by branch sets. -/
structure MinorModel (H : SimpleGraph W) (G : SimpleGraph V) where
  /-- The branch set of each vertex of `H`. -/
  branch : W → Set V
  /-- Each branch set induces a connected, in particular nonempty, subgraph of `G`. -/
  connected : ∀ w, (G.induce (branch w)).Connected
  /-- Distinct branch sets are disjoint. -/
  disjoint : ∀ w w', w ≠ w' → Disjoint (branch w) (branch w')
  /-- Adjacent vertices of `H` have branch sets joined by an edge of `G`. -/
  adj : ∀ w w', H.Adj w w' → ∃ x ∈ branch w, ∃ y ∈ branch w', G.Adj x y

/-- `H` is a minor of `G`: there is a minor model of `H` in `G`. -/
def IsMinor (H : SimpleGraph W) (G : SimpleGraph V) : Prop :=
  Nonempty (MinorModel H G)

/-- `G` contains a `K_t` minor: the complete graph on `Fin t` is a minor of `G`. -/
def HasCliqueMinor (G : SimpleGraph V) (t : ℕ) : Prop :=
  IsMinor (⊤ : SimpleGraph (Fin t)) G

/-- The Hadwiger number `h(G)`: the largest `t` such that `G` contains a `K_t` minor.

It is defined as a supremum in `ℕ`. For a graph on a finite vertex type the set of such `t`
contains `0` and is bounded by the number of vertices, because branch sets are nonempty and
disjoint; so the supremum is a maximum. For an infinite graph with unbounded clique minors
the value would be the default `0`. Every statement below is about a finite vertex type. -/
noncomputable def hadwigerNumber (G : SimpleGraph V) : ℕ :=
  sSup {t : ℕ | HasCliqueMinor G t}

end Minor

/-! ### Connected matchings -/

section ConnectedMatching

variable {V : Type*}

/-- Two edges `e`, `f` (as unordered pairs of vertices) *touch* in `G` if some endpoint of
`e` is adjacent in `G` to some endpoint of `f`. It is used below only for two distinct edges
of a matching, which are disjoint. -/
def EdgesTouch (G : SimpleGraph V) (e f : Sym2 V) : Prop :=
  ∃ x ∈ e, ∃ y ∈ f, G.Adj x y

/-- A *connected matching* of `G`: a matching (Mathlib's `Subgraph.IsMatching`) any two
distinct edges of which touch. -/
def IsConnectedMatching {G : SimpleGraph V} (M : G.Subgraph) : Prop :=
  M.IsMatching ∧ ∀ e ∈ M.edgeSet, ∀ f ∈ M.edgeSet, e ≠ f → EdgesTouch G e f

/-- `cm(G)`: the maximum number of edges of a connected matching of `G`.

It is defined as a supremum in `ℕ` of the edge counts (`Set.ncard`) of connected matchings.
For a graph on a finite vertex type this set contains `0` (the empty matching) and is
bounded by half the number of vertices, so the supremum is a maximum. Every statement below
is about a finite vertex type. -/
noncomputable def connectedMatchingNumber (G : SimpleGraph V) : ℕ :=
  sSup {k : ℕ | ∃ M : G.Subgraph, IsConnectedMatching M ∧ M.edgeSet.ncard = k}

end ConnectedMatching

/-! ### Fractional colourings -/

section FractionalColoring

open Finset

variable {V : Type*} [Fintype V]

open Classical in
/-- A *fractional colouring* of a finite graph `G`: nonnegative real weights on the sets of
vertices, zero on every set that is not independent, such that for every vertex the weights
of the sets containing it add up to at least `1`. -/
structure FractionalColoring (G : SimpleGraph V) where
  /-- The weight of a set of vertices. -/
  weight : Finset V → ℝ
  /-- Weights are nonnegative. -/
  nonneg : ∀ s, 0 ≤ weight s
  /-- Only independent sets carry weight. -/
  indep : ∀ s, weight s ≠ 0 → G.IsIndepSet (s : Set V)
  /-- Every vertex is covered with total weight at least `1`. -/
  cover : ∀ v, 1 ≤ ∑ s ∈ univ.filter (fun s : Finset V => v ∈ s), weight s

/-- The total weight of a fractional colouring. -/
noncomputable def FractionalColoring.total {G : SimpleGraph V} (w : FractionalColoring G) : ℝ :=
  ∑ s, w.weight s

/-- The fractional chromatic number `χ_f(G)`: the infimum of the total weights of the
fractional colourings of `G`. For a finite graph the set of totals is nonempty (weight `1` on
each singleton) and bounded below by `0`, so this is a genuine infimum, and it is attained. -/
noncomputable def fractionalChromaticNumber (G : SimpleGraph V) : ℝ :=
  sInf (Set.range (FractionalColoring.total (G := G)))

end FractionalColoring

/-! ### The statements -/

/-- **Theorem 1.1 of the paper.** There are arbitrarily large `m` for which some graph `G` on
`m` vertices has independence number `α(G) ≤ 2` and `cm(G) < m/100`. The last inequality is
stated in the natural numbers, as `100 cm(G) < m`. An `m`-vertex graph is a
`SimpleGraph (Fin m)`; `indepNum` is Mathlib's independence number. -/
theorem exists_indepNum_le_two_and_connectedMatchingNumber_lt :
    ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m),
      G.indepNum ≤ 2 ∧ 100 * connectedMatchingNumber G < m := by
  sorry

/-- **Corollary 1.2 of the paper.** There are graphs `G` of arbitrarily large order `m` with
`h(G) < 26m/75 + 2/3 < m/2 ≤ χ_f(G) ≤ χ(G)`.

The chromatic number is Mathlib's `chromaticNumber`, with values in `ℕ∞`; the statement
exhibits it as a natural number `k`, so it is finite, and the comparisons are in `ℝ`. -/
theorem exists_hadwigerNumber_lt_fractionalChromaticNumber :
    ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m), ∃ k : ℕ,
      G.chromaticNumber = k ∧
      (hadwigerNumber G : ℝ) < 26 * (m : ℝ) / 75 + 2 / 3 ∧
      26 * (m : ℝ) / 75 + 2 / 3 < (m : ℝ) / 2 ∧
      (m : ℝ) / 2 ≤ fractionalChromaticNumber G ∧
      fractionalChromaticNumber G ≤ k := by
  sorry

/-- **The counterexamples.** There are finite simple graphs of arbitrarily large order whose
chromatic number exceeds their Hadwiger number. The comparison is in `ℕ∞`, where Mathlib's
chromatic number lives; for a finite graph the chromatic number is finite, so this is the
inequality of natural numbers `h(G) < χ(G)`. -/
theorem exists_hadwigerNumber_lt_chromaticNumber :
    ∀ N : ℕ, ∃ m : ℕ, N ≤ m ∧ ∃ G : SimpleGraph (Fin m),
      (hadwigerNumber G : ℕ∞) < G.chromaticNumber := by
  sorry

/-- **Hadwiger's conjecture**, as the paper states it: `h(G) ≥ χ(G)` for every finite
nonempty simple graph `G`. The vertex type ranges over `Type`; every finite graph is
isomorphic to one on such a type. -/
def HadwigerConjecture : Prop :=
  ∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V),
    G.chromaticNumber ≤ (hadwigerNumber G : ℕ∞)

/-- Hadwiger's conjecture is false. -/
theorem not_hadwigerConjecture : ¬ HadwigerConjecture := by
  sorry

/-- The weakening of Hadwiger's conjecture with the fractional chromatic number in place of
the chromatic number: `χ_f(G) ≤ h(G)` for every finite nonempty simple graph `G`. -/
def FractionalHadwigerConjecture : Prop :=
  ∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V),
    fractionalChromaticNumber G ≤ (hadwigerNumber G : ℝ)

/-- The fractional weakening of Hadwiger's conjecture is false. -/
theorem not_fractionalHadwigerConjecture : ¬ FractionalHadwigerConjecture := by
  sorry

end Hadwiger
