# RL11 — MK2 fails by a color-copy exterior constraint

Date: 2026-10-01 Europe/Madrid. **Completed analytic work; NOT PROMOTED.
RL11 remains open pending normal closeout.**
BASE_HEAD: ea4978ec31b060d432db2987b06586cd4bea60cc.
Incoming authority tree: 95833de67b819add9abf53fa229066e5ee8a50ab.
The live predecessor matches. All 111 incoming files were byte-verified;
RL11 is unique and no unresolved authority-integrity failure was found.

## Outcome and exact obligation

**MK2 is false on its exact D_cyc domain.** The graph K below has eighteen
vertices, satisfies every D_cyc premise, has an independent triple, and
has NO exterior vertex whose deletion leaves D_cyc. All eleven exterior
deletions have explicit proper six-colorings missing color 6 on S.
The proof is analytic and covers every proper coloring where required;
it uses no graph/coloring/path enumeration, sampling or new source query.

Moreover K has no Q5 core, but the inherited five uncolored paths and one
simultaneous S-rooted K6 survive. Thus the unrestricted MK2/induced-kernel
applicability arrow is retired; even Q5 is not necessary for UP_6 on D_cyc.
General UP_6, CR_6 and ordinary Hadwiger are neither proved nor refuted.
This is a candidate countermodel, not a correction to a promoted theorem.

The named candidate obligation MK2 is resolved negatively. The positive
universal root obligation BR-01 is not reduced by a new coverage theorem.
The result removes an invalid sufficient-input strategy and identifies a
concrete obstruction: vertex-essential coloring constraints can be encoded
by an exterior gadget without a small induced alpha<=2 core.

## Domain, quantifiers and single mechanism

D_cyc means finite simple H, exact chi(H)=6, seven labeled vertices
S={u_0,...,u_6} colorful in EVERY proper map V(H)->[6], and exactly the
seven nonedges e_i=u_i u_(i+1) on S (indices modulo seven). Add v adjacent
exactly to S. For EACH i, identifying the connected star
{v,u_i,u_(i+1)} into w_i gives a six-colorable minor J_i.
No full minor-criticality, global independence or order bound is assumed.

MK2 asserts that EVERY pair in D_cyc with alpha>2 has SOME exterior vertex
x with (H-x,S) in D_cyc; equivalently EVERY exterior-deletion-minimal D_cyc
pair has global alpha<=2. The countermodel below refutes exactly this
quantifier pattern. Its order eighteen is a witness size, never a universal
order bound.

The ONE assessed mechanism replaces an exterior edge ab by an equality
gadget followed by an inequality edge. A five-clique forces a and z to
share the remaining sixth color. The edge zb then enforces the old ab
inequality. When an appropriate vertex is deleted that constraint releases
a coloring which was excluded before deletion. This tests the deletion
inference directly; it does not repeat the old palette or short-path routes.

Full sharp Hadwiger remains h(G)>=chi(G) for EVERY finite simple graph,
both zero on empty. A full proof or actual rigorously verified finite h<chi
graph is legitimate. Neither is supplied by this auxiliary negative.

## RL11-P01 — the base graph and color-copy extension

Take the exact RL8 base H_0, with S as above and T={t_0,...,t_4}. Its only
nonedges are the cycle pairs on S and the following S-to-T pairs:

| Exterior vertex | Nonneighbors in S |
|---|---|
| t_0, t_1 | u_2, u_4, u_6 |
| t_2, t_3 | u_0, u_3, u_5 |
| t_4 | u_1, u_3, u_6 |

All pairs in T are edges. This is the inherited type list [0,0,1,1,4]
from authoritative/UNCOLORED_CORE_WITNESS.json and RL8-P03/P04. No change
is made to that original witness or its proof/certificate.

For completeness, its complement is triangle-free: C7 is triangle-free,
T has no complement edges, and each displayed neighborhood is independent
in C7. Hence alpha(H_0)<=2. A proper six-coloring on its twelve vertices
therefore has exactly six classes of size two. The five clique vertices
T have distinct colors, each with an S partner; the sixth class is an S
pair. Thus EVERY proper six-coloring uses all six colors on S. The seven
rows below explicitly supply colorings, so chi(H_0)=6.

Set a=t_0 and b=t_1. Delete ONLY the edge ab. Add six new exterior vertices
z,r_1,...,r_5. Let R={r_1,...,r_5} be a clique, join every r_j to a and z,
and add the edge zb. There are no other new edges. Call the result K.
In particular the six new vertices have no neighbors in S; az and ab are
nonedges. This fully specifies a finite simple graph on eighteen vertices.

