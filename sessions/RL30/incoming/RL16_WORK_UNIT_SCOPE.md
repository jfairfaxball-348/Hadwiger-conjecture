# RL16-U01 work-unit scope

Date: 2026-10-02 Europe/Madrid.
Status: RL16 OPEN / one bounded analytic mechanism / NOT PROMOTED.

## Retained domain

Keep full sharp Hadwiger `h(G)>=chi(G)` for every finite simple graph.
Retain the full C_7 degree-seven cyclic domain, `m=1`, the same
minimum-cardinality S-complete resource `T`, the same fixed spanning-tree
leaf `x`, the same private endpoint `a` with `N_H(a)∩T={x}`, and the same
fixed proper six-coloring `d` of `G-x`. Put `gamma=d(v)`, `alpha=d(a)`,
`A_rho=N_G(x)∩d^{-1}(rho)`, and let `C_a` be the gamma/alpha component
containing `a`.

Assume only the unresolved branch `C_a∩A_gamma=empty` and fix one forced
`y∈(A_alpha\C_a)\S` from the distinct RL14-locked component.

## Single mechanism and stopping rule

Let `B=T-{x}` and test the direct exchange

    R = B ∪ {y}.

Before any appeal to minimum-cardinality, require a valid nonempty
connected exterior resource, full coverage of all seven cyclic missing
edges, and strict cardinality decrease. Stop at the first failed implication.

A singleton check on `{y}` is used only to record the immediate consequence
of the same minimum-resource hypothesis; it is not a second mechanism.
No beta palette or second private endpoint is used.

## Bounds actually used

- one fixed leaf x, one fixed coloring d, one anchor a and one witness y;
- one direct x-to-y resource exchange mechanism;
- zero mathematical numerical computation;
- zero new source queries and zero new source opens;
- no witness splicing, quotient lift, insertion-swap retry, second palette,
  second leaf/coloring, second-resource construction or broader catalogue.