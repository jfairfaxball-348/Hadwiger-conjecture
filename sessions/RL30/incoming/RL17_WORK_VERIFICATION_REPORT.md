# RL17 work checkpoint verification

Date: 2026-10-02 Europe/Madrid.
Status: **bounded RL17 checkpoint; NOT PROMOTED.**

Start gate:
- live main matched BASE_HEAD 32387459dc70787ab65f1da9ffcfa87ffa57d00e;
- BASE_HEAD root tree is e907bf4752404abaf234701466fbbc6292199778;
- incoming authoritative tree is aedcece2f7d51a3c11aebde5ea843557d3efcac2 with 187 top-level blobs;
- authoritative navigation identifies RL17 as the sole incoming session and
  RL17_STRICT_SHRINK_EXCHANGE_BRIEF.md as the sole current brief;
- sessions/RL17 and a pre-existing RL17 work branch were absent;
- no unresolved integrity failure was found in the required current records.

Analytic check:
1. y is in G-x, hence y!=x.
2. If y∈T then y∈B=T-{x}.
3. Inherited B is connected and not a resource, so its existence violates no
   minimum-cardinality claim.
4. N_H(a)∩T={x} would give ay∉E(H), consistent independently with
   d(a)=d(y)=alpha in the proper coloring d.
5. Distinct gamma/alpha components are components in the induced two-color
   subgraph of G-x; connectedness/membership in T is not restricted to those
   colors, so y∈T does not merge the components.
6. No current premise supplies any further y-versus-T location rule.

Thus the first required implication y∉T is unproved. Under the brief's
mandatory stopping rule, z-selection and every R_z validity/size gate remain
unassessed.

Classification is same-worker analytic assessment only; no formal checking
or external independent certification. No mathematical numerical
computation and no new mathematical source query/open occurred. No named
mathematical obligation is reduced. Programme ACTIVE.
