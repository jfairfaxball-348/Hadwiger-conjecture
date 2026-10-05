# RL52 HC7 root-coverage gate brief

Status: READY / NOT STARTED.
Scope: one bounded coverage/provenance audit after the user-authorized HC7 target reset.
Programme ACTIVE.

Follow `AGENTS.md`, `authoritative/START_HERE.md`, `authoritative/HC7_RESEARCH_PROGRAMME.md`, `authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md`, `authoritative/RL52_STATE.md`, `docs/RESEARCH_RECOVERY_PROTOCOL.md`, `authoritative/RL51_REPORT.md`, `authoritative/RL51_PROOF_STATE_AND_RESIDUAL_LEDGER.md`, `authoritative/RL51_FAILURE_AND_LESSON_LEDGER_APPENDIX.md`, `authoritative/FAILURE_AND_LESSON_LEDGER.md`, and the exact frozen RL50-RL51 provenance named below.

Root: HC7 only — every finite simple graph G with chi(G)=7 must contain K7 as a minor.

Do not execute the former RL52 M3 clique-separator proof/falsification task.

Preserve every inherited theorem/certificate at exactly its recorded scope. Correction/demotion is NONE at entry. FL-043 through FL-054 and all retry conditions remain in force.

## Starting counterexample domain

For coverage auditing, begin with a hypothetical minor-minimal HC7 counterexample:

```
chi(G)=7,
G has no K7 minor,
and every proper minor of G is 6-colorable.
```

The programme document records the elementary reduction justifying this baseline. Recheck it briefly for logical applicability, but do not turn RL52 into a new general proof campaign.

Do not assume any stronger connectivity theorem, minimum-degree theorem, existence of a degree-seven vertex, H[S]=K7-C7, a resource family of a particular size, m=3,A=S, the RL41 attachment triple, a star coloring, color pair, Kempe component, bridge, pivotal edge, or M3-CLIQUE-SEPARATOR-DICHOTOMY unless the exact needed bridge is already proved/source-verified in repository authority.

## Single RL52 task — HC7-ROOT-COVERAGE-AUDIT

Audit exactly this implication chain:

```
HC7 counterexample
  -> minor-minimal chi=7, K7-minor-free counterexample
  -> every proper minor 6-colorable / full-C7 critical
  -> available universal connectivity and degree consequences
  -> exhaustive degree/neighborhood cases
  -> degree-seven branch, if universally reached
  -> H[S]=K7-C7 branch, if proved exhaustive/relevant
  -> exhaustive resource cases, including m=3,A=S where applicable
  -> existing RL31-RL51 local machinery.
```

For every arrow, record:

1. exact quantified statement;
2. classification: elementary / proved analytic / exact certificate / source-status theorem / candidate / open;
3. exact authoritative or frozen repository provenance;
4. whether the arrow covers every hypothetical minor-minimal HC7 counterexample;
5. the first residual branch not covered.

The audit is provenance-first. Read only exact older files directly cited by the current RL51 records or the frozen RL50 audit/dependency-scope records when needed to verify an arrow.

Required frozen inputs include:

- `sessions/RL51/checkpoint/RL51_REPORT.md`;
- `sessions/RL51/checkpoint/RL51_PROOF_STATE_AND_RESIDUAL_LEDGER.md`;
- `sessions/RL51/checkpoint/RL51_SESSION_STATE_AND_RL52_KICKOFF.md`;
- `sessions/RL51/incoming/RL50_AUDIT_REPORT.md`;
- `sessions/RL51/incoming/RL50_DEPENDENCY_SCOPE_AUDIT.md`;
- `sessions/RL51/incoming/RL50_COLLATZ_RISK_AND_VERDICT.md`.

## Root-payoff test

RL52 succeeds if it identifies the exact first missing universal coverage arrow and thereby turns the programme's next obligation into a root-facing statement.

If every arrow down to a degree-seven/H[S]/resource branch is already proved, then state the resulting exhaustive branch decomposition and identify the first still-open branch. Only in that event may a later RL select a local M3 task.

A narrow result may be listed as inherited evidence but does not reduce HC7 unless its entire upstream coverage chain is proved.

## Bounds and prohibitions

This is a desk-based finite audit.

- New external mathematical source retrieval: 0 by default.
- New mathematical numerical computation: 0.
- New graph/coloring/resource census: 0.
- New local Kempe/refinement mathematics: 0.
- Candidate mechanisms compared: 0 unless needed solely to state the first uncovered branch.
- Do not try to prove M3-CLIQUE-SEPARATOR-DICHOTOMY.
- Do not resurrect a suspended route merely because it has many existing lemmas.

If a classical structural theorem is load-bearing but only weakly verified in repository authority, record one bounded source-verification successor task instead of importing the theorem from memory.

## Stopping outcomes

Stop with exactly one of:

1. **coverage chain complete to a documented exhaustive local decomposition** — record that decomposition and the first open branch;
2. **first universal arrow missing** — state its exact quantifiers and residual branch, with one bounded successor proof/source-verification task;
3. **actual scope defect found** — freeze dependent deductions, record correction/demotion and retry conditions under the recovery protocol.

Checkpoint whether any inherited mathematical classification changed. The expected answer is NONE unless the audit discovers a real defect.

End with the AGENTS.md recommendation line.
