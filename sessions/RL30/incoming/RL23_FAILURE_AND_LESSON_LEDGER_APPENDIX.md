# RL23 append-only candidate lesson event — FL-026

Date: 2026-10-02 Europe/Madrid.
Status: RL23 checkpoint only / NOT PROMOTED.

## FL-026 — one-sided leaf target color is compatible with the retained local resource/color consequences

- **Origin/evidence:** RL23 bounded fixed one-sided leaf-color compatibility assessment at BASE_HEAD 57572d2e3cf353cad139460902e0958339371480; exact work is checkpointed under work-checkpoints/RL23-20261002/. Same fixed RL22 pattern X={a},Y={b}, defect e=ab, disjoint star type f and source coloring c; conditional branch c(x)=beta.
- **Classification:** method barrier / recovery lesson; not a mathematical error, counterexample, theorem demotion, source-status change or full-model existence certificate.
- **Expectation tested:** whether properness, the repair pattern, fixed resource connectedness, pq, B-defect identities and promoted RL21/RL22 consequences contradict c(x)=beta.
- **Actual observation:** no contradiction is forced. xa is proper because c(a)=alpha!=beta=c(x); xb is a nonedge, so x may share beta with b. The beta singleton statement is only on S. The tree neighbor r of x is simply forced to avoid beta by properness.
- **First missing dependency:** no retained fixed-scope premise forces a beta-colored neighbor of x or otherwise makes beta unavailable at x.
- **Downstream effect:** the prepared recoloring a->beta is blocked by ax in this conditional branch; no five-color S-boundary compression, pattern elimination, m=2 exclusion or smaller family follows.
- **Surviving valid scope:** RL22-P01, RL21-P01/P02, FL-025, FL-024, the RL20 NONE result, FL-023 and all source/certificate limits remain exact.
- **Scope caution:** this records compatibility with the permitted local consequences only. It does not assert that a full C_7 critical graph realizing the branch has been independently constructed.
- **Lesson:** singleton color information on S cannot be silently globalized to H, and connected resource/joining-edge structure does not itself produce a target-color exclusion at x.
- **Retry condition:** do not repeat the same one-sided leaf-color contradiction test without a new fixed-scope color/incidence premise. A next attempt must change mechanism rather than relabel this absence of contradiction.
- **Prepared changed recovery:** assess one explicitly named strict minimum-total-size resource-family exchange candidate at the same m=2 frontier, without reusing the exhausted leaf-color contradiction as a premise. Form the candidate replacement sets first and stop if resource coverage, connectedness, disjointness or required joining edges are not forced.
- **Sources/computation:** zero new mathematical source queries/opens and zero mathematical numerical computation.
- **Programme:** ACTIVE.
