# RL19 append-only lesson event — FL-022

Date: 2026-10-02 Europe/Madrid.
Status: **prepared at RL19 checkpoint; NOT PROMOTED.**

## FL-022 — articulation-side defects localize to opposite sides but need not collapse

- **Origin/evidence:** RL19 bounded articulation-side pruning assessment at BASE_HEAD fc61fb68165e341de9e15cf3b7de63232ffc295b; exact assessment in ARTICULATION_SIDE_PRUNING_REPORT.md.
- **Prior expectation/status:** RL18-P01 left the disconnected alternative in which y is an articulation of H[T] and every component of H[T-{y}] has exact T-side attachment {y}. RL19 tested one fixed component K≠K_x.
- **Positive observation:** R=K∪{y} and R'=T\K are proper nonempty connected exterior subsets. Minimum-cardinality forces a cyclic coverage defect on each. S-completeness sends the endpoints of the R-defect to T\R and the endpoints of the R'-defect into K. The two selected defect edges are necessarily vertex-disjoint.
- **First missing dependency:** no retained incidence rule couples two vertex-disjoint cyclic defects strongly enough to make either R or R' cover all seven cyclic nonedges, and no complete-coverage conclusion is forced for another proper subset.
- **Witness to the method barrier:** at the boundary-incidence level, defects s_0s_1 and s_3s_4 can be supported on opposite articulation sides while s_2,s_5,s_6 attach through y. This is not an actual C_7 countermodel; it only falsifies the desired implication from the allowed premises.
- **Downstream effect:** no smaller resource, contradiction, m=1 exclusion, endpoint anchoring, second resource, UP_6/CR_6 result, order-seven theorem, higher-order theorem, or full-root conclusion follows.
- **Surviving frontier:** candidate RL19-P01 is scoped and unpromoted; RL18-P01 and every inherited result/source limit remain unchanged.
- **Lesson:** articulation decompositions can separate where coverage defects are repaired without forcing those repairs to interact. A next attempt needs a new incidence constraint linking the two defect supports, not another repetition of S-completeness plus the same split.
- **Retry condition:** do not retry the same two-side coverage argument without a premise that constrains which cyclic vertices can lie outside one side's S-neighborhood.
- **Prepared recovery:** after the mandatory RL20 progress/correction audit, consider one bounded private-endpoint incidence gate using only the fixed a with N_H(a)∩T={x} to constrain the full defect set for the same articulation side; do not use a second K or coloring mechanism by default.
- **Sources/computation:** zero new mathematical source queries, zero new source opens, zero mathematical numerical computation.
- **Programme:** ACTIVE.
