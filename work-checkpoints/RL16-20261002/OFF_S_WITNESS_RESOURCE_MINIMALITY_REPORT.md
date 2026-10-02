# RL16 off-S witness / minimum-resource pruning assessment

Date: 2026-10-02 Europe/Madrid.
Status: **RL16 OPEN; bounded assessment complete; NOT PROMOTED.**

## Outcome

The minimum-resource gate does **not** contradict the failed-anchor branch
and does **not** restore endpoint anchoring. The first direct exchange fails
before minimum-cardinality can be used to derive a contradiction.

One scoped positive consequence is obtained:

**RL16-P01 — proved scoped elementary analytic mathematics.** In the
failed-anchor branch, the forced off-S witness `y` is an exterior vertex of
`H`, and the singleton `{y}` is not a resource. Hence there exists at least
one cyclic missing edge whose two endpoints both have no neighbor in `{y}`.

This does not locate that missed edge, does not make `y` unusable in a
larger connected set, and does not imply endpoint anchoring.

## Retained setup

Use exactly the inherited RL16 domain. `T` is a minimum-cardinality
S-complete resource in the `m=1` case. The inherited RL13 leaf result gives
`|T|>=2`, and for `B=T-{x}` it gives that `B` is nonempty and connected but
is not a resource because cyclic coverage fails. The private endpoint
identity retained here is `N_H(a)∩T={x}`.

RL15-P01 is preserved exactly. Under `C_a∩A_gamma=empty`, RL14-P01 supplies
a distinct locked gamma/alpha component with an alpha-colored neighbor
`y` of `x` outside `S`; fix one such `y`. Thus `xy∈E(G)` and `d(y)=alpha`.

## 1. The witness is a valid exterior singleton

Because `va` is an edge and `d` is proper on `G-x`, `alpha=d(a)` differs
from `gamma=d(v)`. The witness has color alpha, so `y!=v`. It is already
known that `y∉S`; therefore `y∈V(H)\S`.

Consequently `{y}` is a nonempty connected exterior set. Since `|T|>=2`,
`|{y}|=1<|T|`. If `{y}` met every cyclic missing edge through its
S-neighborhood, it would be a resource smaller than the minimum resource
`T`, impossible. Therefore `{y}` is not a resource and misses at least one
cyclic missing edge. This proves RL16-P01.

## 2. Direct replacement of x by y

Consider the only authorized exchange candidate

    R = (T-{x}) ∪ {y} = B ∪ {y}.

There are two exhaustive location cases, because RL15 did not locate `y`
relative to `T`.

### Case A: y lies in B

Then `R=B`. The inherited leaf result already proves that `B` is nonempty
and connected and has smaller cardinality than `T`, but it fails cyclic
coverage and hence is not a resource. The resource-validity gate therefore
fails before minimality can be invoked.

### Case B: y lies outside T

Then `R=B∪{y}`. The set is exterior and nonempty, but connectedness is not
forced. The only guaranteed new attachment is the edge `xy`, and `x` has
been deleted from `R`; no edge from `y` to `B` is supplied by RL14-P01,
RL15-P01, `xy∈E(G)`, or `N_H(a)∩T={x}`. Under the mandated ordering, the
assessment stops at this first missing connectedness implication.

Independently, the exact cardinality check is

    |R| = |B|+1 = |T|

when `y∉T`. Thus even an independently supplied connectedness-and-coverage
proof for this direct swap would still not give the strict decrease required
for a contradiction from minimum-cardinality.

No cyclic-coverage claim for this outside-T swap is made after the
connectedness stop.

## 3. Endpoint anchoring and contradiction status

The failed-anchor assumption remains logically possible at the present
proved scope. Minimum-cardinality shows only that the single witness is
coverage-defective as a resource. It does not force `y` into `C_a`, does
not force `C_a∩A_gamma` to be nonempty, and does not make the direct swap a
strictly smaller resource.

Accordingly there is no contradiction, no restored endpoint anchoring, no
second resource, and no exclusion of `m=1`.

## Classification and obligation accounting

RL16-P01 is proved scoped elementary analytic mathematics with same-worker
review only. The direct exchange mechanism is blocked at resource validity
(if `y∈B`) or, if `y∉T`, at connectedness, with an independent exact
strict-size failure as well.

No named inherited mathematical obligation is reduced. BR-00, BR-01
universal coverage, general UP_6, CR_6, ordinary order-seven coverage, all
higher orders and full sharp Hadwiger remain open. RL15-P01, RL14-P01,
RL13-P00/P01/P02, all earlier results/countermodels/certificates, source
limits and FL-001 through FL-018 retain their exact scopes.

The failed-anchor branch is still not asserted to occur in an actual C_7
graph. Mathematical numerical computation: 0. New source queries: 0.
New source opens: 0. No formal or external independent certification and
no novelty claim. Programme ACTIVE.