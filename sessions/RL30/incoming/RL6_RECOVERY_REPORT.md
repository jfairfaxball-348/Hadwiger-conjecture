# RL6 — bounded route recovery assessment

Date: 2026-09-30. Status: **RL6 CLOSED/FROZEN; completed scoped results carried into sole incoming RL7**.
BASE_HEAD: `63af75cde689372a766105d1b3d7cdcac1ad36c8`.
Incoming authority tree: `5f109b306dca394f0a48b12b3ed40af7d7ad411a`.
Current brief: [RL6_ROUTE_RECOVERY_AND_PIVOT_BRIEF.md](RL6_ROUTE_RECOVERY_AND_PIVOT_BRIEF.md).
Inputs and pre-assessment bounds: [RL6_INCOMING_SNAPSHOT.json](RL6_INCOMING_SNAPSHOT.json), [RL6_WORK_UNIT_SCOPE.md](RL6_WORK_UNIT_SCOPE.md).

## Outcome and root boundary

One bounded recovery work unit is complete. Three changed candidates were compared; C1 / BR-01 was selected for the deeper assessment. It supplies a **complete scoped analytic rooted-K6 construction** from an independently expressible coloring certificate. Contraction criticality supplies that certificate on the degree-seven, matching-defect neighborhood slice. Consequently that configuration is excluded from a hypothetical minor-minimal order-seven counterexample.

The scoped mechanism is valid without universal vertices and retains exact six-chromaticity, colorfulness in every six-coloring, flexible roots, unrestricted graph order and unrestricted root-set size. Its extra certificate is not automatic: an analytic countermodel to universal certificate extraction is H=C5 join C5, S=V(H). That graph has a rooted K6, so the countermodel does not refute CR_6 or ordinary Hadwiger.

Full sharp Hadwiger remains h(G)>=chi(G) for every finite simple G, with both values zero on the empty graph. Either a complete rigorous proof or an actual rigorously verified finite graph with h(G)<chi(G) resolves the root. Neither is established. Universal CR_6 remains NOT PROMOTED / INCONCLUSIVE; even a general CR_6 proof implies ordinary order seven only, leaving every ordinary t>=8 and CR_s for s>=7.

The complete analytic deductions below are promoted only at their exact stated scopes by the normal atomic RL6 closeout. No novelty, formal checking, or independent external review is claimed. No new literature retrieval, graph census, or numerical certificate was undertaken.

## Verified incoming frontier and first missing dependency

The pinned current entrypoint names exactly RL6 and one sole recovery brief. The current process amendment supersedes historical RL5 hold wording. There is no unexplained unresolved integrity failure. All 45 fetched input/verifier blobs match their recorded Git identities. Both inherited verifiers pass at their unchanged scopes.

Use the inherited definitions:
- C_t(G): chi(G)=t and every proper minor J of G has chi(J)<=t-1.
- F_s(H,S): chi(H)=s and every proper c:V(H)->[s] has c(S)=[s].
- R_s(H,S): one collection of s nonempty, pairwise disjoint, connected branch sets, pairwise adjacent, every branch meeting S.
- M_t(G): the same simultaneous model without the rooting requirement.

A1 yields C_t in a minimal counterexample; A2 yields F_(t-1)(G-v,N(v)); A3 attaches the singleton v to a rooted model with no loss of order. At t=7 the inherited ordinary order-six theorem also gives an unrooted K6 in H=G-v. **The first missing dependency is a theorem converting the established critical/colorful interface into one compatible N(v)-rooted K6.** Neither independent paths nor a same-order unrooted model proves that conversion.

| Inherited lesson | Actual diagnosis | Surviving valid scope / consequence here |
|---|---|---|
| FL-001 / CM-R | The weak rooted replacement is falsified; no promoted CR_6 theorem was refuted. | Preserve the nine-vertex certificate and analytic lift. Use actual all-colorings colorfulness and check simultaneous interiors. |
| FL-002 / M1 | Coverage barrier, not a false restricted theorem. P03 excludes even one universal vertex in the critical application. | Preserve RL4-P01/P02/P03. C1 does not use universality. No M1 restart. |
| FL-003 / RL5 | Completed source comparison is inconclusive for CR_6; original and journal access failures are retrieval limits. | Preserve exact checked index and statement scopes. No unchanged gate/query replay and no inference of openness. |
| FL-004 | Process defect: exploratory development had been held to proof-admission requirements. | Develop a candidate independently now; consume only the scoped input actually proved below. |
| FL-005 / Collatz review | Imported methodology, with no external certificate rerun. | State every residual parameter and coverage obligation; no finite-signature or local-result promotion to the root. |

