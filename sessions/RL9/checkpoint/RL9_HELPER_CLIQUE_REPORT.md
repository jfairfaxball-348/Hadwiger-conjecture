# RL9 — helper-clique extraction by a specified matching-edge extension

Date: 2026-10-01 Europe/Madrid. Status: VERIFIED ANALYTIC WORK CHECKPOINT;
NOT AUTHORITATIVE / NOT PROMOTED. RL9 remains the sole incoming session.
BASE_HEAD: 0eb090e5986d909046e00b83085cb0afb5f54116.
Authority tree: 01ee75abad5aff6cc34796e8331ae4114f6ae3c7 (81 blobs).
The expected predecessor matches. The complete start gate passes; no
unresolved inherited integrity failure. Inputs: INCOMING_SNAPSHOT.json.
Pre-assessment bounds and exact procedural deviation: WORK_UNIT_SCOPE.md
and MATCHING_CRITERION_PROOF.md. No default-branch or authority mutation.

## Outcome

EX5 is proved at its EXACT stated scope: EVERY (H,S) in D_cyc with GLOBAL
alpha(H)<=2 has T=V(H) minus S inducing K5. The mechanism establishes
extension of EACH PARTICULAR complement edge tt' in T, not just existence
of some perfect matching. In fact, after deleting ANY two exterior vertices,
the C7 boundary and the remaining three helpers have a perfect matching
using only original complement edges. An existing edge tt' can therefore
be added to that matching. It gives a proper six-coloring with a T-only
color, contrary to full colorfulness.

Through inherited RL8-P01/P02 alone, UP_6 follows on EVERY D_cyc pair with
global alpha(H)<=2. No conclusion is drawn on alpha>2, general UP_6, CR_6
or full sharp Hadwiger. A critical use must independently justify its
alpha premise; none is inferred from criticality here. No negative graph,
corrected inherited theorem, formal proof certification or novelty claim.

The next changed task is deletion-minimal colorful-kernel extraction in
NEXT_RECOVERY_TASK.md. It attempts applicability without imposing global
alpha<=2. Its candidate remains unproved and is not assessed in this unit.
The programme remains active.

## Definitions, full quantifiers and established versus hypothetical inputs

All graphs are finite and simple. Full sharp Hadwiger remains h(G)>=chi(G)
for EVERY such G, both values zero on empty. A complete rigorous proof or
an actual rigorously verified finite graph with h(G)<chi(G) resolves the
root. Neither is produced by this unit.

F_6(H,S) means chi(H)=6 and c(S)=[6] for EVERY proper c:V(H)->[6].
R_6(H,S) means six simultaneous nonempty, pairwise disjoint, connected
branch sets, all fifteen pairs adjacent, EVERY branch meeting S. Roots
are flexible. C_7(G) means chi(G)=7 and every proper minor six-colorable;
that full minor-criticality is absent from D_cyc.

D_cyc consists of EVERY pair (H,S) with:

1. Exact chi(H)=6 and full F_6(H,S).
2. S={u_0,...,u_6}, seven distinct labeled vertices, whose only H nonedges
   are e_i={u_i,u_(i+1)}, modulo seven.
3. G obtained by adding v adjacent exactly to S; for EACH i=0,...,6,
   the star contraction J_i identifying {v,u_i,u_(i+1)} is six-colorable.

EX5 has the additional EXPLICIT restriction GLOBAL alpha(H)<=2 and asks
that EVERY such pair has H[V(H) minus S]=K5. Inherited RL8-P01 proves
|H|=12 and |T|=5 on this restricted domain. It is not a general order bound.
Inherited RL8-P02 proves UP_6 when an independently present five-vertex
exterior clique W has alpha(H[S union W])<=2, with arbitrary additional
vertices allowed. Neither EX5 nor general UP_6 was assumed at entry.

UP_6 retains its original weaker D_cyc domain: there EXIST one star type i,
a proper J_i six-coloring, an omission o in {u_i,u_(i+1)}, and five paths
repairing all nonedges of H[R], R=S minus {o}. All interiors lie outside R,
are pairwise disjoint, avoid every selected root, and use o on at most one
path. Colors on paths are unrestricted. Sufficiency is inherited RL7-P01:
assign each whole interior to one endpoint branch. Ten original root edges
and five last path edges witness all fifteen branch adjacencies together.

