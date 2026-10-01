# Exact changed recovery task after the RL7 routing countermodel

Date: 2026-10-01. Status: **PREPARED CANDIDATE-DEVELOPMENT TASK; NOT ASSESSED OR PROMOTED**.
This is the frontier for a further authorized work unit or the RL8 handover
after normal RL7 closeout. It does not install RL8 before that transition.

## Failure to address and last valid frontier

RL7-P02/P03 in [RL7_COMPATIBILITY_REPORT.md](RL7_COMPATIBILITY_REPORT.md) give
a twelve-vertex (H,S) satisfying the exact weaker cyclic auxiliary domain
but refuting the original SP_6 input for every star coloring and either
repeated-color root. Two adjacent unique-color demands force the same T
vertex internally. RL7-P04 gives a positive rooted K6 and five uncolored,
internally disjoint paths in that graph. The defect is therefore a forced
palette collision, not an absence of a rooted model. FL-009 records it.

Retain RL6-P01–P04, RL7-P01's conditional assembly, the C2/C3 residuals,
A1–A11 and all inherited obligations. Full sharp Hadwiger is the root;
general CR_6 and ordinary order seven remain unproved here. Full C_7
criticality was not used in the countermodel and cannot be silently added.

## One changed mechanism and complete quantifiers

Use exactly D_cyc from the RL7 report: every finite simple H with exact
chi(H)=6, S={u_0,...,u_6}, F_6(H,S) in EVERY proper six-coloring, cyclic
nonedges u_i u_(i+1), and all seven six-colorable J_i obtained by adding v
adjacent exactly to S and contracting {v,u_i,u_(i+1)}.

**UP_6, a new unproved sufficient input:** for every (H,S) in D_cyc, there
exist i in [0,6], a proper six-coloring of J_i, an omitted vertex
o in {u_i,u_(i+1)}, and, with R=S minus {o}, five paths P_ab in H indexed
by the five nonedges ab of H[R], such that:

- P_ab has endpoints a,b and interior disjoint from R;
- all five interiors are mutually disjoint; no selected root is internal
  on another path;
- o is internal in at most one path;
- vertices of P_ab may have ANY colors. No endpoint-palette condition is imposed.

The coloring is retained as an available star witness; it does not impose
a path palette or permit mixing different colorings into one presumed model.
Equivalently the new routing assertion chooses an omitted boundary vertex
and five uncolored paths, since every boundary vertex lies in an eligible
star pair. This equivalence removes only an irrelevant witness choice, not
any domain premise. Roots remain flexible among all seven vertices.

**Precise change:** delete only SP_6's bichromatic-path requirement, retaining
its full auxiliary domain and every disjointness, rooting and sharpness
condition. This lets a demand use a differently colored common neighbor
instead of the unique partner forced by its two-color subgraph. The recorded
countermodel actually passes UP_6: use J_3, o=u_4, and the five explicit
two-edge paths in P04. This addresses the recorded obstruction concretely.

**Provenance/status:** this candidate is formulated from the exact RL7
countermodel and positive witness. It is neither inherited as a theorem nor
justified generally by that witness. Exploration is authorized; proof
admission requires a complete independent argument or a correctly scoped
countermodel. There is no new literature dependency.

## Sufficiency and non-circularity

RL7-P01 assembles UP_6 into one rooted K6, with ten original and five
repaired adjacencies, all six branches nonempty, connected, disjoint and
meeting S. A2 plus critical proper-star colorings supplies D_cyc in the
critical application, and A3 adds singleton v. No larger-order model or loss
of sharpness is allowed.

UP_6 is a more restrictive routing certificate than an arbitrary rooted
minor: it repairs every missing edge of one six-root induced boundary by
five internally disjoint paths, yielding a subdivision with those roots.
Do not replace the unrestricted ordinary-Hadwiger target by an unrestricted
subdivision assertion. This is only a candidate sufficient construction for
the named cyclic interface. Its failure may leave a general branch model.
An assertion that absence of this certificate alone permits a coloring
missing a color on S needs its own proof; naming an obstruction does not
establish it. Assuming UP_6 to prove UP_6 or using R_6 as its justification
would be circular or an unsupported converse.

## One bounded next work unit

Assess UP_6 on the same weaker domain, with one uncolored-routing mechanism
and at most seven named star-contraction types. First check that the proposed
argument genuinely permits paths outside the old two-color subgraphs and
does not fix an unjustified repeated-color root. Seek one independent
unbounded-domain construction/obstruction argument or one rigorously checked
auxiliary countermodel. Do not reassess SP_6 unchanged, restart M1, replay the
source gate, conduct a graph census, sample graphs, or refresh the roadmap.

Graph exterior size, path lengths, component structure and coloring choices
remain unbounded. Seven possible omissions/stars do not establish global
finite coverage. A numerical experiment requires its hypothesis, exact graph
order cap, complete domain and verifier to be recorded before execution.

Stop on overlapping interiors, roots appearing internally, wrong colorfulness
quantifiers, an unproved converse from a minor to this certificate, silently
imported full criticality, or incomplete finite coverage used as universal.
A negative must exclude UP_6 for every allowed omission and every path
family; one failed routing is insufficient. A CR_6 negative separately
requires exclusion of all flexible branch models; an ordinary negative
separately requires rigorous h<chi.

## Residuals, retry conditions and deliverable

No critical cyclic exclusion or universal CR_6 is inherited from RL7. Other
degree-seven complements, every degree at least eight, all larger root sets,
all ordinary t>=8 and CR_s for s>=7, BR-03's alternatives/unknown T/prefix,
BR-04's sharp upgrade, BR-05's loss-free integral transfer and BR-06's
unavoidability remain. C2 still has unbounded exterior size and missing
independence extraction; C3 still lacks a coverage theorem.

Preserve FL-001–FL-009, RL3-GAP-01, RL3-GAP-02, OPEN-0005,
OPEN-0008 / SRC-0014 / RES-0015, all sixteen unchecked-source limits,
original/published access and cutoff/citation discovery limits, the inherited
corpus, roadmap, dependency map, bridge ledger, countermodels, finite
certificate and Collatz inspection limits. No current-openness inference.

Original SP_6 is retired on D_cyc. Retrying it would require a named changed
premise with independent applicability and an argument eliminating the
shared-interior obstruction; merely excluding this one positive model by
assuming full criticality is not a proof. The present task changes routing
instead. If UP_6 also fails, preserve its complete scope and prepare one
different branch-allocation or critical-input task tied to its first missing
dependency, rather than repeating either selection attempt or ending the
programme.

Deliver one bounded assessment with exact statements, established versus
candidate inputs, proof classifications, falsification, downstream effects,
failure lessons, surviving scope and an exact next recovery task. Recommend
continue or finish under AGENTS.md. No success is promised.
