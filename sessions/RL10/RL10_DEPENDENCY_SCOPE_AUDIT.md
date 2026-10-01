> **RL10 CLOSED/FROZEN — completed audit record.** This record is promoted as an audit finding/research decision only; no mathematical theorem is promoted or demoted by RL10. The original work record follows with explicit navigation normalization. Its OPEN/NOT PROMOTED, pending publication, deferred-in-RL10 and finish recommendations are historical control wording, superseded by this closeout. Exact original bytes are preserved in the frozen checkpoint. RL11 is the sole incoming successor for the audited, selected applicability assessment; MK2 remains UNPROVED and NOT ASSESSED, and no RL11 work has begun.

# RL10 fresh dependency and scope audit

Date: 2026-10-01 Europe/Madrid. Completed bounded work; **NOT PROMOTED**.
Evidence is pinned at `bf3ebc0b9e5470b8170c00ff17094882a6adf689`.
This is a fresh analytic review by the current worker. It is **not external independent certification**, formal proof checking, a novelty audit, or a new theorem-discovery campaign. The four inherited script passes certify only their stated finite/package domains.

## Definitions and the exact chain under review

Every graph is finite and simple. The root remains h(G)>=chi(G), both zero on the empty graph. Either a full proof or a finite graph with rigorous h(G)<chi(G) is a legitimate root outcome.

F_s(H,S) means exact chi(H)=s and every proper coloring into [s] uses all s colors on S. R_s(H,S) requires s simultaneous nonempty, pairwise disjoint connected branches, every pair adjacent and every branch meeting S. Roots are flexible. C_t(G) means chi(G)=t and every proper minor has chromatic number at most t-1. A t-counterexample additionally excludes a K_t minor.

Keep **exactly D_cyc**: chi(H)=6; S={u_0,...,u_6} is colorful in EVERY proper six-coloring; the only H[S] nonedges are e_i=u_i u_(i+1), modulo seven; after adding v adjacent exactly to S, all seven minors J_i contracting the connected star {v,u_i,u_(i+1)} are six-colorable. Full minor-criticality is not a premise of D_cyc.

Q5(H,S) means that some five distinct exterior vertices T induce K5 and alpha(H[S union T])<=2. It says nothing about other exterior vertices. EX5 has the additional **GLOBAL alpha(H)<=2** premise and concludes that the entire exterior is K5. Order twelve and exterior size five are justified only on this global slice. UP_6 on general D_cyc asks for an eligible omission o, a star/coloring witness, and five paths for the nonedges among R=S minus {o}, with pairwise disjoint interiors outside R and o used internally at most once. It remains stronger than an arbitrary rooted minor certificate; no converse from R_6 to UP_6 is known here.

The reviewed chain is:

| Arrow | Independently supplied premises | Audited scope |
|---|---|---|
| C_7 with the specified cyclic degree-seven vertex -> D_cyc | A2 gives exact chi and EVERY-coloring colorfulness; each J_i is a proper minor | Valid, uses more criticality than D_cyc itself assumes |
| D_cyc + GLOBAL alpha<=2 -> order 12, exterior 5 | RL8-P01 | Valid; no bound on general D_cyc |
| Same slice -> seven cross matchings -> MC | RL9-P01 | Valid before assuming an exterior clique |
| C7 + three helpers + independent neighborhoods + MC -> residual perfect matching | RL9-P02 and self-contained matching criterion | Valid standalone ten-vertex lemma |
| Each particular exterior complement edge + its residual matching -> forbidden T-only color | RL9-P03 | Valid for EVERY such edge; yields EX5 |
| EX5 slice -> Q5 -> UP_6 -> R_6 | RL8-P01, RL9-P03, RL8-P02, RL7-P01 | Valid only with all those consuming hypotheses |
| R_6(G-v,N(v)) -> M_7(G) | A3 adds singleton v | Sharp order seven; no t>=8 consequence |
| General D_cyc or critical G-v -> GLOBAL alpha<=2 or an applicable Q5 core | No proved input | **OPEN**; do not traverse this arrow |

