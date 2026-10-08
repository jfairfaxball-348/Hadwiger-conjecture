module

public import Mathlib

@[expose] public section

/-!
# A hole relation in the abstract; units and conflicts

By the user's decision of 2026-10-07 (`blueprint/MILESTONES.md`, M4), Section 3 of the
paper is formalised for **any** finite set carrying a symmetric, loopless, triangle-free
relation, and not only for the paper's set `Ω_n` of raw vertices with its hole relation.
Lemma 2.2 says that the hole relation of Section 2.1 is such a relation; that instance is
`Hadwiger.HoleData.holeRel` in `Hadwiger/Supersaturation.lean`.

This file holds the bare relation, the graph on the positions of a list for it, and the two
notions of the opening paragraph of Section 3:

"A *unit* is an ordered pair of raw vertices with no hole between its endpoints. … The event
of interest is that all four cross pairs have holes".

Everything here is **new**. A symmetric loopless relation is the same thing as a Mathlib
`SimpleGraph`, and "triangle-free" is Mathlib's `CliqueFree 3`; why the bare structure is
used instead is in `blueprint/FIDELITY.md` (F-HOLEREL).

Blueprint entries: `D-3.rel`, `D-3.unit`. Milestone M4, first slice. Fidelity notes:
F-HOLEREL, F-UNIT.
-/

namespace Hadwiger

/-- A **hole relation in the abstract**: a relation on `Ω` that is symmetric, has no loops,
and is triangle-free. These are the three properties that Lemma 2.2 proves for the hole
relation of Definition 2.1.

Triangle-freeness is stated for any three elements, not assumed distinct, as in
`Hadwiger.HoleData.not_hole_triangle`. For a relation with no loops this is the same as
excluding triangles on three distinct elements. `Ω` is not assumed finite here; the
statements that need finiteness assume it. -/
structure HoleRel (Ω : Type*) where
  /-- `Rel i j`: there is a hole between `i` and `j`. -/
  Rel : Ω → Ω → Prop
  /-- The relation is symmetric. -/
  symm : ∀ {i j : Ω}, Rel i j → Rel j i
  /-- The relation has no loops. -/
  irrefl : ∀ i : Ω, ¬ Rel i i
  /-- The relation is triangle-free. -/
  triangle_free : ∀ {i j k : Ω}, Rel i j → Rel j k → Rel i k → False

namespace HoleRel

variable {Ω : Type*}

/-- **The graph on positions** of a list `o_1, …, o_m`, for an abstract hole relation: two
distinct positions are adjacent when their elements have no hole between them.

This is `Hadwiger.HoleData.positionGraph` (Section 2.1, signed off on 2026-10-07) with the
hole relation of linear data replaced by an arbitrary `HoleRel`. The signed-off definition
is not changed, and is recovered from this one: `Hadwiger.HoleData.positionGraph_holeRel`. -/
def positionGraph (H : HoleRel Ω) {m : ℕ} (o : Fin m → Ω) : SimpleGraph (Fin m) where
  Adj p q := p ≠ q ∧ ¬ H.Rel (o p) (o q)
  symm := ⟨fun _ _ h => ⟨h.1.symm, fun h' => h.2 (H.symm h')⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

/-- A **unit**: an ordered pair with no hole between its endpoints (Section 3, first
sentence). The endpoints may coincide: `(x, x)` is always a unit, because the relation has no
loops. -/
def IsUnit (H : HoleRel Ω) (u : Ω × Ω) : Prop :=
  ¬ H.Rel u.1 u.2

/-- Two ordered pairs **conflict** when all four cross pairs have holes (Section 3: "all four
cross pairs have holes"; proof of Proposition 3.4: "two units are adjacent when they give all
four cross holes"). The cross pairs of `u = (x, y)` and `v = (x', y')` are `(x, x')`,
`(x, y')`, `(y, x')`, `(y, y')`.

The paper applies the notion to two units; this predicate is defined for any two ordered
pairs. -/
def Conflict (H : HoleRel Ω) (u v : Ω × Ω) : Prop :=
  H.Rel u.1 v.1 ∧ H.Rel u.1 v.2 ∧ H.Rel u.2 v.1 ∧ H.Rel u.2 v.2

end HoleRel

end Hadwiger
