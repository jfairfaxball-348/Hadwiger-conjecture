# RL8 — one bounded uncolored cyclic-routing assessment

Date: 2026-10-01 Europe/Madrid. Status: **RL8 CLOSED/FROZEN; SCOPED ANALYTIC RESULTS RETAINED BY RL9**.
RL8 was the unique incoming session at the pinned base:
`authoritative/RL8_UNCOLORED_CYCLIC_ROUTING_BRIEF.md`.
BASE_HEAD: `2fbd0440857302ac3a8e1807f4d0451b6a641823`.
Authority tree: `112b083f1fe7579ea7ce80fe9d02067e6a7c59b1`.
The expected predecessor matches exactly. No unresolved integrity failure.
Exact input identities and pre-computation bounds are in
[RL8_INCOMING_SNAPSHOT.json](RL8_INCOMING_SNAPSHOT.json) and
[WORK_UNIT_SCOPE.md](RL8_WORK_UNIT_SCOPE.md).

## Outcome and first missing dependency

General UP_6 is **NOT PROVED OR REFUTED**. One mechanism gives a complete
scoped analytic construction: for every pair in D_cyc that contains five
exterior clique helpers T with alpha(H[S union T])<=2, UP_6 holds. The whole
H may have arbitrarily many other vertices. At most one path needs three
edges; the other paths have two. The omitted boundary vertex can supply one
interior. Every construction assembles into one simultaneous S-rooted K6.

The additional helper core is not independently extracted from general
D_cyc. It is a structural hypothesis, not a replacement domain premise or
consequence of the seven boundary choices. This is the first missing
dependency for an unrestricted application. At a full-critical interface the
core-containing cyclic configuration is excluded by a proper K7; the
core-free cyclic configuration and every other retained case remain.

A new twelve-vertex pair in D_cyc refutes the all-two-edge version for EVERY
omission, but passes UP_6 with a three-edge reroute, a positive rooted K6 and
a proper K7 in G. This is a narrower routing-capacity obstruction, **not a
UP_6 negative, CR_6 negative or ordinary Hadwiger counterexample**.

The exact changed recovery task is [NEXT_RECOVERY_TASK.md](RL9_HELPER_CLIQUE_EXTRACTION_BRIEF.md):
remove the helper-clique hypothesis in the alpha(H)<=2 slice, testing one
complement-matching extension inference. No general UP_6 is consumed.
The programme remains active. No inherited theorem is corrected or demoted.

## Full definitions, quantifiers and root objective

All graphs are finite and simple. h(H) is the greatest order of a clique
minor, chi(H) the chromatic number, both zero on the empty graph. Full sharp
Hadwiger remains h(H)>=chi(H) for EVERY finite simple graph. A complete proof
or an actual rigorously verified finite h<chi graph is a legitimate root
outcome; neither is established here.

F_6(H,S) means exact chi(H)=6 and c(S)=[6] for EVERY proper c:V(H)->[6].
R_6(H,S) means one family of six simultaneous nonempty, pairwise disjoint,
connected branch sets, every pair adjacent and every branch meeting S.
Roots are flexible. C_7(G) additionally means exact chi(G)=7 and every
proper minor is at most six-colorable. C_7 is NOT an auxiliary premise.

D_cyc consists of every (H,S) satisfying:

1. Exact chi(H)=6 and F_6(H,S).
2. S={u_0,...,u_6}, seven distinct cyclically labeled vertices; the ONLY
   nonedges of H[S] are e_j=u_j u_(j+1), modulo seven.
3. G adds v adjacent exactly to S. For each i=0,...,6, J_i contracts the
   connected star {v,u_i,u_(i+1)} to w_i and is six-colorable.

UP_6 is the still-unproved assertion that for EVERY (H,S) in D_cyc there
EXIST i in [0,6], a proper six-coloring c_i of J_i, an omitted
o in {u_i,u_(i+1)}, and five paths P_ab in H indexed by the five nonedges
of H[R], R=S minus {o}, with endpoints a,b, interiors outside R, pairwise
disjoint interiors, no selected root internal on any path, and o internal
on at most one path. All path colors are unrestricted. The coloring is an
available star witness, not a path-palette requirement. Every omission is
eligible in a star, so paths may be constructed before choosing that witness.

The established inputs are the exact inherited RL6-P01–P04, RL7-P01–P04 and
their proof classifications, D_cyc's stated premises when applicable, and
elementary finite coloring facts proved below. General UP_6, general CR_6,
universal core extraction and every global coverage assertion are hypothetical.

## Provenance, precise change and sufficiency

