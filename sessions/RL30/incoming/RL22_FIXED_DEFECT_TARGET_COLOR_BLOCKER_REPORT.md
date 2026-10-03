# RL22 fixed-defect T_2 target-color blocker assessment

Date: 2026-10-02 Europe/Madrid.
Status: bounded analytic work complete; RL22 OPEN / NOT PROMOTED.

## Exact fixed scope

Retain the full C_7 cyclic degree-seven domain and the RL21 non-singleton m=2, A=S fixed-choice interface. Keep the fixed family {T_1,T_2}, fixed joining edge pq, fixed rooted spanning tree on T_1, fixed non-root leaf x, B=T_1-{x}, and fixed selected defect e=ab with

    N_H(a) intersect B = N_H(b) intersect B = empty.

Select only RL21 repair pattern 1:

    X={a}, Y={b}.

Therefore

    xa in E(H), xb notin E(H),
    N_H(a) intersect T_2 = empty,
    N_H(b) intersect T_2 != empty.

Fix exactly one cyclic nonedge f disjoint from e and exactly one actual six-coloring c pulled back from the permitted original-G star minor for f. Because f is disjoint from e, a and b are singleton color classes on S. Set

    alpha=c(a), beta=c(b), alpha!=beta.

Define exactly

    Z_a={t in N_H(a) intersect T_2 : c(t)=beta},
    Z_b={t in N_H(b) intersect T_2 : c(t)=alpha}.

No second coloring, repair pattern, defect, leaf, tree, joining edge or resource side is considered.

## Blocker-set verdict

Pattern 1 itself forces

    N_H(a) intersect T_2 = empty.

Hence, independently of the internal structure or coloring of T_2,

    Z_a = empty.                                               (1)

No corresponding conclusion for Z_b follows from the selected repair pattern. Connectedness/resource coverage of T_2 and the fixed joining edge pq are not needed for (1), and they do not alter it.

Thus the RL22 blocker gate has a positive answer in this one fixed pattern: at least one target-color blocker set is forced empty.

## Corresponding one-endpoint recoloring test

Test only the recoloring corresponding to (1): keep c on every vertex of H[S union U] except set

    a -> beta.

All changed-edge classes except ax are certified:

- Inside S, b is the unique beta-colored S vertex and ab is a nonedge, so the recoloring creates no S-S conflict.
- There is no edge from a to B by the fixed defect property.
- There is no edge from a to T_2 by Y={b}.
- The only possible U-neighbor of a is therefore x, and xa is an edge because X={a}.

For ax, source properness gives only

    c(x) != alpha,

because xa is an edge. But pattern 1 also gives xb notin E(H), so properness supplies no implication

    c(x) != beta.                                             (2)

If c(x)=beta in the fixed source coloring, recoloring a to beta creates the monochromatic edge ax. The permitted premises do not exclude that equality.

Therefore the five-color boundary compression is NOT CERTIFIED from the RL22 premises in this pattern. This is not a proof that the recoloring always fails; it is the exact first missing color implication.

The work unit stops at (2), as required. The opposite orientation b->alpha is not tested: its T_2 safety would require a separate conclusion about Z_b and would be a second branch of the mechanism.

## Exact frontier and classification

The durable new information is:

- in fixed repair pattern X={a},Y={b}, Z_a is forced empty;
- nevertheless T_2 blocker exclusion alone is insufficient for the corresponding recoloring because x is a one-sided leaf repairer;
- the first missing implication is c(x)!=beta for the already fixed star coloring.

Classification: scoped analytic blocker-gate assessment / method barrier with same-worker review only. No new universal theorem, finite counterexample, source result, or certificate is claimed.

No named inherited mathematical obligation is genuinely reduced. The full m=2, A=S branch remains open, including this selected repair pattern. RL21-P01/P02, FL-024, the RL20 NONE correction/demotion result, FL-023, all inherited source/certificate limits, simultaneous-compatibility requirements, sharpness conditions and unbounded residual parameters remain unchanged.

New mathematical numerical computation: 0.
New mathematical source queries/opens: 0.
Programme ACTIVE.