In ANY proper coloring of K into [6], R uses five distinct colors. Both
a and z are adjacent to every member of R and hence receive the same sole
remaining color. Edge zb implies c(a)=c(z)!=c(b). Consequently restriction
to S union T is a proper six-coloring of the ORIGINAL H_0, including its
edge ab. Conversely, EVERY six-coloring of H_0 extends to K by giving z
the color of a and giving R the other five colors in any order.

These statements concern every coloring, not selected witnesses. They use
only the gadget's actual edges and six labels. In particular this exact
extension equivalence transfers H_0's universal colorfulness to K.

## RL11-P02 — all D_cyc premises and independent triples

The boundary is unchanged. Exact chi(K)=6 follows from the explicit
extension just given and the K6 on {a} union R. Universal colorfulness
follows from restriction to H_0. Neither fact uses MK2, UP_6, a desired
rooted minor, or an ordinary Hadwiger theorem.

Here are ALL seven star colorings. In row i, give t_j and its displayed
partner color j+1, for j=0,...,4. Give w_i color 6. On the original K
before contraction, the repeated pair u_i,u_(i+1) has color 6 instead.
In every row give z color 1 and give (r_1,...,r_5) colors (2,3,4,5,6).

| i | Repeated S pair | t_0 partner | t_1 partner | t_2 partner | t_3 partner | t_4 partner |
|---|---|---|---|---|---|---|
| 0 | u_0,u_1 | u_2 | u_4 | u_3 | u_5 | u_6 |
| 1 | u_1,u_2 | u_4 | u_6 | u_0 | u_5 | u_3 |
| 2 | u_2,u_3 | u_4 | u_6 | u_0 | u_5 | u_1 |
| 3 | u_3,u_4 | u_2 | u_6 | u_0 | u_5 | u_1 |
| 4 | u_4,u_5 | u_2 | u_6 | u_0 | u_3 | u_1 |
| 5 | u_5,u_6 | u_2 | u_4 | u_0 | u_3 | u_1 |
| 6 | u_6,u_0 | u_2 | u_4 | u_3 | u_5 | u_1 |

Each partner is in the displayed nonneighbor set and each row partitions
the other five S vertices. On the old quotient, w_i is alone in color 6,
so all its edges to old vertices are safe. It has NO edge to any r_j or z:
the contracted vertices and v have no neighbors among these six new
vertices. Thus sharing color 6 with r_5 creates no edge conflict. R has
distinct colors, a and z have color 1, and zb has colors 1 and 2. This
checks every new and old edge type of every J_i(K), including new edges
incident to the contracted vertex. The pulled-back row 0 is also an
explicit coloring of K itself. All seven required star minors are covered.

Independent-triple placements are accounted for as follows:

| Number of S vertices | Witness or remaining scope |
|---|---|
| 2 | {u_0,u_1,r_1} is independent: u_0u_1 is a boundary nonedge and r_1 has no S neighbors. |
| 1 | {u_0,t_2,r_1} is independent: u_0 is a nonneighbor of t_2 and r_1 has neither u_0 nor t_2 as a neighbor. |
| 0 | This witness has no such triple. A triple meeting R can contain only one R vertex, cannot contain a or z, and can contain at most one vertex of the clique T minus {a}. A triple in T union {z} would have to include the sole nonadjacent T pair a,b, but zb is an edge. Positive safe-deletion claims restricted to other graphs with exterior triples remain UNASSESSED. |

Thus alpha(K)>2 is established in two placements. A negative to a
universal statement requires one valid placement, not positive coverage
of all three. No assertion is made about all graphs in any placement
class, and arbitrary graph/exterior/coloring/component/path parameters
remain in every surviving universal task.

## RL11-P03 — every exterior deletion fails, with actual colorings

First define c* on H_0-ab by these six color classes:

| Color | Class |
|---|---|
| 1 | u_1,u_2 |
| 2 | u_3,u_4 |
| 3 | u_0,t_2 |
| 4 | u_5,t_3 |
| 5 | u_6,t_4 |
| 6 | a,b |

All pairs are listed nonedges of H_0 except ab, which was deliberately
removed. All seven S vertices use precisely colors 1,...,5. This coloring
does NOT extend to the intact gadget: a=b conflicts with the forced
a=z!=b rule. That is a direct obstruction, not a safe-deletion proof from
incompatible original colorings.

For the five original exterior deletions, use the following classes on
the remaining old vertices. The numbered columns are the actual labels.

