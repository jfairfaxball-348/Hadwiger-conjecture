# RL14 append-only lesson event — FL-017

Date: 2026-10-02 Europe/Madrid. RL14 work appendix, NOT PROMOTED. Preserve FL-001 through FL-016 unchanged at normal closeout.

## FL-017 — criticality Kempe-locks every one-component insertion palette

- Origin/evidence: RL14 at BASE_HEAD 16f7847c90a1b8667c33c3963d125da272217b35, authority tree eb263feb1f4e59c9c08478c2c1872b78daebf5c9; exact proof in LEAF_DELETION_COLORING_REPORT.md.
- Prior expectation/status: RL13 prepared one changed mechanism using an actual coloring d of G-x and the private leaf endpoints, asking whether one gamma/delta component swap could free gamma at x. The mechanism was unassessed and was not an inherited theorem.
- Positive analytic observation: in every six-coloring of G-x, all six colors occur on N_G(x). More strongly, for every pair p,q of colors, some p/q Kempe component meets N_G(x) in both colors; otherwise simultaneous swaps on all p-neighbor components would free p and six-color G.
- Exact mechanism test: one gamma/delta component can free gamma exactly if it contains all gamma-neighbors of x and no delta-neighbor of x. The critical Kempe-lock lemma rules this out for every delta!=gamma. The conclusion remains true even if the component is allowed to contain v.
- Role of private endpoints: N_H(a)∩T=N_H(b)∩T={x} controls only direct incidence with T-{x}. It does not force the mixed Kempe component to contain or avoid a,b, nor does it control paths through S or residual vertices.
- First failed/missing implication: the prepared route needs, for some delta, one component containing all gamma-neighbors and zero delta-neighbors. Criticality forces a mixed component for every palette, so this conjunction cannot hold.
- Downstream effect: the one-component leaf insertion mechanism is retired at the exact RL14 scope. No m=1 exclusion, second resource, rooted K6/K7 minor, UP_6, CR_6, order-seven theorem, higher-order theorem, or full-root result follows. No inherited theorem is corrected or demoted.
- Surviving frontier: RL13-P00/P01/P02 and all earlier scoped results/countermodels remain intact. The exact new reusable datum is the palette-wise mixed-component obstruction at x.
- Lesson: when a vertex is deleted from a chromatic-critical graph, Kempe components around its neighborhood are themselves locked by criticality. A proposed recoloring that would free a color must first contradict that lock using genuinely additional structure; local private-neighbor identities alone do not do so.
- Retry condition: do not retry a one-component insertion swap, another favorable deletion coloring, or another leaf. A changed mechanism must consume the forced mixed components as structural objects rather than presume one is safe.
- Sources/computation: zero new source queries, zero new source opens, zero mathematical numerical computation.
- Programme active.
