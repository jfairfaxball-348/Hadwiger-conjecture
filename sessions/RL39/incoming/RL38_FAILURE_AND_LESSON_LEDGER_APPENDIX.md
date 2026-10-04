# FL-041 — global pair minimality eliminates overlap; the disjoint profile is deliberately unassessed by the RL38 bound

Date: 2026-10-04 Europe/Madrid.
Origin: RL38 bounded global nearest endpoint-witness pair refinement assessment.
Classification: bounded stopping barrier accompanying proved scoped analytic RL38-P01; not a mathematical error, theorem demotion, source-status change, full-domain countermodel, or finite certificate.

Expectation tested: whether minimizing witness distance over admissible pairs from both endpoints of each selected least miss remains valid through closure, saturation, and final-blocker reconstruction and eliminates the remaining refined overlap profile.

Actual observation: the global-pair closure, finite monotonicity, minimum-total-size saturation, final tree-leaf deletion blocker, and least-miss order interface all re-derive. In refined NEQ overlap, the nonshared endpoint y of g has an I-neighbor z. The pair (y,z) is eligible in W_{K-1} and z is strictly closer to C than w, contradicting global pair minimality. Hence refined NEQ overlap is impossible.

First unassessed residual: the RL38 brief required an immediate stop when the already named final blockers g,h are vertex-disjoint. Therefore RL38 did not test whether the same certified facts g<h, g missed by C, and g covered by C union I already force an eligible pair (y,z) with z in I strictly closer to C than w even without any overlap with h.

Downstream effect: M3-GLOBAL-NEAREST-PAIR-OVERLAP is certified at the new refined closure scope. M3-CORE remains not certified; m=3, A=S remains open; all-SAT, EQ, and refined DISJOINT survive the RL38 stopping rules. No named inherited universal mathematical obligation is genuinely reduced.

Surviving valid result: RL38-P01 supplies a fully audited global-pair closure and eliminates every refined NEQ overlap profile. The remaining refined NEQ case is exactly DISJOINT.

Lesson: the endpoint-overlap hypothesis was needed in RL36-RL37 to localize which endpoint had internal support, but under the RL38 global-pair rule the DISJOINT branch may no longer need such localization: any I-support of g would be eligible for the same distance comparison. This inference was not assessed in RL38 because its brief explicitly prohibited doing so.

Retry condition: do not rebuild the closure, choose new endpoints/witnesses, inspect another cyclic nonedge, classify cyclic distances, introduce another blocker, or return to the suspended m=2 chain. A changed bounded continuation may consume RL38-P01 and test only whether I-coverage of the already named disjoint g supplies a closer eligible final pair.

Selected recovery: RL39 performs exactly that DISJOINT support-versus-global-minimality audit and stops after the inference succeeds or fails. It does not investigate all-SAT or EQ.

Sources/computation: zero new mathematical source retrieval and zero mathematical numerical computation.
Programme ACTIVE.
