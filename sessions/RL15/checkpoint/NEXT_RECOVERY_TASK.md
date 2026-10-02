# Prepared recovery after RL15-U01

Status: **PREPARED ONLY / NOT STARTED.**
RL15 remains OPEN / NOT PROMOTED.

## Why the mechanism must change

RL15-U01 stops before resource extraction because the component C_a
containing the private endpoint a is not proved to meet A_gamma.

In the unresolved branch C_a∩A_gamma=∅, RL14-P01 forces a distinct locked
gamma/alpha component M_alpha and therefore an alpha-colored neighbor

    y ∈ N_G(x) \ S

outside C_a. Endpoint privacy alone does not locate or eliminate y.

## One bounded changed task

Retain the same full C_7 domain, m=1 minimum-cardinality S-complete
resource T, the same fixed leaf x, the same private endpoint a, and the same
fixed deletion coloring d. Do not use b unless this one-anchor gate is
completed.

Assume only the unresolved branch C_a∩A_gamma=∅ and choose one witness

    y ∈ (A_alpha \ C_a) \ S

from the RL14-locked component.

Assess exactly whether the **minimum-cardinality resource property of T**,
together with xy∈E(G) and N_H(a)∩T={x}, forces a contradiction or restores
endpoint anchoring. In particular, any proposed pruning/replacement of x
by y must explicitly verify:
1. the resulting set is a valid connected resource under the inherited
   resource definition;
2. its S-neighborhood retains the required S-completeness/cyclic coverage;
3. its cardinality is strictly smaller before minimality is invoked.

If none of these follows, stop at the first failed resource-minimality
implication and record where y may still lie/attach.

## Bounds and exclusions

- one fixed anchor a and one fixed coloring d;
- one off-S witness y;
- one resource-minimality/pruning mechanism;
- no beta palette, no second leaf/coloring, no witness splicing;
- no Kempe insertion swap;
- no cyclic-coverage or joining-edge conclusion unless the endpoint gate is
  first actually restored;
- zero source query/open and zero numerical mathematics by default.

This task directly targets FL-018's missing bridge rather than replaying
RL14 or assuming the desired second resource.
