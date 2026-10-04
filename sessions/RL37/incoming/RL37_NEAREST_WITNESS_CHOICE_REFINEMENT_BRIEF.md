# RL37 nearest-witness choice-refinement brief

Status: READY / NOT STARTED.
Scope: one bounded recovery from RL36-P01 / FL-039. Programme ACTIVE.

Follow AGENTS.md, authoritative/START_HERE.md, docs/RESEARCH_RECOVERY_PROTOCOL.md, authoritative/RL36_PROOF_STATE_AND_RESIDUAL_LEDGER.md, authoritative/RL36_FAILURE_AND_LESSON_LEDGER_APPENDIX.md, and the RL36 incoming provenance named there. Preserve RL35-P01/FL-038, RL34-P01/FL-037, RL33-P01/FL-036, RL32-P01/FL-035, RL31-P01/FL-034, and the RL30 audit exactly.

Keep full sharp Hadwiger as the root:

    h(G) >= chi(G)

for EVERY finite simple graph. Either a complete rigorous proof or an actual rigorously verified finite counterexample is legitimate.

Preserve RL36-P01 exactly at its original arbitrary fixed-choice scope. Do not silently reinterpret the inherited witness w as nearest, minimal, or canonical.

RL36 certifies M3-NAMED-BLOCKER-OVERLAP only as a branchwise endpoint-support localization. In NEQ, if the already named g,h overlap at x, the nonshared endpoint of g is forced to have an I-neighbor. If x=a, then N_H(a) intersect T={w} and a is a certified w-contact endpoint of h. If x!=a, then a is the internally supported endpoint and also has the retained edge aw. Neither profile is contradictory under the inherited arbitrary witness choice.

Execute exactly one bounded changed-choice assessment.

Retain the same RL31 m=3, A=S starting configuration, maximum minimum-total family F={T_1,T_2,T_3}, fixed joining edges, terminal endpoints, spanning trees Q_i, terminal cores R_i, and least-index MISS-side discipline. Define a NEW candidate closure, separate from the already proved RL33 fixed-choice closure:

- at each failed-coverage stage C_k, choose the least cyclic nonedge g_k missed by C_k as before;
- fix one admissible endpoint a_k of g_k having a neighbor in T_i*;
- among N_H(a_k) intersect T_i*, choose w_k minimizing Q_i*-distance to C_k;
- let P_k be the unique Q_i* path from w_k to the first vertex r_k of C_k;
- put C_{k+1}=C_k union V(P_k).

This nearest-witness rule is a candidate input, not inherited mathematics. Audit it in the following order and STOP at the first failed gate.

1. Verify that every executed step is well-defined, repairs g_k, preserves earlier cyclic coverage, and keeps C_k connected and contained in T_i*.
2. Verify that the finite seven-nonedge monotonicity argument still forces a first exact-coverage stage K<=7.
3. At that first passing stage, re-audit the replacement-family gates and determine whether minimum total size again forces C_K=T_i*. If not, record the exact obstruction and STOP.
4. Only if saturation is re-established, re-derive the final path/leaf deletion blocker and the least-miss order localization needed to define the refined final data C,T,Q,P,g,a,w,h and I=V(P)\(C union {w}). Do not import RL34/RL35 final-blocker conclusions without rechecking their premises under the changed closure.
5. If the RL31 profile is all-SAT, record and STOP. If the refined final profile is EQ, h=g, record it and STOP.
6. Only in refined NEQ, determine whether the already named final g,h are disjoint or overlap. If disjoint, record and STOP.
7. If they overlap at x, use only the certified endpoint-support inference: x has no I-neighbor and the nonshared endpoint of g has an I-neighbor. Compare only x=a versus x!=a.
8. Exact target inference: if x!=a, then a is the nonshared endpoint and has a neighbor z in I. Because z lies internally on the Q-path from w to C, audit whether z is strictly closer in Q to C than w, contradicting the nearest-witness definition of w. If this inference is certified, record that refined overlap forces x=a. STOP there. Do not seek a further contradiction in RL37.

Target M3-NEAREST-WITNESS-OVERLAP: determine whether the nearest-witness refinement is itself valid through saturation/final-blocker reconstruction and, if so, whether it eliminates only the refined x!=a overlap profile.

Do not choose another MISS side, family, spanning tree, terminal core, joining edge, deletion vertex, blocker beyond the refined final h, or coloring. Do not inspect arbitrary other cyclic nonedges or classify cyclic distances. Do not enter m=4 or return to the suspended m=2 chain. No broad graph, coloring, list, neighborhood-subset, or seven-nonedge census. New mathematical source retrieval and numerical computation are zero by default.

Checkpoint the exact frontier, state explicitly whether any named mathematical obligation is genuinely reduced, preserve any failure lesson and retry condition, and recommend continue or finish under AGENTS.md.
