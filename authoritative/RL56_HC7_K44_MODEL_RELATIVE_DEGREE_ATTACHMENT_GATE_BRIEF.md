# RL56 HC7 K4,4 model-relative degree attachment gate brief

Status: READY / NOT STARTED.
Programme ACTIVE.
Root: HC7 only.

Follow AGENTS.md, START_HERE.md, HC7_RESEARCH_PROGRAMME.md, PROOF_STATE_AND_OPEN_OBLIGATIONS.md, RL56_STATE.md, RL55_REPORT.md, RL55_PROOF_STATE_AND_RESIDUAL_LEDGER.md, FAILURE_AND_LESSON_LEDGER.md, RL55_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, RL51_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and docs/RESEARCH_RECOVERY_PROTOCOL.md.

Preserve all inherited theorem scopes, SRC-0025 at checked_primary theorem-statement/hypothesis level, FL-043 through FL-056, and correction/demotion NONE.

## Certified domain

Work only with a hypothetical minor-minimal HC7 counterexample G satisfying:
- G finite simple, chi(G)=7, no K7 minor;
- every proper minor is 6-colorable;
- delta(G)>=8;
- G contains a K4,4 minor.

Choose a legitimate K4,4 model minimizing total branch-set size. Consume RL55-P01 exactly:

For each branch set X and the four opposite branch sets Y_1,...,Y_4, if T_j is the set of vertices of X adjacent to Y_j, then no proper nonempty connected subset of X meets all four T_j. Hence if X-x remains connected, x is the unique member of some T_j, and every spanning tree of G[X] has at most four leaves.

Do not strengthen this theorem.

## Single changed mechanism

RL55 stopped because same-graph model minimality does not couple to proper-minor 6-colorability: internal contraction preserves a K4,4 model in a proper 6-colorable minor, and model sizes in different graphs are not comparable.

RL56 must therefore use delta(G)>=8 in the ORIGINAL GRAPH.

Formulate and assess at most one exact universal **model-relative attachment lemma**. Before attempting to prove or consume it, state:
1. its full quantifiers over every graph and minimum model in the certified domain;
2. the exact attachment object forced by degree-eight surplus;
3. why that object is not already merely one of the four required opposite-side adjacencies or internal connectivity edges;
4. an explicit branch-set construction yielding K7, or an explicit proper-minor coloring contradiction, from the claimed attachment;
5. one concrete falsification pattern;
6. the first missing dependency if the lemma cannot be proved from current authority.

A candidate that only says "there is an extra neighbour" is insufficient unless the location and payoff of that neighbour are universally controlled.

Stop at the first further missing universal dependency.

## Prohibitions

Do not:
- repeat RL55 internal branch-set reducibility arguments as the changed mechanism;
- infer singleton branch sets;
- compare minimum model size across different graphs;
- transfer delta(G)>=8 to a contracted quotient;
- assume K4,4 is a subgraph or induced subgraph;
- assume unique cross edges, independent sides, a separator, or prescribed branch-set topology;
- catalogue K4,4 models or run graph/coloring/resource censuses;
- perform mathematical numerical computation;
- return to degree-seven neighborhood, RL31-RL49 resource/Kempe/pivotal-edge, or M3-CLIQUE-SEPARATOR-DICHOTOMY work;
- launch a broad literature campaign.

If a specifically named load-bearing theorem already in repository provenance becomes necessary but is weakly verified, stop and formulate one bounded source-verification successor.

## Stopping outcomes

Stop RL56 with exactly one of:
1. a proved attachment lemma eliminates delta(G)>=8;
2. a proved attachment lemma genuinely narrows the HC7 residual but leaves one exact missing dependency;
3. the one assessed attachment candidate fails or cannot be proved from current authority, with the first missing dependency and changed retry condition recorded;
4. an actual scope/validity defect is found, with correction/demotion.

## Checkpoint

State:
- the exact candidate attachment lemma;
- the exact use of delta(G)>=8 in the original graph;
- the explicit payoff/falsifier;
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
