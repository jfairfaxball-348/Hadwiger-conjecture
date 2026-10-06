# RL65 authoritative state — HC7 K7^- density candidate gate

Status: READY / NOT STARTED.
Predecessor: RL64 CLOSED/FROZEN under sessions/RL64/.
Sole current brief: RL65_HC7_K7MINUS_DENSITY_CANDIDATE_GATE_BRIEF.md.
Durable programme: HC7_RESEARCH_PROGRAMME.md (see §11).
Proof state: PROOF_STATE_AND_OPEN_OBLIGATIONS.md.
Source register: RL64_SOURCE_REGISTER.md (consolidated; supersedes RL63_SOURCE_GAP_REGISTER.md, which is retired from authority and frozen in sessions/RL63/checkpoint/ and sessions/RL64/incoming/).
Ledger: FAILURE_AND_LESSON_LEDGER.md (FL-001..FL-065).
Root: HC7 only.

## RL64 outcome (two-edge-deficient frontier admission gate)

Admitted at Level A (statement-checked, version-pinned v1, proofs unread, unrefereed preprints):
- **F1**, arXiv:2609.17760v1 (Dvořák–Norin–Rahman): "Every K7= -minor-free graph is 6-colorable." Caveats: AI-assistance disclosure (§1.1); depends on the unrefereed Dvořák arXiv 2609.13818.
- **F2**, arXiv:2507.03244v1 (Norin–Totschnig): "Every graph with no K7∨ -minor is 6-colorable."

New certified universal item: **U8.** Every HC7 counterexample contains K7 minus any two edges as a minor. This is the first narrowing since RL54. U8 does not imply U7 (K4,4) and does not give K7^-.

Documented obstructions:
- **K7^-:** exactly F1 Conjecture 1.5 (5-connected, n>=6, e>=4n−2 ⇒ K7^- minor), via F1 Thm 1.6.
- **K7:** the density method is false. Two universal vertices over a 5-connected planar triangulation give 7-connected K7-minor-free graphs with 5n−15 edges.

Inputs: the frontier proofs consume Mader 7-connectivity (with conflicting citations), Dirac, Kriesell–Mohr, KT05 lemmas and Dvořák 2026. They do **not** use the Mader K7 extremal function or Gallai.

Classification summary:
- Correction/demotion: NONE.
- Theorem-classification changes: NONE.
- Source-status changes:
  - SRC-03 C→A; SRC-04 C→A; GAP-02 C→B;
  - new Level-B rows RL64-SRC-01..10.

## RL65 task

Assess C65 = F1 Conjecture 1.5:
- prove the bridge B65 (C65 + F1 Thm 1.6 ⇒ U9: every HC7 counterexample has a K7^- minor);
- run the falsification test on the named families;
- formulate and assess the K7^- analogue at the first F1 locus where the matching deficiency is spent (Thm 2.9 or Lemma 6.4/6.6).

Stop at the first missing dependency or falsifier.

**Precondition.** arxiv.org reachable (F1 v1 sha256-pinned), or the user supplies the files.

**Bounds.** At most 3 retrievals. Mathematical computation: 0. Census: 0. One candidate.

**Prohibited:**
- K7^=/K7^vee model upgrades (FL-055..062);
- density attempts for K7;
- degree-7 / M3 / Kempe / K4,4 local work;
- consuming F1/F2 lemmas above Level A statement level;
- a literature loop;
- committing F1 full text.

## Standing rules

- Frontier rule (FL-064, extended by FL-065): state the position relative to S1, S2, S4/U8, the K7^- target, and the K7 density-failure examples.
- All FL-001..FL-065 retry conditions remain in force.
- The RL70 periodic audit is still owed (after RL69).
- Do not silently assume 7-connectivity, delta<=9, or C65.

Programme ACTIVE.
