# FL-062 — direct spanning side-chromatic sum is incompatible with every actual 7-chromatic domain member; suspend the spanning K4,4 coloring route

Date: 2026-10-06.
Origin: RL61 HC7 K4,4 spanning side-chromatic-sum gate.
Classification: analytic method barrier / route-suspension lesson; not a mathematical error, theorem demotion, source-status change, certified HC7 counterexample, finite certificate, or certified-domain falsification of the RL61 candidate.

Expectation tested: HC7-K44-SPANNING-SIDE-CHROMATIC-SUM proposed that for every hypothetical minor-minimal HC7 counterexample G on the delta(G)>=8 residual and every globally minimum-total-size spanning K4,4 model M, with side-unions A and B partitioning V(G),

    chi(G[A]) + chi(G[B]) <= 6.

Actual observation: for every finite graph G and every partition V(G)=A disjoint-union B,

    chi(G) <= chi(G[A]) + chi(G[B]),

because proper colorings of G[A] and G[B] can be relabeled to use disjoint palettes and then combined. Therefore every actual member of the RL61 domain, which by hypothesis has chi(G)=7, satisfies

    chi(G[A]) + chi(G[B]) >= 7.

The proposed <=6 bound can therefore hold universally on the stated counterexample domain only vacuously, i.e. only if that spanning counterexample subcase has already been eliminated by an independent argument. It is not an independent structural invariant from which the elimination can be obtained.

Certified-domain status: HC7-K44-SPANNING-SIDE-CHROMATIC-SUM remains CANDIDATE / NOT ESTABLISHED and is not certified-domain falsified, because no genuine minor-minimal HC7 counterexample in the exact domain has been exhibited. The analytic inequality above is a method barrier showing that any actual domain member would violate the candidate.

Surviving valid scope: SRC-0025, RL55-P01, RL56-P01, and the exact non-establishment classifications of RL56-C01, RL57-C01, RL58-C01 and RL59-C01 remain unchanged. The spanning U=V(G) subcase and the broader delta(G)>=8 residual remain open.

Downstream effect: no HC7-universal obligation was reduced. The spanning K4,4 coloring route is suspended, including both the RL59 quotient-palette lift and the RL61 direct side-chromatic-sum reformulation.

First missing dependency: a genuinely independent non-color-lift structural mechanism that eliminates or transforms the spanning minimum-total-size K4,4 subcase. Rephrasing the desired contradiction as a side-palette or side-chromatic upper bound does not supply that mechanism.

Correction/demotion: NONE.
Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.

Retry condition: do not revisit the spanning K4,4 coloring route through quotient colors, disjoint-palette counts, side-color bounds whose payoff is the same disjoint-palette contradiction, branch-set color catalogues, RL57 degree counting, or RL56 exterior escape. Reopen the route only with a genuinely non-color-lift structural mechanism.

Selected successor: RL62 HC7-CRITICAL-7-CONNECTIVITY-GATE, a root-universal structural candidate outside the suspended spanning-coloring interface.
Programme ACTIVE.
