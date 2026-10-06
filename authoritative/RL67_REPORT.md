# RL67 report — HC7 K7^- r = 1 minimality-transfer gate (H67)

Status: RL67 record. CLOSED/FROZEN on promotion at RL67 closeout.

Session: RL67 HC7-K7MINUS-R1-MINIMALITY-TRANSFER-GATE. Root: HC7 only.
BASE_HEAD: 00552dfa73d6312f357270334ef2db3a23061891 (RL66 closeout). Unchanged at the start gate, checkpoint and CLOSEOUT_LOCK.

**Start gate.**
- Kicked off in the same conversation that promoted RL66, at the user's instruction to carry on with the next session.
- The gate was run fresh from the repository: live main = BASE_HEAD; sessions/RL67 absent; RL67 the unique incoming session; ledger FL-001..FL-067 complete.

**Bounds used.**
- Retrievals: 1/1. R1 was the unversioned F1 PDF: sha256 = pin, v1; pdftotext 24.02.0 extraction hash = expected.
- Mathematical computation in the record: 0. Census: 0. Candidates: 1 (H67, including its minimality-assisted form).
- Process deviation: some verification referees ran unrequested scripts (exhaustive and random checks of Lemma R67 and of G*). No claim depends on them, and they are not part of the record. Future referees under a 0-computation brief should run no scripts.

**Reliance caveats (F1).** F1 = arXiv:2609.17760v1 is an unrefereed preprint; its §1.1 (F1.txt:154–182) discloses AI-obtained proofs. RL67 uses F1 only for:
- the quoted definitions (fragment and boundary, F1.txt:335–338; bifragment and 4-bilight, F1.txt:383–387; minimality convention, F1.txt:1061–1065);
- the statements already in authority (Thm 1.6; F1.txt:392–393).

All uses are at Level A, and no F1 proof is consumed.

## 1. Retrieval and definitions (RL67_H67_ASSESSMENT.md §1)
- F1's 4-bilight definition and its minimality convention are quoted. A (2.8⁻)-counterexample is taken to be minimal in F1's lexicographic order (|V|, |E|).
- S1 + z' precedes G in that order, since n(S2) >= 2. So **P67's minimality-order proviso is discharged.**

## 2. H67 assessment (RL67_H67_ASSESSMENT.md §2–§6)
- **Lemma R67** (PROVED ANALYTIC). Every dense (≤4)-bifragment (S,T) of S1 + z' (S1 4-light) has:
  - z' on both boundaries;
  - at least 2 roots on each side, and no root edges between the sides;
  - at most 3 boundary vertices of each side inside S1.
