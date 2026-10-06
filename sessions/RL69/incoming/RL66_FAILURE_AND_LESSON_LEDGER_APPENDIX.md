# RL66 failure and lesson ledger appendix

Status: RL66 record. CLOSED/FROZEN on promotion at RL66 closeout. This is the exact FL-067 text appended to authoritative/FAILURE_AND_LESSON_LEDGER.md; FL-001..FL-066 are unchanged.

# FL-067 — the heavy-side rooted K6 repair C66 survives every tested member of the named falsifier families but over-asks: it contains the degree-5 case of C65, while the r = 1 payoff needs only some K7^- in S1 + z'

Date: 2026-10-06.
Origin: RL66 HC7-K7MINUS-HEAVY-SIDE-ROOTED-K6-GATE.
Classification: candidate gate with OPEN outcome. Recorded here:
- a falsification record (no falsifier found in the tested members);
- proved reduction lemmas;
- a proved strength bound for the candidate.

It is not a mathematical error, theorem demotion, refutation, certified HC7 counterexample or finite certificate.

## Expectation tested
That C66 (every 4-light 5-rooted R with ρ4(R) >= m(R)+7 has a rooted K6↓5 minor), the heavy-side repair named by FL-066, would either fall to a named falsifier family or be provable as a rooted lemma below C65.

## Actual observation
- **No falsifier found** among the tested members of families (i)–(iv) (RL66_FALSIFICATION_TEST.md):
  - (i) apex over planar: ρ4 <= m and never K6↓5. This is a threshold-necessity witness only, e.g. z + icosahedron.
  - (ii) two apices over planar: an exact (a)/(b) criterion. Every tested member has K6↓5, including root placements that block rooted K4. The all-components-poor regime is NOT ASSESSED.
  - (iii) matching-attached blobs: one-directional reduction to a core of strictly larger surplus (such cores are not excluded).
  - (iv) G0 copies and K2,2,2,2: K6↓5 present.
- **Proved lemmas** (RL66_C66_ASSESSMENT.md):
  - F′: τ(M)+1 disjoint full sets ⇒ K6↓5;
  - P: contracting a root's unique non-root neighbour preserves 4-lightness and changes the surplus by 3 − |T| (a reduction only for |T| <= 3);
  - S: concentrated root contacts force ρ4 <= C(s,2)+s;
  - K4r;
  - E66: K6↓5 ⟺ a K7^- model of R + z' with {z'} a bag, and the C66 threshold is exactly C65's 4n − 2;
  - S66: C66 ⇒ C65 for 5-connected graphs with a degree-5 vertex.
- **Precision B65⁷.** B65 consumes C65 only on 7-connected graphs.

## First missing dependency
A rooted extremal theorem forcing K6↓5 in the reduced core (C1)–(C3) at surplus >= 7. By S66 it has at least the strength of C65's degree-5 case. That case is not established (no statement in authority supplies it) and is not used by U9 via B65. By the reduction to the core, this dependency is equivalent to C66; no strictly weaker sub-lemma has been isolated.

## Surviving valid scope
- U1–U8 unchanged. U9 CONDITIONAL; precision: conditional on C65⁷ (implied by C65) and on F1 Thm 1.6 at Level A.
- C65 CONJECTURE / NOT ESTABLISHED. C66 CANDIDATE / NOT ESTABLISHED (open, not falsified).
- FL-001..FL-066 and their retry conditions unchanged.

## Downstream effect
- R21-K7^- stays ACTIVE.
- The r = 1 sub-case of the Lemma 5.7 analogue is still open:
  - via C66, now known to be at least C65-degree-5 hard;
  - or via the minimality transfer H67 (S1 + z' meets the (2.8⁻) edge bound; whether it is 4-bilight is NOT ASSESSED).
- No HC7-universal obligation is reduced.

## Correction / changes
- Mathematical correction/demotion: NONE.
- Inherited theorem-classification changes: NONE.
- Source-status changes: NONE (retrievals 0/2).

## Lesson
A rooted repair should be tested against its own target before work is invested in it. The test is to add back the contracted side as a vertex (E66) and ask which case of the target the repair implies (S66).

C66's singleton-bag conclusion carries content at the strength of C65's degree-5 case (S66) that the r = 1 payoff never uses: since S1 + z' is a minor of G, any K7^- in it suffices. In every tested member, root placements that block a rooted K4 did not block apex-assisted rooted structures; the 2-apex family needs only a K4 rooted at three roots.

## Retry condition
- Do not invest in C66 as a stand-alone lemma unless a route that proves C65's degree-5 case is named.
- Use E66 / S66 as the strength test for any further rooted repair.
- An r = 1 retry should first assess the minimality transfer H67, with F1's 4-bilight definition retrieved and sha-pinned, and with H54⁻ carried explicitly.
- FL-066's retry conditions remain in force.

## Selected successor
RL67 HC7-K7MINUS-R1-MINIMALITY-TRANSFER-GATE (H67).

Programme ACTIVE.
