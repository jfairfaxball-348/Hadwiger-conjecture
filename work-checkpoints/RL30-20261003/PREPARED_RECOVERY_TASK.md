# RL30 prepared successor task — m=3 terminal-core resource-family exchange

Status: PREPARED ONLY / NOT ASSESSED / NOT PROMOTED.
Proposed successor: RL31.
Provenance: RL13 untouched m=3, A=S branch, selected by the RL30 audit pivot.
No RL31 mathematics has been executed.

## Root and exact domain

Keep full sharp Hadwiger h(G)>=chi(G) for every finite simple graph.

Work inside the full C_7 cyclic degree-seven domain inherited from RL13. Retain a maximum partial resource family

    F={T_1,T_2,T_3}

of cardinality m=3, chosen with minimum total size among maximum families, and assume

    U=T_1 union T_2 union T_3,
    N_H(U) intersect S = S.

Each T_i is a nonempty connected exterior resource. For every resource pair there is an actual joining edge.

This task is independent of the RL21–RL29 fixed m=2 choices. Do not import x, B, e=ab, L, P, V(P)=T_2, c, A, K, z, d, or xz.

## Fixed choices and numeric bounds

Fix exactly one actual joining edge for each pair:
- e_12 between T_1 and T_2;
- e_13 between T_1 and T_3;
- e_23 between T_2 and T_3.

For each i, let s_i,t_i be the endpoints in T_i of its two incident fixed joining edges; s_i=t_i is allowed.

Fix exactly one spanning tree Q_i of H[T_i].

Define R_i as the vertex set of the unique s_i-t_i path in Q_i, with R_i={s_i} when s_i=t_i.

There are at most three candidates, in fixed order i=1,2,3:

    F_i' = {R_i} union {T_j : j != i}.

No alternative joining edge, tree, core, resource family, coloring, path optimization or census is allowed in the work unit.

New mathematical source retrieval: 0 by default.
New numerical computation: 0.
Finite candidate bound: at most 3 analytic family-validity audits.

## Gates for each fixed candidate

Audit in order and stop that candidate at its first failed gate:

1. R_i nonempty and exterior.
2. Disjointness from the other two resources.
3. H[R_i] connected.
4. Exact cyclic resource coverage of R_i.
5. The two fixed joining edges incident with T_i still join R_i to the other resources, and the fixed joining edge between the unchanged pair remains.
6. Strict size: R_i proper subset T_i.

Gates 1,2,3 and the joining-edge part of gate 5 are expected from construction but must still be written explicitly. Minimum total size may be invoked only after all family-validity gates pass and strictness is certified.

## Target claim and independent sufficiency

Target M3-CORE:

> For every retained m=3, A=S minimum-total maximum family with the fixed choices above, at least one i in {1,2,3} has R_i a resource and R_i proper subset T_i.

If M3-CORE is proved, F_i' is a valid cardinality-three partial resource family with smaller total size, contradicting the minimum-total choice. Thus the retained m=3, A=S configuration is excluded. This gives an independently sufficient payoff rather than another consequence of the m=2 saturation/list frontier.

## Falsification and stopping criteria

If M3-CORE is not certified, do not broaden the search.

For each of the at most three fixed sides record only the first obstruction:
- either R_i=T_i (terminal-path saturation), or
- R_i is not a resource, in which case choose exactly one cyclic nonedge whose two endpoints both miss R_i.

If all three sides stop, record the resulting bounded obstruction profile and end the unit. Do not choose new join edges/trees, enter m=4, or return to the RL29 K-xz recovery in the same RL.

## Retry discipline

The preserved RL29 one-coloring extension task is not deleted. It may be reconsidered only if a later audit/argument supplies an independently sufficient obligation-closing payoff that justifies re-entering the m=2 nested frontier.

Programme ACTIVE.
