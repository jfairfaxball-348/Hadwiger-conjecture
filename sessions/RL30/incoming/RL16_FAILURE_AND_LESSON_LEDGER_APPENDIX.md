> **RL16 CLOSED/FROZEN — retained completed work record.** The exact original checkpoint lesson record follows. Its OPEN/NOT PROMOTED, prepared-only, old next-operation and finish wording is historical; RL16_SESSION_STATE_AND_RL17_KICKOFF.md and RL17_STRICT_SHRINK_EXCHANGE_BRIEF.md govern the current state. Mathematical scopes and source limits are unchanged. Plain checkpoint filenames below refer to the frozen originals in ../sessions/RL16/checkpoint/. No RL17 work has begun.

# RL16 append-only lesson event — FL-019

Date: 2026-10-02 Europe/Madrid.
RL16 work appendix, NOT PROMOTED. Preserve FL-001 through FL-018 unchanged
at normal closeout.

## FL-019 — minimum-cardinality does not turn an x-neighbor into a strict smaller replacement resource

- **Origin/evidence:** RL16-U01 at BASE_HEAD
  `fd2853dceff192a6b21f5e2d25c6a60ee8263ed2`; exact assessment in
  `OFF_S_WITNESS_RESOURCE_MINIMALITY_REPORT.md`.
- **Prior expectation/status:** RL15 left a conditional off-S alpha witness
  `y` in the failed-anchor branch and prepared a minimum-resource pruning
  gate. No contradiction, endpoint anchoring or exchange theorem was
  inherited.
- **Positive observation:** `y` is an exterior vertex of `H`. Since
  `|T|>=2` and `T` is minimum-cardinality among resources, `{y}` is not a
  resource and therefore misses at least one cyclic missing edge.
- **First failed/missing dependency:** for the direct exchange
  `R=(T-{x})∪{y}`, if `y∈T-{x}` then `R=T-{x}` and inherited cyclic
  coverage already fails. If `y∉T`, the guaranteed edge `xy` disappears
  when `x` is removed and no `y`-to-`T-{x}` edge is forced, so
  connectedness is not established.
- **Independent strict-size obstruction:** in the outside-T case
  `|R|=|T|`. Even if connectedness and coverage were supplied separately,
  minimum-cardinality would not contradict an equal-size resource.
- **Downstream effect:** no contradiction, endpoint anchoring, second
  resource, `m=1` exclusion, rooted K6/K7 minor, UP_6, CR_6, order-seven
  theorem, higher-order theorem or full-root conclusion follows.
- **Surviving frontier:** RL16-P01 plus RL15-P01, RL14-P01,
  RL13-P00/P01/P02 and all earlier results retain exact scopes; the
  failed-anchor branch remains conditional and not realized by a known
  actual C_7 graph.
- **Lesson:** resource minimality can reject a genuinely smaller valid
  resource only after connectedness and full cyclic coverage are proved.
  Replacing one deleted leaf by one new witness is cardinality-neutral
  when the witness is outside T, and the edge to the deleted leaf does not
  supply attachment to the surviving resource.
- **Retry condition:** a changed attempt must produce or force a connected
  exterior resource of size at most `|T|-1`; merely proving an equal-size
  swap or another x-y incidence is insufficient.
- **Prepared changed recovery:** one strict-shrink exchange gate, stated in
  `NEXT_RECOVERY_TASK.md`.
- **Sources/computation:** zero new source queries, zero new source opens,
  zero mathematical numerical computation.
- **Programme:** ACTIVE.