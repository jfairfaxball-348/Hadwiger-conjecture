# RL37 proof state and residual ledger

Status: CLOSED/FROZEN.
Root: h(G) >= chi(G) for every finite simple graph.

## Promoted scoped result

**RL37-P01 — proved scoped analytic mathematics plus bounded stopping conclusion, same-worker review only.** At the new RL37 nearest-witness refinement of the retained RL31 m=3, A=S setup:

- after the least missed cyclic nonedge g_k and one admissible endpoint a_k are fixed, choosing w_k in N_H(a_k) intersect T_i* to minimize Q_i*-distance to C_k is well-defined;
- the resulting augmentation preserves Q-connectedness, containment, earlier coverage, and repairs g_k;
- finite monotonicity yields a first exact-coverage stage K<=7;
- the replacement-family gates and the three original fixed joining edges re-audit successfully, so minimum total size forces C_K=T_i*;
- the final path/leaf deletion blocker and least-miss order interface re-derive under the changed choice rule;
- all-SAT and EQ remain stopping profiles;
- in refined NEQ, a vertex-disjoint final pair g,h remains a stopping profile;
- if refined NEQ g,h overlap at x, the nonshared endpoint of g has an I-neighbor while x has none;
- if x!=a, then a is the nonshared endpoint and has a neighbor z in I, with dist_Q(z,C)<dist_Q(w,C), contradicting the nearest-witness definition of w;
- therefore refined overlap forces x=a.

Thus M3-NEAREST-WITNESS-OVERLAP is CERTIFIED at this exact new candidate-closure scope. It does not retroactively strengthen RL33-RL36.

## Open obligations

M3-CORE remains NOT CERTIFIED. The m=3, A=S configuration remains open.
All-SAT, EQ, refined DISJOINT, and refined overlap with x=a remain surviving profiles.
No named inherited universal mathematical obligation is genuinely reduced.
Correction/demotion: NONE.

Preserve RL36-P01/FL-039, RL35-P01/FL-038, RL34-P01/FL-037, RL33-P01/FL-036, RL32-P01/FL-035, RL31-P01/FL-034, the RL30 audit and FL-033, all RL20-RL29 valid restricted results, and earlier source/certificate limits exactly. The RL21-RL29 m=2 chain remains suspended.

## Exact successor frontier

RL38 may assess one further changed-choice candidate: for each selected least miss g_k, choose an admissible endpoint-witness pair (a_k,w_k) globally minimizing Q_i*-distance from w_k to C_k over both endpoints of g_k and all their T_i* neighbors. This candidate is not part of RL37-P01 and must independently re-establish closure, saturation, and the final blocker/order interface. Only then may it test whether the surviving refined overlap x=a is eliminated because the nonshared endpoint has an internal support vertex strictly closer to C than the selected w.

Programme ACTIVE.
