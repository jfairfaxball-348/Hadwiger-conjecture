# RL15-U01 work-unit scope

Date: 2026-10-02 Europe/Madrid.
Status: RL15 OPEN / one bounded analytic mechanism / NOT PROMOTED.

## Retained domain

Keep the full sharp Hadwiger root and the exact RL15 restricted domain:
full C_7 degree-seven cyclic neighborhood, m=1, the minimum-cardinality
S-complete resource T, one fixed spanning-tree leaf x, private endpoints
a,b with

    N_H(a) ∩ T = N_H(b) ∩ T = {x},

and one fixed proper six-coloring d of G-x. Put gamma=d(v),
alpha=d(a), beta=d(b). RL14-P01 is consumed exactly and the retired
one-component insertion swap is not retried.

## Single mechanism and stopping rule

Use only the anchor palette {gamma,alpha} first. Let

    A_rho = N_G(x) ∩ d^{-1}(rho)

and let C_a be the {gamma,alpha} Kempe component of G-x containing a.

Test whether the retained private-endpoint structure forces C_a to be
Kempe-locked at x, i.e. whether C_a ∩ A_gamma is nonempty. If this
endpoint-incidence implication is not justified, stop immediately; do not
test cyclic coverage, a C_a-T joining edge, disjointness, resource validity,
or the beta anchor.

This is exactly the first stopping gate authorized by the RL15 brief.

## Bounds actually used

- one fixed leaf x;
- one fixed deletion coloring d;
- one anchor palette assessed before the stop;
- zero mathematical numerical computation;
- zero source queries and zero source opens;
- no witness splicing, quotient lift, prior-mechanism replay, or second mechanism.
