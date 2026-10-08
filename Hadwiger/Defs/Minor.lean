module

public import Mathlib

@[expose] public section

/-!
# Graph minors and the Hadwiger number

Paper: "A counterexample to Hadwiger's conjecture" (OpenAI, 23 September 2026), Section 1:
"`h(G)` is the largest `t` for which `G` contains a `K_t` minor."

Mathlib (at the pinned commit) has no notion of minor for `SimpleGraph`, so everything in
this file is **new**. Blueprint entries: `D-1.h` (and its parts).

Fidelity notes are in `blueprint/FIDELITY.md` (F-MINOR, F-HADWIGER).
-/

namespace Hadwiger

variable {V W : Type*}

/-- A *minor model* of `H` in `G`: a family of vertex sets of `G` ("branch sets"), one for
each vertex of `H`, such that

* each branch set induces a connected subgraph of `G` (Mathlib's `Connected` includes
  nonemptiness),
* distinct branch sets are disjoint, and
* whenever two vertices of `H` are adjacent, some edge of `G` joins their branch sets.

Contracting each branch set to a point and deleting everything else exhibits `H` as a minor
of `G`; conversely every minor arises this way. -/
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
contains `0` and is bounded by the number of vertices, so the supremum is a maximum. For an
infinite graph with unbounded clique minors the value is the junk value `0`; every statement
in this project that mentions `hadwigerNumber` is about a finite vertex type. -/
noncomputable def hadwigerNumber (G : SimpleGraph V) : ℕ :=
  sSup {t : ℕ | HasCliqueMinor G t}

end Hadwiger
