# RL4 — bounded N1 colorful rooted-K6 admissibility assessment

Cutoff/access date: 2026-09-30. Status: **OPEN-SESSION CHECKPOINT; NOT AUTHORITATIVE**.
BASE_HEAD: 779339630af6e819cd047462941bed97a571630b.
Incoming authority tree: 5fe85255f41270f3bf5a5b808f706c319c6696e3.

## Verdict

Universal CR_6 is **NOT PROMOTED / INCONCLUSIVE**. The source assessment did not recover a checked primary proof or counterexample resolving CR_6. RL3-GAP-01 remains a current-status gap, with its checked positive and negative scopes now made more precise. Failure to retrieve a resolution is not evidence of openness, truth, or falsity.

One mechanism was assessed after its full scope was written in MECHANISM_SCOPE.md: remove two universal color carriers and apply the inherited rooted-K4 theorem. It is sufficient on the exact family H=K2 join P, chi(P)=4, for every colorful S. Its critical-case relevance fails: no graph H=G-v in a hypothetical minor-minimal 7-counterexample can contain even one universal vertex. This is a scoped analytic barrier, not a CR_6 countermodel. The mechanism is not a basis for further local work on the unrestricted bridge.

No independent obstruction theorem covering arbitrary six-chromatic H and every colorful S was recovered or proved. Stop N1 under the brief's single-work-unit rule. No graph census, numerical certificate program, second mechanism, or local-lemma stack was begun.

## Root and exact target

The root remains h(G)>=chi(G) for every finite simple graph, with h(empty)=chi(empty)=0. A full proof needs all chromatic numbers and all graph orders. A root counterexample needs a finite simple G with rigorously established h(G)<chi(G).

For finite simple H, define F_s(H,S) by chi(H)=s and, for every proper coloring c:V(H)->{1,...,s}, c(S)={1,...,s}. Define R_s(H,S) by existence of nonempty B_1,...,B_s subseteq V(H), simultaneously pairwise disjoint, each inducing a connected graph, every pair joined by an edge, and B_i intersect S nonempty for every i. Roots are flexible. In particular, |S| may exceed s.

CR_6 is: for every finite simple H and every S subseteq V(H), F_6(H,S) implies R_6(H,S). No restrictions on order, degree, independence number, connectivity, graph class or |S| are part of this target.

Inherited A1-A3 independently give chi(G-v)=6 and F_6(G-v,N_G(v)) in a hypothetical minor-minimal 7-counterexample. R_6 at that interface lets us add {v} and retain order 7 exactly. Thus universal CR_6 would imply ordinary order 7 only; CR_s for every s>=7 and ordinary orders t>=8 would remain. No reverse implication from ordinary order 7 to universal CR_6 is used.

## Source gate and precedent

SOURCE_STATUS_AND_SEARCH_LOG.md records the exact inspected locations, primary-source scopes, retrieval errors, discovery collisions and negative results. The load-bearing input for M1 is the already inherited checked theorem CR_4, now rechecked at its primary statement. The existing ordinary order-6 theorem, RES-0005 in authoritative/background/RESULT_CATALOG.jsonl, is consumed only in the relevance audit below, at its canonical RL2 scope. Neither full external proof was independently certified in RL4.

The four-color precedent has a global structural obstruction step. Its precise connectivity and root-distribution hypotheses are in the source ledger. A change from four to six roots does not inherit that obstruction theorem. M1 instead supplies an explicit reduction to its proved four-color conclusion on one restricted family. A global assertion that absence of R_6 always yields a six-coloring missing a color on S is merely CR_6's contrapositive when chi(H)=6; calling it an obstruction theorem would close no obligation without an independent proof.

## M1 — full quantifiers frozen before consequences

For every finite simple P with chi(P)=4, take a disjoint two-vertex clique Q={q_1,q_2}, and let H=Q join P: retain P, add q_1q_2 and every edge from Q to V(P). For every S subseteq V(H), put T=S intersect V(P).

**M1:** F_6(H,S) implies R_6(H,S).

The independent obstruction form is: for every such P and every S containing Q, if H has no S-rooted K6, there exists a proper six-coloring of H that omits a color on S. Both statements retain arbitrary P order and arbitrary S size. They assume neither R_6, CR_6, ordinary order 7, nor an extra path-compatibility theorem.

## RL4-P01 — all-colorings factorization

**Statement:** for every P,Q,H,S,T in M1,

F_6(H,S) if and only if Q subseteq S and F_4(P,T).

**Proof.** Since Q is a clique complete to P, every proper coloring gives its vertices two distinct colors used nowhere in P. Four further colors are necessary and sufficient for P, so chi(H)=6. In every proper six-coloring, both Q colors occur only on their respective Q vertices. If S is colorful, both vertices must belong to S. Take any proper four-coloring of P; extend it by two fresh Q colors. Colorfulness of S in this extension forces all four P colors to occur on T. This proves the forward direction for every four-coloring, not just one choice.

Conversely, take any proper six-coloring of H. Its restriction to P uses exactly the other four colors. Relabel these to {1,2,3,4}; F_4(P,T) forces all four on T. Since both Q vertices are in S, the two remaining colors also occur on S. This works for every proper six-coloring. QED.

**Classification:** proved elementary analytic mathematics; no enumeration or novelty claim.

## RL4-P02 — simultaneous rooted-K4 lift

