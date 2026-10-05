# RL49 A2 pivotal-edge three-color joint Kempe-repair report

Date: 2026-10-05.
Status: CLOSED/FROZEN on promotion.
Scope: exactly one genuinely three-color joint two-endpoint Kempe mechanism using common defect color alpha and the single auxiliary pair {1,3}.

## Result RL49-P01 — full criticality forces second-order three-color Kempe stability, but that stability still permits the pivotal bridge

Retain exactly the RL49 domain: the fixed RL41 attachment triple
    A_1={u_1,u_3,u_5,u_6},
    A_2={u_0,u_1,u_3,u_5},
    A_3={u_1,u_2,u_4,u_6},
with m=3 and A=S; the inherited e_0={u_0,u_1} full-H coloring
    c(u_0)=c(u_1)=1, c(u_3)=2, c(u_2)=3, c(u_5)=4, c(u_6)=5, c(u_4)=6;
the target S partition
    u_0=u_1=1, u_3=u_4=2, u_2=3, u_5=4, u_6=5;
and the RL47/RL48 pivotal edge e=xy and sole-defect coloring c_e.

RL48-P01 gives a proper six-coloring of G-e with c_e(x)=c_e(y)=alpha, where alpha is in {2,6}, and proves that x and y lie in the same {alpha,beta}-component for every beta distinct from alpha.

RL49 chooses exactly one auxiliary pair, {1,3}. Let C be any connected component of the subgraph of G-e induced by colors {1,3}. Swap colors 1 and 3 on C, obtaining a proper six-coloring c_C of G-e. Since alpha is in {2,6}, both defect endpoints remain colored alpha.

Fix delta in {1,3}. If x and y lie in different {alpha,delta}-components under c_C, swap alpha and delta on the component containing x. Properness on G-e is preserved, exactly one endpoint changes away from alpha, and restoring e yields a proper six-coloring of G. This contradicts chi(G)=7.

Therefore, after every first-stage 1<->3 Kempe-component swap, x and y remain in the same {alpha,1}-component and the same {alpha,3}-component. This is a genuinely three-color second-order stability consequence, not merely the original RL48 unperturbed pairwise coupling.

### Explicit insufficiency obstruction

Use exactly the inherited RL48 symbolic interface. After the pivotal-edge partial swap, take x_1=x_3=6, so alpha=6. The relevant endpoint-coupling witnesses are
    x_1-u_1-x_3  for colors {6,1},
    x_1-x_2-x_3  for colors {6,3}.

By A_2={u_0,u_1,u_3,u_5}, x_2 is adjacent to u_1. Hence u_1 and x_2 lie in the same {1,3}-component.

A first-stage 1<->3 swap on any other component leaves both witness paths unchanged. A swap on the component containing u_1 and x_2 exchanges their colors, so the two displayed paths exchange auxiliary-color roles. Thus, after every allowed first-stage {1,3} component swap, the defect endpoints remain coupled in both required {6,1} and {6,3} subgraphs. The inherited {2,6} pivotal bridge u_3-x_1-x_3-u_4 is untouched.

Classification: **proved scoped analytic second-order three-color Kempe-stability necessity plus explicit symbolic insufficiency obstruction at the audited three-color interface, same-worker review only.**

The symbolic model is not asserted to satisfy A2 globally, chi(G)=7, the proper-minor condition, full-C7 criticality, or full critical realizability. It is not a finite Hadwiger counterexample.

## Consequence for the RL49 target

RL49 stops under allowed outcome (2): one explicit symbolic obstruction at exactly the audited three-color interface.

M3-RL41-A2-26-PIVOTAL-EDGE-THREE-COLOR-JOINT-KEMPE-REPAIR is not proved. The tested two-stage operation yields a genuine full-criticality consequence on the actual graph, but the symbolic interface shows that this second-order stability still does not force repair of the pivotal defect.

The first surviving missing implication is stronger interaction control than invariance under one auxiliary-pair component exchange. Merely choosing another auxiliary pair or replaying the same two-stage template is not a changed mechanism.

## Stopping classification and obligations

Correction/demotion: NONE.
No named inherited universal mathematical obligation was genuinely reduced.
RL41-P01, RL41-P02, RL42-P01, RL43-P01, RL44-P01, RL45-P01, RL46-P01, RL47-P01 and RL48-P01 are preserved exactly.
M3-RL41-A2-26-COMPONENT-SEPARATION remains open on the retained actual H.
M3-RL41-A2-U4-CONFLICT-RECOLOR remains open.
M3-RL41-A2-26-PIVOTAL-EDGE-TWO-ENDPOINT-REPAIR remains not certified.
M3-RL41-A2-26-PIVOTAL-EDGE-THREE-COLOR-JOINT-KEMPE-REPAIR is not certified.
M3-CORE remains NOT CERTIFIED.
The retained m=3,A=S configuration remains open.
Full critical realizability of the fixed RL41 triple remains open.
The full sharp Hadwiger conjecture remains open.

FL-043 through FL-051 remain in force exactly at their recorded scopes and retry conditions. FL-052 records the new three-color second-order stability insufficiency barrier.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
No prohibited census was run.
No formal proof checker or independent external red team was required or run.

Selected successor: RL50, the mandatory progress/correction audit of RL40-RL49 under docs/TENTH_SESSION_PROGRESS_AUDIT.md.
Programme ACTIVE.
