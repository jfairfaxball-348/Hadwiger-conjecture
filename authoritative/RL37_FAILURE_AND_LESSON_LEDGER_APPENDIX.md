# FL-040 — fixed-endpoint nearest choice eliminates NONA overlap but leaves alternate-endpoint support outside the minimization

Date: 2026-10-04 Europe/Madrid.
Origin: RL37 bounded nearest-witness choice-refinement assessment.
Classification: method barrier accompanying proved scoped analytic RL37-P01; not a mathematical error, theorem demotion, source-status change, full-domain countermodel, or finite certificate.

Expectation tested: whether changing the monotone MISS closure so that w is nearest to C among the selected endpoint a's T-neighbors remains valid through saturation/final-blocker reconstruction and eliminates the refined overlap obstruction.

Actual observation: the modified closure, finite monotonicity, minimum-total-size saturation, final tree-leaf deletion blocker, and least-miss order interface all re-derive. In refined NEQ overlap, if x!=a then a is the nonshared endpoint and has an internal support z in I. Since z is strictly closer in Q to C than w, this contradicts fixed-endpoint nearest-witness choice. Hence refined overlap forces x=a.

First missing dependency: when x=a, the internal support forced by overlap lies on the other endpoint y of g. The RL37 rule minimizes only over N_H(a) intersect T, so the closer witness attached to y is not a competitor to w. In fact N_H(a) intersect T={w} in this surviving profile, making the fixed-endpoint minimization vacuous there.

Downstream effect: M3-NEAREST-WITNESS-OVERLAP is certified at the refined closure scope and the x!=a overlap subprofile is eliminated. M3-CORE remains not certified; m=3, A=S remains open; no named inherited universal mathematical obligation is genuinely reduced.

Surviving valid result: RL37-P01 supplies a fully audited nearest-witness closure and proves that any refined NEQ overlap must have x=a. All-SAT, EQ, refined DISJOINT, and refined overlap with x=a remain.

Lesson: witness-distance minimality only compares witnesses eligible under the endpoint-selection rule. To exploit a closer support on the alternate endpoint, endpoint selection itself must participate in the minimization; silently comparing across endpoints would strengthen the RL37 rule.

Retry condition: do not replay the fixed-endpoint nearest rule, endpoint-overlap audit, cyclic-order argument, another deletion/blocker, arbitrary-prefix coverage, cyclic-distance classification, or suspended m=2 chain. A changed retry may define and independently audit a global admissible endpoint-witness-pair minimization for each selected least miss.

Selected recovery: RL38 assesses exactly one global endpoint-witness-pair refinement. At each failed-coverage stage, after selecting the least cyclic miss g_k, choose (a_k,w_k) over both endpoints of g_k and their T_i* neighbors to minimize dist_Q(w_k,C_k). Re-establish every closure/saturation/final-blocker premise before testing whether any refined final overlap contradicts the global pair choice. Stop after the overlap test.

Sources/computation: zero new mathematical source retrieval and zero mathematical numerical computation.
Programme ACTIVE.
