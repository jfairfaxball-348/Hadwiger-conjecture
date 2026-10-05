# RL57 HC7 K4,4 model-union degree absorption / escape gate brief

Status: READY / NOT STARTED.
Programme ACTIVE.
Root: HC7 only.

Follow AGENTS.md, START_HERE.md, HC7_RESEARCH_PROGRAMME.md, PROOF_STATE_AND_OPEN_OBLIGATIONS.md, RL57_STATE.md, RL56_REPORT.md, RL56_PROOF_STATE_AND_RESIDUAL_LEDGER.md, FAILURE_AND_LESSON_LEDGER.md, RL56_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, RL51_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and docs/RESEARCH_RECOVERY_PROTOCOL.md.

Preserve all inherited theorem scopes, SRC-0025 at checked_primary theorem-statement/hypothesis level, RL55-P01 exactly, RL56-P01 only as a conditional double-apex payoff, FL-043 through FL-057, and correction/demotion NONE.

## Certified domain

Work only with a hypothetical minor-minimal HC7 counterexample G satisfying:
- G finite simple, chi(G)=7, no K7 minor;
- every proper minor is 6-colorable;
- delta(G)>=8;
- G contains K4,4 as a minor.

Choose a legitimate K4,4 model M=(A_1,...,A_4;B_1,...,B_4) minimizing total branch-set size and let

    U = A_1 union ... union A_4 union B_1 union ... union B_4.

Consume RL55-P01 exactly. Do not strengthen it.

RL56-P01 may be consumed only in this form: if there are disjoint nonempty connected P,Q outside U, adjacent to each other and each adjacent to all eight branch sets, then G has a K7 minor. RL56 did NOT prove such P,Q exist.

## Single changed mechanism

RL56 stopped because degree eight counts neighbours, not attachment types. Current authority permits degree to be absorbed inside U, including multiple neighbours in one already-required opposite branch set.

RL57 assesses exactly one universal candidate:

**RL57-C01 — model-union degree cap / escape candidate.**

For every G and every minimum-total-size K4,4 model M in the certified domain, with U its branch-set union, there exists v in U such that

    |N_G(v) intersect U| <= 7.

Before attempting proof or consumption, state explicitly:
1. the full universal quantifiers over every certified G and every minimum model M;
2. why the conclusion is genuinely a bound inside the ORIGINAL GRAPH, not quotient minimum degree;
3. the exact consequence of combining it with delta(G)>=8: v has a neighbour in V(G)\U;
4. why one such escape edge does NOT by itself establish RL56-C01, K7, a separator, or a coloring contradiction;
5. one concrete falsification pattern for RL57-C01;
6. the first missing dependency if RL57-C01 cannot be proved from current authority.

Stop at the first further missing universal dependency.

If RL57-C01 is proved, record only the exact escape-edge consequence unless an already-proved current theorem supplies a stronger payoff. Do not invent a new attachment cascade in the same session.

## Prohibitions

Do not:
- assess a second degree-cap candidate;
- catalogue model vertices, degrees, attachment types, or K4,4 models;
- repeat RL55 internal branch-set reducibility as the changed mechanism;
- compare minimum model sizes across different graphs;
- transfer delta(G)>=8 to a contracted quotient;
- infer the RL56 double-apex attachment from one escape edge;
- assume K4,4 is a subgraph/induced subgraph, independent sides, unique cross edges, prescribed topology, or a separator;
- perform mathematical numerical computation;
- return to degree-seven neighborhood, RL31-RL49 resource/Kempe/pivotal-edge, or M3-CLIQUE-SEPARATOR-DICHOTOMY work;
- launch a broad literature campaign.

If a specifically named load-bearing theorem already present in repository provenance becomes necessary but is weakly source-verified, stop and formulate one bounded source-verification successor rather than launching a literature survey.

## Stopping outcomes

Stop RL57 with exactly one of:
1. RL57-C01 is proved, yielding the exact universal escape-edge consequence and one first further missing dependency;
2. RL57-C01 is falsified by a rigorous certified-domain counterexample/counterpattern;
3. RL57-C01 cannot be proved from current authority, with the first missing dependency and a genuinely changed retry condition recorded;
4. an actual scope/validity defect is found, with correction/demotion.

RL57 is not authorized to claim delta(G)>=8 eliminated merely from one escape edge.

## Checkpoint

State:
- the exact status of RL57-C01;
- the exact use of delta(G)>=8 in the original graph;
- any exact escape-edge consequence proved;
- the falsification pattern;
- every consequence actually proved;
- whether delta(G)>=8 is eliminated;
- whether the HC7-universal residual is genuinely narrowed;
- the first missing dependency;
- exact proof/source provenance consumed;
- theorem/source classification changes;
- correction/demotion;
- whether any HC7-universal obligation was genuinely reduced;
- the exact bounded successor.

End with the AGENTS.md recommendation line.
