# HC7 coverage-first research programme

Status: CURRENT PROGRAMME AUTHORITY.
Installed by explicit non-RL target amendment on 2026-10-05.
Incoming numbered session: RL69.
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

## 10. RL63 global audit outcome and RL64 successor

RL63 audited RL1–RL62, the initialization/scaffold and the 2026-10-05 target amendment, under explicit user direction.

**Findings.**
- The certified HC7-universal frontier is unchanged and entirely classical: U1–U7, with K4,4 from SRC-0025 at statement level. The last genuine narrowing was RL54.
- 46 of 62 sessions developed valid local machinery for subcases that no coverage bridge reaches.
- The programme never imported the k=7 literature: Mader 7-connectivity, the Mader K7 extremal function (delta in {7,8,9}), Gallai's order bound, and the 2025–2026 preprints. Orientation indicates those preprints show every 7-chromatic graph has a K7-minus-any-two-edges minor.
- The RL52/RL53 target "degree-seven existence" is retired as mis-specified. The correct finite coverage statement is delta in {7,8,9}, which is source-gated.

**Classifications.** Mathematical correction/demotion: NONE. Theorem-classification changes: NONE. Promoted source-status changes: NONE. RL12-SRC-01 is clarified as a Level-B restatement. The consolidated ledger is repaired: FL-001..042 restored, FL-055 note appended.

**New rule.** The frontier rule (FL-064) applies to every later brief.

**Successor.** Exactly one successor is installed: RL64 HC7-TWO-EDGE-DEFICIENT-FRONTIER-ADMISSION-GATE (authoritative/RL64_HC7_TWO_EDGE_DEFICIENT_FRONTIER_ADMISSION_GATE_BRIEF.md). It admits or rejects F1 (no K7^= minor ⇒ 6-colourable; arXiv:2609.17760) and F2 (no K7^vee minor ⇒ 6-colourable; arXiv:2507.03244) from inspected text, and extracts the consumed classical inputs and the documented K7^- / K7 obstruction.
- Precondition: arxiv.org reachable.
- Bounds: at most 6 retrievals; 0 computation.

**Runner-up (not selected).** The Mader K7 extremal-function gate.

This audit does not replace the RL70 periodic audit.

Programme ACTIVE.

## 11. RL64 frontier admission outcome and RL65 successor

RL64 ran the two-edge-deficient frontier admission gate selected by RL63. The start-gate precondition first failed: arxiv.org was policy-blocked. The user then changed the environment and arxiv.org became reachable. RL64 used 4 of 6 retrievals and 0 computation.

**Findings.**
- **F1 admitted at Level A.** arXiv:2609.17760v1 (Dvořák–Norin–Rahman): "Every K7= -minor-free graph is 6-colorable". It is an unrefereed preprint, its AI-assisted proofs are disclosed, and the proof was not read.
- **F2 admitted at Level A.** arXiv:2507.03244v1 (Norin–Totschnig): "Every graph with no K7∨ -minor is 6-colorable". It is an unrefereed preprint.
- **New universal item U8.** Every HC7 counterexample contains K7 minus any two edges as a minor. This is the first universal narrowing since RL54. U8 does not imply U7 and does not give K7^-.
- **Classical inputs.** Both proofs consume Mader's 7-connectivity, citing conflicting originals, together with Dirac, Kriesell–Mohr and KT05 lemmas. F1 also depends on Dvořák 2026 (rooted K5). Neither uses the Mader K7 extremal function or Gallai. A separate extremal-function gate is therefore not needed for the frontier.
- **Documented obstructions.**
  - K7^- reduces exactly to the density statement F1 Conjecture 1.5 (5-connected, n>=6, e>=4n−2 ⇒ K7^- minor), via F1 Theorem 1.6.
  - For K7 the density method is documented false (two apices over a planar triangulation give 5n−15 edges).

**Classifications.** Mathematical correction/demotion: NONE. Theorem-classification changes: NONE. Source-status changes are recorded in RL64_SOURCE_REGISTER.md. FL-065 is appended to the ledger and extends the frontier rule.

**Successor.** Exactly one successor is installed: RL65 HC7-K7MINUS-DENSITY-CANDIDATE-GATE (authoritative/RL65_HC7_K7MINUS_DENSITY_CANDIDATE_GATE_BRIEF.md). It is a bounded new-mathematics assessment of C65 = F1 Conjecture 1.5, with three parts:
- the bridge B65 to U9;
- a falsification test;
- the K7^- analogue at the first F1 deficiency locus.

Bounds: at most 3 retrievals; 0 computation.

**Runner-up (not selected).** A Level-A gate for Mader's 7-connectivity. It has no downstream consumer, sits below the frontier, and carries FL-063 access risk plus an attribution discrepancy.

The RL70 periodic audit is still owed.

Programme ACTIVE.

## 12. RL65 K7^- density candidate outcome and RL66 successor

RL65 assessed C65 = F1 Conjecture 1.5 as one bounded new-mathematics candidate gate. It used 2 of 3 retrievals: F1 v1 was re-pinned with sha256 unchanged, and the [Dvo26] abstract was pinned. Computation 0; census 0.

