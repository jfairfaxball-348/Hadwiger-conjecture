# HC7 coverage-first research programme

Status: CURRENT PROGRAMME AUTHORITY.
Installed by explicit non-RL target amendment on 2026-10-05.
Incoming numbered session: RL63.
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

**First known gap.** RL62 did not promote HC7-CRITICAL-7-CONNECTIVITY: the elementary separator route stopped at coloring compatibility and the classical Mader route is source-gated because the original theorem text/hypotheses were not directly inspectable. RL63 is therefore a user-directed global audit of the full HC7 attack portfolio rather than an automatic local retry. The residual delta(G)>=8 branch remains explicit.

**Falsification condition.** A claimed universal structural consequence lacks a repository proof/source-status record, loses a hypothesis, or admits a baseline-compatible counterpattern.

**Stopping rule.** Stop at the first load-bearing universal consequence whose proof/source status is not established; formulate one bounded proof or source-verification task rather than importing it.

### W2 — complete degree and neighborhood coverage

**Quantifier.** For every minor-minimal HC7 counterexample G, produce an exhaustive proved partition by degree and, where a vertex v is selected, by the structure of G[N(v)].

**Root payoff.** This is the coverage bridge that can make existing degree-seven and neighborhood-specific work relevant to HC7.

**Inherited bridge.** W1 universal structure.

**First known gap.** RL57 did not establish the proposed cap |N_G(v) intersect U|<=7; RL58 did not establish the direct dense-union K7 payoff; RL59 did not establish the spanning quotient side-palette lift; and RL60 suspended immediate replay of that lift because RL55-RL59 narrowed no graph-level residual. Degree-seven neighborhood classification remains downstream of the unresolved universal delta(G)>=8 branch.

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

**First known gap.** RL59 did not eliminate the spanning-union U=V(G) subcase, and RL61 showed that the direct side-chromatic-sum reformulation cannot independently eliminate it because every actual 7-chromatic domain member has side chromatic sum at least seven. The spanning K4,4 coloring route is therefore suspended. The broader delta(G)>=8 residual and earlier model-union structural obligations remain open.

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

## 7. RL60 audit outcome and RL61 successor

RL60 audited exactly RL50-RL59 plus the explicit HC7 target amendment between RL51 and RL52.

The audit found no mathematical correction or demotion. SRC-0025 remains checked_primary at theorem-statement/hypothesis level; the full subscription proof has not been independently reconstructed. RL55-P01, RL56-P01, RL56-C01, RL57-C01, RL58-C01 and RL59-C01 retain exactly their recorded classifications.

The certified HC7-universal frontier was genuinely advanced in this window only by RL52 and RL54: every hypothetical minor-minimal HC7 counterexample is full-C7 critical, has delta(G)>=7, and contains a K4,4 minor. RL55 added a valid minimum-model interface theorem but RL55-RL59 excluded no further hypothetical HC7 counterexample and reduced no further HC7-universal obligation.

Collatz/repetition risk for unchanged continuation of the RL55-RL59 chain is HIGH. RL59's use of proper-minor 6-colorability was a genuine changed input, but the remaining quotient-palette lift is still an extension/uncontraction interface. Immediate replay of HC7-K44-SPANNING-QUOTIENT-SIDE-PALETTE-LIFT is therefore suspended.

The audit verdict is PIVOT within the K4,4 route: retain SRC-0025 and RL55-P01, but replace the quotient-palette mechanism by exactly one direct original-graph coloring gate.

RL61 assesses the following candidate on the exact RL59 spanning domain. For every hypothetical minor-minimal HC7 counterexample G on the delta(G)>=8 residual and every minimum-total-size spanning K4,4 model M=(A_1,...,A_4;B_1,...,B_4), with A=A_1 union ... union A_4 and B=B_1 union ... union B_4,

    chi(G[A]) + chi(G[B]) <= 6.

If established, disjoint optimal color palettes on A and B give a proper coloring of G with at most six colors, contradicting chi(G)=7. The first missing dependency is a genuine HC7-critical/minimum-model argument controlling the chromatic numbers of the original side-unions. RL61 performs no quotient-palette lifting.

If RL61 cannot prove this direct original-graph control without reopening a recorded failed interface, it must stop and suspend the spanning K4,4 coloring route rather than rename the lift.

Programme ACTIVE.

## 8. RL61 outcome and RL62 successor

RL61 assessed exactly HC7-K44-SPANNING-SIDE-CHROMATIC-SUM on the spanning minimum-total-size K4,4 model domain.

For every partition V(G)=A disjoint-union B, chi(G)<=chi(G[A])+chi(G[B]) by disjoint-palette combination. Hence every actual RL61-domain member with chi(G)=7 has chi(G[A])+chi(G[B])>=7. The proposed <=6 bound is therefore not an independent structural invariant; it can hold on the stated counterexample domain only if that domain is already empty.

HC7-K44-SPANNING-SIDE-CHROMATIC-SUM remains CANDIDATE / NOT ESTABLISHED and is not certified-domain falsified, because no genuine certified-domain counterexample graph is exhibited. The spanning U=V(G) subcase and delta(G)>=8 remain open. No HC7-universal obligation was reduced.

FL-062 suspends the spanning K4,4 coloring route. Immediate retries by quotient palettes, disjoint side palettes, equivalent side-chromatic upper bounds, branch-set coloring catalogues, RL57 degree counting, or RL56 exterior escape are prohibited by its retry condition.

Exactly one successor is installed. RL62 assesses the root-universal candidate HC7-CRITICAL-7-CONNECTIVITY: every hypothetical minor-minimal HC7 counterexample is 7-connected.

Status on entry: CANDIDATE / NOT ESTABLISHED.

RL62 is a bounded proof/source-verification gate outside the suspended spanning K4,4 coloring interface. It may not assume the candidate before proof or source verification and must stop at the first missing dependency.

## 9. RL62 outcome and RL63 global strategic audit

RL62 assessed exactly HC7-CRITICAL-7-CONNECTIVITY on the full hypothetical minor-minimal HC7 counterexample domain.

The elementary separator approach did not establish 7-connectivity. A classical Mader contraction-critical connectivity theorem became load-bearing and a secondary restatement matched the current k=7 hypotheses, but the original theorem text and hypotheses were not directly inspectable from the located subscription-restricted primary source. Under the RL62 proof-admission rule the theorem was therefore not consumed.

HC7-CRITICAL-7-CONNECTIVITY remains CANDIDATE / NOT ESTABLISHED. No certified-domain falsifier was found. The HC7 counterexample class is not yet narrowed to 7-connected graphs; delta(G)>=8 and degree-seven coverage remain unchanged; no HC7-universal obligation was reduced.

FL-063 records the source-access/proof-admission barrier. Repeating the same inaccessible primary-page lookup or promoting from secondary memory is prohibited.

By explicit user direction, RL63 is a GLOBAL AUDIT of all progress RL1-RL62 plus the HC7 target amendment. It must reconstruct the exact valid HC7 dependency frontier, aggressively retire or deprioritize low-leverage routes, compare proof and explicit-disproof strategies, identify where source verification or exact computation can be decisive, and select exactly one bounded highest-leverage RL64 task.

This extraordinary audit does not replace the standing every-tenth-session cadence.

Programme ACTIVE.
