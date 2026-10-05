# RL54 HC7 delta>=8 / K4,4 payoff gate brief

Status: READY / NOT STARTED.
Scope: one bounded primary-source verification plus one bounded root-facing payoff audit.
Programme ACTIVE.

Follow AGENTS.md, authoritative/START_HERE.md, authoritative/HC7_RESEARCH_PROGRAMME.md, authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md, authoritative/RL54_STATE.md, authoritative/RL53_REPORT.md, authoritative/RL53_PROOF_STATE_AND_RESIDUAL_LEDGER.md, authoritative/FAILURE_AND_LESSON_LEDGER.md, authoritative/RL51_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, docs/RESEARCH_RECOVERY_PROTOCOL.md, and only the exact frozen provenance named below.

Root: HC7 only — every finite simple graph G with chi(G)=7 must contain K7 as a minor.

Preserve every inherited theorem/certificate at exactly its recorded scope. Correction/demotion is NONE at entry. FL-043 through FL-054 and all retry conditions remain in force.

## Certified starting domain

Work only with the unresolved universal branch represented by an arbitrary hypothetical minor-minimal HC7 counterexample G satisfying:

```
G finite simple,
chi(G)=7,
G has no K7 minor,
every proper minor of G is 6-colorable,
delta(G)>=8.
```

RL52 certified delta(G)>=7. RL53 did not establish existence of a degree-seven vertex and therefore retained delta(G)>=8 explicitly.

Required frozen provenance includes at least:
- sessions/RL53/checkpoint/RL53_REPORT.md;
- sessions/RL53/checkpoint/RL53_PROOF_STATE_AND_RESIDUAL_LEDGER.md;
- sessions/RL52/checkpoint/RL52_REPORT.md;
- sessions/RL52/checkpoint/RL52_PROOF_STATE_AND_RESIDUAL_LEDGER.md;
- sessions/RL6/RL6_RECOVERY_REPORT.md;
- sessions/RL6/RL6_PROOF_STATE_AND_RESIDUAL_LEDGER.md;
- sessions/RL10/checkpoint/DEPENDENCY_SCOPE_AUDIT.md;
- sessions/RL6/incoming/background/SOURCE_CATALOG.jsonl;
- sessions/RL6/incoming/background/SOURCE_CHECKS.md;
- sessions/RL6/incoming/background/RESULT_CATALOG.jsonl.

Read no other older file unless an exact provenance link in these records requires it.

## Single RL54 task — HC7-DELTA8-K44-PAYOFF-GATE

There are exactly two sequential bounded gates.

### Gate A — exact SRC-0025 verification

Repository source record:

SRC-0025 — Ken-ichi Kawarabayashi and Bjarne Toft, *Any 7-chromatic graph has K7 or K4,4 as a minor*, Combinatorica 25 (2005), 327–353.

Inherited classification: not_directly_checked. The prior source audit records bibliographic discovery only and says the exact paper was not obtained.

Perform at most one bounded primary-source verification of this named source. Verify:
1. source identity/version;
2. exact theorem statement and hypotheses;
3. whether it applies to every finite simple graph in the certified HC7 starting domain;
4. whether the conclusion is exactly K7 minor OR K4,4 minor, with no omitted qualifier;
5. proof/source classification after verification.

Do not run a general literature search. If the primary source cannot be exactly verified, stop with that source gap. Failed access does not establish mathematical openness.

If and only if Gate A passes, record the universal consequence for the HC7 no-K7 branch:

```
G contains a K4,4 minor.
```

This is a structural reduction only, not a contradiction by itself.

### Gate B — exact root payoff audit

Assuming only a Gate-A-verified K4,4-minor conclusion, assess exactly:

```
finite simple G
+ chi(G)=7
+ every proper minor 6-colorable
+ no K7 minor
+ delta(G)>=8
+ G has a K4,4 minor
->
K7 minor or an exact contradiction with the proper-minor-six-colorable premise.
```

Strongly prefer isolating the first missing universal dependency over developing local machinery.

Do not assume that a K4,4 minor is a subgraph, induced subgraph, separator, or prescribed branch-set model. Do not silently strengthen the verified theorem.

If the implication is not established directly from existing proved authority plus elementary reasoning, stop at the first exact missing dependency and formulate one bounded successor task. Do not launch a second theorem-discovery campaign.

## Prohibitions

Do not perform:
- graph/coloring/resource census;
- mathematical numerical computation;
- degree-seven neighborhood classification;
- H[S]=K7-C7 analysis;
- resource decomposition or m-case work;
- RL41 attachment-triple analysis;
- fixed-color, Kempe, bridge or pivotal-edge refinement;
- M3-CLIQUE-SEPARATOR-DICHOTOMY work;
- a return to suspended RL31-RL39 or RL41-RL49 mechanisms.

## Stopping outcomes

Stop RL54 with exactly one of:
1. SRC-0025 cannot be exactly primary-source verified: retain delta(G)>=8 and record the exact source gap;
2. SRC-0025 is verified and yields a universal K4,4-minor consequence, but the payoff implication has a first missing dependency: preserve that dependency and one bounded successor;
3. the verified source plus a complete analytic payoff proves the delta(G)>=8 branch impossible;
4. an actual scope/validity defect is found: freeze affected deductions and record correction/demotion.

At checkpoint state explicitly:
- exact SRC-0025 verification classification;
- whether every hypothetical minor-minimal HC7 counterexample is now certified to contain a K4,4 minor;
- whether delta(G)>=8 has been eliminated;
- the first missing dependency if not;
- exact proof/source provenance consumed;
- inherited theorem classification changes;
- correction/demotion, including NONE if appropriate;
- whether any HC7-universal obligation was genuinely reduced;
- exact bounded successor task.

End with the AGENTS.md recommendation line.
