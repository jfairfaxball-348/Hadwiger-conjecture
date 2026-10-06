# RL68 authoritative state — HC7 K7^- seven-connected density gate

Status: READY / NOT STARTED.
Predecessor: RL67 CLOSED/FROZEN under sessions/RL67/.
Sole current brief: RL68_HC7_K7MINUS_SEVEN_CONNECTED_DENSITY_GATE_BRIEF.md.
Durable programme: HC7_RESEARCH_PROGRAMME.md (see §14).
Proof state: PROOF_STATE_AND_OPEN_OBLIGATIONS.md.
Source register: RL64_SOURCE_REGISTER.md (consolidated), plus the register notes in RL65_REPORT.md §7 and RL67_REPORT.md §6.
Ledger: FAILURE_AND_LESSON_LEDGER.md (FL-001..FL-068).
Root: HC7 only.

## RL67 outcome (r = 1 minimality-transfer gate, H67)

Records: RL67_REPORT.md, RL67_H67_ASSESSMENT.md.

- **R1.** F1 v1 re-pinned: sha256 equals the pin, and the extraction hash is unchanged. F1 = arXiv:2609.17760v1 is an unrefereed preprint whose §1.1 (F1.txt:154–182) discloses AI-obtained proofs; it is used at Level A only. F1's 4-bilight definition (F1.txt:383–387) and its minimality convention (lexicographic in |V|, |E|; F1.txt:1061–1065) are now quoted in authority.
- **H67 is OPEN** (CANDIDATE / NOT ESTABLISHED; not refuted).
  - **Lemma R67.** The only obstruction is a *root-split two-dense-halves* configuration in the heavy side S1: two disjoint non-adjacent sets, each with at least 2 roots, at most 3 boundary vertices inside S1, and positive density in S1 + z'.
  - **V67.** Every H67 instance makes G a (2.8⁻)-counterexample and S1 a C66 counterexample. So H67 is refutable only together with (2.8⁻) and C66.
  - **G\*.** A 15-vertex 5-connected graph satisfying every H67 hypothesis except K7^- -freeness, whose S1 + z' is not 4-bilight.
    - So excluding the configuration needs K7^- -freeness, or a minimality-derived hypothesis that G* violates; the recorded G'/G^x hypotheses do not suffice.
    - G* is weak: S1\* contains K8, so ω <= 7 excludes it, and it is not edge-minimal.
    - It does not constrain a direct K7^- -forcing argument.
  - **H67 statement.** H67 is stated with the same root edges on both sides (RL67_H67_ASSESSMENT.md §3 has the exact statement).
  - **Minimality-assisted form Var:** OPEN. It is equivalent to closing the r = 1 sub-case under H54⁻. The G^x-assisted exclusion H67^G is NOT ASSESSED beyond G*.
  - **First missing dependency:** a K7^- -forcing or reduction lemma for that configuration, which is equivalent to Var. No reduction of the r = 1 sub-case is claimed.
- **Correction C67-1** (scope remark; not a theorem demotion). The RL67 brief's falsification condition wrongly said a violating pair refutes neither C66 nor (2.8⁻). Any H67 instance refutes both, and refutes C65 if G is 5-connected.
- **Drift rule triggered.** Neither RL68 nor RL69 may extend the F1-interface lemma chain before the RL70 audit prices it.

Bounds used: retrievals 1/1; computation in the record 0; census 0. Process note: unrequested referee-side scripts were run during verification; no claim depends on them (RL67_REPORT.md §3).

Classification summary:
- Correction: C67-1 (scope remark). Theorem demotions: NONE.
- Theorem-classification changes: NONE.
- Source-status changes: NONE (F1 re-pinned).

## RL68 task

Assess C68 = C65⁷: every 7-connected graph with n >= 8 and at least 4n − 2 edges contains K7^- as a minor.
- First run the falsification test on the brief's 7-connected families.
- Then: proved / explicit falsifier / open with the exact first missing dependency.
- Chain: C68 + F1 Thm 1.6 (Level A) ⇒ U9 (precision B65⁷, RL66).

**Precondition.** None. No external retrieval is permitted.

**Bounds.** Retrievals 0. Mathematical computation: 0. Census: 0. One candidate.

**Prohibited:**
- any extension of the F1-interface lemma chain: (2.8⁻) lemmas, H67 or its variant, C66, T2.9⁻, H54⁻, downstream loci (drift rule, FL-068);
- K7^=/K7^vee/vampire model upgrades (FL-055..062);
- density attempts for K7;
- degree-7 / M3 / Kempe / K4,4 local work;
- consuming F1/F2 above Level A statement, or [Dvo26] and the F1/F2-cited classical inputs above Level B;
- consuming Mader's K6/K7 extremal functions at all (Level C, RL63-SRC-02);
- any adaptation of F1's Thm 2.8 architecture (bilight-type induction, F1 §2–§6 machinery, [Dvo26] rooted targets);
- a literature loop;
- committing F1 full text.

## Standing rules

- Frontier rule (FL-064, extended by FL-065..FL-068): state the position relative to S1, S2, S4/U8, the K7^- target, and the K7 density-failure examples.
- All FL-001..FL-068 retry conditions remain in force.
- The drift rule binds RL68 and RL69.
- The RL70 periodic audit follows RL69. It must price the F1-interface chain.
- Do not silently assume 7-connectivity of HC7 counterexamples (S1), delta <= 9, C65, C66, H67, H54⁻ or C68.
- The repository-root START_HERE.md and README.md are stale (they name RL52) and non-authoritative (PK-7). This file governs.
- Packaging note: the header lines of FAILURE_AND_LESSON_LEDGER.md still read "CURRENT after RL63" and describe parts only up to FL-064. The file is append-only (an exact byte prefix is preserved at each closeout), so the header is not edited. The ledger in fact runs FL-001..FL-068, as stated here.

Programme ACTIVE.
