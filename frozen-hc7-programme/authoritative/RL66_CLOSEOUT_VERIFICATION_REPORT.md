# RL66 closeout verification report

Status: RL66 record. CLOSED/FROZEN on promotion at RL66 closeout.

Date: 2026-10-06.
Candidate status: PASS, subject to the final ref move and readback.

## Session identity
- Incoming RL: RL66.
- Successor RL: RL67, exactly one number ahead (sessions/RL67 absent).
- Successor type: bounded new-mathematics candidate gate (RL67 HC7-K7MINUS-R1-MINIMALITY-TRANSFER-GATE).
- Programme root: HC7 only.
- BASE_HEAD: a9f89debfb523bf32f1aed703b9ceee8484ec72f. It matched the user's expected predecessor at kickoff, at Phase 0, at the checkpoint, at CLOSEOUT_LOCK entry and at the freeze.
- BASE_TREE: 8195e393a1f7a10071a646f128584e9b7e0b707b.
- Incoming authoritative tree: bebe64012cdd90a387c31d174d2c97d2737e2f70 (29 files).
- sessions/RL66 was absent at startup. RL66 was the unique incoming numbered session.
- Lock trigger: the user's instruction to "promote/commit/push/merge … and then carry on with the next session". "Merge" was taken as explicit permission to fast-forward main after a lease check, as in RL65.

## Frozen generation
- The incoming authoritative tree (29 files) is frozen byte-identically under sessions/RL66/incoming/. The sha256 manifest (sessions/RL66/checkpoint/authoritative_sha256.txt) matched at the freeze. RL66_STATE.md and the RL66 brief were moved there with git mv.
- The RL66 records are in sessions/RL66/checkpoint/:
  - incoming snapshot and manifest;
  - retrieval log (0 retrievals);
  - payoff-chain, falsification-test and C66-assessment records (byte-identical to the promoted authority copies);
  - checkpoint summary;
  - red-team record;
  - CLOSEOUT_LOCK state;
  - final report;
  - FL-067 appendix;
  - RL67 kickoff record;
  - this report;
  - resume.json;
  - README.

## Verifiers / red teams
- **Mathematical red team** (Workflow run wf_5cc3f33d-0c9). 8 independent read-only adversarial referees covered:
  - the payoff chain;
  - full packing and Lemma S;
  - the contraction formula and Lemma P;
  - K4r;
  - E66, S66 and B65⁷;
  - families (i)/(iii), family (ii), and family (iv) together with C66 scope.

  **Result: 7 CONFIRMED, 1 ERROR confined to summary scope (V6), 0 blocking.** Twelve issues were graded minor and thirty wording. All were applied as scoping, precision or provenance edits before promotion (sessions/RL66/checkpoint/RL66_RED_TEAM_RECORD.md). No classification changed. No mathematical correction or demotion.
- **Handover critics** (Workflow run wf_f9ffac1f-b46): **C1 cold-start portability: PASS. C2 scope/licence integrity: PASS.** No blocking issues. Their issues (minor or wording) were fixed before commit:
  - the exact R1 call is now specified in the RL67 brief: unversioned URL, the call itself serves as the reachability check, binding PDF hash, a rule for an extraction-hash-only mismatch, and acceptance of a user-supplied file with the pinned hash;
  - the stopping rule now covers the minimality-assisted variant (same single candidate);
  - access-defect handling now says the deliverable is a re-run recommendation and the drift rule does not apply;
  - the drift-rule horizon is harmonised to RL68 and RL69 in every file, and the drift rule was added to PROOF_STATE O1;
  - H67-payoff provisos (minimality-order check, F1 definitions at Level A) now travel with every payoff statement;
  - U9 precision wording restores the F1 Thm 1.6 (Level A) dependency and the CONDITIONAL status, and the C65⁷ order condition n >= 8 is now in PROOF_STATE;
  - the F1 reliance caveat in the report and checkpoint summary now lists every Level-A F1 use;
  - E66 phrasing corrected;
  - FL-067 lesson wording corrected to "the strength of C65's degree-5 case" in all three copies;
  - definitions lead-in, ∂Y and the unrooted reading of 4-bilight added to the brief;
  - H54⁻ and C65⁷ glossed in START_HERE;
  - the r <= 3 sentence in the checkpoint summary rescoped;
  - a stale root-navigation note (PK-7) added to START_HERE and the brief;
  - this report written.

  **Not changed, by design:**
  - the ledger header line "CURRENT after RL63" lies inside the byte-identical prefix, which the append-only rule protects;
  - historical brief paths in programme §10–§12 are byte-identical earlier text;
  - the branch name is a git ref, not a model identifier (RL64/RL65 precedent).

