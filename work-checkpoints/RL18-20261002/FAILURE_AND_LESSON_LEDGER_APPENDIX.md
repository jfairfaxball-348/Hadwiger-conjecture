# RL18 append-only lesson event — FL-021

Date: 2026-10-02 Europe/Madrid.
RL18 work appendix, **NOT PROMOTED**. Preserve FL-001 through FL-020 unchanged at normal closeout.

## FL-021 — witness deletion yields essentiality, but the fixed gamma/alpha lock is blind to the resulting structure

- **Origin/evidence:** RL18 bounded inside-T witness-essentiality assessment at BASE_HEAD c6e9ada33dd8107471e20c04afb775cdbc38ddd9; exact assessment in INSIDE_T_WITNESS_ESSENTIALITY_REPORT.md.
- **Prior expectation/status:** RL17 left y∈T as the unresolved conditional alternative and prepared deletion of y to test whether minimum-cardinality plus the same gamma/alpha locked-component data would force progress.
- **Positive observation:** T_y=T-{y} is nonempty. If it is connected, minimum-cardinality forces a cyclic coverage defect and S-completeness upgrades that defect to one cyclic nonedge pq with N_H(p)∩T=N_H(q)∩T={y}. If it is disconnected, y is an articulation of H[T] and every component K of H[T_y] has exact T-side attachment N_H(K)∩(T\K)={y}.
- **First missing dependency:** no retained implication connects either the off-palette private cyclic edge in the connected branch or the unrestricted-color articulation structure in the disconnected branch to the fixed gamma/alpha Kempe partition strongly enough to obtain a smaller valid resource or contradiction.
- **Why the fixed palette cannot close the connected branch:** the forced defect endpoints p,q lie in S and are adjacent to y, so their colors are neither gamma nor alpha; they are also nonneighbors of x. Thus the new coverage defect is not carried by the gamma/alpha x-neighborhood data.
- **Why it cannot close the disconnected branch:** components of H[T-y] and their y-attachments may use arbitrary colors; the gamma/alpha component partition of G-x does not control connectivity in H[T], and xy itself is absent from G-x.
- **Downstream effect:** no y∉T theorem, endpoint anchoring, second resource, m=1 exclusion, rooted-minor conclusion, UP_6/CR_6 result, order-seven theorem, higher-order theorem, or full-root conclusion follows.
- **Surviving frontier:** RL18-P01 is a scoped candidate result pending promotion; RL16-P01, RL15-P01, RL14-P01, RL13-P00/P01/P02 and all earlier results/source limits retain exact scope.
- **Lesson:** minimum-cardinality makes every deletable resource vertex structurally essential, but the form of essentiality matters: a non-cut vertex is coverage-essential while a cut vertex is connectivity-essential. A color-induced component argument cannot consume either certificate without an explicit bridge to the relevant S-incidence or T-block structure.
- **Retry condition:** do not retry the same fixed gamma/alpha test, RL17 z-exchange, RL16 equal-size exchange, or RL14 insertion swap. A changed attempt must use either the newly exposed private cyclic edge or the articulation decomposition itself.
- **Prepared changed recovery:** one articulation-side pruning gate, stated in NEXT_RECOVERY_TASK.md.
- **Sources/computation:** zero new source queries, zero new source opens, zero mathematical numerical computation.
- **Programme:** ACTIVE.
