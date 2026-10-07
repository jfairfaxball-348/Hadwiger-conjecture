# Sorry / axiom / native_decide ledger

Every `sorry`, `admit`, `axiom` and `native_decide` in the Lean sources is listed here, one
row per declaration and kind. `python scripts/check_ledger.py` fails if a row is missing or
stale, and CI runs it.

Rules (binding, from `AGENTS.md`):

- A row is removed only by removing the `sorry` from the source with a real proof.
- An `axiom` or `native_decide` may be added only with the user's explicit approval, and a
  declaration that depends on one is never `DONE`.
- A gap or error in the paper is never closed by adding a row here. It is recorded in
  `blueprint/PAPER_ISSUES.md` and reported to the user.

## Current state

- `axiom`: none.
- `native_decide`: none.
- `admit`: none.
- `sorry`: 10, all of them unproved **statements** of the statement layer. No definition
  contains `sorry`.
- The files under `Hadwiger/Sanity/` (added at milestone M0) contain none of the four.

| File | Declaration | Kind | Blueprint ID | Milestone | Note |
|---|---|---|---|---|---|
| `Hadwiger/ChromaticBounds.lean` | `Hadwiger.card_le_indepNum_mul_fractionalChromaticNumber` | `sorry` | S-1.b | M1 | `\|V\| ≤ α · χ_f` |
| `Hadwiger/ChromaticBounds.lean` | `Hadwiger.card_le_indepNum_mul_of_colorable` | `sorry` | S-1.a | M1 | `\|V\| ≤ α · k` for a proper `k`-colouring |
| `Hadwiger/ChromaticBounds.lean` | `Hadwiger.fractionalChromaticNumber_le_of_colorable` | `sorry` | S-1.c | M1 | `χ_f ≤ k` for a proper `k`-colouring |
| `Hadwiger/HoleRelation.lean` | `Hadwiger.HoleData.indepNum_positionGraph_le_two` | `sorry` | S-2.3 | M3 | equation (2.3), first half |
| `Hadwiger/HoleRelation.lean` | `Hadwiger.HoleData.not_hole_self` | `sorry` | L-2.2 | M3 | Lemma 2.2, no loops |
| `Hadwiger/HoleRelation.lean` | `Hadwiger.HoleData.not_hole_triangle` | `sorry` | L-2.2 | M3 | Lemma 2.2, triangle-free |
| `Hadwiger/Main.lean` | `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` | `sorry` | C-1.2 | M1 | Corollary 1.2 |
| `Hadwiger/Main.lean` | `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` | `sorry` | T-1.1 | M17 | Theorem 1.1; needs Proposition 3.4 (M4) and Theorem 3.1 (M5 to M16) |
| `Hadwiger/MatchingMinor.lean` | `Hadwiger.hadwigerNumber_lt_of_indepNum_le_two` | `sorry` | P-3.5 | M1 | Proposition 3.5, second assertion |
| `Hadwiger/MatchingMinor.lean` | `Hadwiger.three_mul_hadwigerNumber_le` | `sorry` | P-3.5 | M2 | Proposition 3.5, first assertion |

## Declarations that depend on `sorry` without containing one

These have complete proof bodies and are `PROVED_MODULO` in the blueprint:

- `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber` (T-FINAL) — from Corollary 1.2.
- `Hadwiger.not_hadwigerConjecture` (T-NOT-HC) — from T-FINAL.