Established inputs are the stated D_cyc/alpha premises on the assessed slice,
RL8-P01/P02 and retained RL6/RL7 facts at their exact scopes. The matching
criterion used below is independently proved in MATCHING_CRITERION_PROOF.md.
No unchecked source, Gallai decomposition, matching-covered theorem,
desired minor, T independence or full criticality is consumed.

## Provenance, precise change, independent sufficiency and bounds

RL8-P02's longer reroute needs a clique edge between two spare helpers.
FL-010 records that availability as the first missing structural input.
RL8-P01 counts five helpers on the GLOBAL alpha<=2 slice but supplies no
clique. This ONE assessment derives that clique by complement edge extension.
It does not replay the all-two-edge shortcut, SP_6, M1, any old source gate,
sampling, graph census or roadmap. All seven star types are used only to
derive a uniform necessary neighborhood inequality.

The graph K below has ten vertices by the inherited slice count, not a
finite reduction of the unrestricted root. Its deletion-set analysis is
analytic and exhaustive by integer case bounds, not numerical enumeration.
No graph, coloring, matching or path computation is performed. The two
new general-matching source queries did not recover checked proof text;
the complete criterion proof makes the deduction self-contained. Exact
queries, access limits and T-008 are preserved in that proof file.

## RL9-P01 — seven stars supply cross matchings without assuming a clique

Fix ANY (H,S) in D_cyc with global alpha(H)<=2. By RL8-P01, |H|=12 and
T has five vertices. Put F=complement(H). F is triangle-free and F[S]=C7.
For each t in T, N(t)=N_F(t) intersect S is an independent set of C7,
because two adjacent neighbors would form an F triangle with t.

For EACH i, choose a proper six-coloring of J_i and pull it back to H.
It is proper: the two contracted S vertices are nonadjacent in H and every
H edge is retained by the quotient. Full F_6 makes the remaining five S
vertices occupy five distinct colors different from the repeated pair.
Global alpha<=2 and twelve vertices force all six classes to have size two.
The repeated class consists only of {u_i,u_(i+1)}. Each of the other five
classes has its single S vertex and one T vertex. Therefore the cross
edges of F contain a matching saturating T into S minus e_i.

Consequently, for EVERY U subseteq T and EVERY i=0,...,6,

    |N(U) minus e_i| >= |U|,  where N(U)=union of N(t), t in U.    (MC)

This follows by restricting an actual star-supplied matching to U. It is
not an inference from seven sampled colorings and never assumes F[T] empty.
Every t has |N(t)|>=2: a neighborhood of size at most one is wiped out
by a cycle edge incident with that vertex (or any edge for the empty set).

## RL9-P02 — the three-helper residual matching lemma

Standalone statement: for EVERY graph K on S disjoint union R, with |S|=7,
|R|=3, K[S]=C7, K[R] empty, each N_K(r) subseteq S independent in C7,
and (MC) for EVERY U subseteq R and every cycle edge e_i, K has a perfect
matching. This requires no five-helper graph, colorfulness, T-T edge or
criticality. All cross edges used are existing K edges.

First derive three consequences of MC.

* Each helper has at least two neighbors, as in P01.
* The union of the neighbors of any two helpers has size at least three.
  If it had size at most two, deleting a cycle edge incident with one of
  them leaves at most one neighbor for two helpers, contrary to MC.
  If that union has exactly three vertices, it must be independent in C7:
  deleting an edge contained in that union would leave one neighbor.
* The union Y of all three helper neighborhoods has size at least five.
  If |Y|<=3, delete an edge touching Y to leave at most two neighbors.
  If |Y|=4, Y contains a cycle edge, since an independent C7 set has at
  most three vertices. Delete that edge to leave two. Both violate MC.

We verify the complete odd-component criterion. Take ANY deletion set
X subseteq V(K), put A=X intersect S, B=X intersect R, a=|A|, b=|B|,
and q=q(K-X). Since K has ten vertices,

    q congruent to 10-a-b congruent to a+b (modulo two).          (PAR)