Proof evidence: [RL6 report](incoming/RL6_RECOVERY_REPORT.md), [RL7 report](incoming/RL7_COMPATIBILITY_REPORT.md), [RL8 report](incoming/RL8_UNCOLORED_ROUTING_REPORT.md), [RL9 report](incoming/RL9_HELPER_CLIQUE_REPORT.md), [criterion](incoming/RL9_MATCHING_CRITERION_PROOF.md). Their frozen counterparts and classifications are linked in [SESSION_MATRIX.md](RL10_SESSION_MATRIX.md).

## Earlier load-bearing reductions and barriers

| Record | Fresh analytic check | Finding and retained limits |
|---|---|---|
| A1 | Choose a minor minimal among those with chi>=t inside a K_t-minor-free graph. All proper minors have chi<=t-1; deleting a vertex and adding one color proves chi<=t. | Exact chi=t follows without assuming chromatic number is minor-monotone. |
| A2 | G-v has chi=t-1 by the two inequalities. A color missing on N(v) would extend to v. | Full EVERY-coloring F_(t-1), not one colorful coloring. |
| A3 | Singleton v is disjoint and adjacent to every old branch through its N(v) intersection. | One simultaneous model; all old adjacencies survive. |
| A4–A6 | CR_(t-1) supplies the still-open rooted input; ranges in A5 cover all remaining t. | Conditional only. CR_6 gives ordinary t=7 only. |
| A7–A8 | A C_t graph with a K_t minor must be K_t itself; the converse uses A1. Lower-order Hadwiger in A8 is licensed only at the least failing t. | A7 is an equivalent coordinate, not an obligation reduction; A8 is conditional. |
| A9–A11 | Both dichotomy alternatives and the finite prefix must close; C^2 t is not t-1; reductions require universal coverage. | Logical assembly survives. Inherited source theorems are not independently recertified. |
| CM-B/CM-D | K_(a,b) has h=a+1 by the explicit model and two singleton branches in the large independent side. Universal clique joins add exactly their order. The stated thresholds are consistent. | chi<t on both families: seed-only negatives, not critical or root negatives. |
| CM-R | The planar base, outer-face obstruction and explicit coloring agree with the exact certificate. In the lift, s roots in s disjoint branches allocate all roots bijectively; the four X branches cannot use clique vertices. | Unbounded lift is analytic. Root set is not colorful. Base script certifies only one 9-vertex graph. |
| RL4-P01 | Two universal vertices use distinct private colors; extending every four-coloring and restricting every six-coloring proves the equivalence. | Every P with chi=4 and every S, all orders. |
| RL4-P02 | Four inherited CR_4 branches plus two universal singleton roots give 6+8+1=15 adjacencies. | Correct scoped deduction; CR_4 retains inherited statement/proof limits. |
| RL4-P03 | If q is universal in G-v, its private color forces vq; then q is universal in G. Ordinary order six on G-q gives a K7. | Valid for the stated K7-minor-free, vertex-critical interface. M1 covers no such interface; the restricted theorem is not false. |

Evidence: [dependency map](incoming/DEPENDENCY_MAP.md), [bridge ledger](incoming/BRIDGE_LEDGER.md), [countermodel proofs](incoming/FALSIFICATION_REPORT.md), [RL4 report](incoming/RL4_ADMISSIBILITY_REPORT.md). RL5's realization-source comparison is an index/premise audit: k=6 excludes rooted K7, k=5 with nonempty coloring family is 5-colorable, and an empty family supplies neither exact chi=6 nor F_6. No source result is silently upgraded.

## RL6 P01–P04 and the two comparator routes

**P01.** The component swap is proper because every edge with both endpoint colors in the swapped palette stays within a two-color component. If the other endpoint root lies outside the component, uniqueness of BOTH endpoint colors on the entire S makes one color disappear from S. This contradicts F_6. Every other representative has a different color, so the resulting simple path avoids all other representatives internally.