The precise surviving deductions, source scopes and source/access limits remain in [PROOF_STATE_AND_OPEN_OBLIGATIONS.md](PROOF_STATE_AND_OPEN_OBLIGATIONS.md), [DEPENDENCY_MAP.md](DEPENDENCY_MAP.md), [BRIDGE_LEDGER.md](BRIDGE_LEDGER.md), [FALSIFICATION_REPORT.md](FALSIFICATION_REPORT.md), and RL4/RL5's reports. They are reused without reinterpretation.

## Three changed candidates

### C1 — BR-01: match the color pairs used to repair missing root adjacencies

**Full statement.** For every finite simple H with chi(H)=6 and every S subseteq V(H) with F_6(H,S), suppose there exist a proper coloring c:V(H)->[6] and six distinct representatives r_i in S with c(r_i)=i. On [6] let D contain ij exactly when r_i r_j is not an edge of H. Require:
1. D is a matching, possibly empty.
2. For every endpoint i of an edge of D, S intersect c^(-1)(i)={r_i}.

Call this extra certificate L_6(H,S;c,r). The candidate conclusion is one simultaneous R_6(H,S), with r_i in branch i. The existential choice of c and r is part of the certificate; no globally prescribed root injection replaces the flexible-root target.

**Established/hypothetical inputs.** F_6 is the full inherited target premise. Proper colorings exist by exact chi=6. Existence of L_6 is an additional input to justify, not a consequence assumed from colorfulness. The scoped implication and its specific critical application are proved below.

**Provenance and change.** This is a desk-derived use of the elementary two-color component flip. It adds a concrete attachment certificate absent from CM-R's weak premises. It replaces M1's exclusive colors from universal vertices by unique colors on S only at endpoints of missing adjacencies, and requires disjoint color pairs to certify compatibility. No cited Kempe-routing theorem is imported or generalized.

**Missing inference and root connection.** Colorfulness forces a path for each missing root edge. The matching makes the paths use disjoint palettes, proving simultaneous compatibility. At the critical interface, R_6 plus singleton v gives M_7 by A3. Existence of the certificate on every critical pair remains a separate coverage obligation.

**Covered/residual cases.** All H and all S admitting the certificate; no order, degree, connectivity, or |S| bound. Extra roots may share colors that are not endpoints of D. Covered critical configurations are proved in P03. Every other critical configuration, every larger t, and universal certificate extraction remain.

**Sufficiency/circularity/falsification.** Check all fifteen adjacencies in one model, all unique-color assertions on the entire S, and disjoint path interiors. F_6, not the desired minor, drives the flips. Reject universal extraction on a valid colorful pair with no certificate; P04 supplies that rejection. Stop if palettes overlap without an independent compatibility argument.

**Disposition.** Selected for the single deeper assessment. Scoped implication proved; universal applicability refuted at the general colorful-pair scope. Critical coverage remains partial.

### C2 — BR-03: distinguish the external signatures of an actually independent large side

**Full statement and mechanism.** For every integer t>=7, every finite C_t graph G, and every pair of disjoint sets A,B such that all A-B edges exist and B is independent in G, set X=V(G) minus (A union B), r=|X| and b=|B|. Then the sets N_G(y) intersect X, y in B, form an antichain under inclusion; in particular b<=2^r.

**Established step.** If two distinct y,z in B had N_X(y) subseteq N_X(z), independence of B and completeness to A would give N_G(y) subseteq N_G(z). A proper (t-1)-coloring of the proper minor G-y could be extended by assigning y the color of z. This contradicts chi(G)=t. Thus all signatures are incomparable and distinct, giving the elementary 2^r bound. This is a reconstructed analytic necessary condition, not a completion theorem.

**Hypothetical coverage input.** To derive a contradiction from BR-03's B_t alternative, one would need an independently proved large independent B and a bound on r incompatible with its huge b. Neither is inherited. No independence of either side of the K_(a,b) subgraph is silently assumed.