Let k be the number of remaining helpers with no neighbor in S minus A.
These are isolated vertices; every other remaining helper attaches to one
or more cycle components and cannot create an additional component.

If a=0, all remaining helpers attach to the intact cycle, so K-X is
connected. For b=0 it has even order and q=0. For b>=1 its q<=1<=b.
If a>=5, the remaining graph has 10-a-b vertices, hence
q<=10-a-b<=a+b. These cases cover all b when a=0 or a>=5.

It remains to consider 1<=a<=4. Deleting a vertices from C7 leaves at most
a path components. Thus q<=a+k. If b>=1 then k<=3-b<=b+1, so
q<=a+b+1. PAR removes the extra one: q<=a+b. If b=0 and k<=1,
q<=a+1 and PAR similarly gives q<=a.

The ONLY remaining cases have b=0, k>=2, and 1<=a<=4:

| a | Exhaustive remaining argument |
|---|---|
| 1 | No helper can be isolated, since each has at least two neighbors. |
| 2 | Two isolated helpers would have neighborhood union of size at most two, contradicting the pair consequence of MC. |
| 3 | All three cannot be isolated, since their union has size at least five. Thus k=2. Their union equals A and is an independent three-set of C7. Its cyclic gaps are 2,2,3, so C7-A consists of one two-vertex edge and two singleton components. The third helper has at least two neighbors outside A, since all three neighborhoods together have at least five vertices. Those neighbors cannot both lie in the two-vertex edge, by independence of its neighborhood; they therefore meet at least two distinct components. Adding this helper leaves at most two nonisolated components, with five vertices in total. Their odd-component count is odd and at most two, hence at most one. The two isolated helpers give q<=3=a. |
| 4 | All three cannot be isolated, again by union size at least five; k=2. Only three S vertices remain, so they have at most three components. Hence q<=3+2=5. PAR makes q even, so q<=4=a. |

Every possible X is covered. Hence q(K-X)<=|X| for EVERY X, and the
self-contained criterion gives a perfect matching of K. Since K[R] is
empty, it has three cross edges and two disjoint C7 edges. This proves
the residual lemma without adding complement edges or enumerating graphs.

## RL9-P03 — extend the PARTICULAR edge and prove EX5

Fix ANY distinct t,t' in the five-vertex T with tt' an edge of F. Let
R=T minus {t,t'}. Form the spanning subgraph K of F minus {t,t'} by retaining
ALL C7 edges and ALL R-to-S edges, and deleting any edges within R.
This is a subgraph, not an assumption that R or T was originally independent.
Its three helper neighborhoods are independent in C7 by triangle-freeness.
P01's MC restricts to EVERY subset of R. P02 therefore gives a perfect
matching M of this ten-vertex K.

