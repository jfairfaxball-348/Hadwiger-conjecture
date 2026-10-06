# RL64 brief — HC7 two-edge-deficient frontier admission gate

Status: READY / NOT STARTED.
Programme: ACTIVE.
Root: HC7 only.
Selected by: RL63 global audit (authoritative/RL63_STRATEGIC_VERDICT.md). Predecessor: RL63 CLOSED/FROZEN under sessions/RL63/.
Required reading:
- AGENTS.md
- authoritative/START_HERE.md
- this brief
- authoritative/HC7_RESEARCH_PROGRAMME.md
- authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md
- authoritative/RL63_STRATEGIC_VERDICT.md
- authoritative/RL63_SOURCE_GAP_REGISTER.md
- authoritative/FAILURE_AND_LESSON_LEDGER.md (FL-055..FL-064)

## Start-gate precondition (access, not mathematics)

arxiv.org must be reachable from the session environment, or the user must supply the exact arXiv versions of 2609.17760 and 2507.03244.

If neither holds at the start gate, stop before mathematics:
- report the precondition failure;
- do not search for substitutes;
- do not replay the RL63 retrievals.

## Exact candidate statements

**F1** (RL63-SRC-03: arXiv:2609.17760, Z. Dvořák, S. Norin, N. Rahman). Every finite simple graph with no K7^= minor is 6-colourable, where K7^= is K7 minus two independent edges.

**F2** (RL63-SRC-04: arXiv:2507.03244, Theorem 4 per RL63 excerpt). Every finite simple graph with no K7^vee minor is 6-colourable, where K7^vee is K7 minus two edges with a common end.

Both statements are known only at RL63 orientation level (search excerpts). Neither is consumed on entry.

## HC7 programme §5 fields

**Quantifiers.** F1 and F2 concern all finite simple graphs. They are applied to every hypothetical HC7 counterexample G, that is, chi(G)=7 with no K7 minor. Minimality is not needed.

**HC7-universal obligation reduced, if both are admitted.** For every such G and every pair of distinct edges e,f of K7, G has a K7−{e,f} minor. This covers both isomorphism types and supersedes the RL54 K4,4 frontier as near-K7 structure.

**Inherited theorem connecting it to the root.** None beyond the root negation (chi(G)=7). F1 and F2 apply directly.

**First known gap.** Inspected statement, definitions and hypotheses in the version-pinned texts.

**Falsification condition.** Either of the following blocks admission and is recorded exactly:
- the inspected statement differs from the excerpt in any of these ways:
  - extra hypotheses;
  - a non-simple-graph setting;
  - a different K7^= or K7^vee definition;
  - a non-standard minor;
  - a conditional main theorem;
- a withdrawn version.

**Stopping rule.** Stop after (1) admission or non-admission of F1 and F2, and (2) the bounded extraction below.

## Bounded extraction (from inspected text only; no proof reconstruction)

**(a) Versions.** Record the arXiv version identifiers and dates, the authors, and the refereed or preprint status.

**(b) Consumed inputs.** List every classical or prior input the proofs consume, recording the exact citation and the statement as quoted. Classify each at Level B (restatement). At minimum cover:
- Mader 7-connectivity;
- the Mader K7 (and K6) extremal functions;
- the Kawarabayashi–Toft lemmas;
- Jakobsen;
- Gallai;
- any new edge-extremal bound together with its statement.

**(c) Frontier-obstruction map.** Record:
- the authors' own remarks on K7^- and K7;
- whether the proofs proceed through a finite low-degree case analysis;
- the residual configuration types where only a two-edge-deficient minor is obtained.

## Prohibitions

- No attempt to upgrade a K7−{e,f} model to K7^- or K7 (this is the FL-055..FL-062 model-minimality pattern).
- No degree-7, M3, Kempe or K4,4 local work.
- No proof reconstruction.
- No literature loop beyond the two papers and their version pages.
- No computation and no census.

## Bounds

- External retrievals: at most 6 (two abstract/version pages, two full texts, two reserve).
- Mathematical computation: 0.
- Census: 0.
- Candidate count: exactly 1 gate (F1+F2).

## Expected outputs

1. Admission record:
   - F1 and F2 at Level A (statement-checked primary preprint, proof unread, version-pinned); or
   - an exact non-admission record.
2. Classical-input table at Level B.
3. Frontier-obstruction map.
4. Updated universal frontier.
5. Source register update.
6. One RL65 recommendation, chosen between:
   - a Level-A gate for the classical input that the frontier proofs show is load-bearing; and
   - one bounded NEW-MATH candidate at the documented obstruction.

## Frontier rule (FL-064)

Every later brief must state its position relative to:
- S1 (7-connectivity);
- S2 (delta in {7,8,9});
- S4 (K7 minus any two edges).

Programme ACTIVE.
