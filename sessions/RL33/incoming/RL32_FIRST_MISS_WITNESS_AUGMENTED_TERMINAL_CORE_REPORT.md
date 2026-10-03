# RL32 first-MISS witness-augmented terminal-core report

Date: 2026-10-03 Europe/Madrid.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the retained RL31 full C_7 cyclic degree-seven m=3, A=S setup and the one RL32 candidate authorized by the incoming brief.

## Result RL32-P01 — selected-MISS repair and second obstruction dichotomy

Retain RL31-P01, the same maximum minimum-total family F={T_1,T_2,T_3}, the same fixed joining edges, terminal endpoints, spanning trees Q_i and terminal cores R_i.

If the RL31 obstruction profile is all-SAT, RL32 has no candidate and stops exactly as required.

Otherwise let i* be the least coordinate with MISS_i*(g_i*). Fix exactly one endpoint a of g_i* with an actual neighbor w in T_i*, fix the edge aw, let P be the unique Q_i* path from w to the first vertex r of R_i*, and put R_i*^+ = R_i* union V(P).

Then:
1. R_i*^+ is nonempty and exterior because R_i* is nonempty exterior and R_i*^+ is a subset of T_i*.
2. R_i*^+ is disjoint from the other two resources because it is a subset of T_i*.
3. H[R_i*^+] is connected: H[R_i*] is connected, P is an H[T_i*]-path, and P meets R_i* at r.
4. The selected old miss g_i* is repaired. Its endpoint a has the neighbor w in R_i*^+. Every cyclic nonedge already covered by R_i* remains covered because R_i* is a subset of R_i*^+.
5. Exact cyclic resource coverage is nevertheless not forced by the retained premises. If it fails, choose exactly one cyclic nonedge g_i*^(2) whose endpoints both miss R_i*^+. Necessarily g_i*^(2) != g_i*.
6. If exact cyclic resource coverage passes, all three original fixed joining edges are preserved because R_i* is a subset of R_i*^+ and contains the two fixed terminal endpoints on side i*. If additionally R_i*^+ is a strict subset of T_i*, then F^+={R_i*^+} union {T_j:j!=i*} is a valid cardinality-three partial resource family with smaller total size, contradicting the defining minimum-total-size choice.

Therefore every retained non-all-SAT configuration stops after the one forced augmentation in exactly one of two ways:
- **REMISS_i*(g_i*^(2))**: gate 4 fails at a cyclic nonedge different from the selected RL31 miss; or
- **AUGSAT_i***: gate 4 passes and minimum total size forces R_i*^+=T_i*.

Classification: proved scoped analytic mathematics, same-worker review only. No formal proof checker, external independent certification, source upgrade, or novelty claim.

## M3-WITNESS-AUGMENT target

M3-WITNESS-AUGMENT is NOT CERTIFIED. One forced witness path repairs the selected miss but need not repair every other cyclic coverage defect, and the coverage-passing branch may saturate the whole resource.

This is a bounded proof-mechanism stopping result, not a graph counterexample and not a counterexample to the target as a universally quantified statement.

## Obligation accounting

No named inherited universal mathematical obligation is genuinely reduced. The m=3, A=S branch remains open. M3-CORE remains not certified. The RL21-RL29 m=2 chain and RL29 one-coloring recovery remain preserved but suspended under RL30/FL-033. m=1, m=4, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order seven, higher orders, and full sharp Hadwiger remain open at their recorded scopes.

Correction/demotion: NONE.

## Bounds and sources

Exactly one witness-augmented candidate was assessed symbolically. No second MISS side, second witness edge, alternate path, joining edge, spanning tree, core, coloring, family, m=4 work, broad census, new mathematical source retrieval, or mathematical numerical computation occurred.

Programme ACTIVE.
