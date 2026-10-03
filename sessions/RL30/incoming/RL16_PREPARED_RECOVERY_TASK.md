> **RL16 CLOSED/FROZEN — retained completed work record.** The exact original checkpoint prepared recovery record follows. Its OPEN/NOT PROMOTED, prepared-only, old next-operation and finish wording is historical; RL16_SESSION_STATE_AND_RL17_KICKOFF.md and RL17_STRICT_SHRINK_EXCHANGE_BRIEF.md govern the current state. Mathematical scopes and source limits are unchanged. Plain checkpoint filenames below refer to the frozen originals in ../sessions/RL16/checkpoint/. No RL17 work has begun.

# Prepared recovery after RL16-U01

Status: **PREPARED ONLY / NOT STARTED.**
RL16 remains OPEN / NOT PROMOTED.

## Why the mechanism must change

The direct `x -> y` replacement cannot contradict minimum-cardinality.
When `y` is outside `T` it is not known to attach to `B=T-{x}` and it is
cardinality-neutral; when `y` is already in `B`, the replacement is the
known non-resource `B`.

## One bounded changed task

Retain the same full C_7 domain, `m=1` minimum-cardinality S-complete
resource `T`, fixed leaf `x`, fixed anchor `a`, fixed coloring `d`, the
same failed-anchor branch, and the same one witness `y`.

Assess one **strict-shrink exchange gate**: determine whether the retained
full-critical/Kempe structure forces an exterior connected set of the form

    R_z = (T - {x,z}) ∪ {y}

for some single `z∈T-{x}` chosen within the argument, such that `R_z` is
nonempty, connected, and its S-neighborhood meets every one of the seven
cyclic missing edges. If `y∉T`, this has size `|T|-1` and would contradict
minimum-cardinality. If the argument cannot first force `y∉T`, or fails
connectedness, full cyclic coverage, or strict size, stop at that first
implication and record it.

Do not use a second palette, a different leaf/coloring, witness splicing,
the retired insertion swap, quotient lifting, numerical search or a new
source query by default.

This task is a candidate recovery mechanism only; no existence of such
`z` or `R_z` is claimed.