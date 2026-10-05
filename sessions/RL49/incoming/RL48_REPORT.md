# RL48 A2 pivotal-edge coupled two-endpoint defect-repair report

Date: 2026-10-05.
Status: CLOSED/FROZEN on promotion.
Scope: exactly one coupled A2/full-C7-criticality consequence rooted at both endpoints of the sole pivotal-edge defect.

## Result RL48-P01 — full criticality forces all-color defect-pair Kempe coupling, but that coupling alone does not repair the bridge

Retain the fixed RL41 attachment triple
    A_1={u_1,u_3,u_5,u_6},
    A_2={u_0,u_1,u_3,u_5},
    A_3={u_1,u_2,u_4,u_6},
with m=3 and A=S; the actual aligned e_0={u_0,u_1} full-H coloring
    c(u_0)=c(u_1)=1, c(u_3)=2, c(u_2)=3, c(u_5)=4, c(u_6)=5, c(u_4)=6;
and the target S partition
    u_0=u_1=1, u_3=u_4=2, u_2=3, u_5=4, u_6=5.

By RL45-P01, u_3 and u_4 lie in one {2,6}-component K. Let e=xy be an exterior edge of K such that K-e separates u_3 from u_4, and let c_e be the RL47 coloring obtained by swapping 2 and 6 on the u_4-side component. RL47-P01 proves that c_e is proper on H-e, has exactly the target partition on S, and has e as its sole monochromatic defect, with c_e(x)=c_e(y)=alpha for one alpha in {2,6}.

Because the target partition uses only colors 1,2,3,4,5 on S, extend c_e to G-e by setting c_e(v)=6. This is a proper six-coloring of G-e.

Fix beta in [6]\{alpha}. If x and y lay in different connected components of the subgraph of G-e induced by colors {alpha,beta}, swap alpha and beta on the component containing x. The Kempe swap preserves properness on G-e and changes x but not y. Restoring e then gives a proper six-coloring of G, contradicting the inherited premise chi(G)=7.

Therefore, for every beta distinct from alpha, x and y lie in the same {alpha,beta}-component of G-e under c_e. This is a genuinely coupled two-endpoint consequence of full criticality and is strictly stronger than RL47 endpoint saturation.

### Explicit insufficiency obstruction

Start from the exact RL42/RL46 singleton-resource interface H*. Add one exterior vertex r with no S-neighbor and edges rx_1 and rx_3. Keep the pre-swap colors c(x_1)=6, c(x_2)=3, c(x_3)=2, c(r)=4.

The coloring is proper. Since r has no S-neighbor, r alone is not a resource; every resource still contains at least one of x_1,x_2,x_3. Hence the singleton family T_i={x_i} remains maximum of size three and minimum-total-size among such maximum families.

The original {2,6}-path u_3-x_1-x_3-u_4 remains, and e=x_1x_3 is pivotal in that bichromatic subgraph. Delete e and swap the u_4-side {2,6}-component. Then x_1 and x_3 both have color 6, e is the sole defect, and S has exactly the target partition.

Adjoin v adjacent to S and color v with 6. In this symbolic G-e interface the defect endpoints x_1,x_3 are connected for every alternative color:
    beta=1: x_1-u_1-x_3,
    beta=2: x_1-u_3-v-u_4-x_3,
    beta=3: x_1-x_2-x_3,
    beta=4: x_1-r-x_3,
    beta=5: x_1-u_6-x_3.
Each path alternates colors 6 and beta. Thus the exact coupled consequence proved above is compatible with the retained pivotal bridge at this symbolic interface.

Classification: **proved scoped analytic full-criticality defect-pair Kempe-coupling necessity plus explicit symbolic insufficiency obstruction at the audited coupled color interface, same-worker review only.**

The symbolic model is not asserted to satisfy A2 globally, chi(G)=7, the proper-minor condition, full-C7 criticality, or full critical realizability. It is not a finite Hadwiger counterexample.

## Consequence for the RL48 target

RL48 stops under allowed outcome (2).

M3-RL41-A2-26-PIVOTAL-EDGE-TWO-ENDPOINT-REPAIR is not proved. Full criticality forces every single two-color endpoint-separating Kempe repair to fail by putting both endpoints in the same relevant bichromatic component, but the symbolic obstruction shows that all five such pairwise couplings can coexist with the pivotal bridge.

The first surviving missing implication is genuinely multicolor: one needs a joint operation or criticality consequence coupling at least two alternative colors simultaneously, rather than another independent endpoint recoloring or single two-color component exchange.

## Stopping classification and obligations

Correction/demotion: NONE.
No named inherited universal mathematical obligation was genuinely reduced.
RL41-P01/P02 and RL42-P01 through RL47-P01 are preserved exactly.
M3-RL41-A2-26-COMPONENT-SEPARATION remains open on the retained actual H.
M3-RL41-A2-U4-CONFLICT-RECOLOR remains open.
M3-RL41-A2-26-PIVOTAL-EDGE-TWO-ENDPOINT-REPAIR is not certified.
M3-CORE remains NOT CERTIFIED.
The retained m=3,A=S configuration remains open.
Full critical realizability of the fixed RL41 triple remains open.
The full sharp Hadwiger conjecture remains open.

FL-043 through FL-050 remain in force exactly at their recorded scopes and retry conditions. FL-051 records the new all-color defect-pair coupling insufficiency barrier.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
No prohibited census was run.
No formal proof checker or independent external red team was required or run.

Selected successor: RL49, one bounded pivotal-edge three-color joint two-endpoint Kempe-repair audit.
Programme ACTIVE.
