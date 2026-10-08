module

public import Hadwiger.Defs.Law

@[expose] public section

/-!
# Sanity checks for laws on a finite type (not in the paper)

Nothing in this file is a statement of the paper. It pins the definitions of
`Hadwiger/Defs/Law.lean` from both sides, so that a definition that was accidentally too
weak or too strong would make one of these lemmas false, and it holds the general lemmas
about those definitions that later files need.

* `IsLaw`: the laws are exactly the weight functions of Mathlib's `Convexity.StdSimplex ℝ α`;
  a point mass is a law; a law needs a nonempty type.
* `mass`: `0` on the empty set, the total on the whole type, the weight on a singleton,
  monotone, at most `1` for a law.
* `marginalFst`, `marginalSnd`, `prodLaw`: the marginals of `p ⊗ q` are `p` and `q`, in that
  order; marginals and products of laws are laws.
* `SatisfiesCaps`: `μ^2` satisfies the three caps with both caps equal to `1`, and no law
  satisfies them with a cap below `1`.
* `listLaw`: it is a law; the list of length `0` has weight `1`; the probability that all
  `m` elements lie in `S` is `μ(S)^m`.

Added at milestone M4, first slice. Blueprint entries: `S-M4.law`, `S-M4.mass`, `S-M4.marg`,
`S-M4.caps`, `S-M4.list`, in the section "Sanity checks (not in the paper)".

Added at milestone M4, second slice, for the proof of Lemma 3.2 (`Hadwiger/EntropyAndCuts.lean`):
three general lemmas, marked "Support (Lemma 3.2)" below. A law has a point of positive weight
(`IsLaw.exists_pos`); a set containing a point of positive weight has positive mass
(`mass_pos`); and the normalised restriction `ρ(·|S)` of nonnegative weights to a set of
positive mass is a law (`isLaw_restrict`). They serve the last step of the paper's proof,
"comparison with the normalized restriction `ρ(·|S)`". Blueprint entry: `S-L3.2.restrict`, in
the section "Steps of the paper's proofs, proved as separate lemmas".

Added at milestone M4, third slice, for the proof of Lemma 3.3 (`Hadwiger/EntropyAndCuts.lean`):
three general lemmas, marked "Support (Lemma 3.3)" below. Under nonnegative weights the mass of
a union is at most the sum of the masses (`mass_union_le`); and the two marginals of the weight
function that puts weight `c` on one pair `(a, b)` and `0` elsewhere are `c` at `a`, respectively
at `b`, and `0` elsewhere (`marginalFst_ite_eq`, `marginalSnd_ite_eq`). The first serves the last
step of the paper's proof ("Take `S = L_0 ∪ R_0`"), the other two the change of a flow along one
edge of a residual path. Blueprint entries: `S-L3.3.sets` and `S-L3.3.residual`, in the same
section.
-/

namespace Hadwiger

variable {α β : Type*}

/-! ### `IsLaw` -/

section IsLaw

variable [Fintype α]

