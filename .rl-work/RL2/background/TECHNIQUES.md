# Recurring proof techniques

Research cutoff: 2026-09-30. Session: RL2. Status: NOT PROMOTED — working research checkpoint.

This is a source map, not a chosen research strategy. A technique's successful use at one scope does not prove its transfer to the full conjecture.

| Method | Checked use / sources | Scope limit that must travel with it |
|---|---|---|
| Density and degeneracy | RES-0008, RES-0009; SRC-0007, SRC-0011 | Tight degeneracy order is not a sharp coloring theorem; d=e/v differs from average degree. |
| Minor-minimal / contraction-critical reduction | RES-0028; SRC-0003, SRC-0016 | Legitimate reduction at fixed t; extra structure needs proof. Chromatic number is not generally minor-monotone. |
| Apex reduction | RES-0006; SRC-0003 | Fixed t=6 reduction, with a Four Color dependency; no unrestricted-t version inherited. |
| Highly connected extraction | RES-0014; SRC-0012 | Density antecedent and t,k,C bounds retained; extraction does not promise chi(H)=chi(G). |
| Linkage, rooted models and gluing | TOP-0005; SRC-0012, SRC-0016 | Simultaneous disjointness and pair adjacency must be shown; connectivity alone is not a clique model. Survey orientation is not an imported universal theorem. |
| Small-graph transfer | RES-0011, RES-0012; SRC-0012 | Absolute constants survive; infinitely many t remain; conclusion is linear. |
| Unavoidability plus reducibility | RES-0026; SRC-0004 | Local reducibility only works with a global coverage theorem for the same counterexample class. |
| LP duality / weighted stable sets | RES-0019, RES-0020; SRC-0005 | Fractional conclusion; no cost-free integral rounding. |
| Probabilistic clique models | RES-0022; SRC-0009 | Almost-sure conclusion in G(n,1/2), not all graphs. |
| Parity-aware constructions and transfers | RES-0016–RES-0018; SRC-0013, SRC-0017 | Odd-minor constraints strengthen the witness; sharp odd assertion is false, transfer costs factor 2. |
| Neighborhood sparsity / structural dichotomy | RES-0029, RES-0030; SRC-0018 | Maximum-degree hypothesis or both OR branches remain; necessity is not exclusion. |
| Computation and formal proof | RES-0026, RES-0027; SRC-0004, SRC-0019 | Inherited theorem-specific work; RL2 reran no reducibility computation or Coq proof. |

Separation/decomposition language, chromatic separability, average-degree normalization, and branch-set witnesses are indexed in GLOSSARY.jsonl. Technical sources listed but not directly checked (for example SRC-0026, SRC-0027) are recovery leads, not unrecorded theorem dependencies.

