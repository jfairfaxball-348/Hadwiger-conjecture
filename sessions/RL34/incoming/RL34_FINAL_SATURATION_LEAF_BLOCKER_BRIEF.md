# RL34 final saturation leaf-blocker brief

Status: READY / NOT STARTED.
Scope: exactly one bounded recovery from RL33-P01 / FL-036.
Programme ACTIVE.

Follow AGENTS.md, authoritative/START_HERE.md, docs/RESEARCH_RECOVERY_PROTOCOL.md, authoritative/RL33_PROOF_STATE_AND_RESIDUAL_LEDGER.md, authoritative/RL33_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and the frozen RL33 incoming provenance named by START_HERE.md. In particular preserve RL32-P01 and RL31-P01 at their exact scopes and preserve the original RL33 choice discipline from sessions/RL33/incoming/RL33_MONOTONE_CYCLIC_MISS_CLOSURE_BRIEF.md.

Keep full sharp Hadwiger as the root:

    h(G) >= chi(G)

for EVERY finite simple graph. Either a complete rigorous proof or an actual rigorously verified finite counterexample is legitimate.

Retain exactly the same RL31/RL32/RL33 full C_7 cyclic degree-seven m=3, A=S setup, the same maximum minimum-total family F={T_1,T_2,T_3}, the same three fixed joining edges, terminal endpoints s_i,t_i, spanning trees Q_i, terminal cores R_i, and the same RL33 least-index MISS side and closure sequence when that branch exists.

Preserve RL33-P01 exactly:

- if the RL31 obstruction profile is all-SAT, there is no MISS candidate;
- otherwise the monotone closure reaches exact cyclic resource coverage after at most seven distinct repairs;
- at its first coverage-passing stage K, minimum total size forces C_K=T_i*.

Do not import the suspended RL21-RL29 m=2 choices.

Execute exactly one bounded final-saturation leaf-blocker assessment.

1. If the RL31 obstruction profile is all-SAT, record the all-SAT profile and STOP. Do not invent a substitute candidate.
2. Otherwise retain the exact RL33 closure sequence and its first coverage-passing index K>=1. Let:
   - g_{K-1} be the final selected cyclic nonedge missed by C_{K-1};
   - a_{K-1} be the already fixed endpoint used by RL33;
   - w_{K-1} be its already fixed neighbor in T_i*;
   - r_{K-1} be the first vertex of C_{K-1} on the already fixed Q_i* path;
   - P_{K-1} be that path.
3. Using only RL33-P01 and the fixed-tree definitions, first prove or reject the structural claims needed for deletion. In particular audit whether
       T_i* = C_{K-1} union V(P_{K-1})
   implies that w_{K-1} is a leaf of the relevant Q_i* attachment and that H[T_i*\{w_{K-1}}] is connected. Do not consume either claim before proving it.
4. If deletion connectivity fails, record the first failed claim and STOP.
5. If it passes, audit exactly one replacement family
       F^- = {T_i*\{w_{K-1}}} union {T_j:j!=i*}
   in this order:
   (a) nonempty/exterior;
   (b) disjointness;
   (c) connectedness;
   (d) exact cyclic resource coverage;
   (e) preservation of the three original fixed joining edges;
   (f) strict size.
6. Do not invoke minimum total size until all family-validity gates and strictness are certified.
7. If gate (d) fails, choose exactly the least cyclic nonedge h in the inherited cyclic order whose endpoints both miss T_i*\{w_{K-1}}. Because T_i* is a resource, determine exactly what adjacency to w_{K-1} is forced. Then assess only the dichotomy
       h = g_{K-1}
   or
       h != g_{K-1}.
   Do not choose a second deletion vertex or another side.
8. If gate (d) passes, the strict replacement family contradicts minimum total size; record that outcome exactly.

Exact target M3-SATURATION-LEAF-BLOCKER: certify the strongest valid final-leaf blocker statement and determine whether the equality/non-equality relation between h and the final selected miss yields a contradiction or a new retained obstruction.

Do not choose another MISS side, joining edge, spanning tree, original core, closure sequence, coloring, family, or deletion vertex. Do not enter m=4. Do not return to the suspended m=2 chain. No broad graph, coloring or list census. New mathematical source retrieval and numerical computation are zero by default.

Checkpoint the exact frontier, state explicitly whether any named mathematical obligation is genuinely reduced, preserve any failure lesson and retry condition, and recommend continue or finish under AGENTS.md.
