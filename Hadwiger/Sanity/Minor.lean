import Hadwiger.Defs.Minor

/-!
# Sanity checks for minors and the Hadwiger number (not in the paper)

Nothing in this file is a statement of the paper. These lemmas pin the definitions
`Hadwiger.MinorModel`, `Hadwiger.HasCliqueMinor` and `Hadwiger.hadwigerNumber` of
`Hadwiger/Defs/Minor.lean` from both sides, so that a definition that was accidentally too
weak or too strong would be caught (milestone M0, `blueprint/MILESTONES.md`).

* from above: `HasCliqueMinor.le_card`, `eq_top_of_hasCliqueMinor_card`,
  `hadwigerNumber_pathGraph_three`, `hadwigerNumber_cycleGraph_four`;
* from below: `hadwigerNumber_top`, `HasCliqueMinor.of_adj`, the two small graphs again;
* the supremum in `hadwigerNumber` is a maximum for a finite graph:
  `hasCliqueMinor_hadwigerNumber`, `hasCliqueMinor_iff_le_hadwigerNumber`;
* `hadwigerNumber_mono` (adding edges) and `hadwigerNumber_congr` (isomorphism).

Blueprint entries: `S-M0.minor-*`, `S-M0.hadwiger-*`, `S-M0.final-finite`, in the section
"Sanity checks (not in the paper)".

Since milestone M2 this file is imported by `Hadwiger/MatchingMinor.lean`, whose proof of
Proposition 3.5 uses `hasCliqueMinor_hadwigerNumber`. Nothing in this file became a
statement of the paper by being used.
-/

namespace Hadwiger

open SimpleGraph