**P02.** Distinct edges of the defect matching use disjoint palettes, hence disjoint entire paths. Giving each interior to one endpoint yields connected branches; remaining endpoints are singletons. For m missing pairs, m last path edges plus 15-m original root edges establish the complete model at once. The hypotheses permit unbounded H and S; the proof never replaces flexible roots by a prescribed injection for all graphs.

**P03.** Contracting {v,x,y} is legitimate because it is connected, although xy is a neighborhood nonedge. Pullback to H is proper: x,y are nonadjacent, and every other H edge remains constrained in the quotient. F_6 forces the other five S colors to be distinct. The omitted y is x's only nonneighbor within S, so defects among the six representatives still form a matching with private endpoint colors. The K7 is proper since d(v)=7 implies at least eight vertices. The star-fold bound alpha(N(v))<=d(v)-5 also survives: folding an independent neighbor set I of size>=2 limits S to at most 1+d(v)-|I| colors, while F_6 requires six. The singleton case uses d(v)>=6. At degree six this makes N(v) a clique; thus a K7-minor-free minimal counterexample has minimum degree at least seven. This does not force a degree-seven vertex to exist.

**P04.** Every optimal coloring of each C5 in C5 join C5 has class sizes 2,2,1 with disjoint palettes between the cycles. Any three chosen representatives within a cycle have a nonedge, but only one color is private there. No certificate L_6 exists. The three explicit connected branches in each cycle and nine join adjacencies still give a rooted K6. Failure of extraction is distinct from failure of R_6.

**C2.** Independence of B and complete adjacency to A are both needed to turn nested exterior signatures into N(y) subseteq N(z). Extending the coloring of G-y with z's color then contradicts criticality. The antichain conclusion survives; b<=2^r supplies no contradiction with r unbounded. A K_(a,b) subgraph does not ensure an independent B.

**C3.** Each opposite-side x-y path contracts to identify the nonadjacent x,y in a proper minor. Pullback retains all edges on the retained side; the boundary has |K|-1 distinct color classes. A palette permutation aligns both side colorings and no A-B edge obstructs gluing. The local reduction is valid. No unavoidability or finite configuration coverage is supplied.

## RL7 P01–P04

**P01.** Whole interiors may be assigned to endpoint branches even when several paths meet at that endpoint: their initial segments are connected through the common root. Pairwise disjoint interiors and root avoidance are the required compatibility facts. They give ten original and five repaired adjacencies simultaneously. Path palettes are unnecessary for this implication.

**P02.** Triangle-freeness of the specified complement gives alpha(H)<=2. Twelve vertices force at least six colors; each listed matching gives six. In EVERY six-coloring all six classes have size two. The K5 exterior occupies five distinct classes, each meeting S; the last class is an S pair. This proves universal colorfulness, rather than inferring it from the seven listed witnesses. In each J_i the merged vertex is alone in its color, so all new incident edges are safe.

**P03.** Fix ANY J_i coloring and either allowed omission. Among the five roots common to both choices take three consecutive roots a,b,d. If x_a,x_b are the partners of a,b, the two-color subgraph on {a,b,x_a,x_b} is exactly a-x_b-x_a-b: same-color pairs and ab are nonedges; the cross edges follow from no independent triple; x_ax_b is a clique edge. The corresponding b-d path also contains x_b internally. The collision is forced for all colorings and both omissions. No sample-based universal claim occurs.

**P04.** The five positive paths have distinct helpers. The supplied branches give all fifteen adjacencies, and adding v gives six further ones. Colorfulness proves chi(G)>=7 and a fresh color for v proves chi(G)<=7. The explicit proper K7 excludes full C_7 membership. The SP_6 negative is therefore neither a CR_6 negative nor an ordinary counterexample; its critical-only restriction remains unassessed.

## RL8 P01–P04