- **Proposition V67** (PROVED ANALYTIC). Every H67 instance makes G a (2.8⁻)-counterexample (via the Step 0 identity) and S1 a C66 counterexample (via the argument of P66a's proof + Lemma D). H67 is stated with the same root edges on both sides; see RL67_H67_ASSESSMENT.md §3 for the exact statement. Hence (2.8⁻) ⇒ H67 and C66 ⇒ H67, both vacuously. H67 is refutable only together with (2.8⁻) and C66.
- **Counterpattern G\*** (PROVED ANALYTIC). A 15-vertex, 5-connected (hence 4-bilight) graph satisfying every H67 hypothesis except K7^- -freeness (it has a K7 minor), whose S1\* + z' is not 4-bilight. So H67 without K7^- -freeness is false.
  - Scope: any argument that *excludes* the configuration, or shows S1 + z' (or G^x) 4-bilight, must use K7^- -freeness, or a minimality-derived hypothesis that G* violates. The recorded G'/G^x hypotheses do not suffice.
  - G* is weak. S1\* contains K8, so ω <= 7 excludes it, and it is not edge-minimal.
  - G* does not constrain a direct K7^- -forcing argument.
- **Minimality-assisted form Var: OPEN.** Var is equivalent to closing the r = 1 sub-case under H54⁻.
  - Proved implication: in a minimal (2.8⁻)-counterexample with an r = 1 5-separation whose lighter side has a full component (guaranteed under H54⁻), G^x is not 4-bilight for every root x with deg_X(x) <= ρ4(S1) − m − 4, in particular deg_X(x) <= 3. Here G^x is S2's full component contracted into the root x.
  - G* satisfies it for every root. So the G^x-assisted exclusion H67^G is NOT ASSESSED beyond G*.
- **Outcome. H67: CANDIDATE / NOT ESTABLISHED — OPEN, not refuted.**
- **First missing dependency.** A K7^- -forcing or reduction lemma for the root-split two-dense-halves configuration in the heavy side of a minimal (2.8⁻)-counterexample. It is equivalent to Var, hence to closing the r = 1 sub-case under H54⁻, so no reduction is claimed and no strictly weaker sub-lemma is isolated. The configuration occurs only when S1 is a C66 counterexample. (C1), (C3) and the first clause of (C2) of the RL66 core then hold for S1, but not Cor P.1.
- **P67.** A PROVED ANALYTIC implication, CONDITIONAL on H67 (open) and H54⁻ (NOT PROMOTED), with the F1 definitions at Level A.
  - Scope convention: F1's lexicographic minimality, transported to (2.8⁻).
  - The minimality-order proviso is discharged.
  - The r = 1 sub-case stays open by both routes (C66, H67).

## 3. Verification
- **Checkpoint verification** (Workflow wf_077f1c6f-f18, 4 referees): 2 CONFIRMED, 2 GAP. Its one blocking issue was a mis-scoped barrier, which was fixed. It also prompted correction C67-1 (sessions/RL67/checkpoint/RL67_VERIFICATION_RECORD.md).
- **Closeout red team** (Workflow wf_2b4e8a81-7bd, 5 referees, on the revised records and the RL68 brief): 3 CONFIRMED, 2 GAP, and **0 errors in the mathematics**. There were 2 blocking issues, 17 minor and 24 wording.
  - Blocking issue 1: the FL-068 lesson still demanded a forcing argument, and G*'s weakness was unrecorded (S1\* contains K8 and is not edge-minimal).
  - Blocking issue 2: the RL68 brief listed Mader's extremal functions as Level B. They are Level C (RL63-SRC-02).
  - Both are fixed, and every other issue is applied (sessions/RL67/checkpoint/RL67_RED_TEAM_RECORD.md). No classification changed.

## 4. Frontier (FL-064..FL-068 positions)

| Item | Position after RL67 |
|---|---|
| U1–U8 | certified; unchanged |
| U9 | CONDITIONAL via B65⁷ on C65⁷ and F1 Thm 1.6 (Level A); not certified |
| S1 (7-connectivity) | Level B; not used |
| S2 (delta in {7,8,9}) | Level C; not used |
| S4 / U8 | certified start point; nothing re-derived below it |
| K7^- target (C65) | CONJECTURE. The F1-interface chain is held: T2.9⁻ blocked (FL-066), C66 open (FL-067), H67 open (FL-068). RL68 assesses C65⁷ directly |
| K7 density-failure examples | not used; no density attempt for K7 |

## 5. Corrections / demotions
- **Correction C67-1** (scope remark in current authority; not a theorem demotion). The RL67 brief's falsification condition said a violating pair for H67 "refutes the standalone H67 only. It refutes neither P66a/P66b, C66, (2.8⁻) nor C65."
  - By V67, any H67 instance refutes (2.8⁻) and C66, and refutes C65 if G is 5-connected.
  - P66a/P66b stay valid.
  - The brief's procedural redirect to the variant would be moot in that event, since a violating pair voids P67. The redirect was never triggered, and no deduction consumed the remark.
  - The frozen RL67 brief (sessions/RL67/incoming/) is not rewritten; this record and FL-068 carry the correction.
- Theorem demotions: NONE. Inherited theorem-classification changes: NONE.

## 6. Source status
- **Promoted source-status changes: NONE.**
- Register note (RL63-SRC-03, F1):
  - re-pinned at RL67 R1 (2026-10-06T13:52Z) from the unversioned URL; byte-identical to the admitted v1 (sha256 6af798e5…c907); still no newer version;
  - extraction sha256 76b7917b…e89d unchanged (pdftotext 24.02.0);
  - definitions now quoted in authority: F1.txt:335–338, 383–387, 1061–1065.

## 7. Route-portfolio effect

| Route | Change |
|---|---|
| R21-K7^- | Stays ACTIVE. It now proceeds directly through C65⁷ (RL68). The F1-interface lemma chain is HELD under the drift rule until the RL70 audit |
| R21-K7 | Unchanged: SUSPENDED |
| R04 (S1) | Unchanged; no consumer |
| others | Unchanged |

## 8. RL68 recommendation (exactly one)

**Selected: RL68 HC7-K7MINUS-SEVEN-CONNECTED-DENSITY-GATE.** Candidate C68 = C65⁷: every 7-connected graph with n >= 8 vertices and at least 4n − 2 edges contains K7^- as a minor. Why:
- it is exactly the density input the B65⁷ route to U9 needs (sufficient; necessity not claimed);
- it lies outside the F1-interface chain, as the drift rule requires;
- it uses 7-connectivity, which is not preserved by the minors used in the 4-bilight induction (heuristic);
- it sidesteps the root-split configuration;
- each outcome is informative for the RL70 audit. A proof would leave U9 resting on F1 Thm 1.6 at Level A, with promotion to be decided explicitly at RL68 verification. A falsifier would block the B65⁷ route (U9 stays open).

Bounds: retrievals 0; computation 0; census 0; one candidate.

**Runner-up: the S1 / Mader 7-connectivity Level-A source gate (O2).** It loses because it has no consumer (U9 uses 7-connectivity only inside F1 Thm 1.6's conclusion), and it carries FL-063 access risk and the 174/175 attribution discrepancy.

**Not selected:**
- the H67 variant, C66, T2.9⁻ at ρ4 >= 2, H54⁻ promotion and the downstream loci: all barred by the drift rule;
- a K7^- → K7 mechanism (O3): unscoped, with FL-055..062 barriers;
- an early audit: not permitted, since RL70 is fixed.

**Standing.** The RL70 periodic audit follows RL69 and must price the F1-interface chain. The ledger FL-001..FL-067 is carried forward untouched, with FL-068 appended (§9).

## 9. FL-068

FL-068 is appended to authoritative/FAILURE_AND_LESSON_LEDGER.md and recorded in RL67_FAILURE_AND_LESSON_LEDGER_APPENDIX.md.

Programme ACTIVE.
