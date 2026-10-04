# RL43 fixed-counterpattern criticality-compatibility report

Date: 2026-10-04.
Status: OPEN checkpoint; NOT PROMOTED.
Scope: exactly one analytic audit of the fixed RL41 attachment triple against inherited full-C7 criticality inputs beyond original resource maximality.

## 1. Fixed interface

Retain
S={u_0,...,u_6},  H[S]=K7-C7,

A_1={u_1,u_3,u_5,u_6},
A_2={u_0,u_1,u_3,u_5},
A_3={u_1,u_2,u_4,u_6}.

Let D_i=S\A_i, so
D_1={u_0,u_2,u_4},
D_2={u_2,u_4,u_6},
D_3={u_0,u_3,u_5}.

Each D_i is independent in the complement cycle C7, equivalently each A_i is a cyclic-edge cover, exactly as preserved by RL41-P01.

Define Q on S union {x_1,x_2,x_3} by H[S]=K7-C7, x_1x_2x_3 a triangle, and N_Q(x_i) intersect S=A_i. This is exactly the RL42 interface graph.

For any actual retained full-C7 graph with resources T_i, contracting each connected T_i to x_i and deleting v and every other exterior vertex produces Q as a proper minor. Therefore the inherited proper-minor condition yields only the necessary demand chi(Q)<=6 at this direct quotient.

## 2. The canonical proper-minor quotient passes

Q is in fact 5-colorable.

Use colors 1,...,5:
u_0=u_1=1,
u_3=u_4=2,
u_2=3,
u_5=4,
u_6=5,

and
x_1=3,
x_2=5,
x_3=4.

The only repeated S-pairs are the cyclic nonedges u_0u_1 and u_3u_4. For x_1, its color 3 occurs on u_2 in D_1; for x_2, color 5 occurs on u_6 in D_2; for x_3, color 4 occurs on u_5 in D_3. Hence no x_i conflicts with its S-neighborhood, and the x_i receive distinct colors on their triangle.

Thus the most direct proper-minor consequence of full criticality does not exclude the fixed triple.

Moreover Q is not 4-colorable. Any four-coloring of K7-C7 has class sizes 2,2,2,1. Since each D_i is independent in C7, no doubled S-color class can lie wholly in D_i; an x_i can reuse only the unique singleton S-color. Because x_1,x_2,x_3 form a triangle, three distinct reusable colors would be needed. Hence chi(Q)=5. This lower bound is interface information only and is not a full-critical realization.

## 3. All seven star-pattern interfaces also pass without enumeration

Fix any cyclic pair e_j={u_j,u_(j+1)}. Give its two vertices one color and give the other five vertices of S five further distinct colors, so S uses six colors with e_j as the unique repeated class.

For i=1,2,3 put E_i=D_i\e_j. Because D_i contains no cyclic edge, e_j meets D_i in at most one vertex, so |E_i|>=2. Also D_2 and D_3 are disjoint, hence E_2 and E_3 are disjoint.

The three sets E_i have a system of distinct representatives: each has size at least two, every two-set union has size at least two, and the total union has size at least |E_2|+|E_3|>=4. By Hall's condition choose distinct d_i in E_i.

Color x_i with the singleton color of d_i. Since d_i lies in D_i and outside the repeated pair, that color appears on no vertex of A_i. Distinct d_i give distinct colors to the x_i triangle. Therefore Q has a proper six-coloring with e_j as the unique repeated S-color class for every j, proved uniformly rather than by a seven-case census.

Consequently the fixed triple is compatible with the exact star-pattern coloring interface inherited from the seven original-G star minors.

## 4. A symbolic near-critical H-interface

Let H^dagger be the disjoint union Q disjoint-union K6. Keep T_i={x_i}.

Then:
- chi(H^dagger)=6, because K6 is a component and Q is 5-colorable;
- each T_i is a nonempty connected exterior resource with S-neighborhood A_i;
- T_1,T_2,T_3 are pairwise disjoint and pairwise joined;
- no connected set contained in the K6 component has any S-neighbor, hence no such set is a resource;
- no connected resource can mix the two components;
- every resource in the Q exterior uses at least one of x_1,x_2,x_3, so a pairwise-disjoint resource family has size at most three;
- the singleton family has size three and total size three, hence is maximum and minimum-total-size among maximum three-resource families;
- for each cyclic pair e_j, the star-pattern coloring of Q above combines with an arbitrary six-coloring of the K6 component to give a proper six-coloring of H^dagger with e_j as the unique repeated S-color class.

Thus the fixed triple is compatible with the original resource interface, exact chi(H)=6, and all seven star-pattern coloring-existence inputs.

Classification: explicit symbolic near-critical interface model only. It is NOT a full-C7 critical realization.

## 5. Exact failure at A2

H^dagger fails A2. Combine the displayed five-coloring of Q with a six-coloring of the disjoint K6 component. This is a proper H^dagger -> [6] using only five colors on S.

Equivalently, if one adjoins a vertex v adjacent exactly to S, that coloring leaves one color absent from S and colors v with it; the resulting graph is not 7-chromatic. No full criticality is claimed.

This isolates the first criticality premise not captured by the surviving interface: A2 colorfulness, equivalently the chi(G)=7 obstruction to a six-coloring of H missing a color on S.

## 6. First missing implication

To use A2 to exclude the fixed triple, one must derive from the actual full graph a proper six-coloring of H using at most five colors on S.

The fixed attachment data do provide a five-color-on-S coloring after contracting the T_i to the interface vertices x_i. But the inherited proper-minor condition colors contracted/deleted minors; it does not provide an uncontraction or extension back through arbitrary connected resource interiors. Nor does it extend a prescribed boundary coloring through every residual component of H-(S union T_1 union T_2 union T_3).

This is exactly the lift defect already isolated by RL13 at A=S: an arbitrary quotient coloring need not lift through connected interiors, and residual components can be inextendible against a fixed boundary coloring.

Therefore the first missing implication is:

M3-RL41-A2-INTERFACE-LIFT:
under the retained full-C7 hypotheses and the exact fixed triple, prove that some proper five-color-on-S coloring of the contracted/resource interface extends to a proper H -> [6], or derive an equivalent criticality consequence that excludes the triple without such a lift.

No such implication is presently certified.

## 7. Stopping classification and obligations

Stopping outcome: (3) the first missing implication between inherited criticality and exclusion of the fixed triple.

Correction/demotion: NONE.
Named inherited universal mathematical obligations genuinely reduced: NONE.

RL41-P01, RL41-P02 and RL42-P01 remain unchanged at their exact scopes.
M3-CORE remains NOT CERTIFIED.
The retained m=3,A=S configuration remains open.
Full critical realizability of the fixed triple remains open.
Full sharp Hadwiger remains open.

FL-043, FL-044 and FL-045 remain in force with their existing retry conditions.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
No prohibited census was run.

Selected bounded successor if RL43 is closed: one RL44 fixed-counterpattern A2 interface-lift feasibility audit. It may test only M3-RL41-A2-INTERFACE-LIFT for the displayed five-color interface pattern, keeping arbitrary resource interiors and residual components explicit; no alternative attachment triples, m=4, m=2 replay, or RL31-RL39 machinery.