## Classification results
- **Step 0 identity:** PROVED ANALYTIC.
- **P66a:** PROVED ANALYTIC, CONDITIONAL on C66.
- **P66b:** PROVED ANALYTIC, CONDITIONAL on C66 and the NOT PROMOTED H54⁻.
- **Lemma F′, contraction formula and Lemma P, Lemma S, Lemma K4r, E66, S66:** PROVED ANALYTIC (elementary).
- **Precision B65⁷:** PROVED ANALYTIC, CONDITIONAL exactly as B65.
- **Falsification record (i)–(iv):** PROVED ANALYTIC. No falsifier was found in the tested members.
  - The family (ii) all-components-poor regime is NOT ASSESSED.
  - Family (iii) is a one-directional reduction to cores.
  - The Lemma P residual case |T| = 4 is not excluded.
- **C66:** CANDIDATE / NOT ESTABLISHED; OPEN, not falsified. Its first missing dependency is equivalent to C66 and has at least C65-degree-5 strength.
- **H67 and the Thm 2.9-outcome extension:** NOT ASSESSED. The extension is a pointer only.
- **U1–U8:** unchanged. **U9:** CONDITIONAL (only C65⁷ is needed).
- **Mathematical correction/demotion:** NONE.
- **Inherited theorem-classification changes:** NONE.
- **Promoted source-status changes:** NONE.

## Ledger
- FAILURE_AND_LESSON_LEDGER.md: the incoming 241329-byte file is a byte-identical prefix of the successor ledger. FL-067 is appended after a separator. FL-001..FL-067 are all present with no gaps.
- The FL-067 text is identical in the ledger, in RL66_FAILURE_AND_LESSON_LEDGER_APPENDIX.md and in the checkpoint appendix.

## Successor authority (35 files)
- **Replaced:**
  - START_HERE.md (names RL67 and its sole brief);
  - PROOF_STATE_AND_OPEN_OBLIGATIONS.md;
  - FAILURE_AND_LESSON_LEDGER.md (append-only);
  - HC7_RESEARCH_PROGRAMME.md (header line RL66→RL67 plus appended §13; all earlier text byte-identical).
- **Added:**
  - RL66_REPORT.md
  - RL66_PAYOFF_CHAIN.md
  - RL66_FALSIFICATION_TEST.md
  - RL66_C66_ASSESSMENT.md
  - RL66_FAILURE_AND_LESSON_LEDGER_APPENDIX.md
  - RL66_CLOSEOUT_VERIFICATION_REPORT.md
  - RL67_STATE.md
  - RL67_HC7_K7MINUS_R1_MINIMALITY_TRANSFER_GATE_BRIEF.md
- **Unchanged:**
  - HC7_PROGRAMME_TARGET_AMENDMENT.md;
  - the RL63, RL64 and RL65 records (RL64_SOURCE_REGISTER.md remains the consolidated register).
- **Retired from current authority** (frozen in sessions/RL66/incoming/): RL66_STATE.md and the RL66 brief.
- **Checks:**
  - Every current-tense path reference in START_HERE, RL67_STATE, the RL67 brief, PROOF_STATE and the RL66 records resolves to an existing file.
  - The only unresolved names are historical brief paths in programme §10–§12, which are byte-identical earlier text referring to briefs now frozen in sessions/.

## Bounds and integrity
- External retrievals: 0/2. Mathematical computation: 0. Census: 0. Candidates: 1.
- No forbidden route was used:
  - no T2.9⁻ retry;
  - no K7^=/K7^vee/vampire model upgrade;
  - no K7 density attempt;
  - no degree-7/M3/Kempe/K4,4 work;
  - no r >= 2 sub-case work (the extension note is a pointer only);
  - no second locus.
- Licence: no F1 full text, PDF or extraction file is in the tree, and no retrieval was made.
- No model identifier appears in any added or changed file.
- No theorem or source status depends on conversation history.
- Not included in this transition: the stale root README.md / START_HERE.md navigation (PK-7). That needs a separate non-RL commit, and only if the user asks.

## Final deterministic operations
1. Create one RL66 transition commit with parent BASE_HEAD.
2. Push it to the session branch claude/wonderful-ritchie-3fs24c.
3. With the user's explicit permission, lease-check that live main is still BASE_HEAD and fast-forward main once.
4. Read back both refs, sessions/RL66/checkpoint/README.md and authoritative/START_HERE.md.
