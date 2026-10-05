# RL57 HC7 K4,4 model-union degree absorption / escape gate report

Date: 2026-10-05.
Status: CLOSED/FROZEN on promotion.
Root: HC7 only.
BASE_HEAD: 81008b18ef9b6e398c60910939599ae18c5fe45d.
BASE_TREE: 609825731f854ef1058e659be70c621164970040.
AUTHORITATIVE_TREE: 85aaa33866adf1181a8d5d06778c5171adfd3bbc.

Start gate passed: live main matched BASE_HEAD, sessions/RL57 was absent, sessions/RL1 through RL56 were present, and RL57 was the unique incoming numbered session. Frozen RL1-RL56 records and all inherited theorem/source scopes were preserved. Correction/demotion: NONE.

## RL57-C01 — exact candidate

For every hypothetical minor-minimal HC7 counterexample G satisfying:
- G finite simple;
- chi(G)=7;
- G has no K7 minor;
- every proper minor is 6-colorable;
- delta(G)>=8;
- G contains K4,4 as a minor;

and for every legitimate K4,4 model M=(A_1,...,A_4;B_1,...,B_4) minimizing total branch-set size, with U the union of its eight branch sets, RL57-C01 asserts that there exists v in U with

    |N_G(v) intersect U| <= 7.

This is a statement about degree inside U in the ORIGINAL GRAPH. It is not a quotient-minimum-degree statement.

If RL57-C01 were proved, d_G(v)>=8 would force at least one neighbour of v in V(G)\U. One such escape edge would not by itself prove RL56-C01, K7, a separator, or a proper-minor coloring contradiction.

Status: NOT ESTABLISHED / NOT PROMOTED. No certified-domain counterexample was produced, so RL57-C01 is not recorded as falsified.

## Concrete RL55-interface counterpattern

The bounded proof attempt stops at an exact interface obstruction.

Index the eight branch sets by the vertices of K4,4 and fix an alternating Hamilton cycle of K4,4. Replace each branch set by a three-vertex path.

For each of the two opposite-side branch sets adjacent to a given branch-set index on the Hamilton cycle, use one distinct endpoint of its three-vertex path as the singleton supporter of that cycle adjacency, and put one corresponding endpoint-to-endpoint cross edge on the cycle pair. For each of the other two opposite-side branch sets, put all nine cross edges between the corresponding three-vertex paths.

For each branch set X, the four opposite-side attachment sets are therefore:
- one singleton endpoint;
- the other singleton endpoint;
- all three vertices of X;
- all three vertices of X.

Any connected subset of the three-vertex path meeting both singleton endpoints is the whole path. Hence no proper nonempty connected subset meets all four attachment sets. The displayed interface therefore satisfies the exact RL55-P01 irreducibility condition.

Every endpoint of a branch-set path has:
- one internal path neighbour;
- one sparse Hamilton-cycle cross-neighbour;
- six neighbours in the two completely joined opposite branch sets.

Thus its in-union degree is eight. The middle vertex has two internal neighbours and those same six complete-pair neighbours, also giving in-union degree eight. Hence every displayed model vertex satisfies

    |N_G(v) intersect U| = 8.

Scope: this is not asserted to be a full HC7 counterexample, and it is not asserted that the displayed K4,4 model is globally minimum-total-size among every model in the constructed graph. It is therefore not a certified-domain falsifier of RL57-C01. Its exact role is to prove that RL55-P01 and the basic legitimate-model interface alone cannot imply RL57-C01.

Classification: METHOD BARRIER / COUNTERPATTERN at the RL55 model-interface scope.

## Exact use of delta(G)>=8

delta(G)>=8 was used only in the ORIGINAL GRAPH and only conditionally:

    RL57-C01
    -> some v in U has at most seven neighbours in U
    -> d_G(v)>=8
    -> v has at least one neighbour outside U.

Because RL57-C01 was not proved, no universal escape edge was promoted.

## Classification and residual

RL57-C01 promoted: NO.
RL57-C01 certified-domain falsified: NO.
Universal escape edge proved: NO.
delta(G)>=8 eliminated: NO.
HC7-universal graph-level residual genuinely narrowed: NO.
HC7-universal obligation genuinely reduced: NO.

First missing dependency: HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF — a theorem using the full certified HC7 hypotheses, beyond RL55-P01 alone, to convert the dense alternative |N_G(v) intersect U|>=8 for every v in U into a direct K7 payoff, or expose the first further missing universal dependency.

Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.
Correction/demotion: NONE.

SRC-0025 was consumed only at its existing checked_primary theorem-statement/hypothesis status; its subscription proof was not independently reconstructed.

No external source retrieval, mathematical numerical computation, graph census, model catalogue, attachment catalogue, degree-seven work, resource/Kempe work, pivotal-edge work, or M3 work was used.

FL-058 records the interface counterpattern, barrier, and changed retry condition.

## Successor

RL58 — HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF-GATE.

Assess exactly one direct dense-union payoff candidate: in the certified domain, if every vertex of U has at least eight neighbours in U, then G contains a K7 minor. The changed mechanism must be a direct root-facing payoff from dense U; do not first infer an escape edge, repeat RL55 branch-set reducibility, or reopen RL56-C01.

Programme ACTIVE.
