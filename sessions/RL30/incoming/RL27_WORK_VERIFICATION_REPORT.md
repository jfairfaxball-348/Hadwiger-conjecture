# RL27 work verification report

Date: 2026-10-03 Europe/Madrid.
Status: isolated same-worker verification / NOT PROMOTED.

## Start gate

PASS.

- Live main was read as c032a457aa986b3d2f366e4c3807d0a985de45cb before mathematics and again immediately before isolated checkpoint creation.
- This equals the predecessor supplied by the user.
- Root tree: ee5c689e26c26f75d2329583807e94c843ffece5.
- Incoming authoritative tree: bf48eb5cbe00c6637cc5e0d937dac90d1439528a.
- authoritative/START_HERE.md says RL27 is the sole incoming session.
- The authoritative top-level RL27-name check found exactly the RL26-to-RL27 handover and the sole RL27 brief; no competing RL27 brief was found.
- Required current records report correction/demotion NONE and no unresolved integrity failure blocking RL27.

## Mathematical verification

### Non-A-list-colorability

Rechecked all three edge classes in the splice of an assumed A-list coloring on R_1 with fixed c outside R_1:
- inside R_1: proper by the assumed list coloring;
- outside R_1: proper because c is a proper coloring of J and contraction changes no outside-outside edge;
- crossing edge uz: list membership excludes c(z) by definition of A(u).

Therefore the contradiction with chi(G)=7 is valid at the exact fixed scope.

### Minimal obstruction degree implication

Rechecked finiteness and inclusion-minimal selection of one induced obstruction K. For each u, K-u is A-list-colorable. If |A(u)|>d_K(u), at most d_K(u) list colors can be occupied on the d_K(u) neighbors, so one list color remains and extends the coloring. Therefore |A(u)|<=d_K(u). Since gamma is in A(u), d_K(u)>=1.

No folklore theorem is consumed.

### Sole endpoint/path consequence

C27-X was stated before testing. Its required upper bound d_K(x)<=1 is not implied by x being a Q_1 leaf or W endpoint, because neither Q_1 nor W is asserted to contain all original-G edges on R_1. The stop is therefore at a genuine missing degree-to-incidence implication, not at a contradiction or verifier defect.

## Scope and guards

PASS.

No second coloring, K, endpoint, path, contraction, y, tree, leaf, joining edge, defect, resource side or family was used. No RL23 recoloring, m=1 identity, RL25 later gate, minimum-total-size invocation, new source retrieval or numerical work occurred.

No saturation exclusion and no named-obligation reduction is claimed.

Programme ACTIVE.
