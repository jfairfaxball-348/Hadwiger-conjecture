# RL33 monotone cyclic-miss closure brief

Status: READY / NOT STARTED.
Scope: exactly one bounded recovery from RL32-P01 / FL-035.
Programme ACTIVE.

Follow AGENTS.md, authoritative/START_HERE.md, docs/RESEARCH_RECOVERY_PROTOCOL.md, authoritative/RL32_PROOF_STATE_AND_RESIDUAL_LEDGER.md, authoritative/RL32_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and the frozen RL32 incoming provenance named by START_HERE.md. In particular preserve RL31-P01 from sessions/RL32/incoming/RL31_M3_TERMINAL_CORE_RESOURCE_FAMILY_EXCHANGE_REPORT.md and the original RL32 choice discipline from sessions/RL32/incoming/RL32_FIRST_MISS_WITNESS_AUGMENTED_TERMINAL_CORE_BRIEF.md.

Keep full sharp Hadwiger as the root:

    h(G) >= chi(G)

for EVERY finite simple graph. Either a complete rigorous proof or an actual rigorously verified finite counterexample is legitimate.

Retain exactly the RL31 full C_7 cyclic degree-seven m=3, A=S setup, the same maximum minimum-total family F={T_1,T_2,T_3}, the same three fixed joining edges, terminal endpoints s_i,t_i, spanning trees Q_i, and terminal cores R_i. Preserve RL32-P01 exactly. Do not import the suspended RL21-RL29 m=2 choices.

Execute exactly one bounded fixed-side monotone cyclic-miss closure assessment.

1. If the RL31 obstruction profile is all-SAT, record the all-SAT profile and STOP. Do not invent a substitute candidate.
2. Otherwise let i* be the least index with the RL31 MISS_i*(g_i*) coordinate. Work only on T_i* with its already fixed Q_i* and R_i*.
3. Set C_0=R_i*.
4. For k=0,1,... while C_k fails exact cyclic resource coverage:
   - choose the least cyclic nonedge in the inherited cyclic order whose endpoints both miss C_k;
   - because T_i* is a resource, fix exactly one endpoint a_k having one actual neighbor w_k in T_i*;
   - necessarily w_k is outside C_k;
   - in Q_i*, let P_k be the unique path from w_k to the first vertex of C_k;
   - define C_{k+1}=C_k union V(P_k).
5. The selected cyclic nonedge must become covered after that step and all previously covered cyclic nonedges must remain covered. Therefore no cyclic nonedge may be selected twice. Stop after at most seven augmentations.
6. When exact cyclic coverage first passes, audit the replacement family
       F^closure = {C_k} union {T_j:j!=i*}
   in this order:
   (a) nonempty/exterior;
   (b) disjointness;
   (c) connectedness;
   (d) exact cyclic resource coverage;
   (e) preservation of the three original fixed joining edges;
   (f) strict size C_k proper subset T_i*.
7. Invoke minimum total size only if all family-validity gates and strictness are certified.

Exact target M3-MISS-CLOSURE: prove that the bounded monotone closure reaches exact resource coverage after at most seven distinct miss repairs, and determine the forced retained outcome. If the final closure is strict, F^closure contradicts minimum total size. If strictness fails, record C_k=T_i*.

Do not choose another MISS side, joining edge, spanning tree, original core, coloring, or family. Do not enter m=4. Do not return to the suspended m=2 chain. No broad graph, coloring or list census. New mathematical source retrieval and numerical computation are zero by default.

Checkpoint the exact frontier, state explicitly whether any named mathematical obligation is genuinely reduced, preserve any failure lesson and retry condition, and recommend continue or finish under AGENTS.md.
