# RL67 checkpoint summary

Status: RL67 record. CLOSED/FROZEN on promotion at RL67 closeout. This is the kickoff checkpoint as presented to the user, with the checkpoint-verification and closeout red-team edits applied (RL67_VERIFICATION_RECORD.md, RL67_RED_TEAM_RECORD.md). The promoted records supersede it wherever they differ.

Session: RL67 HC7-K7MINUS-R1-MINIMALITY-TRANSFER-GATE. Root: HC7 only.
BASE_HEAD 00552dfa73d6312f357270334ef2db3a23061891 (RL66 closeout). Unchanged at start gate and checkpoint.

**Bounds used.**
- Retrievals: 1/1 (R1: F1 unversioned PDF, sha256 = pin, v1; extraction hash = expected).
- Mathematical computation in the record: 0. Census: 0. Candidates: 1 (H67, including its minimality-assisted form).
- Process note: some verification referees ran unrequested scripts. No claim depends on them (RL67_VERIFICATION_RECORD.md).

**F1 caveat.** F1 is an unrefereed preprint, and its §1.1 (F1.txt:154–182) discloses AI-obtained proofs. It is used only for the quoted definitions (4-bilight, fragment, minimality order) and for statements already in authority, all at Level A.

**Records:** RL67_RETRIEVAL_LOG.md, RL67_H67_ASSESSMENT.md, RL67_VERIFICATION_RECORD.md, FAILURE_AND_LESSON_LEDGER_APPENDIX.md (FL-068), INCOMING_SNAPSHOT.md, authoritative_sha256.txt.

## 1. R1 and the quoted definitions
- **4-bilight** (F1.txt:383–387). G has no dense (≤4)-bifragment. A bifragment is a pair (S,T) of disjoint non-empty vertex sets with no S–T edge; it is dense if ρ4(G,S) > 0 and ρ4(G,T) > 0.
- **Minimality** (F1.txt:1061–1065): lexicographic in (|V|, |E|). G' = S1 + z' has fewer vertices than G, so **P67's minimality-order proviso is discharged**.

## 2. H67 outcome: OPEN (CANDIDATE / NOT ESTABLISHED; not refuted)
- **Lemma R67** (PROVED). Let (S,T) be any dense (≤4)-bifragment of G' = S1 + z' with S1 4-light. Then:
  - z' lies on both boundaries;
  - S and T each contain at least 2 roots, with no root edges between them;
  - each has at most 3 boundary vertices inside S1.

  This **root-split two-dense-halves configuration** is exactly the obstruction to H67.
- **Proposition V67** (PROVED). Every H67 instance makes G a (2.8⁻)-counterexample (Step 0 gives |E| >= 4|V| − 2), and makes S1 a C66 counterexample (P66a + Lemma D). So (2.8⁻) ⇒ H67 and C66 ⇒ H67, both vacuously. H67 is refutable only together with (2.8⁻) and C66, so a refutation is not a realistic product of RL67's bounded gate; the realistic outcomes are proved or open.
- **Counterpattern G\*** (PROVED). A 15-vertex, 5-connected (hence 4-bilight) graph satisfying every H67 hypothesis except K7^- -freeness (it has a K7 minor), whose G*' is not 4-bilight. So **H67 without K7^- -freeness is false.**
  - Any argument that *excludes* the configuration, or shows G' or G^x 4-bilight, must use K7^- -freeness, or a minimality-derived hypothesis that G* violates. The recorded G'/G^x hypotheses do not suffice.
  - G* is weak: S1\* contains K8, and G* is not edge-minimal.
  - G* does not constrain a direct K7^- -forcing argument, since it contains K7 itself.
- **Minimality-assisted variant: OPEN** (probe only).
  - Proved implication: in a minimal (2.8⁻)-counterexample with an r = 1 5-separation whose lighter side has a full component (guaranteed under H54⁻, NOT PROMOTED), G^x is not 4-bilight for every root x with deg_X(x) <= 3. Here G^x is S2's full component contracted into the root x.
  - G* satisfies these hypotheses for every eligible x and still contains the configuration.
- **First missing dependency.** A K7^- -forcing (or reduction) lemma for the root-split two-dense-halves configuration in the heavy side of a minimal (2.8⁻)-counterexample. It is equivalent to the minimality-assisted H67, and no strictly weaker sub-lemma is isolated. The configuration only occurs when S1 is a C66 counterexample.
- **P67:** CONDITIONAL on H67 (open), H54⁻ (NOT PROMOTED), the F1 definitions (Level A) and the adopted (2.8⁻) minimality convention. The minimality-order proviso is discharged. The r = 1 sub-case stays open.
- **Verification.** 4 read-only referees (workflow wf_077f1c6f-f18) reported 2 CONFIRMED and 2 GAP. One issue was blocking: the barrier was mis-scoped, and it is now scoped as above. All issues are applied (RL67_VERIFICATION_RECORD.md).

