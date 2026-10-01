# RL7 — cyclic degree-seven compatibility assessment

Date: 2026-10-01 Europe/Madrid. Status: **ONE BOUNDED UNIT COMPLETE; VERIFIED ANALYTIC WORK CHECKPOINT; NOT PROMOTED**.
BASE_HEAD: `a773ff58e114b6a1a81ca388872684ed875372aa`.
Incoming authority tree: `d32e2cb7975570ed6cea69b1a1328ef26d577316`.
The expected predecessor matches exactly. RL7 is the unique incoming session;
its sole brief is `authoritative/RL7_CYCLIC_DEGREE7_COMPATIBILITY_BRIEF.md`.
Inputs and bounds: [RL7_INCOMING_SNAPSHOT.json](RL7_INCOMING_SNAPSHOT.json),
[WORK_UNIT_SCOPE.md](WORK_UNIT_SCOPE.md).

## Outcome and first missing dependency

The proposed shared-color, internally disjoint five-path input is **false on
the brief's explicitly weaker auxiliary domain**. A single twelve-vertex
analytic countermodel satisfies exact six-chromaticity, every-six-coloring
colorfulness, the seven-cycle nonedge pattern and all seven star-contraction
colorability assumptions. For every contraction coloring and either allowed
repeated-color root choice, adjacent unique-color demands necessarily share
an internal vertex. This rules out the candidate's complete existential
selection, not just one unsuccessful coloring.

The same graph has an explicit simultaneous S-rooted K6. Adding v gives an
explicit K7 and exact chromatic number seven. Thus the construction is an
**auxiliary routing countermodel**, neither a CR_6 countermodel nor an ordinary
Hadwiger counterexample. It is outside full C_7 criticality: its K7 is a proper
minor with chromatic number seven. Full criticality was not part of the tested
domain and cannot be imported retrospectively to save the rejected statement.

The first invalid candidate inference is that separately forced bichromatic
paths can be selected with disjoint interiors when consecutive demands share
a unique color. Repeated-color root choice is not needed for this obstruction;
it occurs among the five roots common to both choices. The sufficient
conditional assembly remains valid, and RL6-P01–P04 remain at their exact scopes.

No general CR_6, critical cyclic exclusion, ordinary order-seven conclusion
or full sharp Hadwiger conclusion follows. The exact changed recovery task is
[NEXT_RECOVERY_TASK.md](NEXT_RECOVERY_TASK.md): test uncolored routing after
dropping only the endpoint-palette restriction. The explicit witness below
passes that changed input. Its general validity remains unproved; this unit
does not assess a second mechanism.

## Definitions and complete target quantifiers

All graphs are finite and simple. F_6(H,S) means exact chi(H)=6 and
c(S)=[6] for EVERY proper c:V(H)->[6]. R_6(H,S) means one collection of six
nonempty, pairwise disjoint connected branch sets, all fifteen pairs adjacent,
each branch intersecting S. Roots may be chosen flexibly. C_7(G) additionally
requires every proper minor to be at most six-colorable; that condition is
absent from the auxiliary domain below.

Let D_cyc consist of every (H,S) such that:

1. chi(H)=6 and F_6(H,S);
2. S={u_0,...,u_6}, with its seven distinct vertices in cyclic order, and the
   only nonedges of H[S] are u_i u_(i+1), indices modulo seven;
3. G is formed by adding v adjacent exactly to S, and each J_i, i in [0,6],
   formed by contracting {v,u_i,u_(i+1)}, is six-colorable.

**SP_6 (the tested candidate):** for every (H,S) in D_cyc, there exist i in
[0,6], a proper six-coloring of J_i, its pullback c to H, an omitted vertex
o in {u_i,u_(i+1)}, and a family (P_ab) over the five nonedges ab of
H[R], R=S minus {o}, such that every P_ab is an a-b path with colors only
{c(a),c(b)}, interiors outside R, and mutually disjoint interiors. No selected
root may be internal on another path. The omitted vertex may be internal in
at most one path. The existential coloring and root choice are both retained.

Star colorings pull back properly to H: the two contracted neighbors are
nonadjacent, and all original H edges are retained. F_6 forces the other
five S vertices to have five distinct colors different from the repeated
pair. This is an independently established property, not a compatibility
theorem. At the critical interface A2 supplies F_6, and criticality supplies
the seven proper-minor colorings. No additional criticality was used here.

