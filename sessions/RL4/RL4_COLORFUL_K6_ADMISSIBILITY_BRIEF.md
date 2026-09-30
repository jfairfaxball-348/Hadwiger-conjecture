# RL4 — N1 colorful rooted-K6 admissibility

Handover cutoff: 2026-09-30. Status: **COMPLETED RL4 TASK BRIEF — historical**. The bounded N1 assessment is completed and RL4 is CLOSED/FROZEN. This file preserves its target and stopping rules, not a current kickoff. The exact incoming brief is retained under incoming/. Results and residuals are in RL4_ADMISSIBILITY_REPORT.md; RL5 is the unique successor under its own sole brief.

## Exact target

Assess this single quantified statement, CR_6:

For **every finite simple graph H with chi(H)=6** and **every S subseteq V(H)** such that **every proper coloring c:V(H)->{1,2,3,4,5,6} uses all six colors on S**, there are six nonempty pairwise disjoint connected vertex sets B_1,...,B_6, every pair joined by an edge, and B_i cap S nonempty for every i.

This is an instance of the known Holroyd strengthening, not a newly discovered conjecture. Graph order, independence number, maximum degree, and S size have no additional restrictions. Do not substitute a chosen 6-coloring for the every-coloring premise, fixed prescribed roots for flexible roots, or a K12 hypothesis for the sharp K6 conclusion.

## Why this bounded target

In a hypothetical minimal 7-counterexample G, H=G-v has chi=6 and S=N(v) is colorful by exact criticality. A CR_6 proof would supply a fully compatible rooted K6 model, and adding {v} gives K7. It therefore closes a named sharp compatibility obligation rather than improving a local numerical consequence. Ordinary Hadwiger at 6 already supplies an unrooted K6; CM-R shows why that alone does not attach the required roots.

Successful CR_6 would settle ordinary order 7. It would **not** prove CR_s for s>=7 or ordinary Hadwiger at t>=8. The full unbounded sharp objective remains the roadmap anchor. CR_6 may be harder than the ordinary order-7 statement because it requires rooting for every colorful S; that additional difficulty must be assessed, not assumed harmless.

## Inputs and first operation

Pin the then-live default-branch HEAD and follow AGENTS.md and the then-authoritative START_HERE.md. Reuse the RL2 corpus, this roadmap, bridge ledger, countermodel report and certificate, and the pinned Collatz failure review. Do not reconstruct the corpus or rerun the base certificate unless an artifact changed or a required check calls for it.

First resolve **RL3-GAP-01**: recover current primary results on the colorful/Strong Hadwiger formulation at 6, including any negative result, and identify the exact status as of the cutoff. RL3-SRC-01 v1 Conjecture 1.2, Theorem 1.3 and Corollary 1.4 are the checked precedent; the low-order results must not be extrapolated. Search failure is not evidence that the six-color target remains open.

If no already known resolution is recovered, make one coherent obstruction assessment: identify whether the rooted-K4 proof's global obstruction/colorfulness contradiction has a **specified independent six-color analogue**. State any proposed analogue with full quantifiers before scheduling local consequences. The required output is a proved statement at its actual scope, a valid countermodel, an independently grounded narrower bridge with an explicit residual coverage ledger, or a blocked/inconclusive assessment. This is one bounded bridge-admissibility work unit, not an unlimited proof search or a graph census.

## Required verification and stopping rules

* A positive claim must cover every H of chi=6 and every colorful S, or explicitly retain its additional restrictions. It must build all six sets simultaneously. It cannot assume an S-rooted K6, a theorem equivalent to the desired closure, or an unverified extra compatibility claim.
* A negative witness must establish chi(H)=6, colorfulness for **all** proper 6-colorings, and absence of **every** S-rooted K6 model. When |S|>6, absence for one chosen six-element subset or one injection is not exhaustive. Record graph data and exact proof/certificate domains. It is a counterexample to CR_6, not to ordinary order 6 or automatically to ordinary order 7.
* Bounded searches and examples are computational evidence unless they verify an actual finite witness. No finite vertex bound is inherited for universal CR_6. All unsearched graph orders remain uncovered.
* CM-R has a noncolorful root set and cannot be reused as a negative witness for CR_6. The dominating, list, subdivision and odd variants are different targets. Keep their failures at their precise scopes.
* If no independent six-color obstruction theorem is available after the single work unit, stop with **NOT PROMOTED / INCONCLUSIVE**. Do not launch a stack of local lemmas or numerical certificates to conceal the missing universal bridge.
* If the target is already resolved in checked literature, record the exact theorem/counterexample and update the route assessment. Do not claim originality or restart a closed route without a named new input.

## Handover output

Record the source-status verdict, exact proposed implication, its proof classification, one sufficiency/falsification audit, the named obligation actually closed, all residual parameters, and the exact next operation. Preserve OPEN-0005 and OPEN-0008 unless separately resolved and consumed. A candidate plan or equivalent reformulation alone is not mathematical progress.
