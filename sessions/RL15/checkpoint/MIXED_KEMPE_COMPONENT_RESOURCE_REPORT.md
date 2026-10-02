# RL15 mixed Kempe-component structural extraction assessment

Date: 2026-10-02 Europe/Madrid.
Status: **RL15 OPEN; bounded assessment complete; NOT PROMOTED.**

## Outcome

The proposed structural extraction stops at the **first endpoint-incidence
gate**. For the anchor palette {gamma,alpha}, the retained hypotheses prove
that the Kempe component containing the private endpoint a is bichromatic,
but they do not prove that this same component is one of RL14-P01's
components meeting N_G(x) in both colors.

Accordingly, no second-resource claim is reached. In particular this unit
does not test or claim complete cyclic coverage, a joining edge to T,
disjointness from T, or resource validity.

This is a precise missing implication, not a counterexample to the
implication and not a counterexample to Hadwiger.

## Exact retained setup

Retain the RL15 brief verbatim in substance. G is in the full C_7
degree-seven cyclic domain; v has degree seven; H=G-v; S=N_G(v); T is the
m=1 minimum-cardinality S-complete resource; x is the fixed spanning-tree
leaf of T with private endpoints a,b; d is the fixed proper six-coloring of
G-x; gamma=d(v), alpha=d(a), beta=d(b).

For a color rho define

    A_rho := N_G(x) ∩ d^{-1}(rho).

Because ax is an edge supplied by N_H(a)∩T={x}, a lies in A_alpha.

Let Q_alpha be the subgraph of G-x induced by colors gamma and alpha, and
let C_a be the connected component of Q_alpha containing a.

## What is forced at the anchor

Since a is one of the retained private cyclic endpoints in S=N_G(v), the
edge va exists. Its endpoints have colors gamma and alpha. Therefore

    v ∈ C_a.

More generally every alpha-colored vertex of S lies in C_a, because every
such vertex is adjacent to v. Thus C_a is certainly a genuine
gamma/alpha bichromatic component containing the private endpoint a.

RL14-P01, however, gives a stronger and differently quantified fact:
there exists some gamma/alpha component M_alpha such that

    M_alpha ∩ A_gamma != ∅
    and
    M_alpha ∩ A_alpha != ∅.

The endpoint-anchoring statement needed by RL15 is precisely

    C_a ∩ A_gamma != ∅.                         (EA-a)

Equivalently, the component containing a must itself be Kempe-locked at x.
Only then can an RL14 forced mixed-at-x component be chosen to contain a.

## Exact dichotomy supplied by the inherited lock

If (EA-a) holds, endpoint anchoring succeeds and the brief would permit
the downstream disjointness/coverage/joining checks.

If (EA-a) fails, then C_a is not the RL14 mixed-at-x component. RL14-P01
still supplies a distinct component M_alpha meeting both A_gamma and
A_alpha. Choose y in M_alpha ∩ A_alpha. Then y is not in S: every
alpha-colored vertex of S belongs to C_a via v, whereas M_alpha is a
different component.

Hence failure of anchoring has the exact forced structural consequence

    there is an alpha-colored neighbor y of x outside S
    lying in a distinct gamma/alpha component that also meets A_gamma.

This is a valid scoped analytic observation. It does not locate y relative
to T, does not join that component to T in the resource sense, and does not
supply cyclic coverage.

## Why the private-endpoint identity does not close (EA-a)

The identity

    N_H(a) ∩ T = {x}

controls direct incidence from a to T-{x}. It neither states nor implies
that a is the only alpha-colored neighbor of x, that every
alpha-colored neighbor of x belongs to C_a, or that C_a contains a
gamma-colored neighbor of x.

In particular, the off-S witness y forced in the failed-anchor branch is
not excluded or located by the privacy identity. The retained authority
contains no independent inference sending y into C_a or otherwise forcing
C_a∩A_gamma to be nonempty.

Therefore (EA-a) is the first unproved implication. Under the brief's
stopping rule the assessment ends here.

No assertion is made that an actual C_7 graph realizes the failed-anchor
branch; establishing or excluding that branch is exactly the remaining
mathematical obligation for this mechanism.

## alpha=beta note

If alpha=beta, a and b lie in the same gamma/alpha component through v.
That still does not establish (EA-a): being bichromatic is weaker than
meeting A_gamma. The first endpoint-incidence gate therefore remains the
same. No separate beta analysis is needed after the mandated stop.

## What was deliberately not attempted

After the endpoint-incidence gate failed, this unit did not:
- extract a path and call it a second resource;
- infer a C_a-T edge from a path through S;
- test complete cyclic coverage;
- test disjointness from T;
- splice the beta palette, another coloring, another leaf, or another
  RL14 mixed component;
- retry the RL14 insertion swap;
- invoke quotient lifting or any prior retired mechanism.

## Classification and obligation accounting

The observations v∈C_a, all alpha-colored S vertices lying in C_a, and the
off-S witness dichotomy above are **proved scoped elementary analytic
mathematics** from the retained RL15 hypotheses plus RL14-P01, with
same-worker review only.

The desired endpoint-incidence implication (EA-a) is **NOT PROVED**.
The overall RL15 mechanism is therefore **blocked/inconclusive at its
first authorized gate**, not falsified by a C_7 countermodel.

No named inherited mathematical obligation is reduced. BR-00, BR-01
universal coverage, general UP_6, CR_6, ordinary order-seven coverage,
every higher order, and full sharp Hadwiger remain open. The m=1 case
remains unresolved and no second resource is constructed.

RL14-P01, RL13-P00/P01/P02, all inherited results and source limits, and
FL-001 through FL-017 retain their exact prior classifications.

Mathematical numerical computation: 0.
New source queries: 0.
New source opens: 0.
Programme ACTIVE.
