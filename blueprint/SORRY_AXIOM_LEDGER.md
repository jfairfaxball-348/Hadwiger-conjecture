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
- `sorry`: 1, an unproved **statement** of the statement layer: Theorem 1.1. No definition
  contains `sorry`. (10 before milestone M1; the five rows for S-1.a, S-1.b, S-1.c, the
  second assertion of P-3.5 and C-1.2 were removed at M1 by proofs, the row for the first
  assertion of P-3.5 at M2, and the three rows for the two open parts of L-2.2 and the
  first half of S-2.3 at M3.)
- The files under `Hadwiger/Sanity/` (three added at milestone M0, one at M3) do not
  contain it.

| File | Declaration | Kind | Blueprint ID | Milestone | Note |
|---|---|---|---|---|---|
| `Hadwiger/Main.lean` | `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` | `sorry` | T-1.1 | M17 | Theorem 1.1; needs Proposition 3.4 (M4) and Theorem 3.1 (M5 to M16) |

## Declarations that depend on `sorry` without containing one

These have complete proof bodies and `#print axioms` shows `sorryAx` for each. The open
`sorry` each one rests on is named.

- `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` (C-1.2; since M1) — from
  Theorem 1.1 (`sorry`, M17), and since M2 from nothing else. `PROVED_MODULO`.
- `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber` (T-FINAL) — from Corollary 1.2.
- `Hadwiger.not_hadwigerConjecture` (T-NOT-HC) — from T-FINAL.
- `Hadwiger.not_fractionalHadwigerConjecture` (S-1.d) — from Corollary 1.2.

So all four rest on exactly one `sorry`, Theorem 1.1, and no other declaration in the Lean
sources depends on a `sorry`.

No longer in this list:

- `Hadwiger.hadwigerNumber_lt_of_indepNum_le_two` (P-3.5, second assertion). It rested on
  the first assertion of Proposition 3.5, which was proved at M2.
- `Hadwiger.HoleData.le_two_mul_chromaticNumber_positionGraph` (S-2.3, second half). It
  rested on the first half of S-2.3, which was proved at M3.