| Deleted x | Color 1 | Color 2 | Color 3 | Color 4 | Color 5 | Color 6 |
|---|---|---|---|---|---|---|
| a=t_0 | u_1,u_2 | u_3,u_4 | u_0,t_2 | u_5,t_3 | u_6,t_4 | b |
| b=t_1 | u_1,u_2 | u_3,u_4 | u_0,t_2 | u_5,t_3 | u_6,t_4 | a |
| t_2 | u_0,u_1 | u_5,u_6 | u_2,a | u_4,b | u_3,t_4 | t_3 |
| t_3 | u_0,u_1 | u_5,u_6 | u_2,a | u_4,b | u_3,t_4 | t_2 |
| t_4 | u_1,u_2 | u_3,u_4 | u_6,b | u_0,t_2 | u_5,t_3 | a |

Every paired S-S class is consecutive on C7 and every S-T pair occurs in
the nonneighbor table. The singleton is exterior; every old vertex other
than the named deletion occurs exactly once. Extend these rows as follows:

| Deleted x | c(z) | (c(r_1),...,c(r_5)) |
|---|---|---|
| a | 1 | (2,3,4,5,6) |
| b | 6 | (1,2,3,4,5) |
| t_2 | 3 | (1,2,4,5,6) |
| t_3 | 3 | (1,2,4,5,6) |
| t_4 | 6 | (1,2,3,4,5) |

For x=a, the surviving gadget is R plus z with edge zb: the row gives z
color 1, R the other five colors, and b color 6. For x=b, a=z=6 and R
uses the other five colors; zb is absent. In the final three rows a and b
have distinct colors, z=a and R uses precisely the other five colors.
These facts check every surviving gadget edge. No color 6 occurs on S.

There are six remaining exterior deletions, all checked by these formulas:

- **Delete z:** use c* on S union T and give r_j color j, j=1,...,5.
  R is proper and all its edges to a of color 6 are proper; zb is absent.
- **Delete r_j, for EACH j=1,...,5:** use c* on S union T, give z color 5,
  and give the four surviving R vertices colors 1,2,3,4 in increasing
  subscript order. Both a and b have color 6. R's clique edges, its edges
  to a and z, and zb are all proper. Again S uses exactly colors 1,...,5.

This exhausts T union {z} union R, all ELEVEN exterior vertices. For EACH
x there is an actual proper map K-x->[6] missing color 6 on S. Therefore
(K-x,S) fails EVERY-coloring colorfulness, whether or not its chromatic
number also drops. We do not claim chi drops in every deletion; failure
of colorfulness alone suffices. S and the seven restricted star colorings
remain available after deletion, so the demonstrated failure is exactly
at a load-bearing preservation premise.

K itself satisfies D_cyc, while every exterior deletion fails. Hence it
is deletion-minimal at the precise defined scope and alpha(K)>2: MK2 is
false. In fact no proper induced subgraph retaining S is in D_cyc: choose
one deleted x and restrict its displayed bad coloring to the smaller graph.
S still misses color 6. There is no induced alpha<=2 D_cyc kernel in K.

There is also no Q5 core in K. Any new vertex z or r_j together with
u_0,u_1 is an independent triple, so none may be included in a core with
global alpha at most two. The only five remaining exterior candidates are
the original T, and their induced graph lacks ab. They are not a clique.
This additional conclusion uses the definition of Q5, not its converse.

## RL11-P04 — the same graph still has the simultaneous desired model

Use the original-H star witness J_2(K) above and omit u_3. The inherited
RL8 paths survive because NONE uses the removed edge ab:

| Missing pair | Path | Interior |
|---|---|---|
| u_0,u_1 | u_0-t_0-u_1 | t_0 |
| u_1,u_2 | u_1-t_2-u_2 | t_2 |
| u_4,u_5 | u_4-t_4-u_5 | t_4 |
| u_5,u_6 | u_5-u_3-u_6 | u_3 |
| u_6,u_0 | u_6-t_3-t_1-u_0 | t_3,t_1 |

The helper nonneighbor table and the retained t_3t_1 edge verify the path
edges directly. All six interior vertices are distinct and avoid the six
selected roots. The omitted u_3 is used internally exactly once. Colors
on these paths are unrestricted.

Assign each interior to its first endpoint. The branches are
B_0={u_0,t_0}, B_1={u_1,t_2}, B_2={u_2}, B_4={u_4,t_4},
B_5={u_5,u_3}, B_6={u_6,t_3,t_1}. They are simultaneously nonempty,
pairwise disjoint, connected by the displayed path segments, and each
meets S. Here are ALL fifteen adjacency witnesses:

