# RL45 fixed-u_4 two-color component recolorability report

Date: 2026-10-04.
Status: CLOSED/FROZEN on promotion.
Scope: exactly one local two-color component recolorability audit using colors 2 and 6 in the fixed actual aligned e_0 full-H coloring.

## Result RL45-P01 — A2 forces u_3 and u_4 into the same {2,6}-component

Retain the exact RL41 attachment triple

    A_1={u_1,u_3,u_5,u_6},
    A_2={u_0,u_1,u_3,u_5},
    A_3={u_1,u_2,u_4,u_6},

with the retained maximum partial resource family F={T_1,T_2,T_3}, m=3 and A=S.

Fix exactly the actual inherited e_0={u_0,u_1} full-H six-coloring aligned as

    c(u_0)=c(u_1)=1,
    c(u_3)=2,
    c(u_2)=3,
    c(u_5)=4,
    c(u_6)=5,
    c(u_4)=6.

Let K be the connected component of the induced subgraph H[c^{-1}({2,6})] containing u_4.

Swap colors 2 and 6 on every vertex of K, leaving all other colors unchanged. This is a proper coloring of the actual full H. Edges with both ends in K remain properly colored after exchanging the two colors. If an edge has exactly one end in K, its other end cannot have color 2 or 6 under c, because then that endpoint would lie in the same {2,6}-component K. Hence no boundary edge becomes monochromatic.

The only vertices of S colored 2 or 6 under c are u_3 and u_4 respectively. If u_3 were not in K, the swap would change only u_4 among the vertices of S: u_4 would become color 2, u_3 would remain color 2, and every other prescribed S-color would remain fixed. The restriction to S would then be exactly

    u_0=u_1=1,
    u_3=u_4=2,
    u_2=3,
    u_5=4,
    u_6=5.

That would be a genuine proper H -> [6] using only five colors on S, contradicting A2.

Therefore

    u_3 and u_4 lie in the same connected component of H[c^{-1}({2,6})].

Consequently the prescribed whole-component swap cannot preserve the required color of u_3: it sends u_3 from 2 to 6 while sending u_4 from 6 to 2. Thus the audited mechanism does not produce the target five-color partition and does not exclude the fixed RL41 triple.

Classification: **proved scoped analytic two-color-component obstruction, same-worker review only.**

## First missing implication

RL45 stops under allowed outcome (3).

Name the sharpened first missing implication

    M3-RL41-A2-26-COMPONENT-SEPARATION.

Its exact meaning is: derive from one independently justified retained resource/attachment interface consequence that the A2-forced common {2,6}-component containing u_3 and u_4 is impossible for the fixed RL41 configuration, or derive an equivalent A2 contradiction while preserving the prescribed colors on S minus {u_4}.

This does not certify the broader target M3-RL41-A2-U4-CONFLICT-RECOLOR.

## Stopping classification and obligations

Correction/demotion: NONE.
No named inherited universal mathematical obligation was genuinely reduced.

RL41-P01: preserved exactly at its recorded scope.
RL41-P02: preserved exactly at its recorded scope.
RL42-P01: preserved exactly at its recorded scope.
RL43-P01: preserved exactly at its recorded scope.
RL44-P01: preserved exactly at its recorded scope.

M3-RL41-A2-U4-CONFLICT-RECOLOR remains open.
M3-CORE remains NOT CERTIFIED.
The retained m=3,A=S configuration remains open.
Full critical realizability of the fixed RL41 triple remains open.
The full sharp Hadwiger conjecture remains open.

FL-043 through FL-047 remain in force exactly at their recorded scopes and retry conditions. FL-048 records the new whole-component recoloring barrier.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
No prohibited census was run.
No formal proof checker or independent external red team was required or run.

Selected successor: RL46, one bounded fixed-{2,6}-component resource-interface separation audit.

Programme ACTIVE.