**P01: count.** Seven S vertices spread over six nonempty color classes give one double-S class and five single-S classes. GLOBAL alpha<=2 bounds every class by two. If a single-S class {x} is a singleton, each cycle neighbor y either has a singleton class (merge to five colors), has a partner t outside S (replace {x},{y,t} by {x,y},{t}, losing a color on S), or is in the unique double-S class. The first two alternatives contradict chi/F_6. Both cycle neighbors cannot occupy that double class because they are adjacent in H. Thus no S singleton exists. All six classes have size two, giving exactly twelve vertices and five helpers. No clique follows at this stage; no global bound survives removal of the alpha premise.

**P02: restriction and safe edge direction.** A full J_i coloring restricts to the quotient of the 12-vertex core and pulls back to a proper coloring of that core. Alpha of the core bounds classes by two, and its size forces six pairs. The five clique helpers have distinct colors; the repeated S pair is the sixth class. Thus the cross matchings and MC hold inside the core without assuming that an arbitrary induced deletion preserves F_6. Extending independent two-element C7 neighborhoods to triples adds complement edges, hence DELETES H edges. A path built in the resulting sparser core remains a path in H. This edge direction is safe; reversing it would be invalid.

There are seven independent triples A_k={u_(k+2),u_(k+4),u_(k+6)} because their cyclic gaps are 2,2,3. A type-k helper is a common H neighbor of precisely e_k. MC forbids multiplicity three; a duplicated type excludes offsets +/-2; two duplicated types must have disjoint triples and hence adjacent indices. Five helpers therefore have three, four or five types. The construction tables cover all possibilities:

| Type count | Cases freshly checked | Existing-edge/disjointness check |
|---|---|---|
| Five | Two missing types adjacent, or after rotation e_0,e_d for d=2,3,4,5 | Adjacent omissions remove both missing demands. Otherwise omissions u_3,u_3,u_4,u_5 respectively remove e_d and a supported edge; the omission is adjacent to both ends of e_0 and four distinct helpers serve the rest. |
| Four | Duplicate type 0; the absent member j of {1,3,4,6} is 1,3,4,6 | Omissions u_2,u_3,u_5,u_6 respectively remove two unsupported edges; the remaining unsupported edge is e_5,e_5,e_2,e_2 and is repaired through the omission. Four distinct type helpers handle the other edges. |
| Three | Multiplicities 2,2,1 normalize to types 0,1,4 | Omit u_3; direct helpers repair e_0,e_1,e_4, u_3 repairs e_5, and e_6 uses u_6-t_3-t_1-u_0. The middle edge is exactly where the T clique is needed. All six interior vertices are distinct. |

For every omission an incident star is available by D_cyc. Its coloring need not control the uncolored paths. Each case retains all six simultaneous branch conditions. Arbitrary extra vertices remain unused, not bounded.

**P03/P04.** On the type multiset [0,0,1,1,4], only three distinct cycle-edge demands have direct helper support. One omitted root can supply at most one additional two-edge path. Four resources cannot cover five distinct demands for any omission. This is an analytic universal short-path obstruction. The stated longer path uses the spare-helper clique edge; its positive model and all fifteen/21 adjacencies pass the fixed checker. Nothing refutes general UP_6.

## Matching criterion: fresh analytic review

The necessity argument correctly assigns distinct vertices of X to distinct odd components. For sufficiency, adding edges to a maximal even-order graph Q without a perfect matching preserves every odd-component inequality: merging components never increases the odd-component count.

Let U be the universal vertices. A nonclique component of Q-U supplies a shortest-path triple a,b,c with ac missing; nonuniversality of b supplies d with bd missing, distinct from a,b,c. Matchings of Q+ac and Q+bd must use their added edges. In the alternating union, shared edges are harmless and neither added edge is shared. If the two added edges lie on different cycles, taking the other matching on the ac cycle and the first elsewhere avoids both additions. If they lie on the same cycle, deleting them gives two odd-vertex paths, since the deleted edges belong to opposite matching types. Their endpoint pairings are (a,b)/(c,d) or (a,d)/(c,b). Use bc in the first case, ab in the second, to join endpoints from DIFFERENT paths. Removing those endpoints leaves two even-vertex paths matchable using original edges; outside the cycle use the first matching. Thus Q would have a perfect matching, a contradiction.

