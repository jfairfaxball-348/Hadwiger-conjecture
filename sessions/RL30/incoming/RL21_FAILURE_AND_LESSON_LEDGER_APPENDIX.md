# RL21 append-only lesson event — FL-024

Date: 2026-10-02 Europe/Madrid.

## FL-024 — m=2 leaf pruning gives an exact repair split, but T_2 color exclusion is the next missing bridge

- **Origin/evidence:** RL21 bounded m=2 S-complete resource-pair leaf-pruning assessment at BASE_HEAD afd7414ab547adc3781b3ec67989464a6c9ce0d8; exact work is frozen under sessions/RL21/checkpoint/.
- **Classification:** method-barrier / recovery lesson accompanying RL21-P01/P02; not a mathematical error, counterexample, theorem demotion or source-status change.
- **Positive observation:** on a non-singleton fixed T_1 side, B=T_1-{x} preserves pq and one minimum-total-size invocation forces one selected cyclic defect e=ab. The repair sets X (via x) and Y (via T_2) are nonempty and cover {a,b}, giving exactly seven patterns. In the two patterns X={a,b} with Y singleton, one actual disjoint-star coloring permits a direct one-endpoint recoloring and gives a proper six-label coloring of H[S union U] using five colors on S.
- **Singleton obstruction:** if |T_1|=1 there is no permitted non-root leaf on the fixed side, so this mechanism stops without switching to T_2.
- **First missing dependency:** in the other five repair patterns, resource coverage, S-completeness and the fixed joining edge do not force a target-color exclusion on T_2-neighbors of either endpoint, nor a common-neighbor condition strong enough to certify the one-endpoint recoloring.
- **Method-barrier witness:** at the boundary-incidence/color level, X=Y={a,b} can coexist with distinct T_2 vertices attached one-sidedly to a and b and carrying the opposite endpoint colors. This is not an actual C_7 countermodel; it only shows the direct recoloring does not follow from the permitted local premises.
- **Downstream effect:** no smaller size-two family, m=2 exclusion, third resource, UP_6/CR_6 result, order-seven theorem, higher-order theorem or root conclusion follows. The two compressed repair patterns are only a scoped interface subcase.
- **Surviving frontier:** RL21-P01/P02 are promoted only at their exact scopes; the RL20 audit, RL19-P01, FL-022, FL-023 and every inherited result/source/certificate limit remain unchanged.
- **Lesson:** the actual joining edge preserves pair compatibility after pruning but does not control defect-endpoint colors inside T_2. A changed attempt needs color-level information rather than another endpoint-level S-completeness argument.
- **Retry condition:** do not repeat the seven-pattern incidence classification or the same direct recoloring test without a new premise controlling target-colored T_2 blockers.
- **Selected successor:** RL22 performs one bounded fixed-defect target-color blocker assessment using one actual star coloring and one unresolved repair pattern.
- **Sources/computation:** zero new mathematical source queries/opens and zero mathematical numerical computation.
- **Programme:** ACTIVE.