**Statement:** M1 holds on its entire specified family.

**Proof.** By P01, F_6 implies Q subseteq S and F_4(P,T). Apply inherited CR_4 to obtain one simultaneous model C_1,...,C_4 in P, all meeting T. Define B_i=C_i for 1<=i<=4, B_5={q_1}, and B_6={q_2}. The four old branches are simultaneously disjoint, connected and pairwise adjacent by CR_4. The singletons lie outside P and are distinct, so all six branches remain disjoint and connected. Each Q vertex is adjacent to every old branch because it is universal and each old branch is nonempty; q_1q_2 supplies the final adjacency. Every branch meets S. All fifteen required pair adjacencies coexist in this single model. No root injection or six-element subset of S was preselected. QED.

The obstruction form follows by contrapositive of inherited CR_4: if Q subseteq S but R_6 fails, T cannot be colorful in P, since the above assembly would otherwise give R_6. Choose an actual four-coloring of P missing a color on T and extend it by two fresh Q colors. It is a proper six-coloring missing that same color on S.

**Classification:** complete analytic deduction at a narrower scope, using an inherited checked primary theorem. CR_4 itself is an inherited result, not a project-originated theorem or an independently recertified external proof. P02 has no novelty claim and is not universal CR_6.

## RL4-P03 — relevance barrier at the order-7 critical frontier

**Statement:** for every finite simple G with chi(G)=7, no K7 minor, and chi(G-v)=6 for every v, and for every v, H=G-v has no universal vertex. This applies in particular to every hypothetical minor-minimal 7-counterexample from A1. It does not assert that any such G exists.

**Proof.** Fix v and suppose q is universal in H. In any proper six-coloring of H, q's color is used only on q. If vq were not an edge, assigning that color to v would extend the coloring to G, contradicting chi(G)=7. Therefore vq is an edge, and q is universal in G.

Put J=G-q. Universality makes chi(G)=1+chi(J), so chi(J)=6. The inherited ordinary order-6 theorem supplies a simultaneous unrooted K6 model in J. Adding {q}, adjacent to every old nonempty branch, gives a K7 model in G. This contradicts the assumed absence of K7. Hence q cannot exist. QED.

**Classification:** proved analytic relevance barrier using inherited ordinary order 6. The same-order unrooted model is sufficient here because the additional vertex is universal; no arbitrary rooting conversion is inferred. CM-R therefore presents no conflict with this proof.

**Consequence:** M1 covers zero instances of the live critical-neighborhood application. It proves a valid restricted CR_6 slice but does not reduce BR-00 or the critical part of BR-01 at order 7. Strengthening M1 by more local consequences within its universal-vertex family cannot repair that coverage failure.

## Exhaustive scope and falsification audit

The proofs quantify over every P of chromatic number four, every order, and every S, including |S|>6. Colorfulness is universally quantified; simultaneous compatibility and exact order six are preserved. The finite certificate inherited from RL3 is not used to extend these proofs, and no computational evidence is treated as proof.

For an explicit uncovered valid-premise example, H=C5 join C5 has chi(H)=3+3=6. Each vertex has degree 2+5=7 in a graph of order 10, so H has no universal vertices. S=V(H) is colorful by chi(H)=6. Each five-cycle has three pairwise adjacent connected branches {0,1},{2,3},{4}; joining the two triples gives a rooted K6 for this S. Thus the absence of M1's premise does not by itself refute CR_6. The example demonstrates a genuine uncovered family, not a negative witness.

A negative CR_6 witness would require an exact six-chromatic H, colorfulness in all proper six-colorings, and exclusion of every S-rooted K6 model, over every possible allocation of flexible roots. Nothing here meets that negative conclusion. CM-R violates colorfulness and remains a barrier only to omission of that premise. The checked Kempe-routing and dominating negatives are scoped in the source ledger; neither supplies a CR_6 countermodel. A CR_6 countermodel would still not automatically establish h(G)<chi(G) for an ordinary Hadwiger counterexample.

## Obligations, route decision and exact frontier

Closed at actual scopes: the RL4 start gate, exact source/theorem disambiguation for the inspected results, M1 factorization and assembly, and the analytic relevance audit. The restricted implication P02 is fully justified; its added premise is not removable by an inherited reduction. No universal sharp bridge is closed.

BR-01 remains the roadmap's priority interface for assessment, not a certified viable proof route. The assessed M1 subroute is stopped for the critical order-7 application. The ranked RL3 routes and A1-A11 are preserved; no replacement global roadmap is manufactured. A future reopening needs a named new primary result or structural input addressing graphs without universal vertices and the simultaneous flexible-root obligation.

RL3-GAP-01 is narrowed but retained; original Holroyd full-text access and comprehensive cutoff-status verification remain missing. Preserve OPEN-0005, OPEN-0008 / SRC-0014 / RES-0015, all sixteen inherited unchecked-source limits, RL3-GAP-02, all CR_s for s>=7, and the unrestricted sharp root. No mathematical correction or demotion of an inherited claim occurred.

One bounded work unit is complete. Exact next operation: preserve this verified open-session checkpoint; when the user requests finish, enter CLOSEOUT_LOCK and perform only the normal deterministic RL4 freeze and successor handover. No further mechanism or graph search is scheduled. A bare continuation without a named new input must retain the blocked frontier instead of restarting M1.

Recommendation: it makes sense to finish up here
