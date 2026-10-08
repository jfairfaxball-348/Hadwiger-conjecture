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
- `sorry`: 6, each an unproved **statement**: Theorem 1.1, and the five statements added in
  the first slice of milestone M4 (2026-10-08): the three assertions of Lemma 3.2, Lemma
  3.3, and the bound of Proposition 3.4. No definition contains `sorry`. (10 before
  milestone M1; the five rows for S-1.a, S-1.b, S-1.c, the second assertion of P-3.5 and
  C-1.2 were removed at M1 by proofs, the row for the first assertion of P-3.5 at M2, and
  the three rows for the two open parts of L-2.2 and the first half of S-2.3 at M3, which
  left 1. The first slice of M4 was "statements only" and added 5.)
- The five new rows are statements that are **not yet signed off** by the user
  (`blueprint/M4_REVIEW_SHEET.md`). By the user's decision of 2026-10-07 no proof of them
  is to be written before that sign-off.
- The files under `Hadwiger/Sanity/` (three added at milestone M0, one at M3, four in the
  first slice of M4) do not contain it.

| File | Declaration | Kind | Blueprint ID | Milestone | Note |
|---|---|---|---|---|---|
| `Hadwiger/EntropyAndCuts.lean` | `Hadwiger.exists_terminal_cut` | `sorry` | L-3.3 | M4 | Lemma 3.3 (terminal cut), abstract and without division; stated in the first slice of M4, unreviewed; its proof is the third slice |
| `Hadwiger/EntropyAndCuts.lean` | `Hadwiger.neg_log_mass_le_relEntropy_of_minimizer` | `sorry` | L-3.2 | M4 | Lemma 3.2, third assertion; stated in the first slice of M4, unreviewed; its proof is the second slice |
| `Hadwiger/EntropyAndCuts.lean` | `Hadwiger.relEntropy_le_sub_of_minimizer` | `sorry` | L-3.2 | M4 | Lemma 3.2, second assertion; stated in the first slice of M4, unreviewed; its proof is the second slice |
| `Hadwiger/EntropyAndCuts.lean` | `Hadwiger.relEntropy_minimizer_pos` | `sorry` | L-3.2 | M4 | Lemma 3.2, first assertion; stated in the first slice of M4, unreviewed; its proof is the second slice |
| `Hadwiger/Main.lean` | `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` | `sorry` | T-1.1 | M17 | Theorem 1.1; needs Proposition 3.4 (M4) and Theorem 3.1 (M5 to M16) |
| `Hadwiger/RandomSample.lean` | `Hadwiger.mass_listLaw_le_sampleBound` | `sorry` | P-3.4 | M4 | Proposition 3.4 as an explicit bound; stated in the first slice of M4, unreviewed; needs Lemma 3.2 and Lemma 3.3; its proof is the fourth and fifth slices |

## Declarations that depend on `sorry` without containing one

These have complete proof bodies and `#print axioms` shows `sorryAx` for each. The open
`sorry` each one rests on is named.

- `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` (C-1.2; since M1) — from
  Theorem 1.1 (`sorry`, M17), and since M2 from nothing else. `PROVED_MODULO`.
- `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber` (T-FINAL) — from Corollary 1.2.
- `Hadwiger.not_hadwigerConjecture` (T-NOT-HC) — from T-FINAL.
- `Hadwiger.not_fractionalHadwigerConjecture` (S-1.d) — from Corollary 1.2.
- `Hadwiger.exists_list_indepNum_le_two_and_connectedMatchingNumber_lt` (P-3.4, existence;
  since the first slice of M4) — from the bound of Proposition 3.4
  (`Hadwiger.mass_listLaw_le_sampleBound`, `sorry`, M4), and from nothing else that is
  open. Its own rank is `PROVED_MODULO`; the entry P-3.4 is `STATED` because the bound is.

So the first four rest on exactly one `sorry`, Theorem 1.1, and the fifth on exactly one,
the bound of Proposition 3.4. No other declaration in the Lean sources depends on a
`sorry`. In particular Theorem 1.1 is not derived from Proposition 3.4 in Lean: that
derivation needs Theorem 3.1 and the construction (M5 to M17), and the final theorem does
not rest on any of the five new `sorry`s.

No longer in this list:

- `Hadwiger.hadwigerNumber_lt_of_indepNum_le_two` (P-3.5, second assertion). It rested on
  the first assertion of Proposition 3.5, which was proved at M2.
- `Hadwiger.HoleData.le_two_mul_chromaticNumber_positionGraph` (S-2.3, second half). It
  rested on the first half of S-2.3, which was proved at M3.
