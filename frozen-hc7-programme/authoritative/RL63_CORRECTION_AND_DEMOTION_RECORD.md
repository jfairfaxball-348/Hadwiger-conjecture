# RL63 correction and demotion record

Status: RL63 global-audit record. CLOSED/FROZEN on promotion at RL63 closeout.
Audit window: RL1–RL62, plus the initialization/scaffold and the 2026-10-05 HC7 target amendment.

## 1. Mathematical corrections and demotions

**NONE.**

Every load-bearing claim was rechecked at its consuming scope (dependency audit §3) and found valid at its recorded classification:
- A1, A2;
- the RL6-P03 star-fold;
- RL52-C01..C03;
- the SRC-0025 consequence;
- RL55-P01, RL56-P01, the RL61 inequality;
- RL31-P01, RL34/35/38/39-P01, RL41-P01.

No silent strengthening, quotient transfer, cross-graph model comparison, subgraph-for-minor substitution or local-to-global coverage jump was found.

## 2. Inherited theorem-classification changes

**NONE.**

The following keep their exact recorded classifications:
- RL55-P01: proved, minimum-model scope;
- RL56-P01: conditional;
- RL56-C01, RL57-C01, RL58-C01, RL59-C01: NOT ESTABLISHED / NOT PROMOTED;
- HC7-CRITICAL-7-CONNECTIVITY: CANDIDATE / NOT ESTABLISHED;
- M3-CLIQUE-SEPARATOR-DICHOTOMY: ADMITTED / UNPROVED;
- M3-CORE: NOT CERTIFIED.

FL-043 through FL-063 and their retry conditions are preserved. None of their changed-input conditions is met by RL63, and RL63 does not claim one is.

## 3. Promoted source-status changes

**NONE.**

## 4. Source-classification clarification (explicit; no upgrade, no demotion of any result)

**RL12-SRC-01** (arXiv:2509.07144, Thm 1.1).
- RL12 recorded it as "inherited statement checked in a primary research paper; original Mader proof unread".
- RL63 orientation (R3) indicates the paper presents the k>=7 7-connectivity statement as Mader's long-standing result; its own new theorems concern k>=17.
- RL63 therefore records it explicitly as a **Level-B restatement** of Mader's theorem (see the source register). That is, it is not original-source verification.

Effects:
- RL12's own wording is preserved verbatim in frozen history and already said "original Mader proof unread".
- RL13-P00 was always conditional on RL12-SRC-01 and remains conditional. Nothing changes.
- The record does **not** satisfy FL-063's retry condition.
- HC7-CRITICAL-7-CONNECTIVITY remains CANDIDATE / NOT ESTABLISHED. A conditional derivation is available at the same Level-B status, parallel to RL13-P00. It is not promoted.
- Consistency check: the programme's statement "no proved/source-verified universal bridge for stronger connectivity" (HC7_RESEARCH_PROGRAMME §2) remains materially correct at Level A. What it omitted was the Level-B record.

## 5. Strategic reclassification (route level, not mathematical)

**HC7-DEGREE-SEVEN-EXISTENCE** (RL52 framing, RL53 gate) is retired as a mis-specified coverage target (route R06). The RL53 classification "OPEN / NOT ESTABLISHED" is preserved.

The correct finite coverage statement is the delta in {7,8,9} partition (route R03), which is source-gated.

## 6. Provenance and packaging findings (no mathematical effect)

| ID | Finding | First defect / evidence | Effect | Repair (at RL63 closeout unless noted) |
|---|---|---|---|---|
| PK-1 | Consolidated FAILURE_AND_LESSON_LEDGER lost FL-001..FL-042 | RL30 (`6d9d053`) and RL31 (`4517a52`) kept a pointer to the verbatim frozen ledger. **RL32 closeout (`29af9c1`) dropped the pointer**; RL32–RL39 each overwrote the file with one entry; RL40 (`e76a791`) restarted at FL-043. This conflicts with AGENTS.md ("Carry … forward in every handover"). | Portability: later sessions could not see FL-001..042 retry conditions | Restore exact text byte-for-byte from frozen sources, with path and blob hash per entry. Precedent: RL60 FL-054 repair. Done at RL63 closeout: restored into authoritative/FAILURE_AND_LESSON_LEDGER.md (manifest: FL_001_042_RESTORATION_MANIFEST.md). |
| PK-2 | RL12-SRC-01 dropped from current authority at the RL30 closeout reset (`6d9d053`, −715 lines in PROOF_STATE) | Last carried at sessions/RL30/incoming/PROOF_STATE_AND_OPEN_OBLIGATIONS.md:381 | RL52 and RL62 never cited it | Carry it in RL63_SOURCE_GAP_REGISTER (Level B) |
| PK-3 | Consolidated FL-055 diverges from sessions/RL54/checkpoint/RL54_FAILURE_AND_LESSON_LEDGER_APPENDIX.md in both directions. The consolidated text drops "The full subscription proof was not independently reconstructed" from the source-status line. | Both texts written in RL54 commit `b38901e` | The caveat survives in PROOF_STATE; no classification effect | Append a dated packaging note listing the differences and pointing to the appendix text; overwrite neither. Done at RL63 closeout: appended to the consolidated ledger (copy: FL_055_DIVERGENCE_NOTE.md). |
| PK-4 | Source catalog never updated (SRC-0025 still not_directly_checked); no source register in current authority | sessions/RL30/incoming/background/SOURCE_CATALOG.jsonl | Status lived only in prose | RL63_SOURCE_GAP_REGISTER serves as the current HC7 source register. Frozen catalog untouched. |
| PK-5 | RL62 "modern secondary restatement" never named (no title or URL) | sessions/RL62/checkpoint/RL62_SOURCE_VERIFICATION_RECORD.md | Unrecoverable provenance gap; possibly the same arXiv:2509.07144 | Record only; frozen history is not edited |
| PK-6 | RL52 cites the star-fold bound as "RL6-P03"; the RL6 ledger lists it as a separate row, "RL6-P03 star-fold context" | sessions/RL6/RL6_PROOF_STATE_AND_RESIDUAL_LEDGER.md:14 | Citation precision only | Successor authority cites "RL6-P03 star-fold context" |
| PK-7 | Root README.md and root START_HERE.md say "RL52 READY" | repository root | Navigation only; authoritative/START_HERE.md is correct | Separate non-RL commit, **only if the user asks** (not in the RL63 transition) |
| PK-8 | ID collision: RL52-C01..C03 are coverage arrows, while RL56-C01..RL59-C01 are candidates | RL52/RL56 reports | Naming only | Note only |

None of PK-1..PK-8 changes any mathematical, source or certificate classification.