RL7's twelve-vertex countermodel and FL-009 forced shared interiors inside
endpoint palettes despite every-coloring colorfulness. Its explicit positive
paths show that deleting ONLY that palette restriction can change the
obstruction. This unit preserves the weaker D_cyc domain and all root,
disjointness, simultaneous-assembly and exact-order conditions. It develops
one unrestricted-color helper-allocation mechanism; SP_6 is not replayed.

The new core condition Q5(H,S) is independently expressible: there EXIST
five distinct vertices T outside S, H[T]=K5 and alpha(H[S union T])<=2.
It is used only for the scoped implication D_cyc + Q5 -> UP_6, not inserted
silently into UP_6 itself. Extra vertices, path lengths, components and
coloring choices in the full domain remain unbounded. No new literature
dependency, source gate, graph census, sampling or roadmap is involved.

RL7-P01 supplies sufficiency without palettes: assign each path's whole
interior to one endpoint branch. The root plus all assigned initial path
segments is connected; different interiors and root avoidance make the six
branches disjoint. All branches are nonempty and meet S. The ten original
root edges and last edges of the five repaired paths give all fifteen
adjacencies simultaneously. The omitted vertex belongs to at most one
branch. This is a conditional assembly, not a path-existence theorem.

In a C_7 application A2 and the proper-star colorings supply D_cyc. If Q5 is
also independently present, the rooted K6 plus singleton v gives a proper
K7, contradicting C_7. This excludes exactly that additional configuration;
it does not extract Q5 or make the configuration unavoidable. General CR_6
would imply ordinary order seven only; all ordinary t>=8 and CR_s for s>=7
remain. No unrestricted subdivision target replaces ordinary Hadwiger.

## RL8-P01 — the alpha<=2 slice has exactly five exterior vertices

For EVERY (H,S) in D_cyc with alpha(H)<=2, |V(H)|=12 and |V(H) minus S|=5.
This is a scoped analytic count, not a bound on the unrestricted exterior.

Fix any proper six-coloring. All six classes are nonempty and meet S, by
exact chromaticity and F_6. The seven S vertices occupy six classes, so one
class contains exactly two S vertices, forming a cycle nonedge; the other
five classes contain one S vertex each. Every class has size at most two.
Consequently the double-S class has no exterior vertex; every exterior
vertex occupies one of the other classes and shares it with its S vertex.
There are at most five exterior vertices and no exterior-only class.

Suppose an S vertex x has a singleton class. Consider either of its two
cycle neighbors y (a nonneighbor in H). If y also has a singleton class,
merge those two independent classes, producing a five-coloring, impossible.
If y's class is {y,t} with t exterior, replace the two classes {x},{y,t}
by {x,y},{t}. This is a proper six-coloring with a color absent from S,
contradicting F_6. Therefore both cycle neighbors of x must lie in the sole
double-S class. Those two neighbors are distance two in C7, hence adjacent
in H, so cannot occupy that class. Contradiction.

There is no singleton S class. Thus all five single-S classes contain an
exterior vertex; the whole graph has twelve vertices and five exterior
vertices. No assertion that those five induce a clique has been proved by
this argument. That missing assertion is the next task, not an implicit
input here.

## RL8-P02 — five clique helpers suffice on an unbounded-order subdomain

For EVERY (H,S) in D_cyc satisfying Q5, UP_6 holds. The paths can be chosen
inside the twelve-vertex induced core S union T, with lengths at most three
edges. Other vertices and edges of H play no role and remain unrestricted.

### Independent star matching constraints

Put K=H[S union T] and let F be its simple complement. Its induced S graph
is C7 and its T graph is independent. Alpha(K)<=2 makes F triangle-free.
For every t in T, N_F(t) intersect S is therefore independent in C7 and has
size at most three.

Restrict a J_i coloring to the quotient of the core and pull it back to K.
It is proper: the repeated neighbors are nonadjacent and every original
core edge survives. There are twelve core vertices, at most six colors and
no independent triple; all six classes consequently have exactly two
vertices. Since T is a clique, its five vertices occupy distinct classes.
The repeated pair {u_i,u_(i+1)} is the remaining class, and each t has a
partner in S minus that pair. Thus the bipartite F edges between T and S
contain a matching saturating T after deleting EACH cycle edge's endpoints.
For any U subseteq T and any j,

    |(union over t in U of N_F(t)) minus {u_j,u_(j+1)}| >= |U|.     (MC)

This necessary constraint follows from actual proper-star colorings, not
from an assumed desired path/model or a finite sample of colorings.

