> **RL13 CLOSED/FROZEN — retained completed work record.** The exact original checkpoint text follows. Its OPEN/NOT PROMOTED, prepared-only, old next-operation and finish wording is historical; RL13_SESSION_STATE_AND_RL14_KICKOFF.md and RL14_LEAF_DELETION_COLORING_BRIEF.md govern the current state. Mathematical scopes and source limits are unchanged. Plain checkpoint filenames below refer to the frozen originals in ../sessions/RL13/checkpoint/. No RL14 work has begun.

# RL13 critical connected-resource obstruction/augmentation report

Date: 2026-10-02 Europe/Madrid. RL13 OPEN; complete bounded analytic checkpoint, NOT PROMOTED.

## Exact outcome

One new scoped invariant is established for the full C_7 cyclic degree-seven domain.

Let F={T_1,...,T_m} be the prescribed maximum partial resource family, with m<5 and minimum total size among maximum families. Put U=union_j T_j and A=N_H(U) intersect S.

For every m in {1,2,3,4}, if A is a proper subset of S, then there is one actual star type k and a proper six-coloring psi of H[S union U] such that psi uses only five colors on S. Consequently at least one component C of H-(S union U) is not colorable from the fixed boundary psi. For such a blocking C, maximality forces the exact dichotomy:

1. C is not a resource, so for some cyclic nonedge e_i neither endpoint has a neighbor in C; or
2. C is a resource but for some j there is no edge between C and T_j.

Thus every blocker exposes either a coverage defect or an actual pairwise-compatibility defect. Connectedness alone is never substituted for the required joining edges.

The mechanism stops at A=S. No fifth resource is asserted.

## Independent inputs

The first independent mathematical inputs are full C_7 criticality and A2:

- H has exact chromatic number six.
- Every proper map H -> [6] uses all six colors on S.
- For each i, the original-G star contraction of the connected set {v,u_i,u_(i+1)} is a proper minor and has an actual proper six-coloring.

Pulling a star coloring back to H makes u_i and u_(i+1) equal. Since all six colors occur on seven vertices of S and H[S] has complement C7, this is the unique repeated color class on S; the other five S vertices have distinct colors.

No desired rooted minor, resource extraction theorem, quotient-coloring lift, or separate coloring compatibility is assumed.

## Proof of the five-color boundary compression

Assume A is not all of S. Choose x in S\A and choose a cyclic nonedge e_a incident with x. Choose a cyclic nonedge e_b vertex-disjoint from e_a; such an edge exists in C7.

Define a proper five-coloring phi of H[S] by giving the endpoints of e_a one color, the endpoints of e_b a second color, and the remaining three S vertices three further distinct colors. The only repeated pairs are actual nonedges of H[S].

Because x is in e_a but x is not in A, e_a is not contained in A.

Case 1: e_b is contained in A. Use the actual star coloring c_b. On A, both c_b and phi have exactly the same equality partition: the pair e_b is equal and every other member of A is a singleton.

Case 2: e_b is not contained in A. Use the actual star coloring c_a. On A, phi is injective because neither repeated pair is wholly in A, and c_a is injective because its only repeated pair e_a is not wholly in A.

In either case the equality partition induced by the chosen star coloring c_k on A is exactly the equality partition induced by phi on A. Therefore the correspondence c_k(s) -> phi(s) for s in A is a well-defined bijection between the used boundary color classes and extends to a permutation pi of all six labels.

Set psi(s)=phi(s) for s in S and psi(t)=pi(c_k(t)) for t in U.

Every edge inside S is proper by construction of phi. Every edge inside U is proper because a single source coloring c_k and one color permutation are used on all of U. If ts is an edge with t in U and s in S, then s is in A, so c_k(t) != c_k(s), hence pi(c_k(t)) != pi(c_k(s))=phi(s). Thus psi is a proper map H[S union U] -> [6] and psi(S) has size five.

This is a same-coloring, same-permutation compatibility argument; no colorings from different star types are spliced.

## Residual-component obstruction

Let the components of H-(S union U) be C_1,...,C_r. If every C_q admitted a proper coloring into [6] compatible with the already fixed colors psi on all its edges to S union U, the component colorings could be combined with psi: distinct residual components have no edges between them. This would give a proper map H -> [6] using only five colors on S, contradicting A2 colorfulness.

