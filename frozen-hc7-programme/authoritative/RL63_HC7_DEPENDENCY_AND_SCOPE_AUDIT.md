# RL63 HC7 dependency and scope audit

Status: RL63 global-audit record. CLOSED/FROZEN on promotion at RL63 closeout.
Root: HC7 only — every finite simple graph G with chi(G)=7 has h(G)>=7.

## 0. Minimal dependency graph from the root

Notation used in the graph:
- `=>` is a proved implication.
- `~>` is an implication that holds only conditionally on a gate.
- `[S]` marks a source-gated step, `[C]` a conditional step, `[X]` a retired step.

```
HC7-NEG: finite simple G, chi(G)=7, no K7 minor
 └─ (elementary, programme baseline) choose G minor-minimal
     => U1  every proper minor 6-colourable  (G is C7 = full-C7 critical)          [RL3 A1; RL52-C01]
     => U2  every proper subgraph 6-colourable; G connected; delta>=6             [RL52-C01]
     => U3  A2: every 6-colouring of G-v uses all 6 colours on N(v)               [RL3 A2]
     => U4  star-fold alpha(G[N(v)])<=d(v)-5 for every v                          [RL6-P03 star-fold, uses U1,U3]
     => U5  delta(G)>=7 (d=6 forces N(v)=K6, so G contains K7)                    [RL52-C02]
     => U6  exhaustive split: some d(v)=7  OR  delta>=8                           [RL52-C03]
     => U7  K4,4 minor                                                            [SRC-0025 statement-level; RL54]
     ~> S1  7-connected                                   [S] RL12-SRC-01 restatement of Mader 1968a; RL62 FL-063
     ~> S2  delta<=9, i.e. delta in {7,8,9}; 3n7+2n8+n9>=30; 7n/2<=e<=5n-15; n>=10
                                                          [S] Mader 1968b K7 extremal function (not in repo)
     ~> S3  n>=13                                         [S] Gallai (k-critical, n<=2k-2 => join) + HC<=6 (RES-0005)
     ~> S4  contains K7^= and K7^vee minors (K7 minus any two edges)
                                                          [S] arXiv:2609.17760 (Dvořák–Norin–Rahman), arXiv:2507.03244; orientation only
     ~> L1  degree-7 local machinery (Dcyc7, m-cases, M3, Kempe)   [C] needs U6 branch 1 AND H[S]=K7-C7 coverage AND resource-case exhaustiveness
     ~> L2  K4,4 minimum-model results RL55-P01, RL56-P01          [C]/[X] valid at model scope; route retired
```

Everything above the `~>` lines is proved or certified at its recorded level. Nothing below them is consumed.

## 1. The eight categories

**1. Universal minor-minimal / full-C7-critical structure (LIVE).** U1–U6 are proved; RL52 rechecked them and so did this audit. The proof of U4 is in sessions/RL6/RL6_RECOVERY_REPORT.md line 133. It uses A2 (sessions/RL3/DEPENDENCY_MAP.md) and is correct.
- Labelling nuance: the RL6 ledger records the star-fold bound as the row "RL6-P03 star-fold context", separate from RL6-P03 proper. RL52 cites it as RL6-P03. This is a citation-precision note only, not a defect.
- The following pre-pivot results are universal over C7 at t=7 but give no root payoff:
  - RL4-P03, which says no G-v has a universal vertex and so d(u)<=n-3. It is conditional on admitting the HC6 source.
  - RL6 C2 and C3.
  - RL12-P01. It is vacuous under S1.
  - RL14-P01, the classical Kempe lock.
  - The contraction/edge-critical arguments of RL26–RL28.

**2. Degree and neighbourhood coverage.** Only U5/U6 are proved. RL52/RL53 posed "degree-7 existence", but nothing supports that target. RL53 attempted it only as a provenance search, and RL63 classifies it as mis-specified.
- The standard coverage theorem is S2, Mader's K7 extremal function, which caps delta at 9. It is absent from the repository.
- No neighbourhood classification is proved for d=8 or d=9. For d=7, the only proved facts are:
  - triangle-free complement (U4);
  - not a matching complement (RL6-P03);
  - K6-minor-free neighbourhood, since v together with a K6 minor of N(v) would give K7. This is elementary; RL63 records it as an observation and does not promote it.

**3. K4,4 minor and model structure.** U7 is valid at SRC-0025's statement level; the derivation is correct and does not even need minimality. RL55-P01 is valid at minimum-model scope. RL56-P01 is a valid conditional. RL56-C01 through RL59-C01 are NOT ESTABLISHED. RL61's inequality shows that the spanning colour route can only restate the root contradiction. No non-colouring mechanism exists. If S4 is admitted, it supersedes K4,4 as "near-K7" structure.

