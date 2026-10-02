# RL21 work verification report

Date: 2026-10-02 Europe/Madrid.
Status: **bounded checkpoint verification; RL21 OPEN / NOT PROMOTED.**

BASE_HEAD was pinned as afd7414ab547adc3781b3ec67989464a6c9ce0d8 and matched the user-supplied expected predecessor. The base root tree is c06895ad32fd16ccc778f726b1a366e0a92b410c and the incoming authoritative subtree is 3fbb6642475e282f7a084c11f4ddb1dea143110c. RL21 was confirmed unique: authoritative/START_HERE.md names RL21 and its sole brief, sessions/RL21 is absent, no pre-existing rl21 work branch existed at startup, and main contained no RL21 work checkpoint. No active integrity failure was found: the RL20 correction/demotion record is NONE and the promoted RL20 verification/proof-state records preserve all inherited scopes.

Same-worker analytic verification checked:

1. If |T_1|=1, no non-root leaf x!=p exists on the fixed side, so the prescribed gate cannot start without violating the no-switch instruction.
2. For |T_1|>=2, deleting one non-root spanning-tree leaf leaves B nonempty and connected and preserves p, hence preserves the fixed joining edge pq to T_2.
3. If B were a resource, {B,T_2} would be a valid size-two family of strictly smaller total size. One use of the minimum-total-size tie-breaker therefore forces B to fail cyclic coverage.
4. For the one selected defect e=ab, B sees neither endpoint. T_1 being a resource forces x to see at least one endpoint; T_2 being a resource forces T_2 to see at least one endpoint; U being S-complete forces every endpoint to be seen by x or T_2. These are exactly X!=empty, Y!=empty, X union Y={a,b}, giving seven patterns.
5. Because p is in B, p sees neither a nor b; pq itself adds no S-incidence conclusion about q.
6. In patterns X={a,b},Y={a} and X={a,b},Y={b}, choose one star edge f disjoint from e and one actual minor coloring c. Recoloring the endpoint missed by T_2 to the other endpoint's color is safe on S because e is a nonedge and safe on U because its only U-neighbor is x, which is adjacent to the target-color endpoint in the original proper coloring. This yields five colors on S.
7. In the other five patterns, the endpoint-repair data do not force T_2 target-color exclusion. The local incidence/color pattern with distinct one-sided T_2 neighbors carrying the opposite endpoint colors is a method-barrier witness only, not a full C_7 realization.

No formal prover, independent reviewer, graph census, numerical search, new source query, or new source open was used. No named mathematical obligation is reduced. Candidate RL21-P01/P02 and FL-024 remain unpromoted until normal closeout.
