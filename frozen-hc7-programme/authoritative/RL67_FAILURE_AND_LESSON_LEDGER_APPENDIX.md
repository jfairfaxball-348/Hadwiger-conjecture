# RL67 failure and lesson ledger appendix

Status: RL67 record. CLOSED/FROZEN on promotion at RL67 closeout. This is the exact FL-068 text appended to authoritative/FAILURE_AND_LESSON_LEDGER.md; FL-001..FL-067 are unchanged.

# FL-068 — the r = 1 minimality transfer H67 is obstructed exactly by root-split two-dense-halves configurations (OPEN); excluding them needs K7^- -freeness or a minimality-derived hypothesis the relaxed counterpattern violates, and the drift rule is triggered

Date: 2026-10-06.
Origin: RL67 HC7-K7MINUS-R1-MINIMALITY-TRANSFER-GATE.
Classification: candidate gate with OPEN outcome. Recorded:
- a structure lemma;
- a vacuity proposition;
- a (weak) counterpattern to the relaxed form.

FL-068's main finding is not a mathematical error, theorem demotion, refutation of H67, (2.8⁻) or C65, certified HC7 counterexample or finite certificate. It also carries correction C67-1, an incorrect scope remark in the RL67 brief; see Correction / changes.

Source caveat: F1 = arXiv:2609.17760v1 is an unrefereed preprint whose §1.1 (F1.txt:154–182) discloses AI-obtained proofs. It is used here only for definitions, at Level A.

## Expectation tested
That the minor G' = S1 + z' of the r = 1 configuration is 4-bilight (H67), so that minimality closes the r = 1 sub-case without C66.

## Actual observation
- R1 retrieved F1 v1 (sha256 = pin).
  - 4-bilight means no dense (≤4)-bifragment (F1.txt:383–387).
  - Minimality is lexicographic in (|V|, |E|) (F1.txt:1061–1065), so G' precedes G.
- **Lemma R67** (PROVED). Every dense (≤4)-bifragment (S,T) of G' has z' on both boundaries and at least 2 roots on each side, with at most 3 boundary vertices of each inside S1.
- **Proposition V67** (PROVED). H67's hypotheses make G a (2.8⁻)-counterexample and S1 a C66 counterexample (P66a's argument + Lemma D). So (2.8⁻) ⇒ H67 and C66 ⇒ H67, both vacuously, and any H67 instance would refute (2.8⁻) and C66.
- **Counterpattern G\*** (PROVED). A 15-vertex 5-connected graph satisfying every H67 hypothesis except K7^- -freeness, whose G*' is not 4-bilight.
  - G* also satisfies the recorded G'/G^x minimality-derived hypotheses, for every root.
  - G* is weak: S1\* contains K8, so ω <= 7 already excludes it, and it is not edge-minimal.
  - It does not constrain a direct K7^- -forcing argument.
- **Minimality-assisted form Var:** OPEN. It is equivalent to closing r = 1 under H54⁻. The G^x-assisted exclusion H67^G is NOT ASSESSED beyond G*.

## First missing dependency
A K7^- -forcing (or reduction) lemma for the root-split two-dense-halves configuration in the heavy side of a minimal (2.8⁻)-counterexample satisfying H54⁻ (RL67_H67_ASSESSMENT.md §6).
- It is equivalent to Var, hence to closing the r = 1 sub-case under H54⁻. No reduction of the sub-case is claimed.
- Any exclusion route must use K7^- -freeness, or a minimality-derived hypothesis that G* violates. The recorded G'/G^x hypotheses do not suffice.

## Surviving valid scope
- U1–U8 unchanged. U9 CONDITIONAL (C65⁷ + F1 Thm 1.6 at Level A).
- C65 CONJECTURE. C66 OPEN. H67 OPEN, not refuted.
- P67: CONDITIONAL on H67 and H54⁻, with its minimality-order proviso discharged.
- Lemma R67, V67, G* and the G^x minimality-derived implication: PROVED ANALYTIC.
- FL-001..FL-067 and their retry conditions unchanged.

## Downstream effect
- The r = 1 sub-case of the Lemma 5.7 analogue stays open by both routes (C66, H67).
- **Drift rule triggered.** Neither the RL68 nor the RL69 recommendation may extend the F1-interface lemma chain before the RL70 audit prices it.
- R21-K7^- continues only through routes outside that chain until then (RL68: C65⁷).
- No HC7-universal obligation is reduced.

## Correction / changes
- **Correction C67-1** (an incorrect scope remark in current authority, not a theorem).
  - *Original.* The RL67 brief (authored at the RL66 closeout), in its Falsification condition, says: "Such a pair refutes the standalone H67 only. It refutes neither P66a/P66b, C66, (2.8⁻) nor C65."
  - *Evidence.* V67: any H67 instance refutes (2.8⁻) and C66, and refutes C65 if G is 5-connected. P66a/P66b stay valid.
  - *Downstream effect.* None. No deduction consumed the remark, and its procedural redirect to the variant (which would have been moot) was never triggered.
  - *Lesson.* A falsification condition must list every statement that a violating instance refutes, including statements whose counterexample conditions appear among the candidate's own hypotheses.
  - The frozen brief is not rewritten.
- Theorem demotions: NONE. Inherited theorem-classification changes: NONE.
- Source-status changes: NONE. Register note: F1 re-pinned at RL67 R1, byte-identical v1.
- Process note: referee-side scripts were run during verification. They were unrequested under a 0-computation brief, and no claim depends on them. Future referees under a 0-computation brief should run no scripts.

## Lesson
Every lemma whose hypotheses already make G a counterexample to the target statement (here also to C66) is vacuous if the target holds, and cannot be refuted explicitly without refuting the target.

Test such a lemma with the target's forbidden-minor hypothesis removed, as G* does. If it fails there, the forbidden-minor hypothesis (or some further hypothesis the relaxed counterpattern violates) is load-bearing, and a proof must use it. It can do so by forcing the minor from the configuration, or through a minimality-derived hypothesis that excludes the counterpattern.

Also record how cheaply the counterpattern is excluded. G* already contains K8 and is not edge-minimal, so it constrains only arguments that use no consequence of K7^- -freeness or minimality at all. Prefer edge-tight or K7-subgraph-free relaxations when testing a retry.

## Retry condition
- Do not retry H67, Var or any r = 1 minimality transfer without naming how K7^- -freeness, or a minimality-derived hypothesis that excludes the root-split configuration itself (not merely G*), is used.
- Do not extend the F1-interface chain in RL68 or RL69 (drift rule). The RL70 audit prices it.

## Selected successor
RL68 HC7-K7MINUS-SEVEN-CONNECTED-DENSITY-GATE (C68 = C65⁷).

Programme ACTIVE.
