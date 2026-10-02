# RL17 bounded checkpoint — strict-shrink exchange gate

Date: 2026-10-02 Europe/Madrid.
Status: **RL17 OPEN; one bounded assessment complete; NOT PROMOTED.**

BASE_HEAD is `32387459dc70787ab65f1da9ffcfa87ffa57d00e`. The incoming authoritative tree is
`aedcece2f7d51a3c11aebde5ea843557d3efcac2`. The start gate passed:
live main matched the expected RL16 promotion commit, RL17 is the unique
incoming session, no frozen sessions/RL17 exists, and no pre-existing RL17
work branch was found.

The sole RL17 mechanism stops at its first required implication:
the retained facts do not establish `y∉T`. The alternative `y∈T-{x}`
remains compatible with every currently proved local consequence. This is
a blocked/inconclusive gate, not a counterexample establishing logical
independence from the full C_7 hypotheses.

Because the RL17 brief requires `y∉T` before choosing any
`z∈T-{x}`, no `R_z=(T-{x,z})∪{y}` candidate is assessed. No appeal to
minimum-cardinality is made beyond preserving RL16-P01.

Read STRICT_SHRINK_EXCHANGE_REPORT.md for the exact assessment,
PROOF_STATE_AND_RESIDUAL_LEDGER.md for classification, and
NEXT_RECOVERY_TASK.md for the one prepared changed task. Programme ACTIVE.