**Findings.**
- **Bridge B65, proved conditionally.** C65 + F1 Thm 1.6 ⇒ every graph with chi >= 7 has a K7^- minor ⇒ U9 for every HC7 counterexample. B65 is conditional on C65 and on F1 Thm 1.6 at Level A statement. U9 is recorded as CONDITIONAL and is not certified.
- **No falsifier of C65** among the five named families. F2's G_n shows that 5-connectivity is necessary. The 2-apex triangulations satisfy C65 and are K7-free.
- **First F1 deficiency locus.** Thm 2.9 as consumed in Lemma 5.7. Lemma 6.4/6.6 and every other locus are downstream.
- **The K7^- analogue T2.9⁻ is false** at Thm 2.9's own quite-heavy threshold. The counterpattern is the two-fanged vampire G0, which is itself 4-light and quite heavy. So the F1 Thm 2.9 / Lemma 5.6 interface cannot reach K7^- unchanged. This is a lemma-level method barrier, not a refutation of C65.
- **The new resource.** A K7^- version has a 5-unit density surplus: the sides of a 5-separation sum to >= m+8, against m+3 in F1.
- **Lemma D (proved).** A rooted K6↓5 on one side plus a 4-light side with positive 4-density gives K7^-.
- **H65.** The formulated heavy-side repair for the r = 1 sub-case, where G0 lives. Its payoff is conditional on the NOT PROMOTED Lemma 5.4 analogue. The barrier itself is proved only for a standalone lemma assuming just 4-light and quite heavy.

**Classifications.** Mathematical correction/demotion: NONE. Theorem-classification changes: NONE. Source-status changes: NONE (a register note for [Dvo26] v1 metadata). FL-066 is appended to the ledger.

**Successor.** Exactly one successor is installed: RL66 HC7-K7MINUS-HEAVY-SIDE-ROOTED-K6-GATE (authoritative/RL66_HC7_K7MINUS_HEAVY_SIDE_ROOTED_K6_GATE_BRIEF.md). It assesses C66 (= H65): every 4-light 5-rooted graph R with ρ4(R) >= m(R)+7 contains K6↓5 as a rooted minor.
- Bounds: at most 2 retrievals; computation 0; census 0; one candidate.
- No r >= 2 sub-cases and no second locus.

**Runner-up (not selected).** T2.9⁻ at the raised threshold ρ4 >= 2. It leaves the r = 1 sub-case containing G0 untouched, and Lemma 5.9's side is only known to be quite heavy. It would also mean re-running F1 §4, above Level A. Symmetrically, C66 leaves r >= 2 open.

**Drift caution.** C66 sits two levels below the documented K7^- target. If RL66 neither resolves C66 nor sharpens its first missing dependency, the next selection should weigh the RL70 audit and the cost of this lemma chain before continuing it.

The RL70 periodic audit is still owed.

Programme ACTIVE.

## 13. RL66 heavy-side rooted K6 outcome and RL67 successor

RL66 assessed C66 as one bounded new-mathematics candidate gate. C66 states that every 4-light 5-rooted R with ρ4(R) >= m(R)+7 has a rooted K6↓5 minor. Retrievals 0 of 2; computation 0; census 0.

**Findings.**
- **No falsifier found** among the tested members of the named families:
  - apex over planar (a threshold-necessity witness only);
  - two apices over planar, including root placements that block rooted K4 (its all-components-poor regime is NOT ASSESSED);
  - matching-attached blobs (one-directional reduction to a core of larger surplus);
  - copies of the two-fanged vampire G0, and K2,2,2,2.
- **C66 is OPEN.** It is not falsified. Its first missing dependency is a rooted extremal theorem forcing K6↓5 in the reduced core that the proved reduction lemmas (full packing, unique non-root neighbour, concentrated contacts) leave.
- **C66 over-asks.**
  - E66: a rooted K6↓5 in R is equivalent to a K7^- model of R + z' with {z'} a bag, and C66's threshold ρ4 >= m+7 is exactly C65's edge bound 4n − 2 for R + z'.
  - It implies C65 for 5-connected graphs with a degree-5 vertex (S66). That case is not established and is not used by U9 via B65. A standalone proof of C66 must settle it without the minimality available at the use-site.
  - The r = 1 payoff (P66b) needs only some K7^- in the proper minor S1 + z'.
- **Precision on U9 (B65⁷).** B65 applies C65 only to 7-connected graphs. U9 therefore stays CONDITIONAL. It needs only C65⁷ (C65 for 7-connected graphs with n >= 8; implied by C65) in place of C65, together with F1 Thm 1.6 at Level A. U9 is not certified.

**Classifications.** Mathematical correction/demotion: NONE. Theorem-classification changes: NONE. Source-status changes: NONE. FL-067 is appended to the ledger.