Every N_F(t) has size at least two: a zero- or one-element neighborhood
would be wiped out by some deleted cycle pair, contrary to MC. Any independent
two-set in C7 extends to an independent three-set. Up to rotation/reflection
its possibilities are {u_0,u_2}, extend by u_4, or {u_0,u_3}, extend by u_5.
Extend all five neighborhoods if needed to independent triples. This adds
F edges (deletes core H edges); T remains a clique, F remains triangle-free,
and all existing star matchings remain available. MC remains valid.
Call the resulting sparser H core K'. Any paths in K' are paths in H.

There are exactly seven independent triples in C7. They are

    A_k={u_(k+2),u_(k+4),u_(k+6)},  k=0,...,6.

Indeed three cyclic gaps are at least two and sum to seven, so they have
lengths 2,2,3; the unique gap of length three fixes this representation.
A helper of type k has complement-neighborhood A_k and is a common H
neighbor for exactly ONE cycle nonedge, e_k. This identifies direct helper
resources without restricting their colors.

### Exhaustive resource constraints at the stated core scope

Let m_k be the number of type-k helpers; sum m_k=5.

* m_k<=2: three identical A_k leave only two available vertices after
  deleting a cycle pair incident with A_k, violating MC for those helpers.
* If m_k=2, then m_(k+2)=m_(k-2)=0. For example A_k union A_(k+2) is
  {u_(k+1),u_(k+2),u_(k+4),u_(k+6)}. Delete the cycle pair
  {u_(k+1),u_(k+2)}; only two neighbors remain for the three helpers.
  The negative-offset case is its reflection.
* Two duplicated types must be adjacent on the seven-edge cycle. Their
  four helpers need at least four remaining neighbors after every pair
  deletion. If their two triples overlap, their union has at most five
  vertices and contains a cycle edge (an independent C7 set has size at
  most three); deleting that edge leaves at most three. Hence the triples
  must be disjoint. The formula for A_k shows disjointness precisely at
  type offsets +1 or -1; union sizes at offsets 1,...,6 are 6,4,5,5,4,6.

These restrictions force three, four or five distinct types. The following
cases exhaust THIS five-helper interface. They do not enumerate H or
provide finite coverage of arbitrary exteriors.

### Five distinct types

Two cycle edges lack a helper. If they are adjacent, omit their shared
vertex; the other five demands each get their own distinct helper.
Otherwise rotate so the missing edges are e_0 and e_d with d=2,3,4 or 5.
Choose the omission as follows:

| d | Omit | Remaining demand without a type helper |
|---|---|---|
| 2 | u_3 | e_0 |
| 3 | u_3 | e_0 |
| 4 | u_4 | e_0 |
| 5 | u_5 | e_0 |

The omission removes e_d and one available type edge. Four remaining demands
get distinct helpers. The omitted vertex is adjacent in H[S] to both u_0
and u_1, so supplies the fifth path u_0-o-u_1. All interiors are distinct.

### Four distinct types

Rotate the duplicated type to 0. Types 2 and 5 are absent by MC; the other
three types are three of {1,3,4,6}. Let j be the unused member of that set.

| j | Edges lacking helpers | Omit | Demand repaired through omission |
|---|---|---|---|
| 1 | e_1,e_2,e_5 | u_2 | e_5 |
| 3 | e_2,e_3,e_5 | u_3 | e_5 |
| 4 | e_2,e_4,e_5 | u_5 | e_2 |
| 6 | e_2,e_5,e_6 | u_6 | e_2 |

In every row the omission removes two unavailable edges, the four type edges
remain, and the omitted vertex is a common neighbor for the fifth demand.
Use one distinct helper for each of those four type edges. The spare duplicate
is unused. All five interiors are disjoint and outside the selected roots.

### Three distinct types: the one necessary longer reroute

Multiplicities are 2,2,1. Rotate/reflect the adjacent duplicated types to
0 and 1. The no-offset-two rule excludes types 2,5 (from duplicate 0) and
3,6 (from duplicate 1). The singleton must have type 4. Label the helpers
t_0,t_1 of type 0, t_2,t_3 of type 1, and t_4 of type 4.

Omit u_3; the selected demands are e_0,e_1,e_4,e_5,e_6. Use:

| Demand | Path | Interior |
|---|---|---|
| e_0 | u_0-t_0-u_1 | t_0 |
| e_1 | u_1-t_2-u_2 | t_2 |
| e_4 | u_4-t_4-u_5 | t_4 |
| e_5 | u_5-u_3-u_6 | u_3 |
| e_6 | u_6-t_3-t_1-u_0 | t_3,t_1 |

