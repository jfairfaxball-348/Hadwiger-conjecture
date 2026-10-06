# RL63 strategic verdict — how can HC7 actually be proved or disproved?

Status: RL63 global-audit record. CLOSED/FROZEN on promotion at RL63 closeout.
Root: HC7 only.

## Plain answer

Neither a proof nor a disproof of HC7 is within reach of anything the repository has built.

**What sixty-two sessions produced.**
- The repository's certified universal frontier is classical: minor-minimality ⇒ full-C7 criticality, delta>=7 via a Dirac-type star-fold lemma, and a K4,4 minor from Kawarabayashi–Toft 2005.
- The last genuine narrowing was RL54.
- 46 of the 62 sessions (RL6–RL9, RL11, RL13–RL19, RL21–RL29, RL31–RL39, RL41–RL49, RL51, RL55–RL59, RL61) developed local degree-seven and K4,4-model machinery for subcases that no coverage bridge reaches. That work is valid at its scope and strategically irrelevant to HC7 as it stands.
- The programme never imported the k=7 literature:
  - Mader's 7-connectivity (it sat unused in RL12-SRC-01);
  - Mader's K7 extremal function, which gives delta in {7,8,9};
  - Gallai's order bound;
  - the 2025–2026 preprints. RL63 orientation finds these claim every 7-chromatic graph has a minor of K7 minus any two edges.

**Where HC7 actually stands (orientation).** The open problem sits between "K7 minus two edges" and K7.

**The credible way to attack it:**
1. rigorously import that frontier;
2. read off the exact obstruction where expert methods stop;
3. concentrate any new mathematics on that obstruction.

**Disproof.** No theorem bounds the order of a counterexample, so there is no exhaustive disproof domain. The disproof track stays compute-gated.

## Hard ranking

| Rank | Route | Gap type | Why here |
|---|---|---|---|
| **1 (WINNER)** | **P1 / R02: two-edge-deficient frontier admission** (arXiv:2609.17760 Dvořák–Norin–Rahman K7^=, arXiv:2507.03244 K7^vee) | SOURCE | Strongest universal narrowing available. Locates the true open gap. Open-access texts, so it can be fully inspected once arXiv is reachable. Independent of every dead route. Bounded. |
| **2 (RUNNER-UP)** | P2 / R03: Mader K7 extremal function ⇒ delta in {7,8,9} | SOURCE | Real finite partition, but below the frontier. Original paywalled. |
| 3 | P3 / R04: Mader 7-connectivity | SOURCE | Narrows without a partition; tool only; FL-063. |
| 4 | P4 / R21: K7^- then K7 beyond the frontier | NEW-MATH | The actual chain to HC7, but unscopable before rank 1. |
| 5 | P5: branch closure on delta=7/8/9 | NEW-MATH + COMPUTATION + COVERAGE | Needs ranks 2–3; the literature already ran this analysis. |
| 6 | R20: certified counterexample search | COMPUTATION | No exhaustive domain; zero tooling; needs rank 2 first; expected yield very low. |
| 7 | R14/R15: repository degree-7 local machinery | COVERAGE | Triple coverage gap. Value only after ranks 1–2 expose a residual it addresses. |
| — | R06–R13, R16, R17 | — | KILL/RETIRE (route portfolio); scoped results preserved. |

**Strongest proof route:** P1 → P4, i.e. admit the frontier, then attack the K7^- / K7 obstruction.

**Strongest disproof route:** a certified exhaustive order-N sweep. Its domain is n<=N, delta>=7, 7n/2<=e<=5n−15, vertex-critical, chi=7. It carries the full certificate stack: graph6+hash; 7-colouring; DRAT/LRAT non-6-colourability; dual-encoding K7-minor UNSAT or an independent exhaustive verifier. It is COMPUTE-GATED on S2 plus tooling. Even a negative result only certifies n>N.

## Why the winner changed from the plan's preliminary verdict

The approved plan provisionally named the Mader extremal-function gate. It also said the verdict would be finalised after reconnaissance, and the brief directs: "If it reveals a much shorter known-theorem route that we have overlooked, prioritize verifying it."

Reconnaissance (R6–R8, orientation only) surfaced the 2025–2026 two-edge-deficient theorems. They change the ranking for four reasons:
1. They sit strictly closer to K7 than anything else known.
2. They almost certainly consume the extremal and connectivity inputs themselves. Their citations will pin those statements at Level B as a by-product.
3. They are open access, unlike Mader 1968.
4. They are the only route whose output tells the programme *what new mathematics HC7 still needs*.

None of the pre-declared triggers fired:
- Q4 found no HC7 resolution.
- Q5 found no delta>=8 theorem.
- The swap condition was not met.

This re-ranking is therefore a disclosed judgement on new information, not a rule trigger.