**Provenance/change.** Vertex criticality now enters explicitly through coloring extension; CM-B's bare seed has false twins and chi=2. The changed mechanism addresses that seed-only failure, but does not exclude arbitrary critical seeds with distinct external signatures.

**Root connection/residuals.** Keep epsilon=1/4, the unknown uniform T, a>=floor((log t)^(1/4)), b>=floor(exp(t^(3/4))), and all t>=T. The inequality only forces r>=ceil(log_2 b). Arbitrary graph order permits that r. Internal B edges, independence extraction, sharp preservation, all D_t cases, and every 7<=t<T remain. No branch of the dichotomy is closed.

**Sufficiency/circularity/falsification/stop.** The local coloring extension is non-circular. It is insufficient for M_t without a new external-size/structure bound and scope-matched extraction. Stop an attempted contradiction at the unbounded r, rather than treating 2^r signatures as a finite global problem. Reopen only for a named bound or structure preserving criticality and sharpness.

**Disposition.** Necessary step survives; rejected as a currently sufficient completion pivot. Not selected for deeper work.

### C3 — BR-06: glue across a one-defect clique separator by two proper minors

**Full configuration.** For every integer t>=7 and finite C_t graph G, consider a partition V(G)=A union K union B with A,B nonempty, no A-B edges, 2<=|K|<=t-1, and G[K] a clique with exactly one missing edge xy. Suppose an x-y path has all its internal vertices in A and another has all its internal vertices in B. The proposed local reduction excludes this configuration.

**Established/proposed inputs and sufficiency design.** Criticality makes every proper minor (t-1)-colorable. For the A-side, delete B outside its specified path and contract that whole x-y path to identify x,y, retaining A and K minus that identification. This is a proper minor: at least one internal B vertex and one of x,y disappear. Its coloring pulls back to a proper coloring of G[A union K] with x,y sharing a color. The analogous A-path contraction supplies that type of coloring on G[B union K]. On K the merged pair and the other vertices are a clique of |K|-1 color classes. Permute the second palette to match the first on those classes and glue. No A-B edges exist, so the resulting coloring is proper on G and uses at most t-1 colors, a contradiction. This checks the local reduction's sufficiency; no unavoidability investigation follows.

**Provenance/change.** A concrete separator, exact boundary-color types and two smaller minors replace the unspecified catalog template at BR-06. No separator theorem from an unchecked source is used. Merely possessing separate paths would not suffice without their role in the two coloring minors and the exact gluing partition.

**Coverage/root connection.** This is a scoped exclusion of a particular critical configuration, decreasing vertex count. Neither existence of such a separator nor uniform unavoidability is proved. All separator-free graphs, other separator patterns, all orders, unbounded side/path sizes, and every t>=7 remain. Local reducibility contributes only if a future coverage theorem supplies this or another reduced configuration.

**Falsification/circularity/stop.** Check that each quotient is a proper minor, every original side edge survives in its pullback, and the palette permutation respects every boundary vertex. The complete root is never assumed. Stop any global conclusion at absent unavoidability; one configuration does not become an exhaustive catalog. Retry requires a named coverage or obstruction-changing reduction input.

**Disposition.** Scoped analytic coloring reduction survives the comparative sufficiency check. Its global coverage is open. Not selected for deeper configuration work.

## Selected deeper assessment: C1

### RL6-P01 — colorfulness forces a missing-edge path

Fix all C1 inputs, and let ij be an edge of D. Consider the connected component C of H[c^(-1)({i,j})] containing r_i. If it did not contain r_j, interchange colors i and j on C. This remains a proper coloring of H: an edge with both endpoint colors in {i,j} lies within one component; every other neighbor color remains distinct from i and j.

The only S vertex originally colored i is r_i; it changes to j. The only S vertex originally colored j is r_j, outside C. No other vertex of S can change to i. The new proper six-coloring therefore misses i on S, contradicting F_6. Hence C contains r_j, and a simple i-j-colored path P_ij connects the roots.

The path contains no other selected root, because all other r_k have colors outside {i,j}. This is a proof from the full all-colorings premise, not a routing assertion about one arbitrary transversal.