| Branch pair | Edge | Branch pair | Edge | Branch pair | Edge |
|---|---|---|---|---|---|
| 0,1 | t_0-u_1 | 0,2 | u_0-u_2 | 0,4 | u_0-u_4 |
| 0,5 | u_0-u_5 | 0,6 | u_0-t_1 | 1,2 | t_2-u_2 |
| 1,4 | u_1-u_4 | 1,5 | u_1-u_5 | 1,6 | u_1-u_6 |
| 2,4 | u_2-u_4 | 2,5 | u_2-u_5 | 2,6 | u_2-u_6 |
| 4,5 | t_4-u_5 | 4,6 | u_4-u_6 | 5,6 | u_3-u_6 |

Thus UP_6 and R_6 hold on THIS core-free countermodel. Adding singleton
{v} gives six further adjacencies through S and a K7 minor of G=K+v.
Colorfulness and one new color for v give exact chi(G)=7. The minor is
proper in this nineteen-vertex G, so G is outside full C_7. Also
h(K)>=6=chi(K), h(G)>=7=chi(G). Neither graph is an ordinary negative.
This retains flexible existential roots; it asserts no prescribed-root
universal theorem and uses no minor-to-subdivision converse.

## Independent conditional sufficiency, rechecked at its actual scope

The audited implication from MK2 remains logically sound as a conditional:

1. In each finite D_cyc pair, minimize the order of an eligible induced
   pair retaining S. Eligibility exists because the original pair qualifies.
   This finite selection alone imposes no independence bound.
2. IF MK2 were true, the selected kernel L would have GLOBAL alpha(L)<=2.
   RL8-P01 would then give order twelve and five exterior vertices; RL9-P03
   EX5 would give their clique. Every consuming hypothesis is needed.
3. RL8-P02 would supply five simultaneous uncolored paths in L. They
   remain paths in H because L is an induced subgraph retaining S.
4. Choose an incident star for the resulting omission and take its actual
   coloring from the ORIGINAL H's D_cyc premise. No extension of a kernel
   coloring to H is assumed or needed. Apply RL7-P01 to obtain six
   simultaneous nonempty/disjoint/connected branches meeting S and all
   ten original plus five repaired adjacencies.

The countermodel blocks step 2: its only eligible induced kernel is K,
which has an independent triple. This is not an error in RL8-P01/P02 or
RL9 EX5. No rooted conclusion was used to justify kernel selection or
the countermodel's coloring premises. Conditional sufficiency cannot turn
a false antecedent into an admissible input.

Even successful general UP_6 would cover only D_cyc and hence the stated
cyclic degree-seven critical interface through A2/proper-star criticality
and A3. No configuration unavoidability follows. General CR_6, stronger
coverage than this interface, would imply ordinary order seven only.
Every ordinary t>=8 and all other retained root obligations remain.

## Disposition, preservation and stop

One mechanism and one candidate graph have been assessed. The complete
negative is the material endpoint; no second work unit, source search or
gadget expansion follows. Same-worker analytic review only: no formal
proof checking or external independent certification, no novelty claim.
The zero-computation default was retained. The explicit tables are analytic
witnesses, not outputs of a numerical search or a claimed machine certificate.

RL6–RL9 P01–P04, A1–A11 with their conditional/inherited distinctions,
C2/C3, FL-001–FL-012, all original proofs and fixed certificates survive.
The RL9 deferred record and RL10 audit remain exact historical provenance:
they correctly recorded MK2 as unproved and unassessed THEN. Append the
new outcome as FL-013; do not rewrite those earlier records.

Retain general alpha>2/core-free D_cyc and critical cyclic cases, other
degree-seven complements, degrees>=8, arbitrary graph/exterior order,
structure, components, paths, colorings and larger S. Retain C2's
independent-side/unbounded-r gap, C3 unavoidability, BR-03 both alternatives,
unknown T and finite prefix at unbounded order, BR-04 sharp upgrade,
BR-05 integral transfer and BR-06 coverage. Retain RL3-GAP-01/02,
OPEN-0005, OPEN-0008/SRC-0014/RES-0015, all sixteen unchecked-source
limits, corpus, roadmap, dependency/bridge records and Collatz review.
No source retrieval failure establishes openness.

NEXT_RECOVERY_TASK.md prepares one changed direct connected-branch
interface development task. It is unassessed and not started here.
The programme remains active. Authority is unchanged pending normal
closeout; the isolated work checkpoint will preserve this result.

it makes sense to finish up here
