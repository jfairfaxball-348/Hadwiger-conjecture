# RL41 prepared direct three-resource rooted-K6 boundary-selection assessment

Status: PREPARED ONLY / NOT ASSESSED / NOT PROMOTED.
Provenance: RL40 audit pivot from the retained RL13/RL31 m=3,A=S root dependency.

Work only in the retained full C7 cyclic degree-seven setting. Retain one maximum partial resource family F={T_1,T_2,T_3} with m=3 and A=S. Each T_i is nonempty, connected, exterior, pairwise vertex-disjoint, and each pair has an actual joining edge.

Define A_i=N_H(T_i) intersect S. Each A_i meets every cyclic nonedge, equivalently is a vertex cover of the complement C7, and A_1 union A_2 union A_3=S.

Do not consume RL31 terminal cores or RL32-RL39 closure/blocker/minimality data.

Target M3-DIRECT-ROOTED-K6-SELECTION: determine whether for every such triple there are distinct r_i in A_i and a three-set J subset S\{r_1,r_2,r_3} which is independent in the complement C7 and satisfies, for every i and s in J,

    s in A_i  OR  r_i s in E(H[S]).

If so, use B_i=T_i union {r_i} and singleton branches {s}, s in J. The original T_i-T_j joining edges give B_i-B_j adjacency; J gives singleton adjacency; and the target condition gives B_i-{s} adjacency. These six branches form an S-rooted K6 in H. Adding {v} gives a K7 minor of G, contradicting the retained full-C7 critical setting. Thus a universal proof excludes the entire m=3,A=S configuration, including all-SAT and EQ.

Bounds: one analytic boundary-selection lemma; zero new source retrieval; zero mathematical numerical computation; no graph/coloring/list/neighborhood-subset/vertex-cover/cyclic-distance/seven-nonedge census; no m=4; no return to m=2; no terminal-core or nearest-witness replay.

Stop with exactly one of:
1. a proof of the universal selection lemma plus explicit branch-set assembly audit;
2. one explicit symbolic boundary-level counterpattern satisfying all stated A_i axioms but admitting no required r_i,J, classified only at boundary level unless full critical realizability is independently proved;
3. the first missing implication with exact surviving scope.

Programme ACTIVE.