**Classification:** complete elementary analytic lemma at C1's exact hypotheses.

### RL6-P02 — assemble all six branches and all fifteen adjacencies

Choose one P_ij from P01 for each edge ij of D. Distinct edges of the matching use disjoint sets of colors, so their whole vertex sets are disjoint. All interiors avoid the selected roots.

For each missing pair with i<j, assign every internal vertex of P_ij to branch i. Let B_i be r_i plus the interiors assigned to it; all other B_i are singleton roots. A vertex i belongs to at most one missing pair.

- Every B_i is nonempty and meets S at r_i.
- Each is connected, since its added vertices form the initial segment of a path from r_i; singleton branches are connected.
- All branches are disjoint: path palettes are disjoint and no interior contains another root.
- If ij is not in D, the original edge r_i r_j witnesses that branch adjacency.
- If ij is in D with i<j, the last edge of P_ij joins B_i to the singleton B_j.

If D has m edges, these are precisely m repaired adjacencies and 15-m original adjacencies, simultaneously. No other compatibility assertion is left implicit. Thus L_6 plus F_6 implies R_6.

**Classification:** complete scoped analytic rooted-model construction. At most three paths; arbitrary graph order and arbitrary |S|. No external higher-order minor, universality, dominating condition, or sharpness loss is used.

### RL6-P03 — independently supply the input at a critical degree-seven matching defect

For every finite C_7 graph G and v with d_G(v)=7, assume the graph of nonedges of G[N(v)] is a matching. Set H=G-v, S=N(v). A2 supplies exact chi(H)=6 and F_6(H,S).

The matching cannot be empty: otherwise S is a seven-clique, while H is a proper minor with chi(H)<=6. Select one missing pair x,y. Contract the connected set {v,x,y} to one vertex w, retaining all remaining vertices and edges, to form a proper minor J. A proper six-coloring of J exists by C_7. Pull it back to H by assigning both nonadjacent x,y the color of w and every other H vertex its corresponding color. Every edge of H is respected; contraction may add constraints but none of the original edges is omitted. This uses criticality of a proper minor, not chromatic minor-monotonicity.

Relabel the common x,y color as 1. Since S has seven vertices, F_6 and that repeated color force the five vertices of S minus {x,y} to have five distinct colors 2,...,6. Each is the only occurrence of its color on S.

Choose r_1=x and the other five roots accordingly, omitting y. In the matching of nonedges on S, x's only nonneighbor is y. Hence r_1 is adjacent to all other selected roots. Every missing selected-root edge is among the remaining five vertices; these edges still form a matching, and every endpoint color is unique on S. The pulled-back coloring therefore supplies L_6. P02 gives one S-rooted K6 in H, including all fifteen adjacencies, and A3 adds singleton v to give a K7 in G.

Since d(v)=7 implies |V(G)|>=8, this K7 is a proper minor, contradicting C_7. **No C_7 graph has this configuration.** In particular it is excluded from every hypothetical minor-minimal order-seven counterexample. This is a conditional-domain exclusion, not evidence that a counterexample or a graph in the excluded domain exists.

For context, the elementary star-fold count also gives alpha(G[N(v)])<=d(v)-5 in any C_7 graph. For an independent I of at least two neighbors, contract {v} union I and pull its six-coloring back to H; S then uses at most 1+d(v)-|I| colors, whereas A2 requires six. Singletons satisfy the same bound since d(v)>=6. At degree six the neighborhood is a clique; with v it supplies K7. Thus a hypothetical minor-minimal K7-minor-free counterexample has minimum degree at least seven. At degree seven its complement-neighborhood must be triangle-free, and P03 further excludes a matching complement. None of this forces the complement to have a covered form at every vertex.

The application is compatible with RL4-P03's absence of universal vertices in H: no vertex here is assumed universal in H. Adjacency of the chosen repeated-color root is only to the other five representatives, a strictly local fact.

**Classification:** complete elementary analytic critical-input and scoped exclusion, using A2/A3's fully reconstructed reductions. No independent literature input beyond the recorded frontier is needed.

### RL6-P04 — universal certificate extraction is false

Let H=C5 join C5 and S=V(H), the inherited RL4 coverage example. Every five-cycle has chromatic number three and independence number two. The join forces disjoint palettes, so chi(H)=6. S is colorful in every optimal coloring.