The first three follow the helper types. u_3 is adjacent to u_5,u_6 in H[S].
u_6 is adjacent to type-1 t_3 and u_0 to type-0 t_1; t_3t_1 is present
because T is a clique. Every path edge is established independently.
All six interior vertices are distinct across the five paths; no selected
root is internal. The omitted vertex is used exactly once. The star J_2
permits omission u_3 and has a proper coloring by the domain premise.
No palette is imposed on these paths.

Each case supplies the full UP_6 certificate and hence RL7-P01's six
branches/all fifteen adjacencies. This proves the scoped implication for
arbitrary finite H containing the core, including unbounded extra exterior.
There is no assumption that an arbitrary minor contains these paths or
that core extraction follows from a rooted model.

## RL8-P03 — a complete obstruction to the all-two-edge shortcut

Define F on S union T by C7 on S, no T-T edges and helper types
[0,0,1,1,4] as in the three-type case. H is its complement. This is exactly
[UNCOLORED_CORE_WITNESS.json](UNCOLORED_CORE_WITNESS.json), not a graph sample.
F has 22 edges and is triangle-free; H has twelve vertices and 44 edges,
alpha(H)<=2 and H[T]=K5.

The following rows give T partners for all seven proper star colorings.
Each row plus its repeated S pair is six independent pairs of H:

| i | Repeated S pair | t_0 | t_1 | t_2 | t_3 | t_4 |
|---|---|---|---|---|---|---|
| 0 | u_0,u_1 | u_2 | u_4 | u_3 | u_5 | u_6 |
| 1 | u_1,u_2 | u_4 | u_6 | u_0 | u_5 | u_3 |
| 2 | u_2,u_3 | u_4 | u_6 | u_0 | u_5 | u_1 |
| 3 | u_3,u_4 | u_2 | u_6 | u_0 | u_5 | u_1 |
| 4 | u_4,u_5 | u_2 | u_6 | u_0 | u_3 | u_1 |
| 5 | u_5,u_6 | u_2 | u_4 | u_0 | u_3 | u_1 |
| 6 | u_6,u_0 | u_2 | u_4 | u_3 | u_5 | u_1 |

Alpha<=2 proves chi(H)>=6; a row proves the reverse bound. In EVERY proper
six-coloring all classes have size two. The K5 T vertices occupy distinct
classes, each paired with S; the remaining class is an S pair. Thus S is
colorful in EVERY six-coloring, without enumerating colorings. In J_i the
repeated class becomes singleton w_i and the other pairs retain independence;
new w_i edges have distinct endpoint colors. All seven J_i are six-colorable.
This verifies EVERY premise of the original weaker D_cyc domain.

Each exterior helper is a common neighbor of a cycle nonedge only at its
type. Only e_0,e_1,e_4 have any common T helper. For ANY omission there
are five distinct demands. In a two-edge path its sole internal vertex
must belong to T union {o}, since every other S vertex is a selected root.
The T helpers can cover at most three distinct demanded edges, regardless
of duplicate supply; o can cover at most one additional demand because
interiors must be disjoint. At most four of five demands can be repaired.
This excludes ALL simultaneous all-two-edge families, for every omission
and every star/coloring, by an analytic resource bound. It does not exclude
longer paths. No census of paths or colorings is used.

## RL8-P04 — simultaneous positive model and negative-scope separation

The five P02 three-type paths pass UP_6 on this SAME graph using J_2 and
omission u_3. Assign each whole interior to its first endpoint:

| Branch | Vertices | Connectivity witness |
|---|---|---|
| B_0 | u_0,t_0 | u_0-t_0 |
| B_1 | u_1,t_2 | u_1-t_2 |
| B_2 | u_2 | singleton |
| B_4 | u_4,t_4 | u_4-t_4 |
| B_5 | u_5,u_3 | u_5-u_3 |
| B_6 | u_6,t_3,t_1 | u_6-t_3-t_1 |

All six are nonempty, connected, pairwise disjoint and meet S at their
selected root. All fifteen adjacencies are explicitly witnessed below:

| Branch pair | Edge | Branch pair | Edge | Branch pair | Edge |
|---|---|---|---|---|---|
| 0,1 | t_0-u_1 | 0,2 | u_0-u_2 | 0,4 | u_0-u_4 |
| 0,5 | u_0-u_5 | 0,6 | u_0-t_1 | 1,2 | t_2-u_2 |
| 1,4 | u_1-u_4 | 1,5 | u_1-u_5 | 1,6 | u_1-u_6 |
| 2,4 | u_2-u_4 | 2,5 | u_2-u_5 | 2,6 | u_2-u_6 |
| 4,5 | t_4-u_5 | 4,6 | u_4-u_6 | 5,6 | u_3-u_6 |

