# RL24 append-only candidate lesson event — FL-027

Date: 2026-10-02 Europe/Madrid.
Status: RL24 checkpoint only / NOT PROMOTED.

## FL-027 — selected leaf repair does not imply singleton cyclic-resource coverage

- **Origin/evidence:** RL24 bounded strict minimum-total-size resource-family exchange feasibility assessment at BASE_HEAD 10cfdbb3b6aeb47cab037912f0f6a18b5684ac26; exact work is checkpointed under work-checkpoints/RL24-20261002/. The sole fixed candidate is F'={{x},T_2}.
- **Classification:** method barrier / recovery lesson; not a mathematical error, counterexample, theorem demotion, source-status change or full-model existence certificate.
- **Expectation tested:** whether the retained non-singleton m=2, A=S resource and selected repair-pattern structure makes {{x},T_2} a valid smaller cardinality-two partial resource family.
- **Actual observation:** gates 1-3 pass. T_2 remains a resource, and singleton {x} covers the selected defect e=ab because xa is an edge. But no retained premise forces x to meet an endpoint of every other cyclic nonedge.
- **First missing dependency:** the all-seven-pairs coverage statement N_H(x) intersect endpoints(g) != empty for every cyclic nonedge g of H[S].
- **Downstream effect:** R_1={x} is not certified as a resource; gates 5-6 are not reached; minimum total size is not invoked; no smaller valid family, m=2 exclusion or boundary compression follows.
- **Surviving valid scope:** RL23's stopping result and FL-026, RL22-P01 and FL-025, RL21-P01/P02 and FL-024, the RL20 NONE result and FL-023 remain exact.
- **Compatibility witness:** a local incidence schema with B={p}, T_2={q}, px,pq edges, N_S(x)={u_0}, N_S(p)={u_2,u_4,u_6}, N_S(q)={u_1,u_3,u_5,u_6}, and e=u_0u_1 satisfies the listed resource/joining/repair consequences while {x} misses u_1u_2. This is not a full critical-graph realization.
- **Lesson:** coverage of one selected B-defect by the deleted leaf cannot be silently globalized into resource coverage of the singleton leaf.
- **Retry condition:** do not retry F'={{x},T_2} without a genuinely new premise controlling x's S-neighborhood across every cyclic nonedge.
- **Prepared changed recovery:** if the programme continues, assess one explicitly fixed transfer candidate that uses a connected q-to-b-neighbor path inside T_2 to repair B, with all family axioms checked from the start; do not treat that candidate as already valid.
- **Sources/computation:** zero new mathematical source queries/opens and zero mathematical numerical computation.
- **Programme:** ACTIVE.
