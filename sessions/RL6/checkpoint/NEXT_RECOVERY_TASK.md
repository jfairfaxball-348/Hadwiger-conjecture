# Next bounded recovery task — cyclic degree-seven defect

Status: **PORTABLE NEXT TASK; NOT STARTED; ALL NEW SELECTION INPUTS CONJECTURAL**.
This is the exact recovery frontier after the completed RL6 work unit. It may be the next RL6 continuation if requested, or the sole bounded target installed for RL7 at normal RL6 closeout. It does not itself install a successor or authorize a numbered transition.

## Why this is a changed task

RL6-P02 repairs only a matching of missing representative adjacencies using disjoint color pairs. RL6-P03 supplies that input on the critical degree-seven matching slice. FL-006 preserves its universal coverage failure.

Now fix a different concrete configuration: d(v)=7 and the graph of nonedges in G[N(v)] is a seven-cycle. Deleting any one of the seven neighbors leaves a P6 of nonedges among the six representatives. It is not a matching, so no choice of coloring or omitted neighbor can make RL6's matching input apply. Shared color labels and the choice between the two repeated-color neighbors must be addressed by a new mechanism.

This is a restricted critical configuration at BR-01 / BR-06, not a restatement of unrestricted CR_6 or the root. No unavoidability of this configuration is asserted. Other degree-seven complements, every degree at least eight, all graph orders and every larger chromatic number remain.

## Exact inherited critical interface

For every finite C_7 graph G and every vertex v with S=N_G(v)={u_0,...,u_6}, d(v)=7, suppose the nonedges of G[S] are exactly u_i u_(i+1), with indices modulo seven. Put H=G-v.

A2 gives exact chi(H)=6 and F_6(H,S). For each i, contract the connected star {v,u_i,u_(i+1)} to form a proper minor J_i. Criticality supplies a proper six-coloring of J_i. Pulling it back to H colors u_i,u_(i+1) alike and the other five S vertices in distinct other colors. H has no universal vertices in the hypothetical counterexample application by RL4-P03.

The first four unique-unique missing pairs can be connected separately by the component-flip argument. The fifth missing pair uses the repeated color: a component containing its unique-color endpoint is forced to contain at least one of the two repeated-color S vertices, but not necessarily the chosen one. Neither this observation nor the separate paths establishes simultaneous compatibility.

## Candidate-development input weaker than full criticality

To test a genuinely independent auxiliary input, formulate it first on this explicit domain:

For every finite simple H and S={u_0,...,u_6} with chi(H)=6, F_6(H,S), and the seven-cycle nonedge pattern above, form G by adding a new vertex v adjacent exactly to S. Assume each of the seven J_i is six-colorable.

These facts are independently expressible and are all supplied by the critical application. They do not assert that every proper minor of G is six-colorable. Colorfulness implies chi(G)=7, but G may still have a K7 minor. This weaker domain allows an attachment or routing countermodel without silently treating it as a root counterexample.

## One precise auxiliary inference to assess

Develop, justify or falsify the following proposed selection mechanism on the explicit weaker domain:

There exist i in {0,...,6}, a proper six-coloring of J_i and its pullback c_i, and an omitted vertex o chosen from {u_i,u_(i+1)} such that, for R=S minus {o}, all five nonedges ab in H[R] admit paths P_ab in H with:
- endpoints a,b and all vertices colored from {c_i(a),c_i(b)};
- interiors avoiding R;
- mutually disjoint interiors, with no selected root appearing as another path's internal vertex.

The omitted neighbor is allowed as an internal vertex of at most one path; flexible roots are not replaced by a fixed transversal. The five defective pairs form a P6. Different paths may share a root endpoint, but may not share an internal vertex.

This is an **unproved sufficient routing input**, not a theorem. If it holds, assign each path's interior to one of its endpoints; each branch is connected through its own root, all interiors are disjoint, the ten original root edges and five repaired edges coexist, and all six branches meet S. A3 supplies order seven at the critical interface. No loss of sharpness or higher-order minor is allowed.

The actual work should identify the first compatibility obstruction: choosing the repeated-color root, or disjointness among paths with a shared color. Use alternate proper-minor colorings only when their exact role in one simultaneous model is proved. A repeated matching proof, a bare contrapositive of CR_6 or independent Menger paths closes nothing.

## Bounds and stopping

One desk-based work unit:
- exactly this seven-neighbor cyclic configuration;
- at most seven named star-contraction types J_0,...,J_6;
- one auxiliary routing/attachment mechanism;
- no broad literature query, source-gate replay, graph census, random sampling, or claimed automatic finite certificate.

The graph outside S, all path lengths, all two-color component structures and all available colorings of each J_i remain unbounded. Seven boundary choices are not a finite reduction of those parameters. Any numerical experiment requires a separately recorded hypothesis, graph-order cap, complete input domain and verifier before execution.

Stop dependent consequences on a valid auxiliary countermodel, missing critical applicability, shared branch interiors, a root fixed without justification, or a circular compatibility assumption. Preserve the failed input and identify an obstruction-changing next task. Do not require the user to supply a theorem before development starts.

An auxiliary path-selection countermodel need not refute R_6. A CR_6 negative separately requires exact chi=6, every-coloring colorfulness and exclusion of every flexible six-branch model. A genuine ordinary negative separately requires rigorous h(G)<chi(G). Do not conflate these scopes.

## Retained records

Read the completed RL6 report and ledger appendix, then only the exact inherited definitions/proofs required by the selected inference. Reuse RL3's roadmap, dependency map, bridge ledger and CM-R at their scopes; preserve RL4/RL5 results and the pinned Collatz review.

Carry RL3-GAP-01, RL3-GAP-02, OPEN-0005, OPEN-0008 / SRC-0014 / RES-0015 and all sixteen unchecked-source limits. No current-openness inference or new-source resolution is made. The root remains full sharp Hadwiger, with proof and rigorously verified ordinary counterexample both legitimate outcomes.
