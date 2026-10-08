import Hadwiger.RandomSample
import Hadwiger.Sanity.ConnectedMatching

/-!
# Sanity checks for the explicit bound of Proposition 3.4 (not in the paper)

Nothing in this file is a statement of the paper, and nothing here is evidence that the bound
of Proposition 3.4 is true. These lemmas pin the three definitions of
`Hadwiger/RandomSample.lean` that make up the bound, and record what the bound is in the
degenerate cases.

* `exceptionSize m` is `⌈m/200⌉`: it is the least `k` with `m ≤ 200 k`.
* `fingerprintLength`: at least `1`; equal to `1` for `B = 1`; equal to `3` for `B = 4`,
  `ε = 1/2` (where `log B / (−log(1 − ε)) = 2`).
* `sampleBound`: at `m = 0` it is `2 (n^2 + 1)^L`, so it is above `1` and the existence
  statement says nothing there; for `1 ≤ m ≤ 200` it is `(n^2 + 1)^L (m/M + m^2/B)`; and for a
  marginal cap `M ≤ 1`, and likewise for a joint cap `B ≤ 1`, it is at least `1`, so the
  bound of Proposition 3.4 is then true for a trivial reason. That matters because for
  `M < 1` or `B < 1` its hypothesis `Supersaturated` is empty
  (`HoleRel.supersaturated_of_lt_one`, `HoleRel.supersaturated_of_jointCap_lt_one`).
* The hypothesis `0 < ε` of Proposition 3.4 cannot be dropped: with `ε = 0` there is an
  example in which every other hypothesis holds and the inequality fails
  (`exists_mass_listLaw_gt_sampleBound_of_zero`).

Added at milestone M4, first slice. Blueprint entry: `S-M4.bound`.
-/

namespace Hadwiger

/-! ### `exceptionSize` -/

/-- **Sanity (M4).** `⌈0/200⌉ = 0`. -/
theorem exceptionSize_zero : exceptionSize 0 = 0 := by
  simp [exceptionSize]

/-- **Sanity (M4).** `m ≤ 200 · ⌈m/200⌉`. -/
theorem le_mul_exceptionSize (m : ℕ) : m ≤ 200 * exceptionSize m := by
  have h : (m : ℝ) / 200 ≤ (exceptionSize m : ℝ) := Nat.le_ceil _
  have h2 : (m : ℝ) ≤ 200 * (exceptionSize m : ℝ) := by linarith
  exact_mod_cast h2

/-- **Sanity (M4).** `200 · ⌈m/200⌉ < m + 200`: the ceiling is the least such number. With
`le_mul_exceptionSize` this determines `exceptionSize m`. It is also the paper's "The strict
bounds follow from `k − 1 < m/200`". -/
theorem mul_exceptionSize_lt (m : ℕ) : 200 * exceptionSize m < m + 200 := by
  have h : (exceptionSize m : ℝ) < (m : ℝ) / 200 + 1 := Nat.ceil_lt_add_one (by positivity)
  have h2 : (200 : ℝ) * (exceptionSize m : ℝ) < (m : ℝ) + 200 := by linarith
  exact_mod_cast h2

/-- **Sanity (M4).** `⌈m/200⌉ ≤ m`, so the binomial coefficient `C(m, k)` in the bound is not
zero. -/
theorem exceptionSize_le (m : ℕ) : exceptionSize m ≤ m := by
  have h := mul_exceptionSize_lt m
  omega

/-- **Sanity (M4).** `⌈m/200⌉ = 1` for `1 ≤ m ≤ 200`. -/
theorem exceptionSize_eq_one {m : ℕ} (h1 : 1 ≤ m) (h2 : m ≤ 200) : exceptionSize m = 1 := by
  have h3 := mul_exceptionSize_lt m
  have h4 := le_mul_exceptionSize m
  omega

/-! ### `fingerprintLength` -/

/-- **Sanity (M4).** The fingerprint length is at least `1`. -/
theorem one_le_fingerprintLength (B ε : ℝ) : 1 ≤ fingerprintLength B ε :=
  Nat.le_add_right 1 _

/-- **Sanity (M4).** For joint cap `B = 1` the fingerprint length is `1`: `log 1 = 0`. -/
theorem fingerprintLength_one (ε : ℝ) : fingerprintLength 1 ε = 1 := by
  simp [fingerprintLength]

