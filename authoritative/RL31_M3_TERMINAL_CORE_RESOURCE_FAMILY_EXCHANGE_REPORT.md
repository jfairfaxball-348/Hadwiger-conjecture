# RL31 m=3 terminal-core resource-family exchange report

Date: 2026-10-03 Europe/Madrid.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the retained full C_7 cyclic degree-seven m=3, A=S setup and the three fixed terminal cores required by the RL31 brief.

## Result RL31-P01 — fixed terminal-core obstruction dichotomy

Retain the maximum partial resource family F={T_1,T_2,T_3}, minimum in total size among maximum families, with U=T_1 union T_2 union T_3 and N_H(U) intersect S=S. Retain exactly the fixed joining edges e_12,e_13,e_23, fixed terminal endpoints s_i,t_i in T_i, fixed spanning trees Q_i, and R_i equal to the unique s_i-t_i path vertex set in Q_i (or {s_i} if s_i=t_i).

For each i in order 1,2,3:

1. R_i is nonempty and exterior because it contains its fixed terminal endpoint(s) and is a subset of exterior T_i.
2. R_i is disjoint from the other two resources because the original T_i are pairwise disjoint.
3. H[R_i] is connected because the unique Q_i path is an H[T_i]-path.
4. Exact cyclic resource coverage is not automatic and is the first possible failed family-validity gate.
5. If gate 4 passes, both fixed joining edges incident with T_i remain: their endpoints s_i,t_i belong to R_i. The fixed joining edge between the unchanged pair also remains.
6. If gate 4 passes and R_i is a strict subset of T_i, then R_i is a resource and F_i'={R_i} union {T_j:j!=i} is a valid cardinality-three partial resource family with strictly smaller total size. This contradicts the defining minimum-total-size choice.

Therefore, for every i, any retained configuration must stop in exactly one of the following ways:

- **MISS_i(g_i):** gate 4 fails. Choose one cyclic nonedge g_i whose two endpoints both have no neighbor in R_i. No later gate is consumed for that side.
- **SAT_i:** gate 4 passes and gate 6 cannot be strict, hence R_i=T_i.

Thus any hypothetical retained m=3, A=S configuration has a three-coordinate obstruction profile (o_1,o_2,o_3), each coordinate being MISS_i(g_i) or SAT_i.

Classification: proved scoped analytic mathematics, same-worker review only. No formal proof checker, external independent certification, source upgrade, or novelty claim.

## M3-CORE target

M3-CORE is NOT CERTIFIED. RL31 supplies no retained implication forcing at least one of the three fixed sides to avoid both obstruction types. Consequently RL31 does not exclude the m=3, A=S configuration.

This is not a counterexample to M3-CORE as a universally quantified statement: the retained configuration itself may be empty. It is a bounded proof-mechanism stopping result under the assumed configuration.

## Obligation accounting

No named inherited universal mathematical obligation is genuinely reduced. The m=3, A=S branch remains open. The full m=2, A=S line and RL29 one-coloring recovery remain preserved but suspended under RL30/FL-033. m=1, m=4, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order seven, higher orders, and full sharp Hadwiger all remain open at their recorded scopes.

Correction/demotion: NONE.

## Bounds and sources

Exactly three fixed analytic candidate audits were permitted and exhausted symbolically. No alternative joining edge, tree, core, family, coloring or path was chosen. No m=4 work occurred. New mathematical source retrieval: 0. Mathematical numerical computation: 0. Broad graph/coloring/list census: 0.

Programme ACTIVE.
