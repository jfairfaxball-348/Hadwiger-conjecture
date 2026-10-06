# RL62 report — HC7 critical 7-connectivity gate

Date: 2026-10-06.
Status: completed bounded assessment.
Root: HC7 only.
BASE_HEAD: 306753660754123c53065916e3167e7b56bfbe25.
BASE_TREE: 146aa79a8c2f961470107e3c398d11030cb672f5.
Incoming authoritative tree: 2f340d08493dd8f3fc51c469270b6295b75efbfc.

## Exact candidate

HC7-CRITICAL-7-CONNECTIVITY:

    every hypothetical minor-minimal HC7 counterexample is 7-connected.

Complete quantified domain: every finite simple K7-minor-free graph G with chi(G)=7 that is minimal under the minor relation among such counterexamples.

Entry classification: CANDIDATE / NOT ESTABLISHED.

## Start gate

The live main head matched BASE_HEAD. sessions/RL62 was absent. RL62 was the unique incoming numbered session. authoritative/START_HERE.md named RL62 and the critical-7-connectivity brief. The required RL61 authority and frozen checkpoint provenance were consumed. No unresolved integrity failure blocked the assessment.

## Analytic assessment

A direct separator proof was tested first. The certified baseline gives that every proper minor and every proper subgraph is 6-colorable. If a separator S has size at most six, colorings of the proper sides/minors exist, but the baseline alone supplies no theorem forcing the two six-colorings to induce compatible colorings on S. Thus connectedness plus delta(G)>=7 does not by itself yield the desired 7-connectivity by this elementary route.

The assessment stopped at that missing compatibility mechanism rather than silently assuming a separator-gluing theorem.

## Bounded classical-theorem verification

A specific theorem then became load-bearing: the classical Mader connectivity theorem for contraction-critical graphs. A modern secondary restatement says that for k>=7 every k-contraction-critical graph is 7-connected, where k-contraction-critical means chi(G)=k and every proper minor is (k-1)-colorable.

At the level of that secondary restatement, the hypothesis match for k=7 is exact: a hypothetical minor-minimal HC7 counterexample has chi(G)=7 and every proper minor is 6-colorable.

The original paper was located:

W. Mader, "Über trennende Eckenmengen in homomorphiekritischen Graphen", Mathematische Annalen 175, 243-252, DOI 10.1007/BF02052726.

The primary Springer landing page exposed bibliographic metadata, but the article theorem text was not inspectable in the RL62 environment because full access was subscription-restricted. The RL62 brief expressly required checking the original theorem statement and hypotheses before consumption. That requirement was therefore not met.

Classification of the Mader input in RL62: primary source located; original theorem text/hypotheses NOT DIRECTLY CHECKED; theorem NOT CONSUMED as repository proof authority.

## Result and effect

HC7-CRITICAL-7-CONNECTIVITY: CANDIDATE / NOT ESTABLISHED.

Certified-domain falsification: NONE.

Every hypothetical HC7 counterexample genuinely narrowed to the 7-connected class: NO.

delta(G)>=8 changed: NO.
Degree-seven coverage changed: NO.
HC7-universal obligation genuinely reduced: NO.

Mathematical correction/demotion: NONE.
Inherited mathematical theorem classification changes: NONE.
Promoted source-classification changes: NONE.

First missing dependency: inspectable exact primary theorem text sufficient to verify Mader's statement/definitions/hypotheses and applicability, or a complete independent analytic proof of 7-connectivity.

External source work: one tightly bounded theorem-verification episode after the classical theorem became load-bearing; no broad literature search.
Mathematical numerical computation: 0.
Graph census: 0.
Candidate count: exactly 1.

FL-063 records the source-access/proof-admission barrier and retry condition.

## User-directed pivot

During closeout the user explicitly directed the next session to be a global audit of all progress to date, with laser focus on proving or disproving HC7 and aggressive strategic reprioritization.

Accordingly RL63 is not an automatic Mader-source retry. It is a global HC7 audit and proof/disproof attack-plan session that must rank all surviving routes by actual root leverage and select one decisive bounded successor.

Programme ACTIVE.
