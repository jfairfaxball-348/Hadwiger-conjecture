# HC7 coverage-first research programme

Status: CURRENT PROGRAMME AUTHORITY.
Installed by explicit non-RL target amendment on 2026-10-05.
Incoming numbered session: RL53.
Programme ACTIVE.

## 1. Exact root theorem and negative target

The sole mathematical root is HC7:

> For every finite simple graph G with chi(G)=7, prove h(G)>=7.

Equivalently, every finite simple 7-chromatic graph contains K7 as a minor.

A legitimate negative result is an actual rigorously verified finite simple graph G with

```
chi(G)=7
and
h(G)<=6.
```

No statement for chi(G)>=8 and no proof of the full Hadwiger conjecture is required.

Historical work whose ultimate target was the full conjecture remains frozen history. Its mathematical content survives only at its recorded scope.

## 2. Minor-minimal counterexample baseline

Assume for programme planning that HC7 is false. Choose a K7-minor-free graph G with chi(G)=7 that is minimal under the minor relation among all such chi=7 counterexamples.

### Baseline premises and status

| Premise | Status | Justification / restriction |
|---|---|---|
| G is finite simple, chi(G)=7, and G has no K7 minor. | root-negation hypothesis | This is exactly a hypothetical HC7 counterexample. |
| Every proper minor M of G is 6-colorable. | elementary reduction | If a proper minor M had chi(M)>=7, vertex deletions inside M can be continued until a subgraph J has chi(J)=7; J is still K7-minor-free and is a proper minor of G, contradicting the choice of G. This reduction is programme baseline, not a new numbered-RL theorem or progress credit. |
| G is full-C7 critical in the inherited repository sense (chi(G)=7 and every proper minor is 6-colorable). | definitional identification | This is the definition used by the current RL51/RL52 records. It does not import any stronger structural theorem. |
| Every proper subgraph is 6-colorable. | elementary consequence | Every proper subgraph is a proper minor. |
| G is connected. | elementary consequence | Otherwise a component has chromatic number 7 and is a proper subgraph. |
| delta(G)>=6. | elementary consequence | If d(v)<=5, a six-coloring of G-v extends to v. |
| delta(G)>=7. | proved inherited analytic consequence, certified for HC7 by RL52 | RL6-P03 proves alpha(G[N(v)])<=d(v)-5 in every full-C7 critical graph. If d(v)=6, N(v) is a K6, so v together with N(v) is a K7, impossible in a K7-minor-free HC7 counterexample. |
| stronger connectivity, existence of a degree-seven vertex, or a complete neighborhood classification | NOT ASSUMED | RL52 found no proved/source-verified universal bridge for these. Do not import them from memory. |
| existence of v with d(v)=7, H=G-v with H[S]=K7-C7, m=3,A=S, the RL41 attachment triple, a star coloring, a color pair, a Kempe component, a pivotal edge, or M3-CLIQUE-SEPARATOR-DICHOTOMY | NOT ASSUMED | These are progressively narrower inherited domains/candidates and require proved coverage bridges. |

The elementary entries above justify the baseline formulation. They do not change the proof classification of any inherited theorem.

## 3. Coverage audit of inherited work

A result contributes to HC7 only if every restriction between the HC7 root and that result is discharged by a proved coverage bridge.

