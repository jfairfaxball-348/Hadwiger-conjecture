# RL41 direct three-resource rooted-K6 boundary-selection report

Date: 2026-10-04.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the retained full-C7 degree-seven m=3,A=S boundary-selection assessment authorized by the RL41 brief.

## Result RL41-P01 — explicit boundary-level counterpattern

Write S={u_0,...,u_6}, indices modulo 7, and let the complement-cycle edges be the cyclic pairs u_i u_(i+1).

Set

    D_1={u_0,u_2,u_4},      A_1=S\D_1={u_1,u_3,u_5,u_6},
    D_2={u_2,u_4,u_6},      A_2=S\D_2={u_0,u_1,u_3,u_5},
    D_3={u_0,u_3,u_5},      A_3=S\D_3={u_1,u_2,u_4,u_6}.

Each D_i is independent in C7, hence each A_i is a vertex cover of C7. Also A_1 union A_2 union A_3=S. Thus the triple satisfies every boundary-set premise of M3-DIRECT-ROOTED-K6-SELECTION.

For the obstruction, define for any t modulo 7

    D_t={u_t,u_(t+2),u_(t+4)},   A_t=S\D_t.

Suppose r is in A_t and J is an independent three-set in C7, disjoint from r, satisfying the RL41 compatibility condition. Equivalently, every member of J∩D_t is nonconsecutive to r in C7.

There are four possible roots.

- If r=u_(t+1), both C7-neighbors u_t,u_(t+2) lie in D_t and are forbidden. After deleting those vertices and r, the eligible vertices induce P4, so no independent three-set J exists.
- If r=u_(t+3), both C7-neighbors u_(t+2),u_(t+4) lie in D_t and are forbidden. Again the eligible vertices induce P4, so no J exists.
- If r=u_(t+5), only u_(t+4) among its two C7-neighbors lies in D_t. The remaining eligible vertices induce P5, whose unique independent three-set is {u_(t+6),u_(t+1),u_(t+3)}.
- If r=u_(t+6), only u_t among its two C7-neighbors lies in D_t. The remaining eligible vertices induce P5, whose unique independent three-set is {u_(t+1),u_(t+3),u_(t+5)}.

Hence the only admissible J for A_t are

    {u_(t+6),u_(t+1),u_(t+3)}
    and
    {u_(t+1),u_(t+3),u_(t+5)}.

Applying this to D_1=D_0, D_2=D_2, and D_3=D_3 gives

    A_1: J in {{u_6,u_1,u_3},{u_1,u_3,u_5}},
    A_2: J in {{u_1,u_3,u_5},{u_3,u_5,u_0}},
    A_3: J in {{u_2,u_4,u_6},{u_4,u_6,u_1}}.

The first two lists intersect only in {u_1,u_3,u_5}, which is not admissible for A_3. Therefore no common J exists at all. In particular there are no distinct roots r_i and common J satisfying the target.

Thus M3-DIRECT-ROOTED-K6-SELECTION is FALSE at the stated boundary-set scope.

Classification: proved scoped analytic counterpattern to the boundary-level universal candidate, same-worker review only. This is not a finite graph counterexample to Hadwiger, not a proof of full critical realizability, and not a demotion of any inherited resource result.

## Result RL41-P02 — conditional rooted-K6/K7-minor sufficiency

Assume instead that distinct roots r_i in A_i and a common three-set J satisfying the RL41 target do exist. Define

    B_i=T_i union {r_i},  i=1,2,3,

and use singleton branch sets {s} for s in J.

The six branch sets are nonempty. They are pairwise vertex-disjoint because the T_i are pairwise disjoint and exterior, the roots are distinct, and J avoids the roots. Each B_i is connected because r_i in A_i means r_i has a neighbor in T_i. Every branch set meets S.

All fifteen pairwise adjacencies hold:

- the 3 B_i-B_j adjacencies are supplied by the original T_i-T_j joining edges;
- the 3 singleton-singleton adjacencies are supplied by independence of J in the complement C7, equivalently adjacency in H[S];
- the 9 B_i-{s} adjacencies hold because either s in A_i, giving an edge from s to T_i, or r_i s is an edge of H[S].

Therefore these six branch sets form an S-rooted K6 in H. Adding singleton {v} gives a K7 minor of G because v is adjacent to every selected S-root. At the retained full-C7 critical scope this would contradict the inherited proper-minor condition.

RL41-P02 is therefore a proved scoped analytic implication. Its antecedent is not universally guaranteed, by RL41-P01.

## Obligation accounting

Correction/demotion: NONE.

No named inherited universal mathematical obligation was genuinely reduced. RL39-P01 and the RL40 audit remain unchanged at their exact scopes.

M3-CORE remains NOT CERTIFIED.
The retained m=3,A=S configuration remains open.
The full sharp Hadwiger conjecture remains open.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
No graph, coloring, list, neighborhood-subset, vertex-cover, cyclic-distance, seven-nonedge, or attachment-triple census was run.

## Successor frontier

RL42 must test exactly whether the original maximum partial resource-family semantics impose an additional cross-resource boundary constraint that excludes this exact RL41 counterpattern. It must not enumerate further boundary triples or resume the RL31-RL39 terminal-core/nearest-witness mechanism.

Programme ACTIVE.
