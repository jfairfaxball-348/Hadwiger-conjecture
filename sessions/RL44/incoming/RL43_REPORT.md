# RL43 fixed-counterpattern criticality-compatibility report

Date: 2026-10-04.
Status: CLOSED/FROZEN on promotion.
Scope: exactly one analytic audit of the fixed RL41 attachment triple against inherited full-C7 criticality inputs beyond original resource maximality.

## Result RL43-P01 — fixed counterpattern survives the audited quotient/star criticality interfaces

Retain

    S={u_0,...,u_6},  H[S]=K7-C7,

and exactly

    A_1={u_1,u_3,u_5,u_6},
    A_2={u_0,u_1,u_3,u_5},
    A_3={u_1,u_2,u_4,u_6}.

Put D_i=S\A_i. Thus

    D_1={u_0,u_2,u_4},
    D_2={u_2,u_4,u_6},
    D_3={u_0,u_3,u_5}.

Each D_i is independent in the complement cycle C7, as already certified by RL41-P01.

Let Q be the RL42 interface graph on S union {x_1,x_2,x_3}: H[S]=K7-C7, the x_i form a triangle, and N_Q(x_i) intersect S=A_i. In any actual retained full-C7 realization, contracting each connected T_i to x_i and deleting v and all other exterior vertices produces Q as a proper minor.

The direct proper-minor condition does not exclude Q. Indeed Q has the following proper five-coloring:

    u_0=u_1=1,
    u_3=u_4=2,
    u_2=3,
    u_5=4,
    u_6=5,
    x_1=3,
    x_2=5,
    x_3=4.

The only repeated S-pairs are the actual nonedges u_0u_1 and u_3u_4. The colors of x_1,x_2,x_3 occur on u_2 in D_1, u_6 in D_2, and u_5 in D_3 respectively, so no x_i conflicts with A_i, and the x_i receive distinct colors.

Moreover Q is not four-colorable. In any four-coloring of K7-C7, every color class has size at most two, so the seven S vertices have class sizes 2,2,2,1. A doubled S-color class is a cyclic pair and therefore cannot be contained in any D_i, since every D_i is independent in C7. Hence each x_i could reuse only the unique singleton S-color, impossible because x_1x_2x_3 is a triangle. Thus chi(Q)=5.

For every cyclic pair e_j={u_j,u_(j+1)}, Q also admits the exact inherited six-color star pattern with e_j as the unique repeated S-color class. Give e_j one color and the other five S vertices five distinct colors. For each i put E_i=D_i\e_j. Since D_i contains no cyclic edge, |E_i|>=2. Also D_2 and D_3 are disjoint, so E_2 and E_3 are disjoint. Hall's condition therefore gives distinct representatives d_i in E_i. Color x_i with the singleton color of d_i. Each such color is absent from A_i and the three x_i colors are distinct. This proves all seven star-pattern interfaces uniformly, without a coloring census.

Finally define the symbolic graph

    H^dagger = Q disjoint-union K6

and retain T_i={x_i}. Then:
- chi(H^dagger)=6;
- the original RL13 resource axioms hold for T_1,T_2,T_3;
- the family is maximum, since every resource must use at least one x_i, and minimum total size among maximum three-resource families;
- all seven star-pattern coloring-existence interfaces hold, by combining the corresponding coloring of Q with a six-coloring of the K6 component.

Thus the fixed RL41 triple is compatible with the original resource interface, exact chi(H)=6, the canonical proper-minor quotient requirement at Q, and all seven inherited star-pattern coloring-existence interfaces.

Classification: proved scoped analytic criticality-interface compatibility/barrier, same-worker review only.

H^dagger is NOT a full-C7 critical realization. It fails A2: combine the displayed five-coloring of Q with a six-coloring of the disjoint K6 component to obtain a proper H^dagger -> [6] using only five colors on S.

## First missing implication

The first criticality input not captured by the surviving symbolic interface is A2 colorfulness, equivalently the chi(G)=7 obstruction to a proper six-coloring of H missing a color on S.

To turn the displayed five-color-on-S quotient coloring into an A2 contradiction for an actual retained graph, one needs an independently justified extension/uncontraction statement through the arbitrary connected resource interiors T_i and every residual component of

    H-(S union T_1 union T_2 union T_3).

The inherited proper-minor condition colors contracted/deleted minors; it does not lift an arbitrary quotient coloring through resource interiors. Nor does it guarantee that every residual component extends a prescribed boundary coloring. RL13 explicitly identified this lift defect at A=S.

Name the missing implication:

    M3-RL41-A2-INTERFACE-LIFT.

At its sharp form for the next gate: prove that the exact target five-color partition on S exhibited above extends to a proper H -> [6] under the retained full-C7 hypotheses and fixed attachment triple, or derive an equivalent A2-based attachment contradiction without silently assuming such a lift.

No such implication is certified in RL43.

## Stopping classification and obligations

RL43 stops under allowed outcome (3): the first missing implication between inherited criticality and exclusion of the fixed triple.

Correction/demotion: NONE.
No named inherited universal mathematical obligation was genuinely reduced.

RL41-P01, RL41-P02 and RL42-P01 remain unchanged at their exact scopes.
M3-CORE remains NOT CERTIFIED.
The retained m=3,A=S configuration remains open.
Full critical realizability of the fixed triple remains open.
The full sharp Hadwiger conjecture remains open.

FL-043, FL-044 and FL-045 remain in force with their recorded retry conditions. FL-046 records the new quotient/star-interface non-exclusion and the A2 lift gap.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
No prohibited census was run.

Selected successor: RL44, one bounded fixed-counterpattern A2 interface-lift feasibility audit.

Programme ACTIVE.