## Provenance, change, sufficiency and circularity

SP_6 is the sole incoming brief's unproved input, replacing RL6's matching
of disjoint color pairs by a P6 of five defects. The countermodel is derived
in this unit by taking a complement of a triangle-free graph: optimal color
classes of size two force common-color resource collisions. No external
Kempe-routing theorem, new source result or arbitrary-root conversion is used.

**RL7-P01 — conditional sufficiency.** For every finite H,S and six distinct
roots R in S, if the five missing-root edges have the proposed internally
disjoint paths, one R_6 model exists. Assign each complete path interior to
one of its two endpoint branches. Each branch contains its root and a union
of path initial segments at that root, hence is connected. Disjoint interiors
and avoidance of roots make branches disjoint; different paths sharing an
endpoint simply attach to the same branch. Every branch is nonempty and
meets S. Ten original root edges and the last edge of each of five paths
witness all fifteen adjacencies in one model. An omitted neighbor used
internally is assigned only once. Bichromaticity is unnecessary for this
assembly; it was the proposed independent path-selection mechanism.

This is a proved CONDITIONAL implication, not proof of SP_6. A3 would add
{v} at the critical interface without losing order, but its antecedent is
not supplied by the rejected candidate. All-colorings colorfulness is used
as a premise; neither the desired model nor ordinary order seven is assumed.

## RL7-P02 — a valid auxiliary-domain countermodel

Define a graph F on S={u_0,...,u_6} and T={t_0,...,t_4}, disjoint. Its edges
are precisely the seven-cycle edges on S and the following S-T edges:

| Exterior vertex | Neighbors in F |
|---|---|
| t_0 | u_0, u_2, u_4 |
| t_1 | u_1, u_3, u_5 |
| t_2 | u_2, u_4, u_6 |
| t_3 | u_3, u_5, u_0 |
| t_4 | u_4, u_6, u_1 |

There are no F edges within T and no other F edges. Let H be the simple
complement of F. H has twelve vertices and 44 edges. H[S] has exactly the
required cyclic nonedges. H[T] is K5.

### Exact chi(H)=6 and the EVERY-coloring premise

F is triangle-free. The cycle has no triangle, T is independent in F, and
each listed N_F(t_j) is an independent triple of the cycle. These possibilities
exhaust triangles. Thus alpha(H)<=2. Since |H|=12, at least six colors are
necessary.

Each row below is a perfect matching of F: its first pair is the indicated
cycle edge, followed by the five pairs {t_j,u_mj}. Pair endpoints are distinct
and each pair is an F edge, hence an independent set in H. Giving the six
pairs distinct colors proves six-colorability. In particular chi(H)=6.

| i | Repeated S pair | m_0 | m_1 | m_2 | m_3 | m_4 |
|---|---|---|---|---|---|---|
| 0 | u_0,u_1 | 2 | 3 | 4 | 5 | 6 |
| 1 | u_1,u_2 | 0 | 3 | 4 | 5 | 6 |
| 2 | u_2,u_3 | 0 | 1 | 4 | 5 | 6 |
| 3 | u_3,u_4 | 0 | 1 | 2 | 5 | 6 |
| 4 | u_4,u_5 | 0 | 1 | 2 | 3 | 6 |
| 5 | u_5,u_6 | 0 | 1 | 2 | 3 | 4 |
| 6 | u_6,u_0 | 2 | 5 | 4 | 3 | 1 |

In ANY proper six-coloring of H, every color class has size exactly two:
there are twelve vertices, at most six classes, and each has size at most
two. The five T vertices lie in distinct classes because H[T] is a clique.
Their partners all lie in S; the sixth class contains the remaining two S
vertices. Hence every color occurs on S. This proves F_6(H,S) universally,
without enumeration or an inference from the seven displayed colorings.

H has no universal vertices: every S vertex misses its two cycle neighbors,
and every T vertex misses its three listed F neighbors. The countermodel
therefore does not rely on M1's universal-vertex family.

### All seven J_i are six-colorable

Add v adjacent exactly to S to obtain G. For row i, merge v,u_i,u_(i+1)
to w_i. Color w_i with the repeated pair's color and retain the five other
paired color classes from the row. Each remaining class {t_j,u_mj} remains
independent after contraction, since neither of its vertices was merged.
w_i is the sole vertex of its class. Thus every quotient edge has differently
colored endpoints, whatever new w_i edges contraction creates. This is a
proper six-coloring of J_i, for each of the seven types.

