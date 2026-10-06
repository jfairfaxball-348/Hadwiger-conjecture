# RL58 HC7 K4,4 dense model-union K7 payoff gate report

Date: 2026-10-05.
Status: CLOSED/FROZEN on promotion.
Root: HC7 only.
BASE_HEAD: 9e388a29f6c4aa3fe9c93f2357f0ddbe8b1a88b5.
BASE_TREE: 417e733c6a9bf22b50f27d0d080f8375e5304c87.
AUTHORITATIVE_TREE: fd81a705a4f131fde22e88fb037363db0a40590d.

Start gate passed: live main matched BASE_HEAD, sessions/RL58 was absent, RL58 was the unique incoming numbered session, and current authority named the exact RL58 brief. Frozen RL1-RL57 records and inherited theorem/source scopes were preserved. Correction/demotion: NONE.

## RL58-C01 — exact candidate

For every hypothetical minor-minimal HC7 counterexample G satisfying:
- G finite simple;
- chi(G)=7;
- G has no K7 minor;
- every proper minor is 6-colorable;
- delta(G)>=8;
- G contains K4,4 as a minor;

and for every legitimate K4,4 model M=(A_1,...,A_4;B_1,...,B_4) minimizing total branch-set size, with U the union of its eight branch sets, RL58-C01 asserts:

    if |N_G(v) intersect U| >= 8 for every v in U,
    then G contains a K7 minor.

The premise is a statement about degree in G[U] in the ORIGINAL GRAPH. It is not a quotient-minimum-degree assertion. The conclusion is a direct HC7 root payoff.

Status: NOT ESTABLISHED / NOT PROMOTED. No rigorous certified-domain counterexample was produced, so RL58-C01 is not recorded as falsified.

## Direct payoff attempt and first missing dependency

The K4,4 model supplies the inherited K5 minor with branch sets

    A_1 union B_1,
    A_2 union B_2,
    A_3 union B_3,
    A_4,
    B_4.

This construction is valid and uses all eight original K4,4 branch sets. To obtain K7 directly from U, the proof would need a universal repartition/refinement/augmentation that produces two additional disjoint connected branch sets pairwise adjacent to the five K5 branch sets and to each other, or an equivalent direct K7 construction.

Current authority supplies no such universal implication from dense in-union adjacency. In particular, RL55-P01 controls indispensable attachment support but does not provide spare vertices or a seven-way repartition.

The first missing universal dependency is HC7-K44-SPANNING-DENSE-MODEL-CRITICAL-REPARTITION/AUGMENTATION.

The sharp subcase is U=V(G). There are then no exterior vertices at all, so any successful direct payoff must exploit the full proper-minor-6-colorability / HC7-critical hypotheses to repartition or replace the canonical K5 model, rather than first seeking an escape edge.

## Fixed RL57 stress test

The three-vertex-path K4,4 interface from RL57 remains a valid stress test against any proof step claimed to follow only from RL55-P01, the basic legitimate-model interface, or dense in-union degree. The displayed interface satisfies RL55-P01 and every displayed model vertex has in-union degree exactly eight.

The pattern is not asserted to satisfy chi(G)=7, proper-minor 6-colorability, K7-minor-freeness, or global minimum-total-size of the displayed K4,4 model. It therefore does not falsify RL58-C01 in the certified domain.

## Exact use of delta(G)>=8

delta(G)>=8 was part of the certified RL58 residual but was not combined with a proved in-union degree cap. No universal escape edge was deduced. The dense premise itself was used only inside U in the original graph.

## Certified-domain falsification condition

A falsifier of RL58-C01 would be a genuine minor-minimal HC7 counterexample G with delta(G)>=8 together with a globally minimum-total-size K4,4 model M such that every v in its union U has at least eight neighbours in U. No such certified-domain example was produced.

## Classification and residual

RL58-C01 promoted: NO.
RL58-C01 certified-domain falsified: NO.
New direct K7 consequence proved: NO.
Universal escape edge proved: NO.
delta(G)>=8 eliminated: NO.
HC7-universal graph-level residual genuinely narrowed: NO.
HC7-universal obligation genuinely reduced: NO.

Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.
Correction/demotion: NONE.

SRC-0025 was consumed only at its existing checked_primary theorem-statement/hypothesis status; its subscription proof was not independently reconstructed.

No external source retrieval, mathematical numerical computation, graph census, model catalogue, attachment catalogue, realization search, degree-seven work, resource/Kempe work, pivotal-edge work, or M3 work was used.

FL-059 records the first missing critical repartition/augmentation dependency and the changed retry condition.

## Successor

RL59 — HC7-K44-SPANNING-DENSE-MODEL-CRITICAL-REPARTITION-GATE.

Isolate the U=V(G) subcase and perform exactly one bounded candidate-development/proof assessment using proper-minor 6-colorability as the changed mechanism. Do not first derive an exterior escape edge, reopen RL56-C01, or replay RL55/RL57 mechanisms.

Programme ACTIVE.
