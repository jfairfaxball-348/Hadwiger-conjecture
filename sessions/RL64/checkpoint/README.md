# RL64 checkpoint — HC7 two-edge-deficient frontier admission gate

RL64 was a SOURCE-VERIFICATION GATE selected by the RL63 global audit. It ran no proof campaign.

## Outcome
- **Access.** The start-gate precondition (arxiv.org reachable) first failed: probes A0 and A0b were blocked (403). The user changed the environment, and probe A0c reached arxiv.org.
- **Bounds.** 4 of 6 retrievals; mathematical computation 0; census 0; no proof reconstruction.
- **Admitted at Level A** (statement-checked, version-pinned v1, proofs unread, unrefereed preprints):
  - F1, arXiv:2609.17760v1 (Dvořák–Norin–Rahman): no K7^= minor ⇒ 6-colourable. AI-assistance disclosed; depends on Dvořák arXiv 2609.13818.
  - F2, arXiv:2507.03244v1 (Norin–Totschnig): no K7^vee minor ⇒ 6-colourable.
- **New universal item U8.** Every HC7 counterexample has K7 minus any two edges as a minor. This is the first narrowing since RL54. It does not imply U7 and does not give K7^-.
- **Inputs.** The frontier proofs consume Mader 7-connectivity (two papers cite conflicting originals), Dirac, Kriesell–Mohr, KT05 lemmas and Dvořák 2026. They do NOT use the Mader K7 extremal function or Gallai.
- **Obstructions.**
  - K7^- reduces to F1 Conjecture 1.5 (5-connected, n>=6, e>=4n−2 ⇒ K7^-) via F1 Thm 1.6.
  - For K7, density is documented false (5n−15 two-apex planar examples).
- **Classifications.**
  - Mathematical correction/demotion: NONE.
  - Theorem-classification changes: NONE.
  - Source-status changes: SRC-03 C→A, SRC-04 C→A, GAP-02 C→B; new Level-B rows RL64-SRC-01..10.
  - RL63 orientation notes EX-1..EX-4 are superseded by inspection.
- **Successor:** RL65 HC7-K7MINUS-DENSITY-CANDIDATE-GATE.
- **Runner-up:** a Level-A gate for Mader 7-connectivity.

## Files
- INCOMING_SNAPSHOT.md, authoritative_sha256.txt — start-gate identity of the incoming authority.
- RL64_RETRIEVAL_LOG.md — A0/A0b/A0c probes and R1–R4, with hashes.
- RL64_ADMISSION_RECORD.md — exact F1/F2 statements and the admission decisions.
- RL64_CLASSICAL_INPUT_TABLE.md — Level-B inputs.
- RL64_FRONTIER_OBSTRUCTION_MAP.md — architecture, deficiency loci, K7^- / K7 obstructions.
- RL64_SOURCE_REGISTER_UPDATE.md (delta) and RL64_SOURCE_REGISTER.md (consolidated).
- RL64_CHECKPOINT_SUMMARY.md — the pre-closeout checkpoint, as presented to the user.
- RL64_REPORT.md — the final report.
- FAILURE_AND_LESSON_LEDGER_APPENDIX.md — FL-065.
- RL64_CLOSEOUT_VERIFICATION_REPORT.md.
- RL64_SESSION_STATE_AND_RL65_KICKOFF.md.
- resume.json.

The full text of F1 is not stored (arXiv non-exclusive licence). Hashes and line references to the pdftotext extraction are recorded instead.