Consequently Q-U consists of cliques. The inequality for X=U bounds the number r of odd cliques by |U|. Match one vertex of each odd clique to a distinct universal vertex; match all even remainders internally. The remaining |U|-r universal vertices have even cardinality by total-order parity. This completes the proof, including U empty and order-zero cases. No external source text is needed, and no unread theorem is consumed. RL9's T-008 retrieval/bounds defect remains a separately recorded process event.

## RL9 P01–P04: exhaustive residual check

**P01.** Use RL8-P01 only after checking GLOBAL alpha(H)<=2. Pulling back ANY J_i coloring gives six independent pairs of H. F_6 ensures that, besides the repeated S pair, each pair contains one S vertex and one T vertex. This does not assume T is a clique. Restricting the actual cross matching proves MC: for all U subseteq T and every cycle edge e_i, |N(U) minus e_i|>=|U|. Triangle-freeness of complement F makes every N_F(t) intersect S independent in C7.

**P02 preliminaries.** MC implies each helper has at least two neighbors; any pair of helpers has union of size at least three, and a union of exactly three is independent; the union of all three has size at least five. For the last claim, a set of size four in C7 contains an edge, whose deletion leaves only two neighbors. These deductions apply to all subsets, not only single helpers.

For an arbitrary deletion X, write A=X intersect S, B=X intersect R, a=|A|, b=|B| and k for the number of remaining isolated helpers. In the ten-vertex graph, q(K-X) is congruent to a+b modulo two. Nonisolated helpers can only merge or extend C7-A components; they cannot add separate components. The following is a partition of ALL deletion cases, not a graph census:

| Case | Bound before parity | Conclusion |
|---|---|---|
| a=0, b=0 | All helpers attach to intact cycle; graph is connected of even order | q=0 |
| a=0, 1<=b<=3 | Remaining graph is connected | q<=1<=b |
| a>=5, all b | q<=10-a-b; a+b>=5 | q<=a+b |
| 1<=a<=4, b>=1 | C7-A has at most a components; k<=3-b<=b+1, so q<=a+b+1 | Parity removes +1 |
| 1<=a<=4, b=0, k<=1 | q<=a+1 | Parity gives q<=a |
| a=1, b=0, k>=2 | Isolation would require a helper to have at most one neighbor | Impossible |
| a=2, b=0, k>=2 | Two isolated helpers would have union of size at most two | Impossible |
| a=3, b=0, k>=2 | k=3 is impossible by union>=5. For k=2 their union equals A, an independent triple. Its gaps 2,2,3 leave component sizes 1,1,2. The third helper has at least two neighbors outside A; its independent neighborhood cannot put both into the size-two edge, so it joins at least two components. | The nonisolated part has five vertices and at most two components, hence at most one odd component. Adding two isolated helpers gives q<=3. |
| a=4, b=0, k>=2 | k=3 is impossible by union>=5. Three S vertices and two isolated helpers give q<=5. | Parity makes q even; q<=4. |

The bounds include X empty, X all vertices, and all b in {0,1,2,3}. Every deletion meets the criterion; a perfect matching exists. Since the three helpers are independent in K, its matching consists of three cross edges and two C7 edges. **No missing deletion case or parity misuse was found.**

**P03: EACH PARTICULAR edge.** Fix an arbitrary actual tt' in F[T]. Delete precisely t,t'. The remaining three helpers retain all their original S neighbors. Delete only edges between those helpers to form K; never add a cross edge. MC restricts to every subset of those three helpers, so P02 gives a matching on precisely the ten remaining vertices using existing F edges. Its union with the original tt' is a perfect matching of the 12-vertex F containing that same edge. The six independent pairs in H give a proper six-coloring with a T-only color. This contradicts EVERY-coloring F_6. The proof is uniform in tt'; an unrelated perfect matching could not replace this argument. EX5 survives exactly at its global-alpha scope.

