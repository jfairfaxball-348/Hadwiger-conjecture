# RL64 failure and lesson ledger appendix

Status: RL64 record. CLOSED/FROZEN on promotion at RL64 closeout. This is the exact FL-065 text appended to authoritative/FAILURE_AND_LESSON_LEDGER.md; FL-001..FL-064 are unchanged.

# FL-065 — two-edge-deficient frontier admitted; the HC7 gap is a K7^- density gap and then a K7 method gap

Date: 2026-10-06.
Origin: RL64 HC7-TWO-EDGE-DEFICIENT-FRONTIER-ADMISSION-GATE.
Classification: source-enabled HC7-universal structural reduction at Level A (statement-checked, unrefereed preprints, proofs unread), plus an externally documented method barrier at K7, plus a resolved access event. It is not a mathematical error, theorem demotion, certified HC7 counterexample or finite certificate.

## Expectation tested

That arXiv:2609.17760 and arXiv:2507.03244, inspected in version-pinned text, state F1 (no K7^= minor ⇒ 6-colourable) and F2 (no K7^vee minor ⇒ 6-colourable) for graphs, with the standard minor relation and no extra hypothesis. RL63 additionally expected that both proofs consume the Mader extremal and connectivity inputs and work on the delta in {7,8,9} branches.

## Actual observation

- **F1, arXiv:2609.17760v1** (Dvořák, Norin, Rahman; v1 submitted 15 Sep 2026, manuscript dated 23 Aug 2026). Theorem 1.1 reads: "Every K7= -minor-free graph is 6-colorable." **F2, arXiv:2507.03244v1** (Norin, Totschnig; v1 submitted 4 Jul 2025). Theorem 4 reads: "Every graph with no K7∨ -minor is 6-colorable." Both use the standard definitions and the standard minor relation, and neither is conditional. Both are unrefereed. F1 discloses AI-generated proofs (§1.1) and depends on the unrefereed preprint Dvořák arXiv 2609.13818. Both are ADMITTED at Level A.
- **Consequence U8:** every graph with chi>=7, hence every HC7 counterexample, has K7−{e,f} as a minor for every pair of distinct edges e,f of K7. U8 does not imply U7 (K4,4 has 8 vertices). U8 does not give K7^-.
- **Inputs.** Both proofs consume Mader's 7-connectivity, but cite different Mader papers: Math. Ann. 175 (1968) per F1, Math. Ann. 174 (1967) per F2. They also use Dirac (U4 at k=7), Kriesell–Mohr Lemma 2 and KT05 lemmas. F2 also uses Kawarabayashi–Luo–Niu–Zhang, RST93 (2.4)/(2.6) and Jørgensen 1994; F1 also uses Dvořák 2026 and Fabila-Monroy–Wood. Neither cites the Mader K7/K6 extremal functions or Gallai. RL63 expectations EX-1 and EX-2 are not borne out: connectivity is consumed, the extremal function is not, and neither paper uses a delta in {7,8,9} partition.
- **Architecture.** Both papers combine a colouring half (contraction-critical ⇒ 7-connected; degree-7 vertices in 5-cliques; an edge lower bound) with a density half (an extremal theorem in 4- or 5-connected graphs). The two-edge deficiency is spent only in the density half. F1 Theorem 1.6 is already proved under K7^- -minor-freeness. It states that a K7^- -minor-free graph with chi>=7 whose proper minors are all 6-colourable is 7-connected with e>=4n−2.
- **K7^- obstruction (authors).** F1 Conjecture 1.5: "Every 5-connected graph with n ≥ 6 vertices and at least 4n − 2 edges contains K7− as a minor." The authors say this "would be sufficient", that there is "no fundamental obstruction", and (F2) that it "would require a corresponding extremal result".
- **K7 obstruction (authors).** A density result analogous to F1 Theorem 1.3 "is false for K7 -minor-free graphs". Two universal vertices added to a 5-connected planar triangulation give a 7-connected K7-minor-free graph with 5n−15 edges. The "final step" is "substantially more difficult".
- **Access event.** arxiv.org was policy-blocked (probes A0 and A0b, 403) until the user changed the environment; probe A0c returned 200. This was an access defect and is resolved.

## First missing dependency

For K7^-: F1 Conjecture 1.5, or an equivalent density theorem, together with a proof of the bridge from it through F1 Theorem 1.6.
For K7: a non-density mechanism, which no inspected text supplies.

## Surviving valid scope

- U1–U7 unchanged; U8 added (Level A statement).
- All RL1–RL63 classifications unchanged.
- S1 stays Level B (now three restatements); FL-063 unsatisfied.
- S2 and S3 stay Level C and are unused by the frontier.
- FL-001..FL-064 and their retry conditions unchanged.

## Downstream effect

- R02 resolved (admitted).
- R16 and R18 formally superseded as near-K7 structure.
- R21: its K7^- part is now scopable; its K7 part stays suspended.
- R03 further de-prioritised.
- R04 unchanged, with an attribution discrepancy.
- R15 confirmed CONDITIONAL ONLY: the literature already performs the degree-7 analysis at K7^- / K7^vee strength.
- First HC7-universal narrowing since RL54.

## Correction / changes

- Mathematical correction/demotion: NONE.
- Inherited theorem-classification changes: NONE.
- Promoted source-status changes:
  - RL63-SRC-03 C→A; RL63-SRC-04 C→A; RL63-GAP-02 C→B;
  - new Level-B rows RL64-SRC-01..RL64-SRC-10;
  - RL63-SRC-01 stays B with a further restatement;
  - RL63-SRC-02 and RL63-GAP-01 stay C.
- RL63 orientation notes EX-1..EX-4 are superseded by inspection. They were Level-C expectations, not recorded claims.

## Lesson

Importing the frontier located the gap exactly: a missing density theorem for K7^-, then a K7 step where density is documented to fail. New mathematics should target the documented density statement. It should not target inherited local chains, and it should not pursue an edge bound for 7-connected K7-minor-free graphs below 5n−15, which the 2-apex planar examples rule out.

## Retry / frontier rule (extends FL-064)

Every later brief states, in addition to its S1/S2/S4 positions, its position relative to:
- U8;
- the K7^- target (F1 Conjecture 1.5 via F1 Theorem 1.6);
- the K7 density-failure examples.

Do not upgrade a K7^= or K7^vee model to K7^- or K7 by model minimality (FL-055..FL-062 pattern). Do not consume F1/F2 internal lemmas above Level A statement level, and record their preprint/AI-assistance status wherever they are used.

## Selected successor

RL65 HC7-K7MINUS-DENSITY-CANDIDATE-GATE (C65 = F1 Conjecture 1.5).
- At most 3 retrievals.
- 0 computation, 0 census.
- Exactly one candidate.

Programme ACTIVE.
