-- This file is from openai/math at commit fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb (Apache-2.0) and has been
-- modified: see docs/UPSTREAM_CHANGES.md in this repository.
module

public import Mathlib

@[expose] public section

namespace OAI

namespace LinearListHadwiger

def ListColorable {V : Type} (G : SimpleGraph V) {Color : Type}
    (L : V → Finset Color) : Prop :=
  ∃ c : V → Color, (∀ v, c v ∈ L v) ∧ ∀ ⦃v w⦄, G.Adj v w → c v ≠ c w

def Choosable {V : Type} (G : SimpleGraph V) (k : ℕ) : Prop :=
  ∀ (Color : Type) (L : V → Finset Color), (∀ v, k ≤ (L v).card) → ListColorable G L

noncomputable def listChromaticNumber {V : Type} (G : SimpleGraph V) : ℕ :=
  sInf {k : ℕ | Choosable G k}

def HasCliqueMinor {V : Type} (G : SimpleGraph V) (t : ℕ) : Prop :=
  ∃ B : Fin t → Set V,
    (∀ i, (G.induce (B i)).Connected) ∧
    (∀ i j, i ≠ j → Disjoint (B i) (B j)) ∧
    (∀ i j, i ≠ j → ∃ v ∈ B i, ∃ w ∈ B j, G.Adj v w)

noncomputable def hadwigerNumber {V : Type} (G : SimpleGraph V) : ℕ :=
  sSup {t : ℕ | HasCliqueMinor G t}

def MainStatement : Prop :=
  ∃ C : ℕ, 1 ≤ C ∧ ∀ (V : Type) [Fintype V] [Nonempty V] (G : SimpleGraph V),
    listChromaticNumber G ≤ C * hadwigerNumber G

end LinearListHadwiger

end OAI
