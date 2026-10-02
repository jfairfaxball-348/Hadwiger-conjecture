# RL13 concrete next target

Status: PREPARED ONLY; NOT STARTED.

Work only inside the unresolved RL13 subcase m=1 and N_H(T) intersect S = S, where T is the single member of the maximum partial family and, because m=1, the minimum-total-size tie-breaker makes T a minimum-cardinality resource.

Use one changed input: minimal resource structure.

If |T|=1, first record the immediate A2 obstruction to a vertex adjacent to all of S; do not generalize it to larger T.

If |T|>=2, choose a spanning tree Q of H[T]. For a leaf x of Q, T\{x} remains nonempty and connected. Minimum cardinality therefore forces T\{x} not to be a resource, so some cyclic nonedge e_i has no endpoint neighbor in T\{x}; since T is a resource, x alone supplies T's coverage of that e_i. Call this a private cyclic-edge witness for x.

Bounded assessment: use at most the seven possible private cyclic-edge/star types and actual original-G star-minor colorings to test whether the leaf-private witnesses force either:
1. a second resource C disjoint from T with an actual joining edge to T, contradicting m=1; or
2. a precise residual attachment/coloring obstruction that explains why augmentation can fail.

Stop at the first missing independent implication, invalid coloring lift, circularity or uncovered leaf case. Do not infer that all leaves can be simultaneously colored from separate star colorings. Do not contract T and assume the quotient coloring lifts. No source query or numerical work by default.

If this m=1 S-complete gate fails, preserve the exact countermechanism before considering m=2,3,4. All larger-order/root obligations remain outside this bounded target.
