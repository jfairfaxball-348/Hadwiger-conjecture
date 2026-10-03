# FL-038 — cyclic order identifies the first leaf-dependent miss but first-passing gives no arbitrary-prefix contradiction

Date: 2026-10-03 Europe/Madrid.
Origin: RL35 bounded leaf-critical blocker cyclic-order assessment.
Classification: method barrier accompanying proved scoped analytic RL35-P01; not a mathematical error, theorem demotion, source-status change, full-domain countermodel, or finite certificate.

Expectation tested: whether the inherited least-miss rule and first coverage-passing stage eliminate either RL34 leaf-critical blocker profile or force a stronger endpoint-contact statement.

Actual observation: writing I=V(P)\(C union {w}) gives T-{w}=C union I. The final selected miss g is min M(C), while the deletion blocker h is min M(C union I). Hence h is exactly the earliest miss of C not repaired by I. In EQ, g=h survives I and is rescued only at w; the fixed endpoint a has unique T-neighbor w, but the other endpoint is not forced either to meet or miss w. In NEQ, every C-miss before h is repaired by I, including g, and h is the first miss whose coverage waits for w. Neither profile contradicts first-passing because first-passing compares the actual closure stages C and T, not arbitrary intermediate subsets such as T-{w}.

First missing dependency: a new relation between the named blocker endpoints and their forced support locations that is not supplied by cyclic order or first-passing alone.

Downstream effect: M3-LEAF-BLOCKER-ORDER is certified as an exact order-localization statement, but M3-CORE remains not certified; m=3, A=S is not excluded; no named inherited universal mathematical obligation is reduced.

Surviving valid result: RL35-P01 localizes h as the first C-miss not internally repaired and preserves the exact EQ/NEQ profiles without strengthening the weak RL34 leaf-contact statement.

Lesson: a stage-level first-passing assertion cannot be silently promoted to a prefix-by-prefix coverage rule. Cyclic order records which miss is repaired where, but by itself does not control which endpoint supplies that repair.

Retry condition: do not repeat the cyclic-order argument, deletion, or path-prefix rhetoric without a new interface relation. Do not inspect arbitrary subsets of the other five cyclic nonedges. A changed retry must use a concrete relation among the already named g,h endpoints and their forced support locations.

Selected recovery: RL36 audits only the endpoint-overlap relation of the already named distinct pair g,h in NEQ. If they are disjoint, record that profile and stop. If they share an endpoint, test whether h's lack of T-{w} support forces the internal support of g onto its other endpoint and whether that interacts with the fixed endpoint a or yields a contradiction. EQ is recorded and stopped.

Sources/computation: zero new mathematical source retrieval and zero mathematical numerical computation.
Programme ACTIVE.
