# RL3 — top-down sharp Hadwiger roadmap

Research cutoff: 2026-09-30. Status: **CLOSED/FROZEN — completed RL3 roadmap; carried into incoming RL4.**
BASE_HEAD: `d5a978dd4e37040a63645a83e5c39c94c3b5182e`.
Incoming authoritative tree: `8f8e3c6f077d2879ca5f25933d2e7be90aacbc91`.

## Decision

Keep full sharp ordinary Hadwiger as the root. Prioritize the **critical-neighborhood to simultaneous rooted model** interface for further assessment. No route has yet earned an unrestricted proof attack. The ranked choice is a research priority, not a theorem, a novelty claim, or a prediction of success.

The hardest missing universal bridge is the conversion of exact chromatic obstruction in an arbitrary minimal counterexample into one compatible complete minor model, at the original minor order. The inherited corpus does not close that conversion. Density, connectivity, separate connections, and already existing unrooted models are insufficient substitutes.

The first bounded follow-up is N1: assess the colorful rooted-K6 statement in [RL4_COLORFUL_K6_ADMISSIBILITY_BRIEF.md](RL4_COLORFUL_K6_ADMISSIBILITY_BRIEF.md). This is a known Holroyd-conjecture instance, chosen to isolate the missing compatibility implication. A positive result would imply ordinary Hadwiger at t=7; it would leave all larger orders unresolved. Its current literature status needs targeted recovery before a proof attack. An inconclusive outcome is permitted and must remain explicit.

## Root and quantifiers

For every finite simple graph G and every integer t>=1, if chi(G)>=t, there are nonempty sets B_1,...,B_t subseteq V(G) satisfying, **together**:

1. B_i cap B_j is empty for all distinct i,j;
2. G[B_i] is connected for every i;
3. for every i<j, an edge of G has one endpoint in B_i and one in B_j.

Equivalently, h(G)>=chi(G). Use chi(empty)=h(empty)=0. The target has unbounded t and graph order, unrestricted maximum degree and independence number, and no parity, class, density, or prescribed-root assumption. The live unresolved range inherited from RL2 is t>=7. Case t=7 is a landmark inside the target, not a replacement for it. [RES-0001, RES-0002, OPEN-0001, OPEN-0002]

## Ranked route assessment

Ranks concern relevance to the sharp root and quality of the present interface, not a total ordering of mathematical difficulty. Dependencies and exact bridge statements are in [DEPENDENCY_MAP.md](DEPENDENCY_MAP.md) and [BRIDGE_LEDGER.md](BRIDGE_LEDGER.md).

| Rank | Route and highest missing bridge | Coverage and sharpness | Evidence, barriers, decision |
|---|---|---|---|
| 1 | Arbitrary contraction-critical counterexample; exploit colorful neighborhoods to obtain all t-1 mutually compatible branch sets touching one neighborhood (BR-01). | Every t>=7; every order. The chromatic/colorful antecedents are established, without a density threshold. Rooted completion is open. General Holroyd completion is a sufficient strengthening; the contraction-critical-only coordinate is root-equivalent. | RES-0028 and checked reduction; RL3-SRC-01 supplies the rooted formulation and a low-order precedent. CM-R defeats replacement of colorfulness by connectivity plus an unrooted sharp model. Investigate N1; do not certify viability. |
| 2 | Counterexample structural dichotomy; eliminate or sharply complete **both** alternatives in BR-03. | Revalidated SRC-0018 v1 gives large-t OR coverage. Fix epsilon=1/4 as specified in the ledger; the unknown threshold T and all 7<=t<T remain. No independence of bipartite sides is implied. | RES-0030; CM-B and CM-D refute seed-only sufficiency. Each alternative needs new criticality-sensitive structure. Neither alternative is presently closed. |
| 3 | Unavoidability plus reducibility (BR-06). | A parameter-uniform family must cover every minimal counterexample, and each reduction must preserve the same sharp coloring/minor target and decrease a well-founded measure. | RES-0006, RES-0026 are genuine fixed-scope precedents. No unrestricted catalog or unavoidability theorem is inherited. Local reducibility without universal coverage is inadmissible. |
| 4 | Small-graph transfer for linear Hadwiger (BR-04). | One absolute C works for all t>=3 and all small graphs of order <=Ct log^4(t). The inherited conclusion is C^2 t colors, followed by a separately open sharp upgrade. | RES-0011, RES-0012. This is the best inherited size transfer for the weakening, but it does not resolve the root bottleneck. Even sharp small-subgraph inputs in Theorem 1.6 leave its Ct(1+f) multiplier. |
| 5 | Independence, fractional, special-class, and random-model routes (BR-05). | Must supply a universal class-coverage/extraction theorem and loss-free integral sharp transfer. The present inputs retain alpha, degree, graph-class, fractional, or probability restrictions. | RES-0007, RES-0013, RES-0019–RES-0022, RES-0029; OPEN-0004–OPEN-0006. Count achievements at their own scopes. No automatic route to arbitrary integral coloring. |
| Rejected targets | Subdivision, sharp list, sharp odd, or universally dominating models (BR-07). | These impose additional witness or coloring conditions absent from the root. | RES-0016, RES-0017, RES-0023–RES-0025; newly checked preprint RL3-SRC-02 for dominating models. Their counterexamples do not disprove ordinary Hadwiger. |

## What this work unit establishes

The start gate and corpus checks pass. Three explicit countermodel families reject proposed **weaker bridge premises**, not Hadwiger: complete bipartite seeds, dense bipartite neighborhoods, and a rooted-model incompatibility family. The last has an exact nine-vertex base certificate and a proof for every lifted order. See [FALSIFICATION_REPORT.md](FALSIFICATION_REPORT.md). BR-08 also records why the inherited sharp critical-density guarantee cannot automatically activate the small highly connected extraction theorem or preserve sharp coloring.

The reduction to a minimal sharp counterexample and the colorful-neighborhood implication are complete elementary analytic deductions, consistent with inherited reductions. These are standard reductions, not claimed new advances. The root conjecture and every proposed universal completion bridge remain open. No confidence percentage or numerical progress score is assigned.

## Source limits and stopping discipline

The RL2 corpus is preserved byte-for-byte. OPEN-0005 (fractional freshness) and OPEN-0008 / SRC-0014 / RES-0015 (unretrieved Lin manuscript) stay open and are not consumed. Checked preprint statements are not independent proof certification. The source addendum records targeted revalidation, the Holroyd-status gap, and a separate newly noticed asymptotic lead without changing the baseline or catalog counts.

Apply the pinned Collatz review at every arrow: full antecedents, all residual parameters, one simultaneous witness, exact constants, and an independent reason the bridge is sufficient. A reformulation that is equivalent to the root closes no obligation. Stop a proposed bridge on a valid countermodel; scope its rejection precisely. Stop dependent work on circularity, missing coverage, an unproved compatibility step, or hidden loss of sharpness. Reopen a stopped bridge only for a named input addressing the obstruction.

RL3 is CLOSED/FROZEN. Its required roadmap outputs are complete. The atomic closeout installs RL4 for N1 only, preserving this roadmap and its gaps. No further RL3 mathematics was undertaken during CLOSEOUT_LOCK.
