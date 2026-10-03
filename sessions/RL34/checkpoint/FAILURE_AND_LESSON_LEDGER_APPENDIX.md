# FL-037 — final saturation deletion preserves connectivity but forces a leaf-critical coverage blocker

Date: 2026-10-03 Europe/Madrid.
Origin: RL34 bounded final-saturation leaf-blocker assessment.
Classification: method barrier accompanying proved scoped analytic RL34-P01; not a mathematical error, theorem demotion, source-status change, full-domain countermodel, or finite certificate.

Expectation tested: whether forced saturation C_K=T_i* makes the final attachment endpoint w_{K-1} deletable so that T_i*-{w_{K-1}} remains a strict resource and yields the minimum-total-size contradiction.

Actual observation: saturation and the fixed-tree construction force w_{K-1} to be a leaf of Q_i*, so deletion preserves connectivity, nonempty/exterior status, disjointness, all three fixed joining edges, and strict size. Therefore exact cyclic resource coverage must fail after deletion. For the least failed cyclic nonedge h, both endpoints have no T_i* neighbor outside w_{K-1}, and at least one endpoint is adjacent to w_{K-1}. If h equals the final selected miss g_{K-1}, that miss is itself leaf-critical. If h differs from g_{K-1}, then g_{K-1} is repaired before the leaf by an internal off-core vertex of P_{K-1}, while the later h is supported only at the leaf in the exact weak sense recorded by RL34-P01. Neither profile is contradictory under the retained premises.

First missing dependency: an incompatibility between one of these two leaf-critical blocker profiles and the inherited cyclic-order / first-coverage-passing structure.

Downstream effect: M3-SATURATION-LEAF-BLOCKER is certified, but M3-CORE remains not certified; m=3, A=S is not excluded; no named inherited universal mathematical obligation is reduced.

Surviving valid result: RL34-P01 proves the final tree-leaf/deletion-connectivity structure and the exact forced blocker dichotomy.

Lesson: minimum total size can force a specific vertex to be coverage-essential even when it is dispensable for connectivity and the fixed joining edges. The obstruction has moved from resource geometry to interface coverage concentrated at one leaf.

Retry condition: do not repeat deletion with another vertex, side, tree, path, family, or automatically return to the suspended m=2 chain. A changed retry must exploit the exact RL34 blocker h, its relation to g_{K-1}, and the inherited least-miss/first-passing cyclic order.

Selected recovery: RL35 performs at most two symbolic profile audits, h=g_{K-1} and h!=g_{K-1}, using only the retained final leaf, the two named cyclic nonedges, their forced support locations, and the inherited cyclic order. No broad seven-nonedge subset census is allowed.

Sources/computation: zero new mathematical source retrieval and zero mathematical numerical computation.
Programme ACTIVE.
