# Status classifications

These are the only statuses a blueprint entry may have. They are computed from the build,
not chosen: `python scripts/axiom_audit.py` fails if the blueprint records a status the
build does not support.

## Results (theorems, propositions, lemmas, corollaries, unnumbered statements)

| Status | Exact meaning | What may be said about it |
|---|---|---|
| `NOT_STATED` | There is no Lean statement. | "Not yet stated." |
| `STATED` | The Lean statement compiles. Its proof is `sorry`, and it is in the ledger. | "Stated." Never "proved". |
| `PROVED_MODULO` | The proof body has no `sorry`, but `#print axioms` shows `sorryAx`: something it depends on is still open. | "Proved from X", naming the open dependencies. Never "proved". |
| `DONE` | Compiles; no `sorry` anywhere beneath it; `#print axioms` shows only `propext`, `Classical.choice`, `Quot.sound`. | "Proved." |

An entry with several Lean declarations takes the weakest status among them.

There is no status for "proved on paper", "proof sketched", "believed true" or "checked on
examples". Such things are notes in `docs/SESSION_LOG.md`, not statuses.

## Definitions and constructions

| Status | Exact meaning |
|---|---|
| `NOT_STATED` | There is no Lean definition. |
| `MATHLIB` | Mathlib's own definition is used unchanged. |
| `DEFINED` | A new Lean definition exists in this repository, contains no `sorry`, and has a fidelity note in `blueprint/FIDELITY.md`. |

`DEFINED` does not mean the definition has been reviewed. Review of the statement layer is
milestone M0, and its outcome is recorded in `blueprint/FIDELITY.md`.

## The three standard axioms

`propext`, `Classical.choice` and `Quot.sound` are the axioms of Lean's standard classical
mathematics and are used throughout Mathlib. Any other axiom in a `#print axioms` result
fails the audit. In particular:

- `sorryAx` means a `sorry` is beneath the declaration;
- `Lean.ofReduceBool` or `Lean.trustCompiler` means `native_decide` was used, which trusts
  the compiler rather than the kernel.

## Paper-side findings

These are not statuses. They are entries in `blueprint/PAPER_ISSUES.md`, each with an
identifier `PI-n` cited from the blueprint entry it affects.

| Kind | Meaning |
|---|---|
| `ERROR` | A statement or proof step in the paper is false as written. Requires a counterexample or a precise refutation. |
| `GAP` | A proof step does not follow from what precedes it and no repair has been found. |
| `UNCLEAR` | The text admits more than one reading, or omits a definition or a quantifier; the reading adopted is recorded. |
| `REPAIRED` | A gap or error for which a correct argument has been found and formalised. The original problem stays on record. |

A suspected problem that has not been pinned down is recorded as `UNCLEAR`, never as
`ERROR`.