Hence r>=1 and some residual component C is psi-inextendible.

C is nonempty, connected, and disjoint from all T_j. If C were a resource and had an actual joining edge to every T_j, then F union {C} would be a partial resource family of cardinality m+1 <=5, contradicting maximality. This proves the coverage-or-compatibility dichotomy above.

The minimum-total-size tie-breaker is part of the chosen family but is not consumed by this first mechanism. No conclusion is extracted from minimality merely by naming it.

## The m=0 case

RL12-SRC-01 is retained at its exact source status: a checked primary statement, without independent reconstruction of the original proof, states that every noncomplete C_k graph for k>=7 is 7-connected.

In the present domain G is noncomplete because H[S] has cyclic nonedges. Also H-S is nonempty: A2 gives chi(H)=6, whereas H=S would give H=K7-C7, which is 4-colorable.

For any component D of H-S, all neighbors of D outside D lie in S: different H-S components have no joining edge and v has no exterior neighbor because d_G(v)=7 and N_G(v)=S. If N_H(D) intersect S were a proper subset of S, deleting at most six vertices would separate D from v, contradicting the inherited 7-connectivity statement. Thus every component D has neighborhood S and is itself a resource. Therefore m=0 cannot occur, conditional only on the retained RL12-SRC-01 source theorem at its recorded verification status.

This is not counted as a new source result or a newly verified theorem.

## First obstruction and stopping point

Suppose m is in {1,2,3,4} and A=S. The boundary compression above cannot start.

Every actual original-G star coloring has exactly six color classes on S with exactly one repeated cyclic pair. Any proper coloring of H[S] using only five colors has seven S vertices in five classes. Because the complement of H[S] is C7, no class has size three, so it necessarily has exactly two repeated size-two classes, corresponding to two disjoint cyclic nonedges.

When A=S, no permutation of the six labels of one star coloring can change its equality partition from one repeated pair to two repeated pairs. Hence the one-star color-permutation lift used above gives no five-color extension of H[S union U].

This is a failure of this mechanism, not a theorem that no such coloring exists. A quotient coloring is not substituted: an arbitrary coloring after contracting a connected U need not lift through its interior. Nor does U being connected or pairwise joined imply coloring compatibility. The first missing independent implication is therefore an argument forcing A != S, or a different scope-justified way to handle an S-complete resource union.

Stop here under the RL13 brief.

## Case accounting, simultaneous compatibility, and sharpness

- m=0: excluded only through inherited RL12-SRC-01 plus the elementary separator inference above.
- m=1,2,3,4 with A != S: the five-color compression and blocker dichotomy are proved.
- m=1,2,3,4 with A=S: uncovered; this is the exact stopping frontier.
- m>=5: not treated.

The A != S hypothesis is sharp for this particular permutation construction: one missing boundary vertex lets one repeated target pair be hidden from A, while A=S exposes the incompatible equality partitions. This is mechanism sharpness only, not a sharp graph theorem.

All graph order, exterior order, number and size of residual components, resource sizes and internal structures, path lengths, attachment patterns, and the full spaces of proper star colorings remain unbounded. The only finite enumerated interface is the seven named star types and m in {0,1,2,3,4}; in each application the proof uses one star type.

## Falsification tests

- A counterexample to the compression lemma would be a valid full-domain G and chosen family with A != S for which the explicitly constructed psi fails an actual edge. The proof checks S-S, U-U and U-S edge types separately.
- A counterexample to residual inextendibility would give compatible extensions on every residual component; their union would explicitly contradict A2.
- A blocker that is both a resource and actually adjacent to every T_j would contradict the defining maximality of F.
- The A=S stopping statement is falsified only as a statement about this permutation mechanism: an independently justified different lift may exist and is deliberately not excluded.

## Obligation accounting

No named inherited universal mathematical obligation was reduced: BR-00, BR-01 coverage, general UP_6, CR_6, ordinary order-seven coverage, higher orders and full sharp Hadwiger all remain open in this programme.

The new result is a scoped analytic obstruction invariant on the proper-boundary subcase of the full C_7 cyclic resource gate. The inherited m=0 exclusion receives no new source-verification credit.

Programme active.
