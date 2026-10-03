# RL7 bounded assessment — recorded scope

Date: 2026-10-01 Europe/Madrid. Completed RL7 pre-assessment scope; historical.
This records original bounds and planned operations, not live RL8 instructions.
BASE_HEAD: a773ff58e114b6a1a81ca388872684ed875372aa.
Authority tree: d32e2cb7975570ed6cea69b1a1328ef26d577316.
Unique incoming session: RL7. The expected predecessor matches exactly.

## Target and quantifiers

Assess exactly the shared-color five-path input in the sole incoming
authoritative/RL7_CYCLIC_DEGREE7_COMPATIBILITY_BRIEF.md. Its domain is every
finite simple H with exact chi(H)=6, S={u_0,...,u_6} colorful in EVERY proper
six-coloring, complement H[S]=C7, and all seven J_i six-colorable, where G adds
v adjacent exactly to S and J_i contracts {v,u_i,u_(i+1)}. Full C_7 criticality
is NOT part of this auxiliary domain.

The candidate quantifies existentially over one i, any proper six-coloring of
J_i, either omitted vertex in the repeated pair, and all five paths. Every
path must be bichromatic for its endpoint colors, have interior outside the
six selected roots, and be internally disjoint from the other four. The
omitted vertex may be internal in at most one path. This is an unproved
sufficient input, not an accepted theorem.

## Changed input, one attempt and bounds

RL6's disjoint palettes are replaced by the brief's P6 defects with shared
colors. One desk-derived falsification construction is being checked:
H is the complement of a triangle-free graph on exactly seven boundary
vertices and five exterior vertices. Each optimal color class is thereby
forced to have size two. Adjacent unique-color demands may require the same
exterior vertex. This construction tests the named input, not CR_6 or the root.

No literature query, source-gate replay, random sampling, graph census or
additional mechanism assessment is authorized by this unit. At most the
seven named star-contraction types are inspected. Exterior size, path lengths,
components and available colorings in the GENERAL domain remain unbounded.

Verification bounds for the single desk-derived witness are explicit:
exactly 12 vertices for H, 13 for G, 7 specified J_i, the listed 7 colorings,
one listed six-branch model, and one listed set of five uncolored paths used
only to distinguish scopes and formulate the next recovery task. A witness
consistency script may inspect all vertex pairs/triples in this one graph
and these explicit witnesses. It will NOT enumerate arbitrary graphs or
claim exhaustive color/path search. Universal color and failure quantifiers
must be established analytically, not inferred from these finite checks.

## Sufficiency, circularity, falsification and stopping

If the original routing input holds, assign each path interior to an endpoint
branch; all interiors are disjoint and avoid roots. Branches stay connected,
ten original adjacencies and five repaired adjacencies coexist, and every
branch meets S. This proves only a conditional implication until the input
is independently justified. A2/A3 connect it to the critical application.

A valid auxiliary countermodel must meet EVERY domain premise and exclude
the candidate for every i, every J_i coloring, and both root choices. A single
bad coloring does not suffice. Stop candidate-dependent deductions on such
a countermodel. A CR_6 negative would additionally need exclusion of every
flexible six-branch model; an ordinary negative needs rigorous h<chi.

First compatibility obstruction to test: shared unique-color path interiors.
Repeated-color root choice is also retained and must not be fixed silently.
If the input fails, preserve its proof, surviving implication and inherited
frontier, then specify one obstruction-changing recovery task. No assessment
of that successor mechanism is part of this unit.

## Current operation

Start gate verified; required reads and hashes are in RL7_INCOMING_SNAPSHOT.json.
Next: check the explicit 12-vertex construction, all seven star-coloring
witnesses, the universal shared-interior obstruction, and a positive model
to distinguish an auxiliary failure from CR_6 and ordinary counterexamples.