In every proper six-coloring, each cycle uses exactly three colors with class sizes 2,2,1: every class has at most two vertices and all three are nonempty. Only one color in each cycle occurs uniquely on S. A six-color transversal must select three vertices in each cycle. Those three cannot form a triangle, so some selected pair in that cycle is nonadjacent. C1 would require both its endpoint colors to occur uniquely on S, but that cycle has only one such color. This is impossible. Thus no coloring and no selection of representatives supplies L_6.

H has no universal vertices. It nevertheless has a rooted K6: in each cycle labelled 0,...,4 use the three connected, disjoint, pairwise adjacent branches {0,1}, {2,3}, {4}; the join supplies all nine cross adjacencies. All branches meet S.

Therefore F_6 does not imply existence of the matching certificate. This rejects only a proposed universal *coverage* inference. It neither falsifies the scoped implication P02 nor gives a CR_6 countermodel or an ordinary Hadwiger counterexample.

**Classification:** complete analytic countermodel proof supporting a coverage barrier; no enumerative finite-certificate claim.

### Explicit non-universal example with |S|>6

For any integer m>=1, take a clique Q={q_1,...,q_6}, six vertices r_i inducing K6 minus r_1r_2 and r_3r_4, and m additional pairwise nonadjacent vertices z_j. Join r_i to exactly Q minus {q_i}. Join each z_j to exactly Q minus {q_6}. Add no other edges involving the z_j. Put S={r_1,...,r_6} union {z_1,...,z_m}.

Q forces chi=6; every optimal coloring gives r_i the color of q_i and every z_j the color of q_6, so S is colorful in every six-coloring. No vertex is universal: q_i misses r_i, every r_i misses q_i, and every z_j misses q_6. The graph is connected, has order 12+m and |S|=6+m.

Choose r_i as the representatives. The endpoint colors of the two missing pairs are unique on S; the duplicated sixth color is not an endpoint. Paths r_1-q_2-q_1-r_2 and r_3-q_4-q_3-r_4 have disjoint palettes and give the model in P02. This demonstrates that the certificate does not require |S|=6 or universality. It supplies no unavoidability assertion for critical graphs.

## Residuals, lessons and next operation

The newly justified critical exclusion covers only the stated neighborhood configurations. Every other degree-seven complement, including a seven-cycle, and every vertex degree at least eight remain. The critical input does not automatically admit every colorful H,S. Noncritical arbitrary six-chromatic pairs outside L_6 remain. No route supplies general CR_6 or resolves ordinary order seven. Every t>=8, every CR_s for s>=7, BR-03's two alternatives/T/prefix, BR-04's sharp upgrade, BR-05's transfer and BR-06's unavoidability remain.

P04 is a useful failure: the sufficient certificate can be proved while its universal extraction is false. The applied lesson is to separate path sufficiency from structural coverage. C2 preserves the unbounded external signature parameter; C3 preserves the unavoidability obligation. See the dated [failure-ledger appendix](RL6_FAILURE_AND_LESSON_LEDGER_APPENDIX.md) and [residual classifications](RL6_PROOF_STATE_AND_RESIDUAL_LEDGER.md).

The next bounded recovery task is [RL7_CYCLIC_DEGREE7_COMPATIBILITY_BRIEF.md](RL7_CYCLIC_DEGREE7_COMPATIBILITY_BRIEF.md): a degree-seven neighborhood whose complement is C7, where selecting six neighbors leaves a P6 of missing adjacencies. Unlike a matching, that pattern necessarily shares color labels across defective pairs. Assess one explicit compatibility mechanism using at most seven named star contractions; do not treat the finitely many boundary choices as coverage of unbounded external graphs or path intersections.

The bounded work unit is complete and RL6 is CLOSED/FROZEN. The exact incoming authority and original nine-file checkpoint are preserved byte-identically under sessions/RL6/incoming/ and sessions/RL6/checkpoint/. Closeout performs no new mathematics. RL7 is the sole successor for the cyclic-defect compatibility assessment; its selection input remains conjectural. The programme remains active.

The original recommendation and all pre-closeout bytes remain in checkpoint/. Status and navigation normalization changes no theorem, countermodel, source limit or residual coverage.
