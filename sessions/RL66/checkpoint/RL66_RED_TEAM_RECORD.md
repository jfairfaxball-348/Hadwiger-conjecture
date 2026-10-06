# RL66 closeout red-team record

Status: RL66 record. CLOSED/FROZEN on promotion at RL66 closeout.

**Method.** One read-only Workflow (run wf_5cc3f33d-0c9) ran 8 independent adversarial referees, each instructed to REFUTE one block of claims. They made no file edits and had no network access. They read the RL66 scratch records, the RL66 brief, RL65_LOCUS_ASSESSMENT.md and RL65_B65_BRIDGE.md. Each returned a verdict of CONFIRMED / ERROR / GAP, with issues graded blocking / minor / wording.

**Result.**
- **7 referees: CONFIRMED.**
- **1 referee (V6): ERROR, confined to summary text.** V6 found the mathematics of families (i) and (iii) correct and stated that "no proof-state classification in the bodies of (i) or (iii) changes". The ERROR was against three over-compressed summary statements:
  - the (iii) table cell "sparse variants are below threshold";
  - "raises the surplus by 3 − |T|", which is false at |T| = 4;
  - the unqualified verdict "No falsifier".
- **0 blocking issues.**
- **No mathematical correction or demotion.** Every issue was applied as a scoping, precision or provenance edit before promotion (triage below).

| Referee | Claim block | Verdict | Issues (minor / wording) |
|---|---|---|---|
| V1-payoff-chain | Step 0 identity, r = 1 arithmetic, P66 via Lemma D, caveats | CONFIRMED | 4 / 3 |
| V2-fullpacking-and-S | Lemma F′, Cor F′.1, Lemma S, Cor S.1 | CONFIRMED | 0 / 4 |
| V3-contraction-LemmaP | contraction formula, Lemma P, Cor P.1 | CONFIRMED | 0 / 2 |
| V4-K4r | Lemma K4r | CONFIRMED | 0 / 3 |
| V5-E66-S66-B65prec | E66, S66, precision B65⁷ | CONFIRMED | 1 / 5 |
| V6-families-i-iii | families (i) and (iii) | ERROR (summary scope only) | 3 / 4 |
| V7-family-ii | family (ii) criterion and members | CONFIRMED | 1 / 3 |
| V8-family-iv-and-scope | family (iv); C66 scope, first missing dependency, attempt and orientation notes | CONFIRMED | 3 / 6 |

## Triage (all applied before promotion)

| Issue | Action |
|---|---|
| "No falsifier" verdicts read as exclusions; (iii) is a one-directional reduction; (ii) is not exhausted | Verdicts rewritten as "no falsifier found among the tested members", with the (ii) poor regime NOT ASSESSED and (iii) "R falsifier ⇒ core falsifier; cores not excluded". Propagated to the assessment, checkpoint summary, report, START_HERE, PROOF_STATE, programme §13, FL-067 and the lock state |
| Sparse variants not all below threshold; Lemma P lowers the surplus by 1 when \|T\| = 4 | Sparse-variant bullets corrected: Lemma P is a reduction only for \|T\| <= 3, and \|T\| = 4 is the residual configuration of Cor P.1, not excluded |
| P66 conflated a general statement with the r = 1 form | Split into P66a (C66 only) and P66b (C66 + H54⁻), each with its own proof. "= 1" corrected to ">= 1" in P66a |
| F1 provenance sentence inaccurate (RL65 read §5) | Rewritten: no F1 proof verified; §5 read at reading level only (the source of H54⁻); §4/§7 unread; Level-A uses in Caveat 5 named |
| H54⁻ provenance and separation-form conversion | H54⁻'s route via Cor 5.3 → Cor 4.2 → Thm 2.9 (AI-suggested Lemmas 4.5/4.9) stated. Fragment-form reading of Lemma D named, with a one-line separation-to-fragment conversion |
| "Irrelevant to U9" over-claimed | Rescoped everywhere to "not used by U9 via B65". Added: the (2.8⁻) route containing C66 would prove C65 in full; S66's point is that a standalone C66 must settle the degree-5 case without minimality |
| "open" for C65's degree-5 case | Changed to "not established (no statement in authority supplies it; literature status not assessed)" |
| [Dvo26] scope mis-described as "5-vertex targets only" | Replaced by the brief's wording: F1 restatements of [Dvo26] Thm 4 / Cor 13 / Cor 16 and the v1 abstract concern 5-vertex targets on the roots (or on <= 4 roots) or 7-vertex targets with two non-roots. None is a 6-vertex apex target |
| First missing dependency equivalent to C66 | Stated explicitly: no strictly weaker sub-lemma isolated. "Each with large ρ4" replaced by ρ4(R,C) >= ⌈(m+7)/τ(M)⌉ |
| Thm 2.9 attempt claims hold only for adjacencies guaranteed by W and R[X] | Qualified, with the unanalysed case noted |
| Thm 2.9-outcome extension: needs H54⁻ and a proper minor; adds nothing beyond H67 at r = 1; r = 2, 3 out of scope | Added, and recorded as a pointer only, needing an authorizing brief. Propagated to the report and PROOF_STATE |
| C65⁷ lacked an order condition; B65⁷ proof adaptation; S1 provenance | C65⁷ now has n >= 8; the step-5 adaptation is stated; F1 Thm 1.6's internal Level-B Mader dependency is noted |
| Definitions: full set (R[F] connected), ν_full, K4r convention, Cor S.1 hypotheses, Cor P.1 \|T\| <= 4, E66 reverse details, S66 step details, K4r parentheticals | All added |
| Family (ii) wording: lesson scope, members lead-in, poor-regime necessary conditions | Rewritten as suggested |
| Family (iv) wording: fang orientation of the explicit model; same root identification for glued K2,2,2,2 copies; "(proved)" markers | Added |
| Payoff chain wording: Step 1 restates G; symmetry S1 = R_AB; open list non-exhaustive; S66 cross-reference | Added |

**Outcome.** Mathematical correction/demotion: NONE. Classification changes caused by the red team: NONE. The C66 status (CANDIDATE / NOT ESTABLISHED; open; not falsified) is unchanged. All edits are scoping, precision or provenance edits.
