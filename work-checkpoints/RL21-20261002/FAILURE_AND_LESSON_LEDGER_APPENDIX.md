# RL21 append-only lesson event — FL-024

Date: 2026-10-02 Europe/Madrid.
Status: **prepared at RL21 checkpoint; NOT PROMOTED.**

## FL-024 — m=2 leaf pruning gives an exact repair split, but T_2 color exclusion is the next missing bridge

- **Origin/evidence:** RL21 bounded m=2 S-complete resource-pair leaf-pruning assessment at BASE_HEAD afd7414ab547adc3781b3ec67989464a6c9ce0d8; exact assessment in M2_S_COMPLETE_PAIR_LEAF_PRUNING_REPORT.md.
- **Prior expectation/status:** RL20 deliberately pivoted away from repeated m=1 refinement to the untouched m=2, A=S branch, using one fixed joining edge and one leaf deletion to test whether minimum total size plus pair structure yields boundary compression or a smaller family.
- **Positive observation:** on a non-singleton fixed T_1 side, B=T_1-{x} preserves pq and one minimum-total-size invocation forces a selected cyclic defect e=ab. The repair sets X (via x) and Y (via T_2) are nonempty and cover {a,b}, giving exactly seven patterns. In the two patterns X={a,b} with Y singleton, an actual disjoint-star coloring admits a direct one-endpoint recoloring and gives five colors on S across H[S union U].
- **Singleton obstruction:** if |T_1|=1 there is no permitted non-root leaf on the fixed side, so this mechanism stops without switching to T_2.
- **First missing dependency:** in the other five repair patterns, resource coverage and S-completeness do not force a target-color exclusion on T_2-neighbors of either endpoint, nor a common-neighbor condition strong enough to certify the one-endpoint recoloring.
- **Method-barrier witness:** at the boundary-incidence/color level, X=Y={a,b} can coexist with distinct T_2 vertices t_a,t_b attached only to a and b respectively and carrying the opposite endpoint colors. This is not an actual C_7 countermodel; it only shows the direct recoloring does not follow from the allowed local premises.
- **Downstream effect:** no smaller size-two family, m=2 exclusion, third resource, UP_6/CR_6 result, order-seven theorem, higher-order theorem or root conclusion follows. The two compressed repair patterns are only a local subcase reduction.
- **Surviving frontier:** candidate RL21-P01/P02 are scoped and unpromoted; the RL20 audit, RL19-P01, FL-022, FL-023 and every inherited result/source limit remain unchanged.
- **Lesson:** the actual joining edge is enough to preserve family compatibility after pruning, but it does not control defect-endpoint colors inside T_2. A changed attempt must add color-level information rather than repeat endpoint-level S-completeness.
- **Retry condition:** do not repeat the same seven-pattern incidence classification or the same direct recoloring test without a new premise controlling the target-colored T_2 blockers.
- **Prepared recovery:** one bounded fixed-defect target-color blocker assessment using one actual star coloring and the same m=2 interface; no resource-side switch or second pruning mechanism by default.
- **Sources/computation:** zero new mathematical source queries, zero new source opens, zero mathematical numerical computation.
- **Programme:** ACTIVE.
