# RL58 HC7 K4,4 dense model-union K7 payoff gate brief

Status: READY / NOT STARTED.
Programme ACTIVE.
Root: HC7 only.

Follow AGENTS.md, START_HERE.md, HC7_RESEARCH_PROGRAMME.md, PROOF_STATE_AND_OPEN_OBLIGATIONS.md, RL58_STATE.md, RL57_REPORT.md, RL57_PROOF_STATE_AND_RESIDUAL_LEDGER.md, FAILURE_AND_LESSON_LEDGER.md, RL57_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, RL56_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, RL51_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and docs/RESEARCH_RECOVERY_PROTOCOL.md.

Preserve all inherited theorem scopes, SRC-0025 at checked_primary theorem-statement/hypothesis level, RL55-P01 exactly, RL56-P01 only as a conditional double-apex payoff, RL57-C01 as NOT ESTABLISHED / NOT PROMOTED, FL-043 through FL-058, and correction/demotion NONE.

## Certified domain

Work only with a hypothetical minor-minimal HC7 counterexample G satisfying:
- G finite simple, chi(G)=7, no K7 minor;
- every proper minor is 6-colorable;
- delta(G)>=8;
- G contains K4,4 as a minor.

Choose a legitimate K4,4 model M=(A_1,...,A_4;B_1,...,B_4) minimizing total branch-set size and let

    U = A_1 union ... union A_4 union B_1 union ... union B_4.

Consume RL55-P01 exactly. Do not strengthen it.

RL56-P01 may be consumed only conditionally: an exterior adjacent double apex attached to all eight branch sets would give K7. RL56 did not prove such an object exists.

RL57 did not prove a universal escape edge. Its fixed interface counterpattern shows only that RL55-P01 plus the legitimate-model interface can coexist with every displayed model vertex having in-union degree eight. The pattern is not certified as a full HC7 counterexample or as a globally minimum model.

## Single changed mechanism

RL57 stopped because the in-union degree cap cannot be obtained from RL55-P01 alone. RL58 must not retry that cap by the same degree-counting or branch-set-reducibility mechanism.

RL58 assesses exactly one direct root-facing candidate:

**RL58-C01 — dense model-union K7 payoff candidate.**

For every G and every minimum-total-size K4,4 model M in the certified domain, with U its branch-set union, if

    |N_G(v) intersect U| >= 8

for every v in U, then G contains a K7 minor.

Before attempting proof or consumption, state explicitly:
1. the complete quantifiers over every certified G and every minimum model M;
2. that the premise is an ORIGINAL-GRAPH statement about G[U], not quotient minimum degree;
3. why the conclusion is an explicit HC7 root payoff;
4. why merely restating RL57-C01 contrapositively is not progress — the changed mechanism must actually derive K7 from dense in-union adjacency using certified hypotheses beyond RL55-P01 alone;
5. how the RL57 three-vertex-path interface pattern stress-tests any step claimed to follow only from RL55-P01;
6. one certified-domain falsification condition for RL58-C01;
7. the first missing universal dependency if the candidate cannot be proved from current authority.

Stop at the first further missing universal dependency.

If RL58-C01 is proved, then in a certified K7-minor-free G the dense alternative is impossible, so every minimum model has some v in U with |N_G(v) intersect U|<=7; combining only then with delta(G)>=8 in the original graph yields one escape edge. Record no stronger attachment consequence unless an already-proved current theorem supplies it.

Do not invent an attachment cascade in the same session.

## Fixed stress test

The RL57 pattern may be used only to reject proof steps that rely on RL55-P01 or the basic model interface alone:
- eight branch sets are three-vertex paths;
- an alternating Hamilton cycle of K4,4 uses distinct singleton endpoint supporters;
- the remaining opposite-side pairs are complete between the corresponding paths;
- every displayed model vertex has in-union degree eight.

Do not claim this pattern is a certified-domain counterexample or globally minimum model without a separate rigorous proof, and do not launch a realization search.

## Prohibitions

Do not:
- assess a second dense-union candidate;
- catalogue model vertices, degrees, attachment types, or K4,4 models;
- repeat RL55 internal branch-set reducibility as the changed mechanism;
- compare minimum model sizes across different graphs;
- transfer delta(G)>=8 to a contracted quotient;
- infer RL56-C01 from any single edge;
- assume K4,4 is a subgraph/induced subgraph, independent sides, unique cross edges, prescribed branch-set topology, or a separator;
- perform graph/coloring/resource census or mathematical numerical computation;
- search for a full realization of the RL57 stress-test pattern;
- return to degree-seven neighborhood, RL31-RL49 resource/Kempe/pivotal-edge, or M3-CLIQUE-SEPARATOR-DICHOTOMY work;
- launch a broad literature campaign.

If a specifically named load-bearing theorem already present in repository provenance becomes necessary but is weakly source-verified, stop and formulate one bounded source-verification successor rather than launching a literature survey.

## Stopping outcomes

Stop RL58 with exactly one of:
1. RL58-C01 is proved, yielding only the exact dense-alternative exclusion and consequent universal escape edge;
2. RL58-C01 is falsified by a rigorous certified-domain counterexample/counterpattern;
3. RL58-C01 cannot be proved from current authority, with the first missing dependency and a genuinely changed retry condition recorded;
4. an actual scope/validity defect is found, with correction/demotion.

RL58 is not authorized to claim delta(G)>=8 eliminated merely from an escape edge.

## Checkpoint

State:
- the exact status of RL58-C01;
- the exact use of dense in-union degree and of delta(G)>=8 in the original graph;
- every direct K7 or escape-edge consequence actually proved;
- the stress-test outcome;
- whether delta(G)>=8 is eliminated;
- whether the HC7-universal residual is genuinely narrowed;
- the first missing dependency;
- exact proof/source provenance consumed;
- theorem/source classification changes;
- correction/demotion;
- whether any HC7-universal obligation was genuinely reduced;
- the exact bounded successor.

End with the AGENTS.md recommendation line.