/-- **Sanity (M4).** For `B = 4` and `ε = 1/2` the fingerprint length is `3`:
`log 4 / (−log(1/2)) = 2`, and `1 + ⌈2⌉ = 3`. A value that depends on the logarithms, the
sign and the ceiling all being as in equation (3.2). -/
theorem fingerprintLength_four_half : fingerprintLength 4 (1 / 2) = 3 := by
  have h4 : Real.log 4 = 2 * Real.log 2 := by
    rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow]
    norm_num
  have h2 : Real.log (1 - 1 / 2 : ℝ) = -Real.log 2 := by
    rw [show (1 - 1 / 2 : ℝ) = 2⁻¹ by norm_num, Real.log_inv]
  have hpos : Real.log 2 ≠ 0 := (Real.log_pos (by norm_num)).ne'
  unfold fingerprintLength
  rw [h4, h2, neg_neg, mul_div_assoc, div_self hpos, mul_one]
  simp

/-! ### `sampleBound` -/

/-- **Sanity (M4), degenerate case `m = 0`.** The bound is `2 (n^2 + 1)^L`. -/
theorem sampleBound_zero (n : ℕ) (M B ε : ℝ) :
    sampleBound n M B ε 0 = 2 * ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε := by
  simp [sampleBound, exceptionSize_zero]
  ring

/-- **Sanity (M4), degenerate case `m = 0`.** The bound is above `1`. So the hypothesis
`sampleBound … < 1` of the existence statement fails at `m = 0`, as it must: no graph on `0`
vertices has `100 · cm(G) < 0`. -/
theorem one_lt_sampleBound_zero (n : ℕ) (M B ε : ℝ) : 1 < sampleBound n M B ε 0 := by
  rw [sampleBound_zero]
  have hbase : (1 : ℝ) ≤ ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε :=
    one_le_pow₀ (by nlinarith [sq_nonneg (n : ℝ)])
  linarith

/-- **Sanity (M4), small `m`.** For `1 ≤ m ≤ 200` the bound is
`(n^2 + 1)^L (m/M + m^2/B)`. -/
theorem sampleBound_of_le_two_hundred (n : ℕ) (M B ε : ℝ) {m : ℕ} (h1 : 1 ≤ m)
    (h2 : m ≤ 200) :
    sampleBound n M B ε m
      = ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε * ((m : ℝ) / M + (m : ℝ) ^ 2 / B) := by
  simp [sampleBound, exceptionSize_eq_one h1 h2]

/-- **Sanity (M4), degenerate case `M ≤ 1`.** For a marginal cap `0 < M ≤ 1` the bound is at
least `1`, for every `m`. So in that case the inequality of Proposition 3.4 holds for a
trivial reason, a probability being at most `1`. -/
theorem one_le_sampleBound_of_le_one (n : ℕ) {M B : ℝ} (hM : 0 < M) (hM1 : M ≤ 1)
    (hB : 0 < B) (ε : ℝ) (m : ℕ) : 1 ≤ sampleBound n M B ε m := by
  unfold sampleBound
  have hbase : (1 : ℝ) ≤ ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε :=
    one_le_pow₀ (by nlinarith [sq_nonneg (n : ℝ)])
  have hchoose : (1 : ℝ) ≤ (m.choose (exceptionSize m) : ℝ) := by
    exact_mod_cast Nat.choose_pos (exceptionSize_le m)
  have hMk : M ^ exceptionSize m ≤ 1 := pow_le_one₀ hM.le hM1
  have hMkpos : 0 < M ^ exceptionSize m := pow_pos hM _
  have h1 : (1 : ℝ) ≤ (m.choose (exceptionSize m) : ℝ) / M ^ exceptionSize m := by
    rw [le_div_iff₀ hMkpos]
    linarith
  have h2 : (0 : ℝ) ≤ (m : ℝ) ^ (2 * exceptionSize m) / B ^ exceptionSize m := by positivity
  calc (1 : ℝ) = 1 * 1 := (one_mul 1).symm
    _ ≤ ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε *
          ((m.choose (exceptionSize m) : ℝ) / M ^ exceptionSize m
            + (m : ℝ) ^ (2 * exceptionSize m) / B ^ exceptionSize m) :=
        mul_le_mul hbase (by linarith) zero_le_one (by linarith)