## Why the runner-up loses

The Mader K7 extremal-function gate (delta in {7,8,9}) loses on three counts:

1. **It lies below the frontier.** It produces a finite degree partition, but every branch of that partition is exactly where Kawarabayashi–Toft, Jakobsen and the 2025–26 papers already worked, reaching K4,4 or K7 minus two edges. Admitting it alone would restart the repository at a 1968–2005 baseline and invite re-deriving known case analysis. That is the drift failure this audit exists to stop.
2. **Verifiability and cost.** The original (Math. Ann. 178, DOI 10.1007/BF01350657) is paywalled, and no open copy was reachable. This is the FL-063 failure pattern in waiting. By contrast, the winner's sources are open arXiv texts.
3. **It is partly subsumed.** The winner's extraction step records the exact form and citation in which the frontier papers use Mader's bounds (Level B). That tells RL65 whether a separate Level-A extremal gate is actually needed, and in what exact form.

## RL64 — exactly one successor task

**Name:** RL64 HC7-TWO-EDGE-DEFICIENT-FRONTIER-ADMISSION-GATE.

**Exact candidate statements (as excerpted; to be verified).**
- F1 (RL63-SRC-03, arXiv:2609.17760, Dvořák–Norin–Rahman): every finite simple graph with no K7^= minor is 6-colourable. K7^= is K7 minus two independent edges.
- F2 (RL63-SRC-04, arXiv:2507.03244, Theorem 4 per excerpt): every finite simple graph with no K7^vee minor is 6-colourable. K7^vee is K7 minus two edges with a common end.

**Quantifiers.** All finite simple graphs. Applied to every hypothetical HC7 counterexample G: chi(G)=7, no K7 minor; minimality is not needed.

**HC7-universal obligation reduced, if admitted.** For every such G and every pair of distinct edges e,f of K7, G contains K7−{e,f} as a minor (both isomorphism types). This strictly supersedes the RL54 K4,4 frontier as near-K7 structure.

**Inherited theorem connecting it to the root.** None needed beyond the root negation (chi=7). Both F1 and F2 apply directly.

**Bounded extraction**, from the inspected texts only, with no proof reconstruction:
- (a) exact statements, definitions, hypotheses, version numbers and dates, and preprint/refereed status;
- (b) every classical input the proofs consume, with exact citation and statement as quoted, recorded at Level B. At minimum: Mader connectivity, the Mader extremal function, the Kawarabayashi–Toft lemmas, Jakobsen, Gallai;
- (c) the authors' own stated obstruction or remarks on K7^- and K7, and whether their proofs proceed through a finite low-degree case analysis. If so, list the residual configuration types where they obtain only a two-edge-deficient minor.

**First known gap.** Inspected arXiv text. In the RL63 environment arxiv.org is blocked by egress policy.

**Start-gate precondition.** arxiv.org is reachable, or the user supplies the exact arXiv versions. If this fails at RL64 start, RL64 stops before mathematics, reports the precondition, and does not replay any retrieval.

**Falsification.** Any of the following, recorded exactly; F1/F2 are then not promoted:
- the inspected statement differs from the excerpt (extra hypotheses, multigraph/loop conventions, a different K7^= or K7^vee meaning, a non-standard minor);
- the version is withdrawn;
- the main theorem is conditional.

**Stopping rule.** Stop after admission/non-admission of F1 and F2 plus extraction items (a)–(c).

Explicitly prohibited in RL64:
- any attempt to upgrade a K7−{e,f} model to K7^- or K7 by model minimality (the FL-055..FL-062 pattern);
- any degree-7/M3/Kempe/K4,4 local work;
- any proof reconstruction;
- any literature loop beyond the two papers and their version pages.

**Bounds.**
- At most 6 external retrievals: two abstract/version pages, two full texts, two reserve.
- 0 mathematical computation; 0 census.

**Output classification target.** F1/F2 at Level A (statement-checked primary preprint, proof unread, version-pinned), or a recorded non-admission. Extracted classical inputs at Level B. One frontier-obstruction map, which becomes the scoping input for P4/P5.

**Success effect on the programme.**
- The universal frontier becomes U1–U7 plus F1/F2.
- R16/R18 (K4,4) are formally superseded.
- RL65 is chosen between:
  - a Level-A gate for whichever classical input the frontier proofs show is load-bearing; or
  - a bounded NEW-MATH candidate at the documented obstruction.

## Standing items

- The RL70 periodic audit is still owed. RL63 does not replace it.
- **Frontier rule** (route portfolio): no route may start or reopen without stating its position relative to S1–S4.
- Environment action for the user: allow arxiv.org (and optionally www.eudml.eu, gdz.sub.uni-goettingen.de, www.digizeitschriften.de, link.springer.com) in the environment's network settings before RL64.
