# A counterexample to Hadwiger's conjecture — Lean 4 formalisation

This repository is a Lean 4 (Mathlib) formalisation, in progress, of the paper
"A counterexample to Hadwiger's conjecture" (OpenAI, 23 September 2026).

The target is a Lean theorem, with no `sorry` and no non-standard axiom, stating that
there are finite simple graphs of arbitrarily large order whose chromatic number exceeds
their Hadwiger number.

**Status: the final theorem is not proved.** The paper's main theorem (Theorem 1.1),
which is almost the whole paper, is `sorry`; the final theorem is derived from it in Lean.
What is proved is elementary: Proposition 3.5 (the clique-minor bound from connected
matchings), three statements from the paper's introduction, and Lemma 2.2 with equation
(2.3) (the abstract hole relation is triangle-free, so the graphs built from it have
independence number at most 2). The paper is
machine-generated and, as far as this project knows, unrefereed; whether its proof is
correct is one of the things the formalisation will find out.

Start with `START_HERE.md`. The rules are in `AGENTS.md`. What is stated and what is
proved is recorded in exactly one place, `blueprint/BLUEPRINT.md`.

## Build

```bash
lake exe cache get
```

```bash
lake build
```

Then the two checks (details in `docs/LEAN_WORKFLOW.md`):

```bash
python scripts/check_ledger.py
```

```bash
python scripts/axiom_audit.py
```

## Layout

| Path | Contents |
|---|---|
| `Hadwiger/`, `Hadwiger.lean` | The Lean sources. |
| `blueprint/` | Blueprint, sorry/axiom ledger, fidelity notes, paper issues, milestones. |
| `docs/` | Status definitions, workflow, provenance, session log. |
| `scripts/` | The ledger check and the axiom audit. |
| `frozen-hc7-programme/`, `sessions/`, `Archive/`, `knowledge/` | Frozen history of the earlier HC7 research programme. Not part of the formalisation. |

## History

Until 2026-10-07 this repository was a research record for HC7, the chromatic-number-7
case of Hadwiger's conjecture. That programme was retired, not solved; the paper's
counterexamples have independence number at most 2 and say nothing about chromatic
number 7. Its record is preserved unaltered; see `frozen-hc7-programme/README.md`.
