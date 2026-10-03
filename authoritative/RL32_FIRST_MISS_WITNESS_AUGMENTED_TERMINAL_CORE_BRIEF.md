# RL32 first-MISS witness-augmented terminal-core brief

Status: READY / NOT STARTED.
Scope: exactly one bounded recovery from RL31-P01 / FL-034.
Programme ACTIVE.

Follow AGENTS.md, authoritative/START_HERE.md, docs/RESEARCH_RECOVERY_PROTOCOL.md, authoritative/RL31_PROOF_STATE_AND_RESIDUAL_LEDGER.md, authoritative/RL31_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and the frozen RL31 incoming provenance named by START_HERE.md.

Keep full sharp Hadwiger as the root:

    h(G) >= chi(G)

for EVERY finite simple graph. Either a complete rigorous proof or an actual rigorously verified finite counterexample is legitimate.

Retain exactly the RL31 full C_7 cyclic degree-seven m=3, A=S setup, the same maximum minimum-total family F={T_1,T_2,T_3}, the same three fixed joining edges, the same terminal endpoints s_i,t_i, the same spanning trees Q_i, and the same terminal cores R_i.

Do not import the suspended RL21-RL29 m=2 choices.

RL31-P01 gives, for each side, either SAT_i (R_i=T_i after coverage passes) or MISS_i(g_i), where one recorded cyclic nonedge g_i has both endpoints missing R_i.

Execute exactly one candidate:

1. If all three sides are SAT, record the all-SAT profile and STOP. Do not invent another candidate.
2. Otherwise let i* be the least index with MISS_i*(g_i*).
3. Since T_i* is a resource while both endpoints of g_i* miss R_i*, fix exactly one endpoint a of g_i* having an actual neighbor w in T_i*; necessarily w is outside R_i*. Fix exactly one such edge aw.
4. In Q_i*, let P be the unique path from w to the first vertex r of R_i*. Define
       R_i*^+ = R_i* union V(P).
5. Audit only
       F^+ = {R_i*^+} union {T_j : j != i*}
   in this exact order:
   (a) nonempty/exterior;
   (b) disjointness;
   (c) connectedness;
   (d) exact cyclic resource coverage;
   (e) preservation of the three original fixed joining edges;
   (f) strict size R_i*^+ proper subset T_i*.
6. Invoke minimum total size only if all family-validity gates and strictness pass.

Exact target M3-WITNESS-AUGMENT: certify that the one forced witness augmentation is a strict resource, yielding a smaller cardinality-three family and contradicting minimum total size.

If the target is not certified, stop at the first failed gate. At a coverage failure record exactly one cyclic nonedge whose endpoints both miss R_i*^+. At strictness failure record R_i*^+=T_i*. Do not choose another MISS side, endpoint-neighbor edge, tree path, joining edge, core, coloring, or family.

No m=4. No broad graph/coloring/list census. New mathematical source retrieval and numerical computation are zero by default.

Checkpoint exact scope, whether any named mathematical obligation is genuinely reduced, the failure lesson/retry condition if blocked, and recommend continue or finish under AGENTS.md.