/-- **Sanity (M4).** The laws on a finite type are exactly the weight functions of Mathlib's
bundled standard simplex `Convexity.StdSimplex ℝ α` ("a finitely supported probability
distribution over elements of `α` with coefficients in `ℝ`"). So `IsLaw` is Mathlib's notion,
read off as a function. -/
theorem isLaw_iff_exists_stdSimplex (p : α → ℝ) :
    IsLaw p ↔ ∃ t : Convexity.StdSimplex ℝ α, (fun x => t.weights x) = p := by
  have h := Convexity.StdSimplex.range_toFun_comp_weights (R := ℝ) (X := α)
  constructor
  · intro hp
    have hmem : p ∈ Set.range (fun t : Convexity.StdSimplex ℝ α => (t.weights : α → ℝ)) := by
      rw [h]
      exact ⟨Set.mem_iInter.mpr hp.nonneg, hp.sum_eq_one⟩
    exact hmem
  · rintro ⟨t, rfl⟩
    exact ⟨fun x => t.weights_nonneg x, t.total_of_fintype⟩

/-- **Sanity (M4).** There is no law on an empty type: the weights of a law add up to `1`,
and the empty sum is `0`. -/
theorem IsLaw.nonempty {p : α → ℝ} (hp : IsLaw p) : Nonempty α := by
  by_contra h
  rw [not_nonempty_iff] at h
  have h1 := hp.sum_eq_one
  simp at h1

/-- **Support (Lemma 3.2).** A law has a point of positive weight: its weights are nonnegative
and add up to `1`, so they are not all `0`. So the support of a law is not empty. -/
theorem IsLaw.exists_pos {p : α → ℝ} (hp : IsLaw p) : ∃ a, 0 < p a := by
  by_contra hne
  have h0 : ∀ x, p x = 0 := fun x =>
    le_antisymm (not_lt.mp fun hx => hne ⟨x, hx⟩) (hp.nonneg x)
  have h1 := hp.sum_eq_one
  simp [h0] at h1

/-- **Sanity (M4).** The point mass at `a` is a law. -/
theorem isLaw_single [DecidableEq α] (a : α) : IsLaw (Pi.single a (1 : ℝ)) where
  nonneg x := by
    by_cases h : x = a
    · subst h
      simp
    · simp [Pi.single_eq_of_ne h]
  sum_eq_one := by simp

/-- **Sanity (M4).** The uniform weights `1/|α|` on a nonempty finite type are a law. -/
theorem isLaw_uniform [Nonempty α] : IsLaw (fun _ : α => (Fintype.card α : ℝ)⁻¹) where
  nonneg _ := by positivity
  sum_eq_one := by
    have h : (Fintype.card α : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr Fintype.card_ne_zero
    simp [h]

end IsLaw

/-! ### `mass` -/

section Mass

variable [Fintype α]

/-- **Sanity (M4).** The empty set has mass `0`. -/
theorem mass_empty (p : α → ℝ) : mass p ∅ = 0 := by
  simp [mass]

/-- **Sanity (M4).** The whole type has mass `∑ x, p x`. -/
theorem mass_univ (p : α → ℝ) : mass p Set.univ = ∑ x, p x := by
  simp [mass]

/-- **Sanity (M4).** Under a law the whole type has mass `1`. -/
theorem IsLaw.mass_univ {p : α → ℝ} (hp : IsLaw p) : mass p Set.univ = 1 := by
  rw [Hadwiger.mass_univ, hp.sum_eq_one]

/-- **Sanity (M4).** A singleton has the mass of its point. -/
theorem mass_singleton [DecidableEq α] (p : α → ℝ) (a : α) : mass p {a} = p a := by
  simp [mass, Set.indicator_apply]

/-- **Sanity (M4).** Masses under nonnegative weights are nonnegative. -/
theorem mass_nonneg {p : α → ℝ} (hp : ∀ x, 0 ≤ p x) (S : Set α) : 0 ≤ mass p S :=
  Finset.sum_nonneg fun x _ => Set.indicator_nonneg (fun y _ => hp y) x

/-- **Sanity (M4).** Mass under nonnegative weights is monotone in the set. -/
theorem mass_mono {p : α → ℝ} (hp : ∀ x, 0 ≤ p x) {S T : Set α} (hST : S ⊆ T) :
    mass p S ≤ mass p T :=
  Finset.sum_le_sum fun x _ => Set.indicator_le_indicator_of_subset hST hp x

/-- **Sanity (M4).** Under a law every set has mass at most `1`. -/
theorem IsLaw.mass_le_one {p : α → ℝ} (hp : IsLaw p) (S : Set α) : mass p S ≤ 1 := by
  rw [← hp.mass_univ]
  exact mass_mono hp.nonneg (Set.subset_univ S)

/-- **Support (M4).** Under a law, a set of mass less than `1` is not the whole type. Used to
pass from the bound of Proposition 3.4 to the existence of a list. -/
theorem IsLaw.exists_notMem_of_mass_lt_one {p : α → ℝ} (hp : IsLaw p) {S : Set α}
    (h : mass p S < 1) : ∃ x, x ∉ S := by
  by_contra hne
  have hall : ∀ x, x ∈ S := fun x => by_contra fun hx => hne ⟨x, hx⟩
  rw [Set.eq_univ_of_forall hall, hp.mass_univ] at h
  exact lt_irrefl _ h

/-- **Support (Lemma 3.2).** Under nonnegative weights, a set that contains a point of positive
weight has positive mass. This is what makes `Real.log (mass ρ S)` an honest logarithm in the
third assertion of Lemma 3.2, and not the junk value `Real.log 0 = 0`. -/
theorem mass_pos {p : α → ℝ} (hp : ∀ x, 0 ≤ p x) {S : Set α} {a : α} (ha : a ∈ S)
    (hpa : 0 < p a) : 0 < mass p S := by
  refine Finset.sum_pos' (fun x _ => Set.indicator_nonneg (fun y _ => hp y) x)
    ⟨a, Finset.mem_univ a, ?_⟩
  rwa [Set.indicator_of_mem ha]

/-- **Support (Lemma 3.2).** The normalised restriction `ρ(·|S)` of nonnegative weights `p` to
a set `S` of positive mass: `p x / p(S)` for `x ∈ S` and `0` otherwise. It is a law.

The division is by `mass p S`, which the hypothesis makes positive; with `mass p S = 0` the
function would be `0` everywhere (`x / 0 = 0`) and not a law. The weights `p` need not add up
to `1`. -/
theorem isLaw_restrict {p : α → ℝ} (hp : ∀ x, 0 ≤ p x) {S : Set α} (hS : 0 < mass p S) :
    IsLaw (fun x => S.indicator p x / mass p S) where
  nonneg x := div_nonneg (Set.indicator_nonneg (fun y _ => hp y) x) hS.le
  sum_eq_one := by
    rw [← Finset.sum_div]
    exact div_self hS.ne'

/-- **Support (Lemma 3.3).** Under nonnegative weights the mass of a union is at most the sum
of the masses: `p(S ∪ T) ≤ p(S) + p(T)`. Used for `μ(L_0 ∪ R_0) ≤ μ(L_0) + μ(R_0)` in the last
step of the paper's proof of Lemma 3.3. -/
theorem mass_union_le {p : α → ℝ} (hp : ∀ x, 0 ≤ p x) (S T : Set α) :
    mass p (S ∪ T) ≤ mass p S + mass p T := by
  classical
  rw [mass, mass, mass, ← Finset.sum_add_distrib]
  refine Finset.sum_le_sum fun x _ => ?_
  by_cases hS : x ∈ S <;> by_cases hT : x ∈ T <;> simp [Set.indicator, hS, hT, hp x]

end Mass

/-! ### Marginals and products -/

section Marginals

/-- **Sanity (M4).** The first marginal of `p ⊗ q` is `p`, when the weights of `q` add up to
`1`. With `marginalSnd_prodLaw` this fixes which marginal is which. -/
theorem marginalFst_prodLaw [Fintype β] (p : α → ℝ) {q : β → ℝ} (hq : ∑ y, q y = 1) :
    marginalFst (prodLaw p q) = p := by
  funext x
  simp [marginalFst, prodLaw, ← Finset.mul_sum, hq]

/-- **Sanity (M4).** The second marginal of `p ⊗ q` is `q`, when the weights of `p` add up to
`1`. -/
theorem marginalSnd_prodLaw [Fintype α] {p : α → ℝ} (q : β → ℝ) (hp : ∑ x, p x = 1) :
    marginalSnd (prodLaw p q) = q := by
  funext y
  simp [marginalSnd, prodLaw, ← Finset.sum_mul, hp]

/-- **Support (Lemma 3.3).** The first marginal of the weight function that puts weight `c` on
the one pair `(a, b)` and `0` on every other pair: it is `c` at `a` and `0` elsewhere. -/
theorem marginalFst_ite_eq [DecidableEq α] [DecidableEq β] [Fintype β] (a : α) (b : β) (c : ℝ)
    (x : α) :
    marginalFst (fun z : α × β => if z = (a, b) then c else 0) x = if x = a then c else 0 := by
  simp only [marginalFst, Prod.mk.injEq]
  by_cases h : x = a <;> simp [h]

/-- **Support (Lemma 3.3).** The second marginal of the weight function that puts weight `c` on
the one pair `(a, b)` and `0` on every other pair: it is `c` at `b` and `0` elsewhere. -/
theorem marginalSnd_ite_eq [DecidableEq α] [DecidableEq β] [Fintype α] (a : α) (b : β) (c : ℝ)
    (y : β) :
    marginalSnd (fun z : α × β => if z = (a, b) then c else 0) y = if y = b then c else 0 := by
  simp only [marginalSnd, Prod.mk.injEq]
  by_cases h : y = b <;> simp [h]

variable [Fintype α] [Fintype β]

/-- **Sanity (M4).** The product of two laws is a law. -/
theorem isLaw_prodLaw {p : α → ℝ} {q : β → ℝ} (hp : IsLaw p) (hq : IsLaw q) :
    IsLaw (prodLaw p q) where
  nonneg z := mul_nonneg (hp.nonneg _) (hq.nonneg _)
  sum_eq_one := by
    rw [Fintype.sum_prod_type]
    simp [prodLaw, ← Finset.mul_sum, hq.sum_eq_one, hp.sum_eq_one]

/-- **Sanity (M4).** The first marginal of a law on pairs is a law. -/
theorem isLaw_marginalFst {σ : α × β → ℝ} (hσ : IsLaw σ) : IsLaw (marginalFst σ) where
  nonneg x := Finset.sum_nonneg fun y _ => hσ.nonneg _
  sum_eq_one := by
    have h := hσ.sum_eq_one
    rwa [Fintype.sum_prod_type] at h

/-- **Sanity (M4).** The second marginal of a law on pairs is a law. -/
theorem isLaw_marginalSnd {σ : α × β → ℝ} (hσ : IsLaw σ) : IsLaw (marginalSnd σ) where
  nonneg y := Finset.sum_nonneg fun x _ => hσ.nonneg _
  sum_eq_one := by
    have h := hσ.sum_eq_one
    rwa [Fintype.sum_prod_type_right] at h

end Marginals

/-! ### The three caps -/

section Caps

variable [Fintype α]

/-- **Sanity (M4).** For any law `μ`, the product law `μ^2` satisfies the three caps of
equation (3.1) with marginal cap `1` and joint cap `1`. In particular the uniform law on
pairs does. -/
theorem satisfiesCaps_prodLaw_self {μ : α → ℝ} (hμ : IsLaw μ) :
    SatisfiesCaps μ 1 1 (prodLaw μ μ) where
  fst x := by rw [marginalFst_prodLaw μ hμ.sum_eq_one, one_mul]
  snd y := by rw [marginalSnd_prodLaw μ hμ.sum_eq_one, one_mul]
  joint z := by rw [one_mul]

/-- **Sanity (M4).** A law that satisfies the caps forces the marginal cap to be at least
`1`: sum `σ_1 ≤ M μ` over the type. So with `M < 1` no law satisfies the caps. -/
theorem SatisfiesCaps.one_le_marginalCap {μ : α → ℝ} {M B : ℝ} {σ : α × α → ℝ}
    (h : SatisfiesCaps μ M B σ) (hμ : IsLaw μ) (hσ : IsLaw σ) : 1 ≤ M := by
  have h1 : ∑ x, marginalFst σ x ≤ ∑ x, M * μ x := Finset.sum_le_sum fun x _ => h.fst x
  rwa [(isLaw_marginalFst hσ).sum_eq_one, ← Finset.mul_sum, hμ.sum_eq_one, mul_one] at h1

/-- **Sanity (M4).** A law that satisfies the caps forces the joint cap to be at least `1`:
sum `σ ≤ B μ^2` over all pairs. So with `B < 1` no law satisfies the caps. -/
theorem SatisfiesCaps.one_le_jointCap {μ : α → ℝ} {M B : ℝ} {σ : α × α → ℝ}
    (h : SatisfiesCaps μ M B σ) (hμ : IsLaw μ) (hσ : IsLaw σ) : 1 ≤ B := by
  have h1 : ∑ z, σ z ≤ ∑ z, B * prodLaw μ μ z := Finset.sum_le_sum fun z _ => h.joint z
  rwa [hσ.sum_eq_one, ← Finset.mul_sum, (isLaw_prodLaw hμ hμ).sum_eq_one, mul_one] at h1

end Caps

/-! ### The law of a list -/

section ListLaw

/-- **Sanity (M4).** The list of length `0` has weight `1`. -/
theorem listLaw_zero (μ : α → ℝ) (o : Fin 0 → α) : listLaw μ 0 o = 1 := by
  simp [listLaw]

variable [Fintype α]

/-- **Sanity (M4).** The law of a list of `m` independent `μ`-elements is a law: its total
mass is `1`. -/
theorem isLaw_listLaw {μ : α → ℝ} (hμ : IsLaw μ) (m : ℕ) : IsLaw (listLaw μ m) where
  nonneg o := Finset.prod_nonneg fun i _ => hμ.nonneg _
  sum_eq_one := by
    have h := Fintype.prod_sum (fun (_ : Fin m) (x : α) => μ x)
    simp only [listLaw]
    rw [← h]
    simp [hμ.sum_eq_one]

/-- **Sanity (M4).** Independence: the probability that all `m` elements of the list lie in
`S` is `μ(S)^m`. This is the computation behind the two exception probabilities in the proof
of Proposition 3.4. -/
theorem mass_listLaw_forall_mem (μ : α → ℝ) (m : ℕ) (S : Set α) :
    mass (listLaw μ m) {o | ∀ i, o i ∈ S} = mass μ S ^ m := by
  have key : ∀ o : Fin m → α,
      Set.indicator {o : Fin m → α | ∀ i, o i ∈ S} (listLaw μ m) o
        = ∏ i, S.indicator μ (o i) := by
    intro o
    by_cases h : ∀ i, o i ∈ S
    · rw [Set.indicator_of_mem (show o ∈ {o : Fin m → α | ∀ i, o i ∈ S} from h)]
      exact Finset.prod_congr rfl fun i _ => (Set.indicator_of_mem (h i) μ).symm
    · rw [Set.indicator_of_notMem (show o ∉ {o : Fin m → α | ∀ i, o i ∈ S} from h)]
      obtain ⟨i, hi⟩ := not_forall.mp h
      exact (Finset.prod_eq_zero (Finset.mem_univ i) (Set.indicator_of_notMem hi μ)).symm
  calc mass (listLaw μ m) {o | ∀ i, o i ∈ S}
      = ∑ o : Fin m → α, ∏ i, S.indicator μ (o i) := Finset.sum_congr rfl fun o _ => key o
    _ = ∏ _i : Fin m, ∑ x, S.indicator μ x :=
        (Fintype.prod_sum (fun (_ : Fin m) (x : α) => S.indicator μ x)).symm
    _ = mass μ S ^ m := by simp [mass]

end ListLaw

end Hadwiger
