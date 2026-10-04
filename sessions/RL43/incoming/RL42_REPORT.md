# RL42 maximum-resource boundary-compatibility report

Date: 2026-10-04.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the fixed RL41 counterpattern compatibility audit authorized by the RL42 brief.

## Result RL42-P01 — fixed counterpattern is compatible with the original maximum-resource interface

Retain S={u_0,...,u_6} with boundary graph H[S]=K7-C7, and the exact RL41 attachment triple

    A_1={u_1,u_3,u_5,u_6},
    A_2={u_0,u_1,u_3,u_5},
    A_3={u_1,u_2,u_4,u_6}.

Define a symbolic interface graph H* with vertex set S union {x_1,x_2,x_3}. On S use exactly K7-C7. Add all three joining edges x_1x_2, x_1x_3, x_2x_3, and make x_i adjacent to exactly the vertices of A_i in S. Add no other vertices or edges. Put T_i={x_i}.

Then each T_i is nonempty, connected, and exterior; the T_i are pairwise vertex-disjoint; and every pair T_i,T_j has an actual joining edge. Moreover N_{H*}(T_i) intersect S=A_i for each i. By RL41-P01, each A_i is a vertex cover of the complement C7, equivalently every cyclic nonedge has at least one endpoint with a neighbor in T_i. Thus every T_i satisfies the original RL13 resource-coverage condition. Also N_{H*}(T_1 union T_2 union T_3) intersect S=S.

The family F={T_1,T_2,T_3} is maximum under the original partial-resource-family semantics. H*-S has exactly the three vertices x_1,x_2,x_3. Every resource is nonempty and members of a partial resource family are pairwise vertex-disjoint, so no partial resource family in H* can contain more than three resources. F has three.

If the RL13 minimum-total-size tie-breaker among maximum families is retained, F also satisfies it automatically: any three pairwise disjoint nonempty resources have total size at least three, while |T_1|+|T_2|+|T_3|=3.

Therefore the original formal resource-family axioms, including maximum-family structure and the retained minimum-total-size tie-breaker, do not by themselves force a cross-A_i condition excluding the fixed RL41 triple.

Classification: proved scoped analytic resource-interface compatibility model, same-worker review only.

This model is not asserted to satisfy full-C7 criticality, chi(H)=6, A2 colorfulness, the star-minor coloring inputs, or the proper-minor condition. It is not a full critical realization and is not a counterexample to Hadwiger.

## Consequence for M3-RL41-COUNTERPATTERN-MAXIMALITY-COMPATIBILITY

The requested exclusion fails at the original resource-interface scope. Maximum-family semantics regulate the existence of an additional disjoint resource that is pairwise joined to the retained family; they do not impose a universal additional relation among A_1,A_2,A_3 strong enough to rule out this exact triple.

RL41-P01 and RL41-P02 remain unchanged at their exact scopes.

## Obligation accounting

Correction/demotion: NONE.
No named inherited universal mathematical obligation was genuinely reduced.

M3-CORE remains NOT CERTIFIED.
The retained m=3,A=S configuration remains open.
Full critical realizability of the RL41 triple remains open.
The full sharp Hadwiger conjecture remains open.

FL-043 remains in force: the RL31-RL39 terminal-core / least-miss / blocker / nearest-witness mechanism stays suspended under its recorded retry condition.

FL-044 remains in force, now sharpened operationally by RL42: a retry of direct rooted-K6 selection cannot rely only on individual attachment-cover data, union=S, or original maximum-resource-family semantics.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
No graph, coloring, list, neighborhood-subset, vertex-cover, cyclic-distance, seven-nonedge, attachment-triple, or resource-family census was run.

## Successor frontier

RL43 must keep the same fixed attachment triple and audit exactly whether the inherited full-C7 criticality inputs, beyond the original resource-family/maximality interface, force a contradiction. It must not enumerate alternative attachment triples, enter m=4, return to m=2, or resume the RL31-RL39 terminal-core machinery.

Programme ACTIVE.
