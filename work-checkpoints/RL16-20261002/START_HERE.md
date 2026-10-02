# RL16 isolated checkpoint — off-S witness / minimum-resource pruning

Status: **RL16 OPEN / one bounded assessment complete / NOT PROMOTED**.
Base authority: `fd2853dceff192a6b21f5e2d25c6a60ee8263ed2`.
Branch: `work/rl16-off-s-minimality-20261002`.

Read `OFF_S_WITNESS_RESOURCE_MINIMALITY_REPORT.md` first, then
`PROOF_STATE_AND_RESIDUAL_LEDGER.md`,
`FAILURE_AND_LESSON_LEDGER_APPENDIX.md`, and
`NEXT_RECOVERY_TASK.md`.

The sole RL16 mechanism was assessed only in the inherited failed-anchor
branch `C_a ∩ A_gamma = empty`, with one forced witness
`y ∈ (A_alpha \ C_a) \ S`. Minimum-cardinality gives one small positive
fact: the exterior singleton `{y}` is not a resource, so its S-neighborhood
misses at least one cyclic missing edge.

The direct exchange `R=(T-{x})∪{y}` does not yield a contradiction.
If `y∈T-{x}`, then `R=T-{x}`, already known to fail resource coverage.
If `y∉T`, no edge from `y` to `T-{x}` is forced after deleting `x`, so
connectedness is not established; independently `|R|=|T|`, so the
strict-size condition needed for minimum-cardinality contradiction also
fails. Endpoint anchoring is not restored.

All inherited results, source limits and FL-001 through FL-018 are
preserved. No named mathematical obligation is reduced. Programme ACTIVE.