# RL47 A2 color-sensitive resource-bridge restriction report

Date: 2026-10-04.
Status: CLOSED/FROZEN on promotion.
Scope: exactly one A2-derived color-sensitive restriction on an RL46-type {2,6} bridge for the fixed RL41 configuration.

## Result RL47-P01 — A2 forces pivotal-edge endpoint saturation, but that restriction does not exclude the RL46 bridge

Retain exactly the fixed RL41 attachment triple

    A_1={u_1,u_3,u_5,u_6},
    A_2={u_0,u_1,u_3,u_5},
    A_3={u_1,u_2,u_4,u_6},

with m=3 and A=S, and retain the actual aligned e_0 full-H coloring

    c(u_0)=c(u_1)=1,
    c(u_3)=2,
    c(u_2)=3,
    c(u_5)=4,
    c(u_6)=5,
    c(u_4)=6.

By RL45-P01, u_3 and u_4 lie in the same component K of H[c^{-1}({2,6})].

Let e=xy be an edge of K with x,y outside S such that u_3 and u_4 lie in different components of K-e. Let W be the component of K-e containing u_4. Swap colors 2 and 6 on all vertices of W and leave all other colors unchanged; call the resulting map c_e.

Every edge of H-e is proper under c_e. If an edge of H-e left W with its outside endpoint colored 2 or 6 under c, that endpoint would lie in the same {2,6}-component of K-e, contrary to the definition of W.

Because u_4 is in W and u_3 is not, the restriction of c_e to S is exactly

    u_0=u_1=1,
    u_3=u_4=2,
    u_2=3,
    u_5=4,
    u_6=5.

Exactly one endpoint of e is swapped, so c_e(x)=c_e(y)=alpha for one alpha in {2,6}. Thus e is the sole monochromatic defect.

A2 now gives the genuinely color-sensitive consequence. For either endpoint z in {x,y} and every beta in [6]\{alpha}, z must have a beta-colored neighbor in H-e under c_e. Otherwise recoloring z with beta repairs the sole defect, remains proper on every other edge, leaves S unchanged, and gives a proper six-coloring of full H whose restriction to S uses only five colors, contradicting A2.

Therefore every exterior pivotal {2,6} bridge edge separating u_3 from u_4 is five-color saturated at both endpoints after the one-side partial swap.

### Explicit insufficiency obstruction

This necessary A2 consequence does not by itself forbid an RL46-type bridge.

Start with the exact RL42-P01/RL46-P01 singleton-resource interface H*. Add one exterior vertex r adjacent only to x_3. Keep

    c(x_1)=6,
    c(x_2)=3,
    c(x_3)=2,
    c(r)=4.

The retained resource interface is unchanged: T_i={x_i}; the x_i are pairwise adjacent; their S-neighborhoods are exactly A_i; r has no S-neighbor and is not a resource; the maximum family still has size three and total size three remains minimum among maximum three-resource families.

The {2,6}-path

    u_3-x_1-x_3-u_4

remains. Take e=x_1x_3 and delete e. Swapping the u_4-side component {x_3,u_4} produces the target five-color partition on S and makes x_1,x_3 both color 6, with e as the sole defect.

Both endpoints satisfy the derived saturation requirement:

    x_1 sees colors 1,2,3,4,5 via u_1,u_3,x_2,u_5,u_6;

    x_3 sees colors 1,2,3,4,5 via u_1,u_4,u_2,r,u_6.

Hence the exact audited color-sensitive pivotal-edge saturation condition is compatible with the RL46-type bridge.

Classification: **proved scoped analytic A2 pivotal-edge saturation necessity plus explicit symbolic insufficiency obstruction at that audited color-sensitive interface, same-worker review only.**

The symbolic model is not asserted to satisfy A2 globally, chi(H)=6, the proper-minor condition, full-C7 criticality, or full critical realizability. It is not a finite Hadwiger counterexample.

## Consequence for the RL47 target

RL47 stops under allowed outcome (2).

M3-RL41-A2-26-COLOR-SENSITIVE-BRIDGE-RESTRICTION is not proved in the required bridge-forbidding sense: the first independently justified A2 consequence tested, pivotal-edge endpoint saturation, is necessary on the actual H but insufficient at the audited symbolic criticality/color interface.

The first surviving missing implication is a coupled defect-repair mechanism that uses more than an independently recolorable endpoint. RL47 saturation explicitly blocks every one-endpoint repair of the sole monochromatic pivotal edge.

## Stopping classification and obligations

Correction/demotion: NONE.
No named inherited universal mathematical obligation was genuinely reduced.

RL41-P01: preserved exactly.
RL41-P02: preserved exactly.
RL42-P01: preserved exactly.
RL43-P01: preserved exactly.
RL44-P01: preserved exactly.
RL45-P01: preserved exactly.
RL46-P01: preserved exactly.

M3-RL41-A2-26-COMPONENT-SEPARATION remains open on the retained actual H.
M3-RL41-A2-U4-CONFLICT-RECOLOR remains open.
M3-CORE remains NOT CERTIFIED.
The retained m=3,A=S configuration remains open.
Full critical realizability of the fixed RL41 triple remains open.
The full sharp Hadwiger conjecture remains open.

FL-043 through FL-049 remain in force exactly at their recorded scopes and retry conditions. FL-050 records the new pivotal-edge saturation insufficiency barrier.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
No prohibited graph/coloring/list/neighborhood/attachment/resource/Kempe-component/path census was run.
No formal proof checker or independent external red team was required or run.

Selected successor: RL48, one bounded A2/full-criticality pivotal-edge coupled two-endpoint defect-repair audit.

Programme ACTIVE.
