# RL65 brief — HC7 K7^- density candidate gate

Status: READY / NOT STARTED.
Programme: ACTIVE.
Root: HC7 only (every finite simple graph G with chi(G)=7 has a K7 minor). A legitimate negative is a rigorously verified G with chi(G)=7 and h(G)<=6.
Selected by: RL64 (authoritative/RL64_REPORT.md §9). Predecessor: RL64 CLOSED/FROZEN under sessions/RL64/.
Mode: one bounded NEW-MATHEMATICS candidate assessment at the documented frontier obstruction.

Required reading:
- AGENTS.md
- authoritative/START_HERE.md
- this brief
- authoritative/HC7_RESEARCH_PROGRAMME.md (§11)
- authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md
- authoritative/RL64_REPORT.md
- authoritative/RL64_ADMISSION_RECORD.md
- authoritative/RL64_FRONTIER_OBSTRUCTION_MAP.md
- authoritative/RL64_CLASSICAL_INPUT_TABLE.md
- authoritative/RL64_SOURCE_REGISTER.md
- authoritative/FAILURE_AND_LESSON_LEDGER.md (FL-055..FL-065)

## Start-gate precondition (access, not mathematics)

arxiv.org must be reachable. It was reachable at the RL64 closeout environment, after probe A0c on 2026-10-06. Alternatively, the user supplies:
- F1 = arXiv:2609.17760v1, PDF sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907;
- [Dvo26] = arXiv 2609.13818.

If neither holds:
- stop before mathematics and report;
- do not use substitutes, mirrors or re-routing.

A re-fetched F1 PDF must match the pinned sha256. A mismatch, or a new arXiv version, must be recorded and the admission re-checked before any use.

## Candidate C65 (status on entry: CONJECTURE / NOT ESTABLISHED)

C65 is F1 Conjecture 1.5 (arXiv:2609.17760v1), quoted exactly:

> Every 5-connected graph with n ≥ 6 vertices and at least 4n − 2 edges contains K7− as a minor.

Here K7^- is K7 minus one edge. Graphs are finite simple; the minor relation is standard. The authors note it may hold "likely even with 2 replaced by a slightly larger constant". The constant 2 is the one the bridge below needs.

## HC7 programme §5 fields

**Quantifiers.** C65 ranges over every 5-connected finite simple graph with n>=6 and e>=4n−2.

**Bridge B65 (to be written and proved in RL65 before any use).**

    C65  ⇒  every finite simple graph with chi>=7 has a K7^- minor  ⇒  (U9) every HC7 counterexample has a K7^- minor

The bridge consumes F1 Theorem 1.6 at Level A statement level (RL64_ADMISSION_RECORD.md / RL64_SOURCE_REGISTER.md):

> Let G be a K7− -minor free graph of chromatic number at least seven. If every proper minor of G is 6-colorable, then G is 7-connected and |E(G)| ≥ 4|V(G)| − 2.

The bridge proof is a minimal-counterexample argument, as in F1's own proof of its Theorem 1.1. It must check every hypothesis explicitly:
- every proper minor is 6-colourable;
- 7-connected ⇒ 5-connected and n>=8>=6.

B65 may be promoted as proved analytic mathematics, conditional on C65 and on F1 Thm 1.6 at Level A statement level.

**HC7-universal obligation reduced, if C65 is established.** U9, which strictly strengthens U8. HC7 itself is not reached: the K7 step is documented to need a non-density mechanism.

**Inherited theorem connecting it to the root.** F1 Thm 1.6 at Level A statement level (unrefereed preprint; AI-assistance disclosed; proof unread). No minimality of the HC7 counterexample is needed.

**First known gap.** F1 spends the two-edge (matching) deficiency only in its density half (RL64_FRONTIER_OBSTRUCTION_MAP.md §2):
- (a) Thm 2.9: a rooted vampire / K2,↓5 outcome, which misses a matching among the edges at the two non-root vertices;
- (b) Lemma 6.4 / Lemma 6.6: a rooted K5^- in the neighbourhood of a vertex of degree <=7, plus two vertices, giving K7^=.