**P04.** P03 supplies the five-clique exterior; the original explicit global alpha bound supplies the alpha-core premise. RL8-P02 now applies. RL7-P01 supplies the simultaneous model. The proof stops before general alpha>2/core-free D_cyc or arbitrary critical H. No unsupported consuming hypothesis was found at the stated scope.

## MK2: audit of sufficiency and circularity only

The [deferred candidate](incoming/RL9_DEFERRED_COLORFUL_KERNEL_TASK.md) remains **UNPROVED, NOT ASSESSED and DEFERRED in current authority**. RL10 has not attempted to prove or refute it.

Its formal claim quantifies over EVERY D_cyc pair minimal under single exterior-vertex deletion and asserts GLOBAL alpha<=2. Its equivalent deletion inference quantifies over EVERY D_cyc pair with alpha>2 and requires SOME exterior x with (H-x,S) still in D_cyc. The equivalence is logical: a pair with no such x is exactly a deletion-minimal pair. It does not establish either assertion.

Finite selection of an eligible induced kernel is legitimate: begin with the supplied pair and delete exterior vertices only while the full D_cyc predicate remains true, minimizing vertex count. This is existence in a finite set, not an efficient procedure and not a proof of alpha<=2. A coloring of H restricts to any induced subgraph, so its chi is at most six; the seven quotient colorings also restrict. The hard point is precisely retaining chi=6 and EVERY-coloring colorfulness. New colorings after deletion need not extend back. When chi falls below six, a proper coloring with an unused label witnesses colorfulness failure; when chi stays six but F_6 fails, that failure directly supplies the missing-color coloring.

If MK2 were independently proved, the selected kernel would satisfy all RL8-P01/RL9 hypotheses. Its 12-vertex, five-clique-helper core would give UP_6 inside the original H, since paths in an induced subgraph remain paths in H and S is unchanged. A full-H star/coloring witness may be chosen from the original D_cyc premise; the kernel's coloring need not extend to H because path colors are unrestricted. This last distinction avoids an otherwise hidden coloring-extension demand in lifting the conclusion.

This is independent conditional sufficiency. It uses no desired minor to choose a kernel. No reverse implication from UP_6 or R_6 to MK2 is proved, and a rooted minor must not be treated as an induced alpha<=2 kernel. Minimality alone is not an independence bound. Rewording MK2 as the deletable-vertex assertion is the SAME unproved task, not new progress. Seven stars and three placements of an independent triple do not bound the exterior or make the proof finite. No inference from an independent triple to a safe deletion was assessed in RL10.

## Complete remaining frontier

No universal sharp bridge has closed. BR-00 remains critical completion for every t>=7 and every order; this is the hardest root obligation. BR-01 retains general CR_6 and all CR_s for s>=7. Even general UP_6 would only close the specified cyclic degree-seven interface, not general CR_6 or all ordinary order seven.

Retain general D_cyc outside independently supplied Q5/global-alpha slices; alpha>2 and core-free critical cyclic cases; every other degree-seven complement beyond the matching exclusion; all degrees>=8; arbitrary graph/exterior order, exterior edges, components, path lengths, coloring choices and larger root sets. There is no configuration-unavoidability theorem. C2 retains independent-side extraction and unbounded r; C3 retains unavoidability. BR-03 retains both alternatives, unknown uniform T and every 7<=t<T at unbounded order. BR-04 retains the sharp upgrade; BR-05 retains universal coverage and loss-free integral transfer; BR-06 retains coverage and scope-matched reductions. Every ordinary t>=8 remains.

RL3-GAP-01, RL3-GAP-02, OPEN-0005 and OPEN-0008/SRC-0014/RES-0015 remain, with all sixteen unchecked-source limits. No new source retrieval occurred. No source-access failure establishes openness. All original proofs, certificates, corpus, roadmap, dependency/bridge maps, FL-001–FL-011 and Collatz inspection limits survive unchanged. See [CORRECTION_AND_LESSON_RECORD.md](RL10_CORRECTION_AND_LESSON_RECORD.md) for the explicit no-demotion finding and route controls.
