# RL65 closeout verification report

Date: 2026-10-06.
Candidate status: PASS, subject to the final ref move and readback.

## Session identity
- Incoming RL: RL65.
- Successor RL: RL66, exactly one number ahead (sessions/RL66 absent).
- Successor type: bounded new-mathematics candidate gate (RL66 HC7-K7MINUS-HEAVY-SIDE-ROOTED-K6-GATE).
- Programme root: HC7 only.
- BASE_HEAD: 60ccaddd48147a64df431e91d26675089200c82e. It matched the user's expected predecessor at kickoff, at the checkpoint, at CLOSEOUT_LOCK entry and at the freeze.
- BASE_TREE: 73291ea96571c77a8f4b1de863fa6bcc409aa659.
- Incoming authoritative tree: 8085e1ef56bc3a765e62072cf529959f4ded2880 (23 files).
- sessions/RL65 was absent at startup. RL65 was the unique incoming numbered session.

## Frozen generation
- The incoming authoritative tree (23 files) is frozen byte-identically under sessions/RL65/incoming/. The sha256 manifest (sessions/RL65/checkpoint/authoritative_sha256.txt) matched at the freeze.
- The RL65 records are in sessions/RL65/checkpoint/:
  - incoming snapshot and manifest;
  - retrieval log;
  - B65, falsification-test and locus-assessment records (byte-identical to the promoted authority copies);
  - checkpoint summary;
  - red-team record;
  - CLOSEOUT_LOCK state;
  - final report;
  - FL-066 appendix;
  - RL66 kickoff record;
  - this report;
  - resume.json;
  - README.

## Verifiers / red teams
- **Mathematical red team** (Workflow run wf_8feab086-c47). 8 independent read-only adversarial referees covered:
  - B65, under two lenses;
  - falsification families F-a to F-d, and F-e;
  - the first-locus identification;
  - G0 against F1's definitions;
  - the exactness of T2.9⁻;
  - Lemma D, H65 and scope.

  Result: **8/8 CONFIRMED, 0 blocking.** Nine issues were graded minor and seventeen wording. All were addressed by scoping, precision or provenance edits before promotion (sessions/RL65/checkpoint/RL65_RED_TEAM_RECORD.md). No classification changed.
- **Handover critics** (Workflow run wf_3a756a8b-e4d):
  - a cold-start portability critic: **PASS**;
  - a scope/licence integrity critic: **PASS**.

  Their issues (minor or wording) were fixed before commit:
  - the RL66_STATE payoff wording made conditional;
  - root separation and R_{A,B} defined in the RL66 brief, with the fragment form made operative;
  - a dangling "Q65" label replaced by an inline NOT ASSESSED statement;
  - the FL-066 title and retry condition widened to admit minimality-derived hypotheses;
  - the checkpoint summary aligned (n >= 8; standalone-lemma scope);
  - an F1 reading-disclosure line added to the report;
  - an F1 status header added to the falsification record;
  - this report written.

## Classification results
- **B65:** PROVED ANALYTIC, CONDITIONAL on C65 (CONJECTURE) and on F1 Thm 1.6 at Level A statement.
- **U9:** CONDITIONAL, not certified.
- **Falsification test:** PROVED ANALYTIC; no falsifier among the five named families.
- **First F1 locus:** Thm 2.9 as consumed in Lemma 5.7.
- **T2.9⁻:** FALSE, by the explicit counterpattern G0 (PROVED ANALYTIC). This is a METHOD BARRIER for a standalone lemma assuming only 4-light and quite heavy, at the quite-heavy threshold.
- **Lemma D:** PROVED ANALYTIC.
- **H65:** CANDIDATE / NOT ASSESSED; installed as RL66's C66. Its payoff is conditional on the NOT PROMOTED Lemma 5.4 analogue.
- **U1–U8:** unchanged.
- **Mathematical correction/demotion:** NONE.
- **Inherited theorem-classification changes:** NONE.
- **Promoted source-status changes:** NONE. Register note in RL65_REPORT.md §7: [Dvo26] v1 metadata pinned, content Level B; F1 v1 re-pinned, sha256 unchanged.

## Ledger
- FAILURE_AND_LESSON_LEDGER.md: the incoming 237074-byte file is a byte-identical prefix of the successor ledger. FL-066 is appended after a separator. FL-001..FL-066 are all present with no gaps.
- The FL-066 text is identical in the ledger, in RL65_FAILURE_AND_LESSON_LEDGER_APPENDIX.md and in the checkpoint appendix.

## Successor authority (29 files)
- **Replaced:**
  - START_HERE.md (names RL66 and its sole brief);
  - PROOF_STATE_AND_OPEN_OBLIGATIONS.md;
  - FAILURE_AND_LESSON_LEDGER.md (append-only);
  - HC7_RESEARCH_PROGRAMME.md (header line RL65→RL66 plus appended §12; all earlier text byte-identical).
- **Added:**
  - RL65_REPORT.md
  - RL65_B65_BRIDGE.md
  - RL65_FALSIFICATION_TEST.md
  - RL65_LOCUS_ASSESSMENT.md
  - RL65_FAILURE_AND_LESSON_LEDGER_APPENDIX.md
  - RL65_CLOSEOUT_VERIFICATION_REPORT.md
  - RL66_STATE.md
  - RL66_HC7_K7MINUS_HEAVY_SIDE_ROOTED_K6_GATE_BRIEF.md
- **Unchanged:**
  - HC7_PROGRAMME_TARGET_AMENDMENT.md;
  - the RL63 records;
  - the RL64 records, including RL64_SOURCE_REGISTER.md, which remains the consolidated register.
- **Retired from current authority** (frozen in sessions/RL65/incoming/): RL65_STATE.md and the RL65 brief.
- **Checks.** Every current-tense path reference in START_HERE, RL66_STATE, the RL66 brief, PROOF_STATE and RL65_REPORT resolves to an existing file.

## Bounds and integrity
- External retrievals: 2/3 (R1 F1 PDF, unversioned URL, sha256 equal to the pin, v1; R2 [Dvo26] abstract page). No probes beyond these. No substitutes or mirrors.
- Mathematical computation: 0. Census: 0. Candidates: 1.
- No forbidden route was used: no degree-7/M3/Kempe/K4,4 work, no K7 density attempt, no K7^=/K7^vee model upgrade.
- Licence: no F1 full text, no PDF and no extraction file is committed; only short quotations, line references and hashes. A tree search found no PDF or F1/F2 text file outside .git and .rl-work. The longest F1 quotation is the Lemma 5.7 deficiency step (a few sentences).
- No model identifier appears in any added or changed file.
- No theorem or source status depends on conversation history.
- Not included in this transition: the stale root README.md / START_HERE.md navigation (PK-7, unchanged since RL63). That needs a separate non-RL commit, and only if the user asks.

## Final deterministic operations
1. Create one RL65 transition commit with parent BASE_HEAD.
2. Push it to the session branch claude/sweet-hypatia-ktxxxs.
3. With the user's explicit permission (given at closeout), lease-check that live main is still BASE_HEAD and fast-forward main once.
4. Read back both refs, sessions/RL65/checkpoint/README.md and authoritative/START_HERE.md.
