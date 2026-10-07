# Contributing

Corrections, proofs, and reports of problems in the paper or in the formal statements are
welcome.

- Read `AGENTS.md` first. Its integrity rules apply to every contribution.
- A result counts as proved only when it is `DONE` in the sense of
  `docs/STATUS_CLASSIFICATIONS.md`: it compiles with no `sorry` beneath it and
  `#print axioms` shows only the three standard axioms.
- Change Lean, `blueprint/BLUEPRINT.md` and `blueprint/SORRY_AXIOM_LEDGER.md` together, and
  run `lake build`, `python scripts/check_ledger.py` and `python scripts/axiom_audit.py`
  before committing.
- If you find a gap or an error in the paper, or a Lean statement that does not say what
  the paper says, record it in `blueprint/PAPER_ISSUES.md` or `blueprint/FIDELITY.md`. Do
  not work around it with an axiom or by changing a statement without saying so.
- Do not add an `axiom` or `native_decide`.
- Do not copy the upstream Lean code for this paper from `openai/math`; this project is
  independent of it by decision of its owner.
- Do not edit `frozen-hc7-programme/`, `sessions/`, `Archive/` or `knowledge/`.
