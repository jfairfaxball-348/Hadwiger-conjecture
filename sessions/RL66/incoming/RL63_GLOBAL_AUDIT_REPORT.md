# RL63 global audit report — HC7 proof/disproof attack plan

Date: 2026-10-06.
Status: RL63 global-audit record. CLOSED/FROZEN on promotion at RL63 closeout.
Type: explicit user-directed GLOBAL AUDIT of RL1–RL62, plus the initialization/scaffold and the HC7 target amendment. It is additional to the periodic cadence; RL70 is still owed.
Root: HC7 only. For every finite simple G with chi(G)=7, h(G)>=7. A legitimate negative is a rigorously verified G with chi(G)=7 and h(G)<=6.

## Start gate

| Check | Result |
|---|---|
| Expected predecessor | ad6eff15af85627a318cf8052f3eff2d08f86433 |
| Live origin/main (git ls-remote) | Same commit — MATCH |
| BASE_TREE | c2ddff8809c2c479da0c1d3d93974722c46385c2 |
| Incoming authoritative tree | 70d8f6797b120a47f477edc08bd8147d7036da44 (22 files; per-file sha256 recorded) |
| `sessions/RL63` | Absent |
| Unique incoming RL | RL63 |
| Sole brief | authoritative/RL63_HC7_GLOBAL_AUDIT_AND_ATTACK_PLAN_BRIEF.md |
| Unresolved integrity failure | None. Packaging findings are recorded separately; none is mathematical. |

## Method

1. Read current authority in the order the brief requires.
2. Swept all frozen session records RL1–RL62 at proof-state / checkpoint provenance, in three independent read-only passes.
3. Re-derived every load-bearing item.
4. Checked the git history of the consolidated ledger and the source records.
5. Ran a red-team critique of the plan.
6. Identified named source gaps, then ran at most 8 external retrievals (orientation only).
7. Ranked the routes.

Mathematical computation: 0. Census: 0. Frozen history and authority: unmodified.

## Exact current HC7 frontier (unchanged by RL63)

For every hypothetical minor-minimal HC7 counterexample G:
- **U1** Every proper minor is 6-colourable (full-C7 critical).
- **U2** Every proper subgraph is 6-colourable; G is connected; delta>=6.
- **U3** A2 holds.
- **U4** alpha(G[N(v)])<=d(v)−5 for every v (RL6-P03 star-fold context).
- **U5** delta>=7.
- **U6** Either some vertex has degree 7, or delta>=8.
- **U7** G has a K4,4 minor (SRC-0025, checked_primary at title/abstract statement level; proof unread).

Last genuine universal narrowing: RL54. No session after RL54 narrowed the class.

**Source-gated, not consumed** (see the source register):
- S1 7-connected — Level B via RL12-SRC-01; the original is FL-063-gated.
- S2 delta in {7,8,9} — Mader 1968b; located only.
- S3 n>=13 — Gallai + HC6; not located.
- S4 minors of K7 minus any two edges — arXiv:2609.17760 and arXiv:2507.03244; located only.

## Principal findings

1. **The universal frontier is classical, and behind the literature.** RL1–RL62 added no non-classical universal narrowing. The repository never imported the k=7 toolkit or the 2025–2026 frontier.
2. **46 of 62 sessions are local, valid and strategically irrelevant to HC7 as it stands.** They comprise degree-seven, resource, Kempe and M3 machinery (RL6–RL51) and K4,4 minimum-model work (RL55–RL61). Classifications are preserved.
3. **The coverage target was mis-specified.** RL52/RL53 framed coverage as "degree-7 existence"; this is retired. The correct finite coverage statement is delta in {7,8,9} (source-gated).
4. **Overlooked provenance.** RL12-SRC-01 recorded 7-connectivity in RL12. It was dropped at the RL30 reset and never cited by RL52 or RL62. RL63 clarifies it as a Level-B restatement. It does not satisfy FL-063 and promotes nothing.
5. **Packaging defects PK-1..PK-8.** The most important is PK-1: the consolidated ledger lost FL-001..042 starting at the RL32 closeout. Repairs are prepared for closeout.
6. **Disproof capability is NONE**, and no exhaustive disproof domain exists.

## Corrections, demotions, source status

- Mathematical corrections/demotions: **NONE**.
- Theorem-classification changes: **NONE**.
- Promoted source-status changes: **NONE**.
- Source-classification clarification: RL12-SRC-01 is Level B, a restatement. No result changes.
- New located-only records: RL63-SRC-01..05. Gaps: RL63-GAP-01..03.

## Route decisions (summary; full table in RL63_ROUTE_PORTFOLIO_AND_KILL_LIST.md)

| Disposition | Routes |
|---|---|
| KEEP | R01 universal baseline |
| SOURCE-GATE | R02 two-edge-deficient frontier (rank 1); R03 Mader extremal / delta<=9 (rank 2); R04 7-connectivity (rank 3); R05 Gallai order bound |
| KILL/RETIRE | R06 degree-7-existence target; R07 early CR_6/rooted routing; R08 general-t corpus as a route; R09 SEP2; R10–R13 m=1/m=2/m=3/fixed-triple-Kempe chains; R16 K4,4 minimum-model; R17 spanning K4,4 colouring |
| CONDITIONAL ONLY | R14 M3 dichotomy; R15 degree-7 programme as a whole |
| SUSPEND | R18 K4,4 non-colouring uses; R19 elementary separator 7-connectivity; R21 K7^- / K7 beyond the frontier (pending R02) |
| COMPUTE-GATE | R20 certified counterexample search |

## Verdict

- **Strongest proof route:** admit the two-edge-deficient frontier (F1, F2), then attack the documented K7^- / K7 obstruction.
- **Strongest disproof route:** a certified exhaustive order-N sweep under the delta/edge band. It is COMPUTE-GATED on S2 and on tooling, and a negative result only certifies n>N.
- **Hard winner (RL64):** HC7-TWO-EDGE-DEFICIENT-FRONTIER-ADMISSION-GATE.
- **Runner-up:** the Mader K7 extremal-function gate (delta in {7,8,9}). It loses because it lies below the frontier, its original is paywalled and FL-063-prone, and the winner's extraction partly subsumes it.
- **Environment precondition for RL64:** arxiv.org must be allowed, or the user must supply the exact arXiv versions.

## Deliverables

- RL63_SESSION_MATRIX.md
- RL63_HC7_DEPENDENCY_AND_SCOPE_AUDIT.md
- RL63_ROUTE_PORTFOLIO_AND_KILL_LIST.md
- RL63_PROOF_VS_DISPROOF_ATTACK_MAP.md
- RL63_SOURCE_GAP_REGISTER.md
- RL63_CORRECTION_AND_DEMOTION_RECORD.md
- RL63_STRATEGIC_VERDICT.md
- RL63_GLOBAL_AUDIT_REPORT.md

Companions (checkpoint): RL63_RETRIEVAL_LOG.md, FAILURE_AND_LESSON_LEDGER_APPENDIX.md (FL-064), FL_001_042_RESTORATION_MANIFEST.md, FL_055_DIVERGENCE_NOTE.md, PREPARED_RECOVERY_TASK.md, RL63_SESSION_STATE_AND_RL64_KICKOFF.md, RL63_CLOSEOUT_VERIFICATION_REPORT.md, INCOMING_SNAPSHOT.md, resume.json. Successor brief: authoritative/RL64_HC7_TWO_EDGE_DEFICIENT_FRONTIER_ADMISSION_GATE_BRIEF.md.

Programme ACTIVE.