## 3. Frontier (FL-064/065/066/067 rule)
| Item | Position |
|---|---|
| U1–U8 | certified; unchanged |
| U9 | CONDITIONAL via B65 on C65⁷ and F1 Thm 1.6 (Level A); not certified |
| S1 (7-connectivity) | Level B; not used |
| S2 (delta in {7,8,9}) | Level C; not used |
| S4 / U8 | certified start point; nothing re-derived below it |
| K7^- target (C65) | CONJECTURE. F1 interface blocked at T2.9⁻ (FL-066). C66 open at C65-degree-5 strength (FL-067). H67 open; its obstruction is the root-split two-dense-halves configuration, and excluding it needs K7^- -freeness, or a minimality-derived hypothesis that G* violates |
| K7 density-failure examples | not used; no density attempt for K7 |

## 4. Corrections and sources
- **Correction C67-1** (explicit; a correction of a scope remark, not a theorem demotion). The RL67 brief's falsification condition said a violating pair "refutes neither P66a/P66b, C66, (2.8⁻) nor C65".
  - By V67, any H67 instance refutes (2.8⁻) and C66, and refutes C65 if G is 5-connected.
  - P66a/P66b stay valid. The procedural redirect would be moot in that event and was never triggered.
- Theorem demotions: **NONE**. Theorem-classification changes: **NONE**.
- Source-status changes: **NONE**. Register note: R1 re-pinned F1. The unversioned URL is byte-identical to the admitted v1 as of 2026-10-06T13:52Z, and the extraction hash is unchanged.

## 5. Drift rule triggered
H67 was assessed and stays open. So **neither the RL68 nor the RL69 recommendation may extend the F1-interface lemma chain** before the RL70 audit prices it. That excludes the minimality-assisted variant, C66, T2.9⁻ at ρ4 >= 2, H54⁻ promotion and the downstream loci.

## 6. RL68 recommendation (exactly one)
**Selected: RL68 HC7-K7MINUS-SEVEN-CONNECTED-DENSITY-GATE.**
- **Candidate C68 = C65⁷.** Every 7-connected graph with n >= 8 vertices and at least 4n − 2 edges contains K7^- as a minor.
- **Why:**
  - it is exactly the input U9 needs through B65 (RL66 precision B65⁷);
  - it lies outside the F1-interface chain, so it complies with the drift rule;
  - 7-connectivity (δ >= 7, rich linkages) is not preserved by the minors used in the 4-bilight induction (heuristic);
  - it sidesteps the root-split configuration of RL67 entirely;
  - each outcome is informative for the RL70 audit: a falsifier would block the B65⁷ route (U9 stays open); a proof would leave U9 resting only on F1 Thm 1.6 at Level A, with promotion to be decided explicitly at RL68 verification; an open result would give an exact first missing dependency.
- **Suggested bounds:** retrievals 0; computation 0; census 0; one candidate.
- **Shape:** first a falsification test on named 7-connected dense families (2-apex triangulations, K_{2,2,2,2,2}, 4th powers of long cycles, and others), then proved / falsifier / open.

**Runner-up: the S1 / Mader 7-connectivity Level-A source gate (O2).** It loses because it still has no consumer: U9 uses 7-connectivity only inside F1 Thm 1.6's conclusion. It also carries FL-063 access risk and the 174/175 attribution discrepancy.

**Not selected:**
- the H67 minimality variant, C66, T2.9⁻ at ρ4 >= 2, H54⁻ promotion and the downstream loci: all barred by the drift rule;
- a K7^- → K7 mechanism (O3): unscoped, with FL-055..062 barriers;
- an early audit: not permitted, since RL70 is fixed.

**Standing.** The RL70 periodic audit is still owed (after RL69). FL-001..FL-067 stay in force. FL-068 is drafted for closeout (it records the H67 barrier and the drift trigger).

## 7. Session recommendation
The gate reached stopping rule 3 (open, with an exact first missing dependency). The only retrieval is spent. Further work on H67 would be a K7^- -forcing or exclusion campaign in the two-dense-halves configuration. G* shows that the exclusion route needs K7^- -freeness or minimality, and the drift rule now bars extending the chain in RL68 and RL69.

it makes sense to finish up here
