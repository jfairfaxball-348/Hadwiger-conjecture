> **RL16 CLOSED/FROZEN — retained completed work record.** The exact original checkpoint proof/residual record follows. Its OPEN/NOT PROMOTED, prepared-only, old next-operation and finish wording is historical; RL16_SESSION_STATE_AND_RL17_KICKOFF.md and RL17_STRICT_SHRINK_EXCHANGE_BRIEF.md govern the current state. Mathematical scopes and source limits are unchanged. Plain checkpoint filenames below refer to the frozen originals in ../sessions/RL16/checkpoint/. No RL17 work has begun.

# RL16 checkpoint proof state and residual ledger

Date: 2026-10-02 Europe/Madrid.
Status: RL16 OPEN / work NOT PROMOTED.

## New scoped result

**RL16-P01.** In the conditional branch `C_a∩A_gamma=empty`, the fixed
RL14-locked witness `y∈(A_alpha\C_a)\S` lies in `V(H)\S`. Because
`|T|>=2` and `T` is minimum-cardinality among all resources, the connected
exterior singleton `{y}` cannot be a resource. Therefore its S-neighborhood
misses both endpoints of at least one cyclic missing edge.

Classification: proved scoped elementary analytic mathematics, same-worker
review only.

## Direct exchange result

For `B=T-{x}` and `R=B∪{y}`:

- if `y∈B`, then `R=B`, which is connected and strictly smaller but is
  already known to fail cyclic coverage;
- if `y∉T`, then no edge from `y` to `B` is forced after removing `x`, so
  connectedness is unproved at the first resource-validity gate; moreover
  `|R|=|T|`, so the required strict decrease is false.

Thus minimum-cardinality yields no contradiction from the direct exchange
and endpoint anchoring `C_a∩A_gamma!=empty` remains unproved.

## Preserved state and residuals

RL15-P01, RL14-P01 and RL13-P00/P01/P02 are unchanged. FL-001 through
FL-018, every inherited theorem/countermodel/certificate/source limit and
all prior verification qualifications are preserved.

No named inherited mathematical obligation is reduced. The `m=1` case
remains unresolved; no second resource is constructed. BR-00, BR-01
universal coverage, general UP_6, CR_6, ordinary order-seven coverage, all
higher ordinary orders and full sharp Hadwiger remain open.

Within this one-anchor line, the remaining missing input is a genuinely
strict-shrink connected resource exchange, not an equal-size replacement.
Graph/resource/component orders and attachment structures remain unbounded.
Programme ACTIVE.