| Scope | Inherited material | Current HC7 coverage status |
|---|---|---|
| universal HC7 / minor-minimal counterexample | the baseline above plus inherited RL6-P03 | RL52 certified the chain through delta(G)>=7. Existence of a degree-seven vertex is not certified; the residual delta(G)>=8 branch remains explicit. |
| full-C7 critical | criticality/A2-type arguments used throughout the programme | potentially root-facing because the minor-minimal baseline is full-C7 critical; each specific consequence still needs its exact hypotheses and provenance |
| degree-seven | the long inherited degree-seven programme | conditional only; current authority does not authorize assuming that every HC7 counterexample has a degree-seven vertex |
| H[S]=K7-C7 | the retained seven-neighbor cycle-complement branch | narrower than degree-seven; it contributes only after a proved neighborhood-coverage theorem |
| m=3,A=S | RL31-RL51 retained resource branch and M3-CORE obligations | narrower again; it contributes only after an exhaustive resource-case bridge |
| fixed triple / fixed color / Kempe | RL41-P01, RL41-P02 and RL42-P01 through RL49-P01 | valid exactly at recorded scopes; RL47-P01 through RL49-P01 also require the recorded pivotal-edge antecedent; none is a universal HC7 coverage theorem |
| suspended / failed mechanisms | RL31-RL39 terminal-core refinement under FL-043; fixed RL41 triple/e_0/{2,6}/pivotal-edge Kempe hierarchy under FL-053; RL51 rejected C2/C3 under FL-054 retry conditions | do not restart without the recorded changed-input/retry condition and a proved root-facing payoff |

RL51-P01 remains a proved scoped conditional payoff only: if M3-CLIQUE-SEPARATOR-DICHOTOMY were proved on its retained m=3,A=S domain, either alternative would contradict the retained full-C7 premises. The dichotomy itself remains UNPROVED.

## 4. Principal root-facing workstreams

There are four principal workstreams. They are ordered by coverage, not by local technical maturity.

### W1 — universal minor-minimal HC7 structure

**Quantifier.** For every minor-minimal HC7 counterexample G as in Section 2, determine only structural consequences that hold for all such G.

**Root payoff.** Every proved consequence reduces the domain of all hypothetical HC7 counterexamples, rather than a chosen local subcase.

**Inherited bridge.** The elementary minor-minimal reduction to full-C7 criticality.

**First known gap.** RL52 certified the baseline through delta(G)>=7 using inherited RL6-P03. The first missing universal arrow is whether every minor-minimal HC7 counterexample has a degree-seven vertex, equivalently whether the residual delta(G)>=8 branch is impossible.

**Falsification condition.** A claimed universal structural consequence lacks a repository proof/source-status record, loses a hypothesis, or admits a baseline-compatible counterpattern.

**Stopping rule.** Stop at the first load-bearing universal consequence whose proof/source status is not established; formulate one bounded proof or source-verification task rather than importing it.

### W2 — complete degree and neighborhood coverage

**Quantifier.** For every minor-minimal HC7 counterexample G, produce an exhaustive proved partition by degree and, where a vertex v is selected, by the structure of G[N(v)].

**Root payoff.** This is the coverage bridge that can make existing degree-seven and neighborhood-specific work relevant to HC7.

**Inherited bridge.** W1 universal structure.

**First known gap.** RL52 found no proved/source-verified universal theorem forcing a degree-seven vertex. Thus delta(G)>=8 is the first explicit residual branch. Neighborhood classification is downstream and must not be entered until degree-seven existence is proved.

**Falsification condition.** An allowed degree/neighborhood branch remains outside the proposed partition, or an asserted branch reduction is only heuristic/source-memory.

**Stopping rule.** As soon as the first uncovered degree or neighborhood branch is identified, record it as the root-facing residual and stop; do not descend into M3 in the same work unit.

### W3 — covered degree-seven local closure

**Quantifier.** For every minor-minimal HC7 counterexample that has already been brought by W2 into a proved degree-seven / H[S]=K7-C7 domain, discharge every remaining resource case needed for that domain.

**Root payoff.** Closes one proved branch of the W2 exhaustive partition; it does not prove HC7 unless all other branches are also closed.

**Inherited bridge.** A proved W2 coverage theorem plus the exact inherited degree-seven/H[S] setup.

**First known gap.** The retained m=3,A=S branch remains open; M3-CORE is not certified; M3-CLIQUE-SEPARATOR-DICHOTOMY is admitted but UNPROVED. Other resource cases may also remain and must be checked for exhaustiveness before claiming branch closure.