RL65 must identify the first of these loci needed for a K7^- version. It must state the exact K7^- analogue required, for example "at most one missing non-root edge", or a rooted K5 in place of K5^-, and assess that one statement.

**Falsification condition.** An explicit 5-connected finite simple graph with n>=6, e>=4n−2 and no K7^- minor. Such a graph refutes C65 as stated, but not the K7^- colouring conjecture. Test first, analytically, the families named in the inspected texts:
- K6;
- a universal vertex over a 5-connected planar triangulation (4n−10 edges);
- F2's G_n (4 universal vertices over a matching; only 4-connected);
- K2,2,2,2;
- two universal vertices over a 5-connected planar triangulation (5n−15 edges).

**Stopping rule.** Stop at the first of the following:
1. a verified falsifier of C65;
2. the first K7^- analogue lemma formulated and assessed: proved, refuted by an explicit counterpattern, or open with an exact first missing dependency;
3. the work-unit bound.

Then checkpoint and recommend. Do not chain into the next F1 locus in the same work unit.

## Frontier position (FL-064, extended by FL-065)

| Item | Position |
|---|---|
| S1 (7-connectivity) | Level B only. **Not needed:** 7-connectivity enters only inside F1 Thm 1.6's own statement for the K7^- -minor-free class. |
| S2 (delta in {7,8,9}) | Level C. **Not needed;** not used by the frontier. |
| S4 / U8 (K7 minus any two edges) | Certified at Level A statement. The starting point. C65 targets strictly above it and re-derives no frontier fact. |
| K7^- target | Exactly F1 Conjecture 1.5 via F1 Thm 1.6. This is the documented obstruction. |
| K7 density-failure examples | Two universal vertices over a 5-connected planar triangulation: 7-connected, K7-minor-free, 5n−15 edges. RL65 makes **no** density attempt for K7 itself. |

## Prohibitions

- No upgrade of a K7^= or K7^vee model to K7^- or K7 by model minimality (FL-055..FL-062 pattern). C65 is a density statement; it may not be attacked by starting from a K7^= / K7^vee model of a fixed graph and "adding the missing edge".
- No degree-7 / M3 / Kempe / K4,4 repository local work. Routes R06–R17 keep their dispositions.
- No consumption of F1/F2 internal lemmas or of [Dvo26] above their recorded levels:
  - F1/F2 stated theorems: Level A statement;
  - cited classical inputs and [Dvo26]: Level B.

  Any result depending on them is recorded CONDITIONAL with those dependencies named, including F1's AI-assistance disclosure.
- No literature loop beyond F1 and [Dvo26].
- No computation and no census.
- No full text of F1 committed to the repository (licence). Quotations, line references and hashes only.

## Bounds

- External retrievals: at most 3. Planned: (1) F1 v1 PDF, verify sha256; (2) the [Dvo26] abs page; (3) the [Dvo26] PDF, only if a Dvo26 statement is load-bearing for the chosen locus. Log each before its call.
- Mathematical computation: 0. Census: 0.
- Candidate count: exactly 1 (C65 at one F1 locus).
- Proof reading of F1 is permitted only for the chosen locus (Thm 2.9 or Lemma 6.4/6.6) and the statements it uses. No full reconstruction of F1.

## Expected outputs

1. B65, written out with its exact classification.
2. Falsification-test record for the named families, with each family's verdict and reasoning.
3. The chosen F1 locus, its exact K7^= statement (quoted), and the exact K7^- analogue required.
4. The assessment outcome for that analogue (proved / counterpattern / open with first missing dependency), classified.
5. Updated frontier position (U8 / U9 status).
6. Corrections/demotions, including NONE.
7. Source-status changes, including NONE.
8. One RL66 recommendation, with runner-up and reasons. The RL70 periodic audit is still owed and is not replaced.

Programme ACTIVE.