Colorfulness also proves chi(G)=7: a proper six-coloring of G would restrict
to a six-coloring of H but leave v no available color on S. Conversely a
six-coloring of H plus a fresh color for v proves chi(G)<=7.

These are the full auxiliary premises. They do not assert all proper minors
of G are six-colorable.

## RL7-P03 — universal failure of shared-color selection

Fix ANY i, ANY proper six-coloring of J_i, and EITHER allowed omitted root.
Pull back to H. Every H color class has size two by P02. The repeated
class is exactly {u_i,u_(i+1)}. The other five boundary vertices
u_(i+2),...,u_(i+6) each have a unique S-color and a distinct partner in T.
All five are selected regardless of which repeated-color vertex is omitted.

Take a=u_(i+2), b=u_(i+3), d=u_(i+4), and write x_a,x_b,x_d for their T
partners. The colors of a,b,d are distinct. The pairs ab and bd are both
missing-root edges in H[R].

The entire two-color subgraph for a,b has just four vertices
{a,b,x_a,x_b}. Edges a x_a and b x_b are absent because each is a color
class; ab is absent by the cycle pattern. The edge x_a x_b is present
because H[T] is a clique. Edges a x_b and b x_a are present: if either
were absent, it and the two already absent edges would yield an independent
triple in H, contradicting alpha(H)<=2. Thus this subgraph is EXACTLY the
path a-x_b-x_a-b. Every eligible bichromatic a-b path has both x_b,x_a
as internal vertices.

Likewise the only eligible b-d path is b-x_d-x_b-d. Its interior also
contains x_b. Consequently the two paths must share x_b internally.
This violates SP_6 before considering the other three demands.

The argument quantifies over every proper coloring of every J_i and both
root choices. It is not seven sampled colorings masquerading as exhaustive
coverage. The omitted vertex has the repeated color, outside these two
palettes, so allowing it internally cannot resolve the collision. Flexible
choice of the repeated-color root cannot affect the three chosen unique
roots. Separate path existence is true here and still insufficient.

Therefore this (H,S) in D_cyc refutes SP_6. Classification: **complete
analytic countermodel proof supporting a method barrier at precisely this
auxiliary scope**. No finite search or numerical negative certificate is
needed for the universal coloring/path conclusion.

## RL7-P04 — explicit positive model and scope separation

Omit u_4 and select R={u_0,u_1,u_2,u_3,u_5,u_6}. The five nonedges among
these roots have the following uncolored paths:

| Missing root edge | Path |
|---|---|
| u_0,u_1 | u_0-t_2-u_1 |
| u_1,u_2 | u_1-t_3-u_2 |
| u_2,u_3 | u_2-t_4-u_3 |
| u_5,u_6 | u_5-t_0-u_6 |
| u_6,u_0 | u_6-t_1-u_0 |

Both edges of every path are H edges by the explicit F-neighbor table.
Their five interiors are distinct members of T and avoid R. The choice
o=u_4 is allowed for J_3 (or J_4); the displayed row 3 provides a J_3
coloring. No bichromatic property is claimed or required for these paths.

One resulting simultaneous model is:

| Branch | Vertices | Connectivity witness |
|---|---|---|
| B_0 | u_0,t_2 | u_0 t_2 |
| B_1 | u_1,t_3 | u_1 t_3 |
| B_2 | u_2,t_4 | u_2 t_4 |
| B_3 | u_3 | singleton |
| B_5 | u_5,t_0 | u_5 t_0 |
| B_6 | u_6,t_1 | u_6 t_1 |

They are nonempty, disjoint, connected and each meets S at its named root.
Among the five branches containing T vertices, their T-T edges supply ten
adjacencies simultaneously. For the other five, B_3 is adjacent to B_0 via
u_3u_0, to B_1 via u_3u_1, to B_2 via u_3t_4, to B_5 via u_3u_5, and to
B_6 via u_3u_6. All fifteen adjacencies are explicit. This also verifies
the ten-original/five-repaired construction in P01 without needing any
color-based branch assignment.

