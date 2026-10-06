# RL65 closeout red-team record

Status: RL65 record. CLOSED/FROZEN on promotion at RL65 closeout.

Method: one read-only Workflow (run wf_8feab086-c47) with 8 independent adversarial referees. Each was instructed to try to REFUTE one claim, with no network access and no file edits. They read the RL65 scratch records and the F1.txt extraction at the cited lines. Each returned verdict CONFIRMED / ERROR / GAP, with issues graded blocking / minor / wording.

**Result: 8/8 CONFIRMED. 0 blocking issues.** No mathematical correction or demotion was needed. Every minor and wording issue was addressed by a scoping or precision edit before promotion (triage below).

| Referee | Claim | Verdict | Issues (minor / wording) |
|---|---|---|---|
| V1a-B65-logic | B65 logic and hypotheses | CONFIRMED | 1 / 2 |
| V1b-B65-conventions | B65 conventions (proper minor, k-connectivity) | CONFIRMED | 1 / 2 |
| V2-families-a-to-d | falsification families F-a to F-d | CONFIRMED | 1 / 1 |
| V3-family-e | falsification family F-e (K7^- present, K7-free) | CONFIRMED | 0 / 3 |
| V4-locus | first-locus identification | CONFIRMED | 2 / 2 |
| V5a-G0-definitions | G0 against F1 definitions | CONFIRMED | 0 / 2 |
| V5b-T29minus-exactness | T2.9⁻ exactness (strawman check) | CONFIRMED | 1 / 2 |
| V6-LemmaD-H65-scope | Lemma D, H65 threshold, scope | CONFIRMED | 3 / 3 |

## Triage (all applied before promotion)

| Issue | Action |
|---|---|
| U9 ⇒ U8 scope: U8 is stated for all chi>=7 graphs | B65 record: B65's chi>=7 conclusion gives U8 at full scope; U9 gives the counterexample-scoped U8 |
| k-connectivity gloss over-read F1.txt:225–226; step-4 order | Gloss marked as interpretation; step 4 reordered so that n>=8 comes first and independently of any convention |
| Multigraph reading of "proper minor" | Remark added (the underlying simple graph is a simple proper minor; chromatic number unchanged) |
| [Dvo26]/Thm 1.6 dependency lists imprecise | Thm 2.9 marked as F1's strengthening of [Dvo26, Cor 16]; other mentions listed; Menger and Lemmas 7.2/7.6/7.7 added |
| Existence of large 5-connected triangulations not cited | Added as (P5), orientation only, used only by the "Role" lines. Per-family claims unaffected |
| F2.txt not re-read; F-e connectivity terse; link cycle may have chords | Citation provenance stated; y-step expanded; "cycle subgraph (possibly with chords)" |
| Lemma 5.9 dependency list incomplete; hereditary uses of K7^= -freeness not listed; Lemma 6.1 also downstream; Cor 6.7 non-deficient sub-cases | Added in RL65_LOCUS_ASSESSMENT §1. The first-locus conclusion is unchanged |
| "quite heavy" quotation dropped a parenthetical | Quotation completed |
| G0 4-lightness via separations not spelled out | One-paragraph separation argument added |
| "Exact analogue" holds only under the 7-vertex outcome convention | Scoped. G0 also fails the weaker "K5 ∪ lighter side ⊇ K7^-" requirement (K5 ∪ G0 ≅ K7^=, 19 edges) |
| Interface barrier must not exclude lemmas with extra minimality hypotheses; refutation is near-tautological | Both stated explicitly in the Scope section, the report and FL-066 |
| "Surplus must be spent on the heavy side" overstated | Scoped to the r = 1 sub-case and to the standalone-lemma interface. For r >= 2 a lighter-side route stays open (FL-066 title and lesson, method-barrier row) |
| H65 + Lemma D closure needs the NOT PROMOTED Lemma 5.4 analogue | The caveat now travels with every closure claim (assessment, report, summary, FL-066, PROOF_STATE, START_HERE, RL66 brief) |
| Lemma D does not literally apply to Lemma 5.9 (different root sets) | Marked as needing a linkage variant and a 5-path analogue; reading level, NOT PROMOTED |
| Lemma D cited F1.txt:472–473 inside §3 (declared unread) | The identity is proved inline; the F1 citation is for comparison only; the reading record is corrected |
| Thm 2.7 mis-described in "first missing dependency" | Corrected (K_k / S_{4,5} targets on <=4 roots) |
| Runner-up reasoning asymmetric | Symmetric remark added (C66 leaves r>=2 open; r = 1 is the sub-case forced by G0) |

Mathematical correction/demotion: NONE. Classification changes caused by the red team: NONE. All edits are scoping, precision or provenance edits.