**Falsification condition.** A retained realization escapes the proposed rooted-K6/separator/resource conclusion, or a local theorem requires an unproved fixed witness/colour/Kempe premise.

**Stopping rule.** Do not start another serial local refinement unless the exact local task closes a proved W2 branch or a named exhaustive subcase with an independently proved HC7 payoff.

### W4 — explicit residual branch

**Quantifier.** For every minor-minimal HC7 counterexample not covered by the proved W3 entry domain, retain the complement as an explicit residual class.

**Root payoff.** Prevents local machinery from hiding the majority of the HC7 obligation; success here plus W3 must exhaust W2.

**Inherited bridge.** The explicit exhaustive partition produced by W2.

**First known gap.** The residual definitely includes the universal branch delta(G)>=8 unless RL53 eliminates it. Degree-seven graphs with other neighborhood structures remain downstream residuals once degree-seven existence is certified.

**Falsification condition.** A proposed residual theorem fails on an allowed branch or depends on a structural result not proved/source-verified for all residual graphs.

**Stopping rule.** Work on one precisely quantified residual branch at a time. If a classical theorem becomes load-bearing but is weakly verified in the repository, stop and formulate one bounded source-verification task.

## 5. Universal-payoff discipline

For every proposed task after RL52, its brief must state:

- exact quantifiers;
- the specific HC7-universal obligation or exhaustive branch it reduces;
- the inherited proved theorem connecting the task to the root;
- the first known gap;
- one falsification/counterpattern condition;
- a stopping rule.

A local result is not progress on HC7 merely because it is deep or strengthens another local result. The coverage bridge must be explicit. The anti-Collatz findings of RL40/FL-043 and RL50/FL-053 remain binding.

Default prohibitions remain: no graph/coloring/resource census, no new mathematical numerical computation, and no external source retrieval unless a bounded source-verification task is explicitly selected.

## 6. Relationship of RL51 to HC7

M3-CLIQUE-SEPARATOR-DICHOTOMY is preserved exactly as an ADMITTED / UNPROVED candidate:

> for every retained full-C7 degree-seven m=3,A=S realization, either H contains an S-rooted K6 or G has a clique separator X with |X|<=6.

RL51-P01 proves only the candidate's conditional payoff at that retained scope.

The candidate is one possible W3 subroute. It is not automatically the next principal task, because HC7 first needs the root-to-local coverage chain audited. The old RL52 brief selecting immediate proof/falsification of this dichotomy is not current authority.

## 7. RL52 outcome and first bounded RL53 task

RL52 completed the HC7 root-coverage gate.

Certified chain:

```
HC7 counterexample
  -> minor-minimal HC7 counterexample
  -> every proper minor 6-colorable / full-C7 critical
  -> proper subgraphs 6-colorable, connected
  -> delta(G)>=7.
```

The delta(G)>=7 step is not a new RL52 theorem. RL52 verified exact inherited provenance in RL6-P03 and the RL10 dependency/scope audit.

The first missing universal arrow is

```
minor-minimal HC7 counterexample with delta(G)>=7
  -> existence of a vertex v with d(v)=7.
```

Equivalently, the residual branch delta(G)>=8 has not been excluded. Therefore no degree-seven neighborhood, H[S]=K7-C7, resource, m=3,A=S, fixed-color, Kempe, pivotal-edge, or M3 clique-separator result may be credited to HC7 until this arrow is proved.

RL53 performs exactly one HC7 degree-seven-existence gate. It must prove, or exactly source-verify at the required scope, that every minor-minimal HC7 counterexample has a degree-seven vertex; otherwise it must retain delta(G)>=8 explicitly and identify the first missing dependency. No broad theorem-discovery campaign, census, local Kempe work, or M3 work is authorized.

Correction/demotion remains NONE unless RL53 discovers an actual scope or validity defect.