**Successor.** Exactly one successor is installed: RL67 HC7-K7MINUS-R1-MINIMALITY-TRANSFER-GATE (authoritative/RL67_HC7_K7MINUS_R1_MINIMALITY_TRANSFER_GATE_BRIEF.md). It assesses the candidate H67 (NOT ASSESSED): in the r = 1 configuration, the minor S1 + z' is 4-bilight. If H67 holds and G' precedes G in F1's minimality order (to be checked at R1), minimality would close the r = 1 sub-case without C66, conditional on the NOT PROMOTED H54⁻.
- Precondition: one sha-pinned F1 retrieval, to quote the 4-bilight definition.
- Bounds: at most 1 retrieval; computation 0; census 0; one candidate.

**Runner-up (not selected).** Continue C66 on its reduced core. It loses because S66 makes a standalone proof of C66 settle an unestablished case of C65 that U9 does not use via B65, and the payoff never uses its singleton-bag conclusion.

**Drift rule.** If H67 is assessed and fails or stays open, neither the RL68 nor the RL69 recommendation may extend the F1-interface lemma chain before the RL70 audit prices it.

The RL70 periodic audit is still owed.

Programme ACTIVE.

## 14. RL67 r = 1 minimality-transfer outcome and RL68 successor

RL67 assessed H67 as one bounded new-mathematics candidate gate. H67 states that the minor S1 + z' of the r = 1 configuration is 4-bilight. One retrieval (F1 v1 re-pinned, hashes unchanged); computation 0; census 0.

**Findings.**
- **F1's definitions quoted.** 4-bilight means no dense (≤4)-bifragment (F1.txt:383–387). Minimal counterexamples are lexicographic in (|V|, |E|) (F1.txt:1061–1065), so S1 + z' precedes G. F1 = arXiv:2609.17760v1 is an unrefereed preprint whose §1.1 (F1.txt:154–182) discloses AI-obtained proofs; it is used at Level A only.
- **H67 is OPEN.**
  - Its only obstruction is a root-split two-dense-halves configuration in the heavy side (Lemma R67).
  - Every H67 instance would refute (2.8⁻) and C66 (V67).
  - A 15-vertex counterpattern shows that H67 without K7^- -freeness is false. So excluding the configuration needs K7^- -freeness, or a minimality-derived hypothesis that the counterpattern violates. The counterpattern is weak, though: it contains K8 and is not edge-minimal, and it does not constrain a direct K7^- -forcing argument.
  - The minimality-assisted form is OPEN, and it is equivalent to closing r = 1 under H54⁻.
- **Correction C67-1.** The RL67 brief's falsification-condition remark is corrected (scope remark; not a theorem demotion).
- **Drift rule triggered.** The F1-interface lemma chain has produced two open repairs in a row (C66, H67). Neither RL68 nor RL69 may extend it before the RL70 audit prices it.

**Classifications.** Correction: C67-1 (scope remark). Theorem demotions: NONE. Theorem-classification changes: NONE. Source-status changes: NONE (F1 re-pinned). FL-068 is appended to the ledger.

**Successor.** Exactly one successor is installed: RL68 HC7-K7MINUS-SEVEN-CONNECTED-DENSITY-GATE (authoritative/RL68_HC7_K7MINUS_SEVEN_CONNECTED_DENSITY_GATE_BRIEF.md). It assesses C68 = C65⁷: every 7-connected graph with n >= 8 and at least 4n − 2 edges contains K7^- as a minor. By B65⁷ this is exactly the density input the B65⁷ route to U9 needs (sufficient; necessity not claimed), and it lies outside the F1-interface chain.
- First a falsification test on named 7-connected families.
- Then: proved / falsifier / open.
- Bounds: retrievals 0; computation 0; census 0; one candidate.

**Runner-up (not selected).** The S1 / Mader 7-connectivity Level-A source gate. It still has no consumer, and it carries FL-063 access risk and an attribution discrepancy.

**The RL70 periodic audit follows RL69.** It must price the F1-interface chain.

Programme ACTIVE.


## 15. RL68 seven-connected density outcome and RL69 successor

RL68 assessed C68=C65^7 directly outside the held F1-interface chain. C68 remains OPEN / CANDIDATE / NOT ESTABLISHED; no required named family falsified it.

RL68 proved the n=8,9 base cases, the contraction edge-count identity, the exact 7-connectivity contraction criterion, and R68: every edge with at most three common neighbours in a minimum-order C68 counterexample lies in a 7-separator. Q10=K10-E(P8) is an edge-tight relaxed stress test showing density+connectivity alone cannot force the desired edge.

The safe-edge formulation is equivalent to C68, not a strict reduction. Thus RL68 changed proof architecture without narrowing the HC7 residual. U1-U8 remain certified; U9 remains conditional.

Corrections/demotions: NONE. Theorem-classification changes: NONE. Source-status changes: NONE. FL-069 appended. Retrievals 0; computation 0; census 0.

Successor: RL69 HC7-K7MINUS-SAFE-CONTRACTION-GATE, one bounded mechanism gate on the equivalent safe-edge form. FL-068 drift rule still binds. Runner-up K6-minor augmentation loses because its density entry point naturally needs the unavailable Level-C Mader K6 extremal theorem.

RL70 follows RL69 and is the mandatory periodic audit. It must price the F1-interface chain.
Programme ACTIVE.
