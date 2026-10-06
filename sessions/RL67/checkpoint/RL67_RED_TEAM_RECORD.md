# RL67 closeout red-team record

Status: RL67 record. CLOSED/FROZEN on promotion at RL67 closeout.

**Method.** One read-only Workflow (run wf_2b4e8a81-7bd) ran 5 independent adversarial referees, each instructed to REFUTE one block. They reviewed the *revised* RL67 records (after the checkpoint verification, RL67_VERIFICATION_RECORD.md) and the proposed RL68 brief. They made no edits and used no network.

**Process deviation.** At least one red-team referee ran unrequested scripts: a random brute-force check of Lemma R67 on 523 small 4-light S1, and a script comparison of the quotations with the scratch extraction. No claim depends on them, and they are not part of the record.

**Result.**
- X1, X2, X3: **CONFIRMED**.
- X4, X5: **GAP**.
- **0 errors in the mathematics.**
- **2 blocking issues** (scope and source classification), 17 minor, 24 wording.
- All were applied before promotion. No theorem classification changed.

| Referee | Claim block | Verdict | Issues (blocking / minor / wording) |
|---|---|---|---|
| X1-quotes-LemmaR67 | quotations, (2.8⁻) convention, minimality order, Lemma R67 | CONFIRMED | 0 / 0 / 5 |
| X2-V67-and-C67-1 | Proposition V67, correction C67-1 | CONFIRMED | 0 / 2 / 5 |
| X3-Gstar-and-probe | G*, the G^x probe | CONFIRMED | 0 / 3 / 4 |
| X4-scope-and-outcome | scope, outcome, dependency, summary/FL-068 consistency | GAP | 1 / 7 / 6 |
| X5-RL68-brief | RL68 brief soundness and portability | GAP | 1 / 5 / 4 |

## Triage (all applied)

| Issue | Action |
|---|---|
| **Blocking (X4).** The FL-068 lesson still required "a genuine forcing argument", contradicting the scoped barrier. G*'s weakness was also unrecorded: S ∪ ∂_1S and T ∪ ∂_1T each induce K8 in S1\* | The lesson was rewritten: a proof must use the forbidden-minor hypothesis (by forcing, or through a minimality-derived hypothesis that excludes the counterpattern). G*'s weakness is now recorded everywhere: it contains K8, so ω <= 7 excludes it, and it is not edge-minimal. Retries should test against edge-tight or K7-subgraph-free relaxations |
| **Blocking (X5).** The RL68 brief treated Mader's extremal functions as Level B | Corrected: Mader's K6/K7 functions are Level C (RL63-SRC-02) and not cited by F1/F2, so they may not be consumed. RL64_SOURCE_REGISTER and RL64_CLASSICAL_INPUT_TABLE were added to the required reading. A general clause now bars any adaptation of F1's Thm 2.8 architecture |
| G* is not edge-minimal; the probe only covers G'/G^x; x5 qualifies under the sharp criterion; presuppositions (H54⁻, r = 1, full component) were dropped in summaries | Probe scope stated. Sharp criterion deg_X(x) <= ρ4(S1) − m − 4 added, with G*^{x5} = S1\* shown not 4-bilight. Presuppositions restored everywhere |
| C67-1 said the redirect was "unaffected"; (iii) said refutation is "outside scope"; (i) wording; "Equivalently P66a" | The redirect is "moot" (it would void P67) and was never triggered. (iii) now reads "not a realistic product of a bounded gate". (i) and the P66a attribution were corrected |
| FL-068 classification line vs C67-1; C67-1 under-documented; AI disclosure missing in FL-068 | FL-068 now records C67-1 in full (original sentence, type, evidence, downstream effect, lesson). It says "main finding not an error", and the F1 caveat is added |
| "Minimality-assisted variant" used for two statements; the dependency equals the r = 1 closure | Var (OPEN; equivalent to closing r = 1 under H54⁻) is separated from H67^G (NOT ASSESSED beyond G*). "No reduction of the r = 1 sub-case is claimed" is stated |
| "Must use K7^- -freeness or minimality" imprecise | Now "K7^- -freeness, or a minimality-derived hypothesis that G* violates; the recorded G'/G^x hypotheses do not suffice" |
| The RL66 core applied to S1 wholesale | Narrowed to (C1), (C3) and the first clause of (C2). Cor P.1 is not claimed for S1 |
| "certify U9" in the summary; "U9 would still not be certified" in the brief | Both replaced: if C68 is proved, U9 rests on F1 Thm 1.6 at Level A (the U8 standard), and promotion is to be decided explicitly at RL68 verification |
| "computation 0" without disclosing referee-side scripts | Recorded as a process deviation (no claim depends on them). Future referees under a 0-computation brief should run no scripts |
| RL68 brief: falsification condition incomplete (also refutes (2.8⁻)); F-e n >= 14; (e) mislabelled as threshold witnesses; "strictly above U8"; P1–P5; literature status | All fixed |
| Wording: quotation start "For a graph H"; (2.8⁻) convention notation; \|V(G')\| >= 7; WLOG citation; fragment-form note; (≤4) qualifier; automorphism transitivity; K7 model description; H67 restatements to include "same root edges"; heuristic labels in the RL68 rationale; Records list | All applied |

**Outcome.** Theorem demotions: NONE. The only correction is C67-1 (scope remark), already recorded. H67 remains CANDIDATE / NOT ESTABLISHED (open). All edits are scoping, precision, provenance or source-classification edits.