Adding the disjoint singleton {v} gives a seventh branch adjacent to all
six through their S roots. Hence h(H)>=6=chi(H) and h(G)>=7=chi(G).
There is no ordinary negative. Contracting these branches and deleting
unused u_4 gives a K7 proper minor of the thirteen-vertex G, so G is NOT
C_7. The auxiliary countermodel consequently neither refutes a full-critical
selection assertion nor proves such an assertion. A new use of criticality
would need a named independent obstruction-changing argument.

The exhibited uncolored paths explain the precise next change: remove the
palette restriction that forced x_b into both paths. They establish only
that this ONE countermodel passes that relaxation, not that all D_cyc pairs
do. They are part of the countermodel scope audit, not a second universal
mechanism assessment.

## Falsification review, stopping and downstream effects

The analytic proof addresses every auxiliary premise and every existential
choice in SP_6. The explicit positive model prevents promotion of an
auxiliary failure to a CR_6 or ordinary negative. The fixed witness checker
inspects graph construction, triangle-freeness, the seven displayed quotient
colorings, five uncolored paths and all fifteen/21 positive model adjacencies.
It does not enumerate general graphs, colorings or paths and does not prove
the analytic shared-interior theorem by testing examples.

Stop SP_6-dependent consequences at P03. The original conditional implication
P01 survives. No previously promoted theorem is corrected or demoted; SP_6
entered as a conjectural input and is now falsified at its specified scope.
RL6's matching/private-color input and P01–P04, C2's unbounded exterior and
C3's unavoidability residuals are unchanged. M1 remains suspended and covers
none of the critical frontier; no source gate was repeated.

Record this outcome as FL-009 in [FAILURE_AND_LESSON_LEDGER_APPENDIX.md](FAILURE_AND_LESSON_LEDGER_APPENDIX.md).
Lesson: full colorfulness can force separate bichromatic paths yet force
their shared resource at the same time. Simultaneous construction needs a
compatibility argument or a changed routing mechanism. A valid minor can
use differently colored helpers, so failure of palette routing need not
be failure of the desired minor.

## Surviving frontier and all residuals

Full sharp Hadwiger remains h(G)>=chi(G) for EVERY finite simple graph, both
values zero on the empty graph; a full rigorous proof or an actual rigorously
verified finite h<chi counterexample is legitimate. Neither is established.
General CR_6 remains unpromoted/inconclusive; a proof would imply ordinary
order seven ONLY, leaving every ordinary t>=8 and every CR_s for s>=7.

The critical cyclic configuration remains uncovered. Other degree-seven
complements, all degrees at least eight, arbitrary graph order, every larger
root-set size, all exterior/path/component/coloring parameters and every
other bridge obligation remain. No cyclic configuration is shown unavoidable.
Seven star types are not finite coverage of the general domain. This finite
graph falsifies a universal input; it does not bound the exterior of all
graphs or turn the surviving universal positive question into a finite one.

Preserve FL-001–FL-008, RL3-GAP-01, RL3-GAP-02, OPEN-0005,
OPEN-0008 / SRC-0014 / RES-0015 and all sixteen unchecked-source limits:
SRC-0001, SRC-0002, SRC-0006, SRC-0008, SRC-0014, SRC-0020, SRC-0021,
SRC-0022, SRC-0023, SRC-0025, SRC-0026, SRC-0027, SRC-0028, SRC-0029,
SRC-0030, SRC-0031. Original/published full-text access failures, incomplete
cutoff/citation discovery and the quarantined source scopes remain. Failure
to retrieve a resolution is not evidence of openness. Corpus, roadmap,
dependency map, bridge ledger, CM-B/CM-D/CM-R proofs, certificate and the
Collatz review retain their original bytes and inspection/classification
limits. C2 still lacks an exterior bound/independence input; C3 still lacks
unavoidability. BR-03 retains both alternatives, unknown T and finite prefix;
BR-04 retains the sharp upgrade; BR-05 retains loss-free integral transfer.

## Durable decision

One bounded RL7 work unit is complete and should finish. The result is the
analytic auxiliary countermodel, its positive rooted model, the intact
conditional assembly, and a precisely changed recovery task. RL7 remains
OPEN pending explicit finish up and normal atomic closeout; main authority
has not changed. The isolated work checkpoint preserves these results for
review, not authoritative consumption. No novelty, formal proof checking
or independent external review is claimed. The programme remains active.

it makes sense to finish up here