The union M union {tt'} is a perfect matching of F containing that EXACT
specified edge. Its six edges are disjoint independent pairs of H. Assign
one distinct color to each pair. This is a proper six-coloring of H with
the class {t,t'} entirely outside S, contradicting the EVERY-coloring F_6
premise. Therefore no edge of F[T] exists and H[T]=K5.

The argument is uniform over EVERY tt' edge; it does not substitute an
unrelated perfect matching. It actually establishes residual matching
existence for ANY deleted pair of T vertices before needing their edge.
No condition on the deleted pair's neighborhoods is silently used.

Thus EX5 is complete proved analytic mathematics at D_cyc plus GLOBAL
alpha(H)<=2. It is a verified work result awaiting normal RL9 promotion.

## RL9-P04 — precisely scoped UP_6 through inherited P01/P02

For EVERY (H,S) in D_cyc with global alpha(H)<=2, inherited RL8-P01 gives
the complete twelve-vertex graph and five exterior vertices. P03 makes
those vertices a clique; the whole core has alpha<=2 by the explicit
premise. This independently supplies Q5, so inherited RL8-P02 applies.

It supplies five simultaneous paths of lengths at most three, at most one
longer reroute, flexible omission and a proper star coloring. All interiors
are disjoint and avoid the six selected roots; the omitted root is used on
at most one path. Its exhaustive three/four/five helper-type cases retain
the exact existing edges, including the now justified spare-helper clique
edge. RL7-P01 assembles six nonempty, disjoint, connected branches, every
branch meeting S, and all ten original plus five repaired adjacencies.

This proves UP_6 on this EXPLICIT global-alpha<=2 slice only. The general
UP_6 statement is not weakened or replaced. At a future critical interface,
one must independently establish the global bound or an applicable core;
no such applicability theorem is supplied here. No arbitrary minor is
converted into a subdivision, and no ordinary root conclusion is claimed.

## Falsification, circularity, failures, lessons and stopping review

The extension question was falsifiable by a graph satisfying ALL D_cyc
and global-alpha premises with an unextendable F[T] edge. The complete
lemma excludes such a graph. No weaker-premise example is presented as an
EX5 countermodel. An EX5 negative would have been distinct from UP_6,
CR_6 and an actual ordinary h<chi negative; none is produced.

Independent sufficiency is explicit: seven actual star matchings -> MC ->
residual perfect matching on existing edges -> extension of tt' -> forbidden
T-only color -> EX5 -> inherited Q5 routing. No desired rooted model,
general CR_6, full criticality or Hadwiger theorem drives this chain.

The local source-check process defect T-008 is recorded and repaired by
exact provenance and self-contained proof, with no source or mathematical
promotion. No candidate mathematical inference failed and no inherited
theorem is corrected/demoted. FL-011 records the successful scoped repair
of helper applicability, its remaining boundary and retry conditions.

Stop further consequences at global-alpha/core applicability. In particular,
this theorem supplies no general exterior bound or independence condition.
It does not establish that the alpha<=2 slice is unavoidable at any critical
vertex. A proposed extension beyond the slice must independently preserve
colorfulness and all simultaneous model/sharpness obligations. One bounded
unit is complete; no second mechanism is investigated.

## Surviving scope, every residual and exact durable frontier

Preserve RL6-P01–P04, RL7-P01–P04, RL8-P01–P04, A1–A11, C2/C3 and all
CM-B/CM-D/CM-R proofs and finite certificate at their exact classifications.
SP_6 and the all-two-edge shortcut remain retired at their original D_cyc
scopes; M1 stays suspended. The inherited corpus, roadmap, dependency map,
bridge ledger, source logs and Collatz review retain exact bytes/limits.

Still uncovered: general D_cyc with alpha>2 and without an independently
present Q5 core; core-free critical cyclic cases; other degree-seven
complements outside the matching slice; all degrees >=8; arbitrary exterior
order, structure, paths, components, colorings and larger S; every ordinary
t>=8 and CR_s for s>=7. General CR_6 is unpromoted/inconclusive with primary
current resolution status UNVERIFIED; even a general CR_6 proof would imply
ordinary order seven only. Every ordinary order-seven case not independently
covered remains. No configuration is shown unavoidable.

C2 retains independent-side extraction and its unbounded exterior r. C3
retains unavoidability. BR-03 retains both alternatives, unknown T and all
7<=t<T; BR-04 retains the sharp upgrade; BR-05 retains loss-free integral
transfer; BR-06 retains coverage and scope-matched reductions.

FL-001–FL-010, RL3-GAP-01, RL3-GAP-02, OPEN-0005,
OPEN-0008 / SRC-0014 / RES-0015 and all sixteen unchecked-source limits
remain: SRC-0001, SRC-0002, SRC-0006, SRC-0008, SRC-0014, SRC-0020,
SRC-0021, SRC-0022, SRC-0023, SRC-0025, SRC-0026, SRC-0027, SRC-0028,
SRC-0029, SRC-0030, SRC-0031. Original/published access failures and
incomplete cutoff/citation discovery stay explicit. No failed retrieval
implies openness. The background source counts remain 13 checked primary,
2 checked authoritative secondary and 16 unchecked; no corpus update.

Durable frontier: RL9-P01–P04 and the criterion proof are complete scoped
analytic work, NOT PROMOTED. Main and all current authority stay at BASE_HEAD.
The exact next proposed task is MK2 on deletion-minimal colorful kernels,
with one analytic coloring-extension mechanism and no invented finite
order bound. Normal RL9 finish is recommended; closing this unit leaves
the programme active. it makes sense to finish up here
