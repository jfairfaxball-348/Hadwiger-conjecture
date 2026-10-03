> **RL21 CLOSED/FROZEN.** This was the prepared recovery at the final RL21 checkpoint. It is installed, without mathematical execution during closeout, as the sole RL22 task in RL22_FIXED_DEFECT_TARGET_COLOR_BLOCKER_BRIEF.md.

# Prepared recovery after RL21 checkpoint

Status: **candidate recovery only; NOT STARTED / NOT PROMOTED.**

RL21 stops because five of the seven selected-defect repair patterns do not force either one-endpoint recoloring to be safe against T_2.

A changed bounded candidate is a **fixed-defect target-color blocker gate**.

Retain the same full C_7 m=2, A=S setup, one fixed joining edge pq, one fixed non-root leaf deletion on T_1, and one selected defect e=ab from RL21-P01. Work only in one of the five unresolved repair patterns. Choose exactly one cyclic star edge f disjoint from e and exactly one actual pulled-back six-coloring c. Put alpha=c(a), beta=c(b), and define only

    Z_a = {t in N_H(a) intersect T_2 : c(t)=beta},
    Z_b = {t in N_H(b) intersect T_2 : c(t)=alpha}.

Account separately for x when x is adjacent to only one endpoint.

Test exactly one changed mechanism: whether properness plus connectedness/resource structure of T_2 and the fixed joining edge pq force Z_a=empty or Z_b=empty. If both blocker sets can survive, record the first exact compatibility witness/barrier and stop.

Do not prune T_2, switch resource sides, choose a second coloring, use a second defect or leaf, invoke m=1 private-endpoint/Kempe structure, attempt a smaller-family mechanism, or start m=3/m=4 in the same unit.

This candidate changes the information level from RL21's endpoint-incidence classification to one fixed source coloring and its target-color blockers. It remains unproved and is not authority for a successor session until normal RL21 closeout installs a successor brief.
