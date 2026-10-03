# RL31 m=3 terminal-core resource-family exchange brief

Status: READY / NOT STARTED.
Scope: exactly one bounded m=3, A=S terminal-core resource-family exchange assessment selected by RL30.
No broad census and no automatic return to the RL21-RL29 m=2 chain.

Follow AGENTS.md, authoritative/START_HERE.md, docs/RESEARCH_RECOVERY_PROTOCOL.md, authoritative/RL30_PROOF_STATE_AND_RESIDUAL_LEDGER.md, authoritative/RL30_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and the inherited RL13 records frozen at sessions/RL30/incoming/RL13_CRITICAL_CONNECTED_RESOURCE_REPORT.md and sessions/RL30/incoming/RL13_PROOF_STATE_AND_RESIDUAL_LEDGER.md.

Keep full sharp Hadwiger as the root:

    h(G) >= chi(G)

for EVERY finite simple graph. Either a complete rigorous proof or an actual rigorously verified finite counterexample is legitimate.

Work inside the full C_7 cyclic degree-seven domain inherited from RL13. Retain a maximum partial resource family F={T_1,T_2,T_3} of cardinality m=3, chosen with minimum total size among maximum families, and assume U=T_1 union T_2 union T_3 with N_H(U) intersect S = S.

Each T_i is a nonempty connected exterior resource. For every resource pair there is an actual joining edge.

This task is independent of the fixed RL21-RL29 m=2 chain. Do not import x, B, e=ab, L, P, V(P)=T_2, c, A, K, z, d, xz, or any conclusion requiring those choices.

Fix exactly one actual joining edge e_12, e_13, e_23 for the three resource pairs. For each i, let s_i,t_i be the endpoints in T_i of its two incident fixed joining edges; s_i=t_i is allowed. Fix exactly one spanning tree Q_i of H[T_i]. Define R_i as the vertex set of the unique s_i-t_i path in Q_i, with R_i={s_i} when s_i=t_i.

There are at most three candidates, in fixed order i=1,2,3:

    F_i' = {R_i} union {T_j : j != i}.

No alternative joining edge, tree, core, resource family, coloring, path optimization, or graph/list/coloring census is allowed.

New mathematical source retrieval: 0 by default.
New numerical computation: 0 by default.
Finite candidate bound: at most 3 analytic family-validity audits.

For each candidate audit in order and stop at the first failed gate:
1. R_i is nonempty and exterior.
2. R_i is disjoint from the other two resources.
3. H[R_i] is connected.
4. R_i has exact cyclic resource coverage.
5. The two fixed joining edges incident with T_i still join R_i to the other resources, and the fixed joining edge between the unchanged pair remains.
6. R_i is a strict subset of T_i.

Minimum total size may be invoked only after all family-validity gates pass and strictness is certified.

Target M3-CORE:

For every retained m=3, A=S minimum-total maximum family with the fixed choices above, at least one i in {1,2,3} has R_i a resource and R_i proper subset T_i.

If M3-CORE is proved, F_i' is a valid cardinality-three partial resource family with smaller total size, contradicting the minimum-total choice and excluding the retained m=3, A=S configuration.

If M3-CORE is not certified, do not broaden. For each of the at most three fixed sides record only the first obstruction: either R_i=T_i, or R_i is not a resource, in which case choose exactly one cyclic nonedge whose two endpoints both miss R_i.

If all three sides stop, record the bounded obstruction profile and end the unit. Do not choose new joining edges or trees, enter m=4, or return to the RL29 K-xz recovery in the same RL.

The RL29 one-coloring K-x extension task remains preserved but suspended by RL30's pivot unless a later argument supplies an independently sufficient obligation-closing payoff.

Programme ACTIVE.
