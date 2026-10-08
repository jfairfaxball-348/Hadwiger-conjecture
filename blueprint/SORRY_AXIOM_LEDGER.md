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
- `sorry`: **none** (since 2026-10-08).

The check scans this project's sources (`Hadwiger/`, `Hadwiger.lean`) and the upstream files
under `OAI/`.

How the last two went, on 2026-10-08. Theorem 1.1
(`Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt`) is proved from the
upstream formalisation under `OAI/`, through `Hadwiger/UpstreamBridge.lean`; that proof is
upstream's work, not this project's. The bound of Proposition 3.4
(`Hadwiger.mass_listLaw_le_sampleBound`) was **not proved**: it was withdrawn as a statement,
together with the existence statement derived from it, because nothing needs it any more
(blueprint P-3.4, now `NOT_STATED`).

| File | Declaration | Kind | Blueprint ID | Milestone | Note |
|---|---|---|---|---|---|

## Declarations that depend on `sorry` without containing one

None.