/-- **Sanity (M4), degenerate case `B ≤ 1`.** For a joint cap `0 < B ≤ 1` the bound is at
least `1`, for every `m`. For `B < 1` the hypothesis `Supersaturated` of Proposition 3.4 is
empty (`HoleRel.supersaturated_of_jointCap_lt_one`), and the inequality then holds for this
trivial reason. -/
theorem one_le_sampleBound_of_jointCap_le_one (n : ℕ) {M B : ℝ} (hM : 0 < M) (hB : 0 < B)
    (hB1 : B ≤ 1) (ε : ℝ) (m : ℕ) : 1 ≤ sampleBound n M B ε m := by
  rcases Nat.eq_zero_or_pos m with rfl | hm
  · exact (one_lt_sampleBound_zero n M B ε).le
  unfold sampleBound
  have hbase : (1 : ℝ) ≤ ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε :=
    one_le_pow₀ (by nlinarith [sq_nonneg (n : ℝ)])
  have hm1 : (1 : ℝ) ≤ (m : ℝ) := by exact_mod_cast hm
  have hpow : (1 : ℝ) ≤ (m : ℝ) ^ (2 * exceptionSize m) := one_le_pow₀ hm1
  have hBk : B ^ exceptionSize m ≤ 1 := pow_le_one₀ hB.le hB1
  have hBkpos : 0 < B ^ exceptionSize m := pow_pos hB _
  have h2 : (1 : ℝ) ≤ (m : ℝ) ^ (2 * exceptionSize m) / B ^ exceptionSize m := by
    rw [le_div_iff₀ hBkpos]
    linarith
  have h1 : (0 : ℝ) ≤ (m.choose (exceptionSize m) : ℝ) / M ^ exceptionSize m := by positivity
  calc (1 : ℝ) = 1 * 1 := (one_mul 1).symm
    _ ≤ ((n : ℝ) ^ 2 + 1) ^ fingerprintLength B ε *
          ((m.choose (exceptionSize m) : ℝ) / M ^ exceptionSize m
            + (m : ℝ) ^ (2 * exceptionSize m) / B ^ exceptionSize m) :=
        mul_le_mul hbase (by linarith) zero_le_one (by linarith)

/-! ### The hypothesis `0 < ε` of Proposition 3.4 is needed -/

/-- **Sanity (M4).** With conflict bound `ε = 0` the inequality of Proposition 3.4 is false.
On one element, with no holes, the point-mass law and both caps equal to `16`: the
hypothesis `Supersaturated` holds (trivially, as for every `ε ≤ 0`), the graph on positions
of the only list of length `2` is one edge, so `2 ≤ 100 · cm(G)` has probability `1`, and
`sampleBound 1 16 16 0 2 = 3/4`.

So the hypothesis `0 < ε` of `mass_listLaw_le_sampleBound` cannot be dropped. The value
`3/4` comes from a junk value: at `ε = 0` the denominator `−log(1 − ε)` of the fingerprint
length is `0`, Lean's `x / 0` is `0`, and the length comes out as `1`. This lemma does not
use Proposition 3.4. -/
theorem exists_mass_listLaw_gt_sampleBound_of_zero :
    ∃ (H : HoleRel (Fin 1)) (μ : Fin 1 → ℝ), IsLaw μ ∧ H.Supersaturated μ 16 16 0 ∧
      sampleBound (Fintype.card (Fin 1)) 16 16 0 2
        < mass (listLaw μ 2) {o | 2 ≤ 100 * connectedMatchingNumber (H.positionGraph o)} := by
  let H : HoleRel (Fin 1) := ⟨fun _ _ => False, fun h => h, fun _ h => h, fun h _ _ => h⟩
  have hμ : IsLaw (fun _ : Fin 1 => (1 : ℝ)) := ⟨fun _ => zero_le_one, by simp⟩
  refine ⟨H, fun _ => 1, hμ, H.supersaturated_of_nonpos _ 16 16 le_rfl, ?_⟩
  -- Every list has a complete graph on positions, with `cm = 1`, so the event is everything.
  have hall : {o : Fin 2 → Fin 1 | 2 ≤ 100 * connectedMatchingNumber (H.positionGraph o)}
      = Set.univ := by
    refine Set.eq_univ_of_forall fun o => ?_
    have htop : H.positionGraph o = ⊤ := H.positionGraph_eq_top o fun _ _ h => h
    have hcm : connectedMatchingNumber (H.positionGraph o) = 1 := by
      rw [htop, connectedMatchingNumber_top]
    show 2 ≤ 100 * connectedMatchingNumber (H.positionGraph o)
    rw [hcm]
    norm_num
  rw [hall, (isLaw_listLaw hμ 2).mass_univ]
  -- The bound: fingerprint length `1`, `k = 1`, so `2 · (2/16 + 4/16) = 3/4`.
  have hL : fingerprintLength 16 0 = 1 := by simp [fingerprintLength]
  rw [sampleBound_of_le_two_hundred _ _ _ _ (by norm_num) (by norm_num), hL]
  norm_num

end Hadwiger