**4. Degree-seven conditional machinery.** All of RL6–RL51's degree-seven work requires U6 branch 1 (a degree-7 vertex), then H[S]=K7−C7 exhaustiveness among complements, then resource-case exhaustiveness. None of these is proved.
- In particular, the "triangle-free, non-matching" complements other than C7 were never covered.
- The work therefore contributes nothing to HC7 unless every one of those coverage steps is proved.

**5. Resource / Kempe / M3 machinery.** These live strictly inside category 4:
- m=1: RL13–RL19;
- m=2: RL21–RL29;
- m=3 terminal core: RL31–RL39;
- fixed RL41 triple with Kempe: RL41–RL49;
- M3 dichotomy: RL51.

RL31-P01 makes M3-CORE equivalent to the retained configuration being empty, so it is a renamed root bridge. RL47–RL49 additionally assume an unproved pivotal edge.

**6. Classical theorems that are source-gated.**
- S1: Mader connectivity, via a restatement in RL12-SRC-01. FL-063 is the barrier.
- S2: the Mader K7 extremal function.
- S3: Gallai's theorem together with HC6.
- S4: the 2025–2026 two-edge-deficient K7 minor theorems.
- HC6 (RES-0005 / SRC-0003): statement checked in RL2, consumed by RL4-P03, and absent from current authority.

None of these is consumed in RL63.

**7. Exact computational machinery and certificates.** There are four distinct standard-library Python scripts, all from RL2–RL12:
- the RL3 rooted-barrier certificate, a single 9-vertex graph;
- the RL7 and RL8 fixed-witness checkers;
- the RL2 corpus schema checker.

None is an HC7 certificate, and none can be reused for HC7 except the branch-set checking helper. There is no tooling for graph generation, SAT/ILP, chromatic-number certificates or minor testing. Mathematical computation since RL12 has been zero.

**8. Explicit counterexample / disproof capability.** NONE. No graph candidate, generator, certificate format or verifier exists. See RL63_PROOF_VS_DISPROOF_ATTACK_MAP.md.

## 2. Last genuine universal narrowing

The last was RL54 (2026-10-05): every hypothetical HC7 counterexample contains a K4,4 minor, at SRC-0025 statement level. The one before it was RL52's certification of delta>=7; the underlying mathematics is the RL6 star-fold from 2026-10-01.

The following do not count as narrowing:
- RL55–RL62, which excluded no hypothetical counterexample;
- reformulations of the same missing bridge, such as M3-CORE (a renamed claim that the configuration is empty), the RL56→RL59 escape/dense/spanning/lift chain, and RL61's restatement of the root contradiction.

Unconsumed narrowings that the literature appears to provide (all SOURCE-GATED):
- S1, 7-connected;
- S2, delta in {7,8,9};
- S3, n>=13;
- S4, minors of K7 minus any two edges.

On S4, the repository is roughly six decades behind on items S1–S3, and RL63 orientation suggests a 2025–2026 frontier beyond K4,4.

## 3. Load-bearing rechecks performed by RL63

| Claim | Recheck | Verdict |
|---|---|---|
| Minor-minimal ⇒ every proper minor 6-colourable | Vertex deletions inside a 7-chromatic proper minor reach a 7-chromatic, K7-minor-free proper minor | VALID |
| A2 | Six colours on N(v) are forced, else v can be coloured | VALID |
| Star-fold alpha(N(v))<=d(v)-5 | Contract {v}∪I for an independent I with \|I\|>=2. The pulled-back colouring uses <=1+d-\|I\| colours on N(v) while A2 needs 6, so \|I\|<=d-5. Singletons need d>=6, which A2 gives. | VALID |
| delta>=7 | d=6 gives alpha<=1, so N(v)=K6 and N[v]=K7 | VALID |
| U7 from SRC-0025 | chi=7 and no K7 minor ⇒ K4,4 minor, at the checked statement scope | VALID at statement level |
| RL56-P01 | A_i∪B_i (i=1..3), A_4, B_4 form a K5 model, plus P and Q | VALID (conditional) |
| RL61 inequality | Disjoint palettes | VALID |
| RL31-P01 ⇒ M3-CORE vacuity | The conclusion contradicts minimum total size | VALID observation (agent re-derivation plus RL31 text "the retained configuration itself may be empty") |
| RL12-SRC-01 applicability | The repository's C_t equals the paper's k-contraction-critical definition. A minimal HC7 counterexample is noncomplete (K7 itself would be a K7 minor). | VALID as a conditional; source is a restatement (see correction record) |

No silent strengthening, quotient degree transfer, cross-graph model comparison, subgraph-for-minor substitution or local-to-global jump was found in RL1–RL62.

## 4. Unbounded residual parameters

The following remain unbounded:
- |V(G)|. No upper bound exists in any theory, and the lower bound is n>=10 only under S2.
- The degree of the low-degree vertex. Without S2 it is unbounded above (delta>=8 residual).
- The resource interiors and residual components in L1.
- The branch-set sizes in L2.

Every finite-looking local result in categories 4–5 carries at least one of these.
