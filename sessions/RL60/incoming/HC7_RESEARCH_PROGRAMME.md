# HC7 coverage-first research programme

Status: CURRENT PROGRAMME AUTHORITY.
Installed by explicit non-RL target amendment on 2026-10-05.
Incoming numbered session: RL60.
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

**First known gap.** RL59 isolates the spanning-union subcase U=V(G) and obtains a certified 6-colorable proper minor by contracting all eight branch sets. The unresolved lift is HC7-K44-SPANNING-QUOTIENT-SIDE-PALETTE-LIFT: convert some quotient 6-coloring into disjoint side palettes sufficient to color the original A- and B-side unions. The residual delta(G)>=8 branch remains explicit.

**Falsification condition.** A claimed universal structural consequence lacks a repository proof/source-status record, loses a hypothesis, or admits a baseline-compatible counterpattern.

**Stopping rule.** Stop at the first load-bearing universal consequence whose proof/source status is not established; formulate one bounded proof or source-verification task rather than importing it.

### W2 — complete degree and neighborhood coverage

**Quantifier.** For every minor-minimal HC7 counterexample G, produce an exhaustive proved partition by degree and, where a vertex v is selected, by the structure of G[N(v)].

**Root payoff.** This is the coverage bridge that can make existing degree-seven and neighborhood-specific work relevant to HC7.

**Inherited bridge.** W1 universal structure.

**First known gap.** RL57 did not establish the proposed cap |N_G(v) intersect U|<=7; RL58 did not establish the direct dense-union K7 payoff; and RL59 did not establish the spanning quotient side-palette lift. Degree-seven neighborhood classification remains downstream of the unresolved universal delta(G)>=8 branch.

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

**First known gap.** RL59 did not eliminate the spanning-union U=V(G) subcase. The immediate unresolved bridge there is HC7-K44-SPANNING-QUOTIENT-SIDE-PALETTE-LIFT. Outside that subcase the broader delta(G)>=8 residual and the earlier model-union escape/augmentation obligations remain open.

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

## 7. RL59 outcome and mandatory RL60 audit

RL59 completed exactly one bounded HC7 K4,4 spanning dense-model critical repartition/augmentation assessment in the subcase U=V(G).

RL59-C01 is the spanning quotient side-palette lift. Contract each of the eight connected branch sets of the spanning minimum-total-size K4,4 model to obtain an eight-vertex proper minor Q. The contraction is proper because delta(G)>=8 in a finite simple graph implies |V(G)|>=9 while the eight nonempty branch sets partition V(G). Proper-minor criticality therefore certifies that Q is 6-colorable.

Because Q contains the spanning K4,4, every proper coloring of Q uses disjoint color palettes on the four A-side quotient vertices and the four B-side quotient vertices. RL59-C01 asks whether some such quotient 6-coloring can be chosen so that its A-side palette properly colors G[A_1 union ... union A_4] and its B-side palette properly colors G[B_1 union ... union B_4]. If so, the two disjoint side colorings combine to a 6-coloring of G, contradicting chi(G)=7.

The conditional payoff is proved, but the universal lift is not. Proper-minor 6-colorability controls the contracted representatives and does not by itself bound the chromatic complexity inside the original side-unions. RL55-P01 controls indispensable opposite-side attachment support, not internal side-union chromatic number. No theorem in current authority supplies the required lift.

RL59-C01 is NOT ESTABLISHED / NOT PROMOTED and was not falsified by a certified-domain example.

The fixed RL57 three-vertex-path stress test does not falsify RL59-C01: its branch-set quotient is K4,4 and its two side-unions are each 2-colorable, so a sufficiently large disjoint palette choice can lift there. Its role remains only to block deductions based on RL55-P01/basic interface/dense degree alone.

U=V(G) eliminated: NO.
delta(G)>=8 eliminated: NO.
HC7-universal graph residual genuinely narrowed: NO.
HC7-universal obligation genuinely reduced: NO.
Correction/demotion: NONE.
Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.

First missing dependency: HC7-K44-SPANNING-QUOTIENT-SIDE-PALETTE-LIFT.

Because RL60 is divisible by ten, the standing audit policy now takes precedence over immediate continuation of this candidate. RL60 must perform the mandatory progress/correction audit of RL50-RL59 and the intervening explicit HC7 target amendment. It must assess present HC7 applicability, load-bearing proof/source scopes, Collatz risk, corrections/demotions, and whether the quotient side-palette bridge is a justified changed mechanism or another renamed unresolved global interface. It must end with exactly one bounded RL61 successor selected from the audited HC7 root dependencies.

No new theorem discovery is authorized during RL60 before the audit is complete.

Programme ACTIVE.
