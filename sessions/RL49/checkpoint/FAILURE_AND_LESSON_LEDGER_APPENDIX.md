# FL-052 — three-color second-order Kempe stability still permits the pivotal bridge

Date: 2026-10-05.
Origin: RL49 A2 pivotal-edge three-color joint Kempe-repair audit.
Classification: three-color full-criticality interaction insufficiency barrier accompanying RL49-P01; not a mathematical error, theorem demotion, full critical realization, finite Hadwiger counterexample, or source-status change.

Expectation tested: whether one genuinely three-color joint two-endpoint Kempe mechanism, using common defect color alpha and exactly two alternative colors simultaneously, repairs the RL48 sole defect or turns unavoidable failure into a contradiction with an inherited full-criticality premise.

Changed mechanism: fix exactly the auxiliary pair {1,3}. Starting from the RL48 proper six-coloring c_e of G-e with c_e(x)=c_e(y)=alpha, first swap colors 1 and 3 on one connected component C of the {1,3}-subgraph. This leaves x and y colored alpha. Then test whether x and y remain coupled in the {alpha,1}- and {alpha,3}-subgraphs of the perturbed coloring.

Actual analytic consequence: for every {1,3}-component C, after the 1<->3 swap on C the endpoints x and y must still lie in the same {alpha,delta}-component for each delta in {1,3}. Otherwise swapping alpha and delta on the component containing exactly one endpoint changes exactly one of x,y; restoring e then gives a proper six-coloring of G, contradicting chi(G)=7.

This is a genuinely three-color, second-order Kempe-stability consequence and is stronger than merely restating RL48 pairwise coupling in the unperturbed coloring.

Explicit symbolic insufficiency: in the inherited RL48 symbolic interface take alpha=6 and auxiliary pair {1,3}. The color-1 witness path is x_1-u_1-x_3 and the color-3 witness path is x_1-x_2-x_3. Because u_1 is in A_2, the edge u_1x_2 exists, so u_1 and x_2 lie in the same {1,3}-component. A 1<->3 swap on any other component leaves both witness paths unchanged. A swap on their common component exchanges the colors of u_1 and x_2, so the two displayed endpoint-coupling paths exchange roles. Thus both required post-perturbation couplings survive every allowed first-stage {1,3} component swap while the original {2,6} pivotal bridge remains untouched.

First missing implication: second-order stability under one fixed auxiliary-color component exchange still does not force a defect-repairing joint exchange. Any future retry must introduce a genuinely stronger full-criticality interaction than stability under a single auxiliary-pair perturbation, and may not merely enumerate other auxiliary pairs or replay the same two-stage template.

Surviving valid scope: RL49-P01 proves the stated second-order stability necessity on the actual G-e for the fixed auxiliary pair {1,3}. The symbolic obstruction satisfies exactly the inherited resource/proper-coloring/pivotal-edge/RL47-saturation/RL48-pairwise-coupling/RL49-second-order-stability interface. It is not asserted to satisfy A2 globally, chi(G)=7, the proper-minor condition, full-C7 criticality, or full critical realizability.

Downstream effect: RL41-P01/P02 and RL42-P01 through RL48-P01 remain unchanged. M3-RL41-A2-26-COMPONENT-SEPARATION remains open on the actual H. M3-RL41-A2-U4-CONFLICT-RECOLOR remains open. M3-RL41-A2-26-PIVOTAL-EDGE-TWO-ENDPOINT-REPAIR remains not certified. M3-RL41-A2-26-PIVOTAL-EDGE-THREE-COLOR-JOINT-KEMPE-REPAIR is not certified. M3-CORE remains NOT CERTIFIED; the retained m=3,A=S configuration remains open; full critical realizability of the fixed triple remains open; full sharp Hadwiger remains open.

Correction/demotion: NONE.
No named inherited universal mathematical obligation was genuinely reduced.

Retry condition: RL50 is the mandatory every-tenth-session progress/correction audit and must review RL40-RL49 before further theorem discovery. Any later return to this mechanism must be justified by that audit and must change the interaction premise rather than substitute another auxiliary pair or repeat one auxiliary-component swap followed by one defect-color swap.

Sources/computation: zero new mathematical source retrieval and zero mathematical numerical computation.
No prohibited census was run.
Programme ACTIVE.
