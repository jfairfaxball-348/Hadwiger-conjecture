# A counterexample to Hadwiger's conjecture — Lean 4 formalisation

This repository is a Lean 4 (Mathlib) formalisation, in progress, of the paper
"A counterexample to Hadwiger's conjecture" (OpenAI, 23 September 2026).

The target is a Lean theorem, with no `sorry` and no non-standard axiom, stating that
there are finite simple graphs of arbitrarily large order whose chromatic number exceeds
their Hadwiger number.

**Status (2026-10-08): the final theorem is proved in this repository's build, with no
`sorry` and only the three standard axioms.** The proof of the paper's main theorem (Theorem
1.1), which is almost the whole paper, is **not this project's work**: it is the Lean
formalisation published by the paper's authors, `openai/math` at commit `fd4aeeb`, kept under
`OAI/` (see `NOTICE`). This project's own work, under `Hadwiger/`, is the definitions and
statements, the clique-minor bound from connected matchings (Proposition 3.5), the bounds of
the paper's introduction, the deduction of Corollary 1.2 and of the final theorem from
Theorem 1.1, including the fractional-chromatic form `χ_f(G) > h(G)`, and the comparison of
definitions that connects the two developments.

The paper is machine-generated and, as far as this project knows, unrefereed. A
machine-checked proof shows that the Lean statements hold; that they say what the conjecture
says is argued in the doc comments and is for a reader to judge.

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
| `docs/` | Status definitions, workflow, provenance, session log, and the draft prompt for the next session. |
| `scripts/` | The ledger check and the axiom audit. |
| `frozen-hc7-programme/`, `sessions/`, `Archive/`, `knowledge/` | Frozen history of the earlier HC7 research programme. Not part of the formalisation. |

## History

Until 2026-10-07 this repository was a research record for HC7, the chromatic-number-7
case of Hadwiger's conjecture. That programme was retired, not solved; the paper's
counterexamples have independence number at most 2 and say nothing about chromatic
number 7. Its record is preserved unaltered; see `frozen-hc7-programme/README.md`.
