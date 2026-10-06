# RL64 closeout verification report

Date: 2026-10-06.
Candidate status: PASS, subject to the final ref move and readback.

## Session identity
- Incoming RL: RL64.
- Successor RL: RL65, exactly one number ahead (sessions/RL65 absent).
- Successor type: bounded new-mathematics candidate gate (RL65 HC7-K7MINUS-DENSITY-CANDIDATE-GATE).
- Programme root: HC7 only.
- BASE_HEAD: b313c5c865b01805261d7cb8ebb7c0232783051f. It matched the user's expected predecessor at start, at checkpoint and at CLOSEOUT_LOCK entry.
- BASE_TREE: 6e72d0fb62e32bc7eb45b1222d199acfd358d24a.
- Incoming authoritative tree: 88db7077963cf53032cbc4cbd2880e51f0e53a87 (22 files).
- sessions/RL64 was absent at startup; RL64 was the unique incoming numbered session.

## Frozen generation
- The incoming authoritative tree (22 files) is frozen byte-identically under sessions/RL64/incoming/; the sha256 manifest (sessions/RL64/checkpoint/authoritative_sha256.txt) matched at freeze.
- The RL64 records are in sessions/RL64/checkpoint/:
  - retrieval log;
  - admission record;
  - classical-input table;
  - frontier-obstruction map;
  - source-register delta and consolidated register;
  - pre-closeout checkpoint summary;
  - final report;
  - FL-065 appendix;
  - kickoff record;
  - this report;
  - resume.json.

## Classification results
- F1 (arXiv:2609.17760v1) and F2 (arXiv:2507.03244v1): ADMITTED at Level A (statement-checked, version-pinned, proofs unread, unrefereed preprints). No falsification condition fired.
- New universal item U8 (K7 minus any two edges). U1–U7 unchanged.
- Mathematical correction/demotion: NONE.
- Inherited theorem-classification changes: NONE.
- Promoted source-status changes:
  - RL63-SRC-03 C→A; RL63-SRC-04 C→A; RL63-GAP-02 C→B;
  - new Level-B rows RL64-SRC-01..10;
  - RL63-SRC-01 stays B; RL63-SRC-02 and RL63-GAP-01 stay C.
- RL63 orientation notes EX-1..EX-4 are superseded by inspection. They were Level-C expectations, not claims.

## Ledger
- FAILURE_AND_LESSON_LEDGER.md: the incoming 231062-byte file is a byte-identical prefix of the successor ledger. FL-065 is appended after a separator. FL-001..FL-065 are all present with no gaps.

## Successor authority (23 files)
- **Replaced:** START_HERE.md (names RL65 and its sole brief), PROOF_STATE_AND_OPEN_OBLIGATIONS.md, FAILURE_AND_LESSON_LEDGER.md (append-only), HC7_RESEARCH_PROGRAMME.md (header line RL64→RL65 plus appended §11; all earlier text byte-identical).
- **Added:**
  - RL64_ADMISSION_RECORD.md
  - RL64_CLASSICAL_INPUT_TABLE.md
  - RL64_FRONTIER_OBSTRUCTION_MAP.md
  - RL64_SOURCE_REGISTER.md
  - RL64_REPORT.md
  - RL64_FAILURE_AND_LESSON_LEDGER_APPENDIX.md
  - RL64_CLOSEOUT_VERIFICATION_REPORT.md
  - RL65_STATE.md
  - RL65_HC7_K7MINUS_DENSITY_CANDIDATE_GATE_BRIEF.md
- **Unchanged:** HC7_PROGRAMME_TARGET_AMENDMENT.md; RL63 records (closeout report, correction record, ledger appendix, global audit report, dependency audit, attack map, route portfolio, session matrix, strategic verdict).
- **Retired from current authority** (frozen in sessions/RL64/incoming/, and for RL62/RL63 also in sessions/RL63/):
  - RL62_CLOSEOUT_VERIFICATION_REPORT, RL62_FAILURE_AND_LESSON_LEDGER_APPENDIX, RL62_PROOF_STATE_AND_RESIDUAL_LEDGER, RL62_REPORT, RL62_SOURCE_VERIFICATION_RECORD. Their load-bearing content is carried in PROOF_STATE, FL-063 and the consolidated register.
  - RL63_SOURCE_GAP_REGISTER, superseded by RL64_SOURCE_REGISTER, which carries all its rows.
  - RL64_STATE and the RL64 brief.
- **Checks.** Current-tense path references in START_HERE, RL65_STATE, the RL65 brief and PROOF_STATE resolve to existing authority files. The only exception is the explicitly retired RL63 register, whose frozen location is named.

## Bounds and integrity
- External retrievals: 4/6. A0/A0b/A0c were disclosed access probes with no source content.
- Mathematical computation: 0. Census: 0. Proof reconstruction: none. No substitute sources; no RL63 replay.
- Licence: no F1 full text or PDF is committed. Only quotations, line references and hashes (checked by search for unquoted body sentences).
- No theorem or source status depends on conversation history.
- Not included in this transition: the stale root README.md / START_HERE.md navigation (PK-7, unchanged from RL63). That needs a separate non-RL commit, and only if the user asks.

## Final deterministic operations
1. Create one RL64 transition commit with parent BASE_HEAD.
2. Push it to the session branch claude/happy-brahmagupta-uevkl2.
3. With the user's explicit permission, lease-check live main against BASE_HEAD and fast-forward main once.
4. Read back the ref, sessions/RL64/checkpoint/README.md and authoritative/START_HERE.md.
