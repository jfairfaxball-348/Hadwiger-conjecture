# RL3 — top-down roadmap setting

Prepared at the RL2 cutoff: 2026-09-30. Status: DRAFT SUCCESSOR MANDATE — NOT STARTED and NOT PROMOTED. Install separately in successor authority only through the normal verified RL2 closeout.

## Mission and boundary

The user explicitly directs RL3 to set the roadmap after RL2 closeout, identify the highest-difficulty target, work from the top down, and avoid the documented Collatz failures. RL3 is therefore a roadmap-setting session. It must assess proof dependencies before authorizing a subsequent proof-attack session. It is not a session to build a stack of local lemmas or numerical certificates first.

Start with the normal AGENTS.md gate, the carried background/READ_ME_FIRST.md, background/OPEN_FRONTIER.md, background/RESULT_CATALOG.jsonl, and the carried COLLATZ_FAILURE_REVIEW.md. Resolve source gaps only where a proposed route depends on them. The corpus cutoff is 2026-09-30; distinguish post-cutoff updates from already checked material.

## Highest-level target

The demanding root objective is the full sharp ordinary Hadwiger conjecture:

For every finite simple graph G and every integer t>=1, if chi(G)>=t, there exist nonempty pairwise disjoint sets B_1,...,B_t of vertices of G such that each G[B_i] is connected and, for every i<j, an edge of G joins B_i to B_j.

Equivalently, h(G)>=chi(G). [RES-0001, RES-0002; OPEN-0001]

The unresolved range is all t>=7, with no upper bound on graph order, no independence-number assumption, no parity restriction, and no graph-class or maximum-degree restriction. The first unsolved fixed case t=7 is a landmark, not the selected definition of the hardest target. “Highest difficulty” here names the unrestricted sharp project objective, not a claimed theorem that all open problems admit a total difficulty ordering.

The central load-bearing challenge to inspect is a **universal sharp sufficiency bridge**: what new theorem would turn the proposed route's genuinely established antecedents into this simultaneous complete minor model for an arbitrary counterexample? Density, local connectivity, individual branch sets and pairwise connections constructed separately do not by themselves establish a compatible model. No project theorem closing that bridge is inherited.

## Work backwards before scheduling work

1. Freeze the exact root statement above and its witness conditions. Fix indexing, graph conventions and constants.
2. Apply only checked reductions. The contraction-critical reduction RES-0028 is a legitimate way to describe arbitrary minimal counterexamples at a fixed t. Preserve every residual parameter; extra assumptions must appear as separate obligations.
3. For each serious route, write its proposed global bridge as an explicit quantified mathematical statement, with antecedents and conclusion. State which arrow to the root it would establish and which arrows remain.
4. Identify the first unproved high-level obligation on that chain. Assess its difficulty and plausibility before expanding dependencies downward.
5. Attack sufficiency: known counterexamples to strengthenings, scope mismatches, constant losses, incompatible models, and cases satisfying weaker local antecedents. Name an actual countermodel if available; absence of a found countermodel is not a proof.
6. Admit local follow-up work only if it is needed for a named bridge whose full coverage has been accounted for. Every proposed follow-up must say exactly what proving its claim would close and what would remain open.

An equivalent reformulation of Hadwiger may be a useful coordinate system. It is not a reduced open obligation merely because it has a new name. A route earns priority through a genuine reduction, new independent structural input, or a precise and plausibly approachable global lemma.

## Minimum route comparison

These are literature-derived families to compare, not a selected proof strategy or claims that the missing bridges are true.

| Family | Inherited input | Highest missing step to assess first | Required coverage / sharpness check |
|---|---|---|---|
| Arbitrary contraction-critical counterexample to a complete model | RES-0028; model definition RES-0002 | A structural/linkage theorem sufficient to construct all t branch sets simultaneously | Every t>=7 and every such graph; root compatibility, disjointness and all pair adjacencies |
| Structural dichotomy for hypothetical counterexamples | RES-0030 from SRC-0018 | A sharp model construction or contradiction for both alternatives | The OR is exhaustive but neither branch is already excluded; retain asymptotic quantifiers and unrestricted degree |
| Small-graph transfer for the linear weakening | RES-0011, RES-0012 | A uniform small-graph linear theorem, followed by a separate justified route across the sharp gap | t remains unbounded; C^2t is not t-1; linear success alone cannot close the root |
| Independence/fractional/class-specific routes | RES-0007, RES-0019–RES-0021; OPEN-0004–OPEN-0006 | A genuine coverage/transfer/rounding theorem connecting the restriction to arbitrary integral sharp coloring | Without that theorem this is a restricted subproblem; count it at its own scope |
| Unavoidability/reducibility architecture | RES-0006, RES-0026 | A parameter-uniform unavoidability theorem and a scope-matched reducibility mechanism | A catalog of locally reducible configurations alone has no universal coverage |

Reject a route whose target silently becomes the false subdivision, sharp list, or sharp odd strengthening. [RES-0016, RES-0017, RES-0023–RES-0025] A correct O(t) or fractional theorem is valuable at its stated scope but needs an explicit additional argument to reach the root.

SRC-0014/RES-0015 must remain uncertain until the manuscript is recovered and inspected. Revalidate SRC-0018 before a load-bearing use of its preprint dichotomy. Do not make freshness uncertainty disappear by describing an older baseline as the latest bound.

## Required RL3 outputs

Produce a compact portable roadmap with:

- A root objective and a dependency graph/list whose arrows are actual implications, each labeled proved/inherited, candidate, open, or rejected.
- A route comparison giving the highest missing bridge, exact scope, known barriers, source IDs and any new input needed.
- A bridge ledger: precise statement, evidence, falsification attempt, outcome, residual parameters, proof classification and relation to the root.
- An explicit choice of the next bounded research claim, with a reason it addresses the hardest live bottleneck. If no route is justified, preserve an inconclusive/blocked assessment instead of manufacturing a new phase.
- A successor brief that states inputs, target, checks, failure conditions and the exact global obligation a successful result would reduce.

A roadmap may include long-range conditional dependencies because the user requested it. It must distinguish those dependencies from proved mathematics. RL3's success is a defensible, source-grounded research decision, not a claim that the conjecture has advanced merely because a plan exists.

## Failure and stopping criteria

Reject or quarantine a bridge immediately if a valid countermodel defeats its stated sufficiency, it assumes its desired conclusion, leaves an uncovered graph family or parameter, consumes an unproved orientation/model-compatibility step, or loses sharpness without acknowledging the loss.

A structural failure closes that bridge family at its documented scope. Reopen only for a named new input that addresses the failure. Do not continue making local consequences more elaborate as a substitute. If the bridge merely restates the root, record “equivalent reformulation; no obligation reduced.” If source access or proof review is incomplete, record an open obligation.

Use named closed obligations and exact remaining scope as the measure of progress. Do not report percentage completion, certify a phase as proof of the root, or infer universal truth from bounded computation. Follow the repository's existing stop-and-repair and closeout rules; this brief does not replace them.

## RL2-to-RL3 handoff

At finish up, freeze RL2's background, external failure review, provenance and verification report. Carry the same load-bearing background IDs and the failure review into successor authority, and install this brief with an RL3 START_HERE.md. Inspect the full atomic transition and read back the remote freeze and successor. RL3 remains unopened until that verified transition exists.