G adds singleton {v}, adjacent to all six through their S roots. F_6
prevents six-coloring G, and a six-coloring of H plus a new color for v
proves chi(G)=7. The branch model gives h(H)>=6 and h(G)>=7. Its K7 is
a proper minor of the thirteen-vertex G, so this G is outside full C_7.
The all-two-edge obstruction is not a UP_6, CR_6 or ordinary negative.

## Verification, circularity, falsification and stopping review

[verify_uncolored_core.py](verify_uncolored_core.py) was written before
execution, after the exact finite bounds were recorded. It checks this one
graph, 220 triples, seven supplied colorings/quotients, seven helper-resource
sets, five supplied paths (four length two, one length three), disjoint
interiors, the six branches and all fifteen/21 positive adjacencies. It
performs no graph/coloring/path search. Universal colorfulness and the
all-two-edge negative are analytic proofs above. The scoped P02 case
classification is also analytic, not established by the fixed witness.

All three inherited verifiers pass at their unchanged RL7-witness,
nine-vertex finite-base and corpus-packaging scopes. Authority has no local
diff. No formal proof checking, independent external review or novelty claim.

The first version using only distinct common helpers is inadequate by P03.
The ONE assessed mechanism accommodates that obstruction through the
omitted vertex and one two-helper reroute; it is not a second source gate
or an unchanged SP_6 attempt. Stop general consequences at missing Q5
extraction. Stop any attempted P02 reuse without the T clique or alpha-core
hypothesis. Neither ordinary Hadwiger, general CR_6 nor UP_6 is assumed to
prove its own path input, and an arbitrary rooted minor is not converted
silently into a rooted subdivision.

## Surviving scopes, residuals and next decision

RL6-P01–P04 and RL7-P01–P04 survive at their exact scopes. SP_6 stays retired
on D_cyc; FL-009's positive graph still passes UP_6. The new short-path
obstruction retires only an additional all-two-edge shortcut; UP_6 remains
unproved on D_cyc outside Q5. All general exterior orders, components,
path lengths, colorings and root choices remain. The alpha<=2 count is not
a global finite reduction. The critical cyclic slice without Q5, other
degree-seven complements outside the inherited matching slice, all degrees
>=8, general colorful pairs and larger S, all ordinary t>=8 and CR_s for
s>=7 remain. No configuration is shown unavoidable.

Retain A1–A11, CM-B/CM-D/CM-R, the exact finite base, RL4 and RL5 scopes,
the corpus, roadmap, dependency map, bridge ledger, countermodel proofs and
Collatz review with its unrerun-certificate limits. C2 still lacks independent
side extraction and an exterior bound; C3 still lacks unavoidability. BR-03
retains both alternatives, unknown T and every 7<=t<T; BR-04's sharp upgrade,
BR-05's loss-free integral transfer and BR-06's coverage remain.

FL-001–FL-009 are preserved; [FAILURE_AND_LESSON_LEDGER_APPENDIX.md](RL8_FAILURE_AND_LESSON_LEDGER_APPENDIX.md)
adds FL-010 with the exact capacity failure, surviving construction,
downstream limits and retry condition. M1 is not restarted. RL3-GAP-01,
RL3-GAP-02, OPEN-0005, OPEN-0008 / SRC-0014 / RES-0015 and all sixteen
unchecked-source limits remain. The exact source labels are SRC-0001,
SRC-0002, SRC-0006, SRC-0008, SRC-0014, SRC-0020, SRC-0021, SRC-0022,
SRC-0023, SRC-0025, SRC-0026, SRC-0027, SRC-0028, SRC-0029, SRC-0030,
SRC-0031. Original/published access failures and incomplete cutoff/citation
discovery remain. No retrieval failure is an openness certificate.

One bounded RL8 unit is complete and CLOSED/FROZEN by the normal atomic
transition. RL8-P01–P04 are promoted only at their exact analytic scopes.
The complete incoming generation and twelve-file checkpoint are preserved
byte-identically under incoming/ and checkpoint/ in sessions/RL8/.
Closeout performs no mathematics. RL9 is the sole incoming successor for
[the already prepared EX5 task](RL9_HELPER_CLIQUE_EXTRACTION_BRIEF.md). General UP_6 remains
unproved/unrefuted; EX5 is unproved and no RL9 research has begun.
The programme remains active.