variable {V V' W : Type*}

/-! ### Minor models: representatives, transport, restriction -/

/-- In a minor model, one vertex can be chosen in each branch set, and the choice is
injective, because branch sets are nonempty and pairwise disjoint. -/
theorem MinorModel.exists_injective_rep {H : SimpleGraph W} {G : SimpleGraph V}
    (M : MinorModel H G) : ∃ f : W → V, Function.Injective f ∧ ∀ w, f w ∈ M.branch w := by
  have hne : ∀ w, ∃ v, v ∈ M.branch w := fun w => by
    obtain ⟨⟨v, hv⟩⟩ := (M.connected w).nonempty
    exact ⟨v, hv⟩
  choose f hf using hne
  refine ⟨f, fun w w' h => ?_, hf⟩
  by_contra hne
  exact Set.disjoint_left.mp (M.disjoint w w' hne) (hf w) (h ▸ hf w')

/-- A graph with a minor model of `H` has at least as many vertices as `H`. -/
theorem MinorModel.card_le [Fintype V] [Fintype W] {H : SimpleGraph W} {G : SimpleGraph V}
    (M : MinorModel H G) : Fintype.card W ≤ Fintype.card V := by
  obtain ⟨f, hf, -⟩ := M.exists_injective_rep
  exact Fintype.card_le_of_injective f hf

/-- A minor model is carried along an injective graph homomorphism: take images of the
branch sets. This covers both adding edges (the identity map) and isomorphisms. -/
def MinorModel.map {H : SimpleGraph W} {G : SimpleGraph V} {G' : SimpleGraph V'}
    (M : MinorModel H G) (f : G →g G') (hf : Function.Injective f) : MinorModel H G' where
  branch w := f '' M.branch w
  connected w := by
    refine (M.connected w).map (induceHom f (Set.mapsTo_image f (M.branch w))) ?_
    rintro ⟨y, x, hx, rfl⟩
    exact ⟨⟨x, hx⟩, rfl⟩
  disjoint w w' h := Set.disjoint_image_of_injective hf (M.disjoint w w' h)
  adj w w' h := by
    obtain ⟨x, hx, y, hy, hxy⟩ := M.adj w w' h
    exact ⟨f x, Set.mem_image_of_mem f hx, f y, Set.mem_image_of_mem f hy, f.map_adj hxy⟩

/-- An injective graph homomorphism `H → G`, that is, a copy of `H` as a subgraph of `G`,
is a minor model with singleton branch sets. -/
def MinorModel.ofInjective {H : SimpleGraph W} {G : SimpleGraph V} (f : H →g G)
    (hf : Function.Injective f) : MinorModel H G where
  branch w := {f w}
  connected w := by
    rw [induce_singleton_eq_top]
    exact connected_top
  disjoint w w' h := Set.disjoint_singleton.mpr fun h' => h (hf h')
  adj w w' h := ⟨f w, rfl, f w', rfl, f.map_adj h⟩

/-- A `K_t` minor from `t` branch sets given in order: it is enough to check disjointness
and the joining edge for `i < j`. -/
theorem hasCliqueMinor_of_branch {G : SimpleGraph V} {t : ℕ} (B : Fin t → Set V)
    (hconn : ∀ i, (G.induce (B i)).Connected)
    (hdisj : ∀ i j, i < j → Disjoint (B i) (B j))
    (hadj : ∀ i j, i < j → ∃ x ∈ B i, ∃ y ∈ B j, G.Adj x y) : HasCliqueMinor G t :=
  Nonempty.intro
    { branch := B
      connected := hconn
      disjoint := fun i j hij => by
        rcases lt_or_gt_of_ne hij with h | h
        · exact hdisj i j h
        · exact (hdisj j i h).symm
      adj := fun i j hij => by
        rcases lt_or_gt_of_ne (show i ≠ j from hij) with h | h
        · exact hadj i j h
        · obtain ⟨x, hx, y, hy, hxy⟩ := hadj j i h
          exact ⟨y, hy, x, hx, hxy.symm⟩ }

/-! ### `HasCliqueMinor`: basic facts -/

/-- Every graph has a `K_0` minor (no branch sets). -/
theorem hasCliqueMinor_zero (G : SimpleGraph V) : HasCliqueMinor G 0 :=
  Nonempty.intro
    { branch := fun i => i.elim0
      connected := fun i => i.elim0
      disjoint := fun i => i.elim0
      adj := fun i => i.elim0 }

/-- A graph has a `K_1` minor exactly when it has a vertex. -/
theorem hasCliqueMinor_one_iff (G : SimpleGraph V) : HasCliqueMinor G 1 ↔ Nonempty V := by
  constructor
  · rintro ⟨M⟩
    obtain ⟨⟨v, -⟩⟩ := (M.connected 0).nonempty
    exact ⟨v⟩
  · rintro ⟨v⟩
    refine hasCliqueMinor_of_branch (fun _ => {v}) (fun _ => ?_) (fun i j h => ?_)
      (fun i j h => ?_)
    · rw [induce_singleton_eq_top]
      exact connected_top
    · exact absurd h (by omega)
    · exact absurd h (by omega)

/-- **Sanity (M0).** A `K_t` minor needs `t` vertices: `t ≤ |V|`. -/
theorem HasCliqueMinor.le_card [Fintype V] {G : SimpleGraph V} {t : ℕ}
    (h : HasCliqueMinor G t) : t ≤ Fintype.card V := by
  obtain ⟨M⟩ := h
  simpa using M.card_le

/-- A `K_t` minor contains a `K_s` minor for every `s ≤ t`: keep the first `s` branch
sets. -/
theorem HasCliqueMinor.of_le {G : SimpleGraph V} {s t : ℕ} (h : HasCliqueMinor G t)
    (hst : s ≤ t) : HasCliqueMinor G s := by
  obtain ⟨M⟩ := h
  exact Nonempty.intro
    { branch := fun i => M.branch (Fin.castLE hst i)
      connected := fun i => M.connected _
      disjoint := fun i j hij => M.disjoint _ _ fun h => hij (Fin.castLE_injective hst h)
      adj := fun i j hij => M.adj _ _ fun h => hij (Fin.castLE_injective hst h) }

/-- A `K_t` minor is carried along an injective graph homomorphism. -/
theorem HasCliqueMinor.map {G : SimpleGraph V} {G' : SimpleGraph V'} {t : ℕ}
    (h : HasCliqueMinor G t) (f : G →g G') (hf : Function.Injective f) :
    HasCliqueMinor G' t := by
  obtain ⟨M⟩ := h
  exact Nonempty.intro (M.map f hf)

/-- Adding edges keeps every `K_t` minor. -/
theorem HasCliqueMinor.mono {G G' : SimpleGraph V} {t : ℕ} (hle : G ≤ G')
    (h : HasCliqueMinor G t) : HasCliqueMinor G' t :=
  h.map (Hom.ofLE hle) Function.injective_id

/-- Isomorphic graphs have the same clique minors. -/
theorem hasCliqueMinor_congr {G : SimpleGraph V} {G' : SimpleGraph V'} (e : G ≃g G')
    (t : ℕ) : HasCliqueMinor G t ↔ HasCliqueMinor G' t :=
  ⟨fun h => h.map e.toHom e.injective, fun h => h.map e.symm.toHom e.symm.injective⟩

/-- An edge is a `K_2` minor. -/
theorem HasCliqueMinor.of_adj {G : SimpleGraph V} {u v : V} (h : G.Adj u v) :
    HasCliqueMinor G 2 := by
  refine hasCliqueMinor_of_branch ![{u}, {v}] (fun i => ?_) (fun i j hij => ?_)
    (fun i j hij => ?_)
  · fin_cases i <;>
    · simp only [Fin.zero_eta, Fin.mk_one, Matrix.cons_val_zero, Matrix.cons_val_one]
      rw [induce_singleton_eq_top]
      exact connected_top
  · fin_cases i <;> fin_cases j <;> first
      | exact absurd hij (by decide)
      | simpa using h.ne
  · fin_cases i <;> fin_cases j <;> first
      | exact absurd hij (by decide)
      | exact ⟨u, rfl, v, rfl, h⟩

/-- The complete graph on a finite type `V` has a `K_{|V|}` minor. -/
theorem hasCliqueMinor_top_card [Fintype V] :
    HasCliqueMinor (⊤ : SimpleGraph V) (Fintype.card V) :=
  Nonempty.intro
    (MinorModel.ofInjective
      ⟨(Fintype.equivFin V).symm, fun h => (Fintype.equivFin V).symm.injective.ne h⟩
      (Fintype.equivFin V).symm.injective)

/-- Only the complete graph has a clique minor on all of its vertices: if `G` has a
`K_{|V|}` minor then every branch set is a single vertex, so `G` is complete. -/
theorem eq_top_of_hasCliqueMinor_card [Fintype V] {G : SimpleGraph V}
    (h : HasCliqueMinor G (Fintype.card V)) : G = ⊤ := by
  obtain ⟨M⟩ := h
  obtain ⟨f, hinj, hf⟩ := M.exists_injective_rep
  have hbij : Function.Bijective f :=
    (Fintype.bijective_iff_injective_and_card f).mpr ⟨hinj, by simp⟩
  -- every branch set is the singleton of its representative
  have hsingle : ∀ w, ∀ x ∈ M.branch w, x = f w := by
    intro w x hx
    obtain ⟨w', rfl⟩ := hbij.surjective x
    by_contra hne
    have hww' : w' ≠ w := fun h => hne (by rw [h])
    exact Set.disjoint_left.mp (M.disjoint w' w hww') (hf w') hx
  rw [eq_top_iff]
  intro v v' hvv'
  obtain ⟨w, rfl⟩ := hbij.surjective v
  obtain ⟨w', rfl⟩ := hbij.surjective v'
  have hww' : w ≠ w' := fun h => ((top_adj _ _).mp hvv') (by rw [h])
  obtain ⟨x, hx, y, hy, hxy⟩ := M.adj w w' ((top_adj _ _).mpr hww')
  rw [hsingle w x hx, hsingle w' y hy] at hxy
  exact hxy

/-! ### The Hadwiger number of a finite graph -/

/-- For a finite graph the set of `t` with a `K_t` minor is bounded, by `|V|`. -/
theorem bddAbove_setOf_hasCliqueMinor [Fintype V] (G : SimpleGraph V) :
    BddAbove {t : ℕ | HasCliqueMinor G t} :=
  ⟨Fintype.card V, fun _ h => HasCliqueMinor.le_card h⟩

/-- **Sanity (M0).** The supremum defining `hadwigerNumber` is attained: a finite graph has
a `K_t` minor with `t = h(G)`. -/
theorem hasCliqueMinor_hadwigerNumber [Fintype V] (G : SimpleGraph V) :
    HasCliqueMinor G (hadwigerNumber G) :=
  Nat.sSup_mem ⟨0, hasCliqueMinor_zero G⟩ (bddAbove_setOf_hasCliqueMinor G)

/-- A `K_t` minor of a finite graph gives `t ≤ h(G)`. -/
theorem HasCliqueMinor.le_hadwigerNumber [Fintype V] {G : SimpleGraph V} {t : ℕ}
    (h : HasCliqueMinor G t) : t ≤ hadwigerNumber G :=
  le_csSup (bddAbove_setOf_hasCliqueMinor G) h

/-- For a finite graph, `G` has a `K_t` minor exactly when `t ≤ h(G)`. So `h(G)` is "the
largest `t` for which `G` contains a `K_t` minor", as in the paper. -/
theorem hasCliqueMinor_iff_le_hadwigerNumber [Fintype V] (G : SimpleGraph V) (t : ℕ) :
    HasCliqueMinor G t ↔ t ≤ hadwigerNumber G :=
  ⟨HasCliqueMinor.le_hadwigerNumber, fun h => (hasCliqueMinor_hadwigerNumber G).of_le h⟩

/-- `h(G) ≤ |V|` for a finite graph. -/
theorem hadwigerNumber_le_card [Fintype V] (G : SimpleGraph V) :
    hadwigerNumber G ≤ Fintype.card V :=
  (hasCliqueMinor_hadwigerNumber G).le_card

/-- **Sanity (M0).** The Hadwiger number is monotone under adding edges. -/
theorem hadwigerNumber_mono [Fintype V] {G G' : SimpleGraph V} (h : G ≤ G') :
    hadwigerNumber G ≤ hadwigerNumber G' :=
  ((hasCliqueMinor_hadwigerNumber G).mono h).le_hadwigerNumber

/-- **Sanity (M0).** The Hadwiger number is invariant under graph isomorphism. No
finiteness is needed: the two sets of `t` are equal. -/
theorem hadwigerNumber_congr {G : SimpleGraph V} {G' : SimpleGraph V'} (e : G ≃g G') :
    hadwigerNumber G = hadwigerNumber G' := by
  unfold hadwigerNumber
  congr 1
  ext t
  exact hasCliqueMinor_congr e t

/-- The complete graph on a finite type `V` has Hadwiger number `|V|`. -/
theorem hadwigerNumber_top_card [Fintype V] :
    hadwigerNumber (⊤ : SimpleGraph V) = Fintype.card V :=
  le_antisymm (hadwigerNumber_le_card _) hasCliqueMinor_top_card.le_hadwigerNumber

/-- **Sanity (M0).** `h(K_n) = n`. -/
theorem hadwigerNumber_top (n : ℕ) : hadwigerNumber (⊤ : SimpleGraph (Fin n)) = n := by
  simpa using hadwigerNumber_top_card (V := Fin n)

/-- A finite graph has Hadwiger number `|V|` exactly when it is complete. -/
theorem hadwigerNumber_eq_card_iff [Fintype V] (G : SimpleGraph V) :
    hadwigerNumber G = Fintype.card V ↔ G = ⊤ := by
  constructor
  · intro h
    exact eq_top_of_hasCliqueMinor_card (h ▸ hasCliqueMinor_hadwigerNumber G)
  · rintro rfl
    exact hadwigerNumber_top_card

/-- A finite graph that is not complete has Hadwiger number less than `|V|`. -/
theorem hadwigerNumber_lt_card_of_ne_top [Fintype V] {G : SimpleGraph V} (h : G ≠ ⊤) :
    hadwigerNumber G < Fintype.card V :=
  lt_of_le_of_ne (hadwigerNumber_le_card G) fun h' => h ((hadwigerNumber_eq_card_iff G).mp h')

/-! ### Two small graphs -/

/-- **Sanity (M0).** The path on three vertices has Hadwiger number `2`: it has an edge,
and it is not complete. -/
theorem hadwigerNumber_pathGraph_three : hadwigerNumber (pathGraph 3) = 2 := by
  apply le_antisymm
  · have hne : pathGraph 3 ≠ ⊤ := by
      intro h
      have h02 : (pathGraph 3).Adj 0 2 := by rw [h]; decide
      simp [pathGraph_adj] at h02
    have := hadwigerNumber_lt_card_of_ne_top hne
    simp only [Fintype.card_fin] at this
    omega
  · have h01 : (pathGraph 3).Adj 0 1 := by simp [pathGraph_adj]
    exact (HasCliqueMinor.of_adj h01).le_hadwigerNumber

/-- The 4-cycle has a `K_3` minor: contract the edge `0–1`. The branch sets are
`{0, 1}`, `{2}`, `{3}`. -/
theorem hasCliqueMinor_cycleGraph_four : HasCliqueMinor (cycleGraph 4) 3 := by
  refine hasCliqueMinor_of_branch ![{0, 1}, {2}, {3}] (fun i => ?_) (fun i j hij => ?_)
    (fun i j hij => ?_)
  · fin_cases i
    · exact induce_pair_connected_of_adj (by decide)
    · show ((cycleGraph 4).induce {2}).Connected
      rw [induce_singleton_eq_top]
      exact connected_top
    · show ((cycleGraph 4).induce {3}).Connected
      rw [induce_singleton_eq_top]
      exact connected_top
  · fin_cases i <;> fin_cases j <;> first
      | exact absurd hij (by decide)
      | simp
  · fin_cases i <;> fin_cases j
    · exact absurd hij (by decide)
    · exact ⟨1, Or.inr rfl, 2, rfl, by decide⟩
    · exact ⟨0, Or.inl rfl, 3, rfl, by decide⟩
    · exact absurd hij (by decide)
    · exact absurd hij (by decide)
    · exact ⟨2, rfl, 3, rfl, by decide⟩
    · exact absurd hij (by decide)
    · exact absurd hij (by decide)
    · exact absurd hij (by decide)

/-- **Sanity (M0).** The 4-cycle has Hadwiger number `3`: contracting one edge gives a
triangle, and the 4-cycle is not complete. -/
theorem hadwigerNumber_cycleGraph_four : hadwigerNumber (cycleGraph 4) = 3 := by
  apply le_antisymm
  · have hne : cycleGraph 4 ≠ ⊤ := by
      intro h
      have h02 : (cycleGraph 4).Adj 0 2 := by rw [h]; decide
      exact absurd h02 (by decide)
    have := hadwigerNumber_lt_card_of_ne_top hne
    simp only [Fintype.card_fin] at this
    omega
  · exact hasCliqueMinor_cycleGraph_four.le_hadwigerNumber

/-! ### The final theorem cannot hold through an infinite chromatic number -/

/-- **Sanity (M0).** For a finite graph, the inequality `h(G) < χ(G)` in `ℕ∞` used in the
final theorem says exactly that the chromatic number is a natural number `k` with
`h(G) < k`. So the final theorem cannot be true through `χ(G) = ⊤`. -/
theorem hadwigerNumber_lt_chromaticNumber_iff [Fintype V] (G : SimpleGraph V) :
    (hadwigerNumber G : ℕ∞) < G.chromaticNumber ↔
      ∃ k : ℕ, G.chromaticNumber = k ∧ hadwigerNumber G < k := by
  constructor
  · intro h
    have hne : G.chromaticNumber ≠ ⊤ :=
      ne_top_of_le_ne_top (ENat.natCast_ne_top _) G.chromaticNumber_le_card
    obtain ⟨k, hk⟩ := ENat.ne_top_iff_exists.mp hne
    refine ⟨k, hk.symm, ?_⟩
    rw [← hk] at h
    exact_mod_cast h
  · rintro ⟨k, hk, h⟩
    rw [hk]
    exact_mod_cast h

end Hadwiger
