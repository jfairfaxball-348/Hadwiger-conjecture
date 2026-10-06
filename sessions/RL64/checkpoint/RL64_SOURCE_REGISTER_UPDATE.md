# RL64 source register update (delta against RL63)

Status: RL64 record. CLOSED/FROZEN on promotion at RL64 closeout.

Base: RL63_SOURCE_GAP_REGISTER.md (frozen in sessions/RL63/checkpoint/ and sessions/RL64/incoming/). The consolidated current register is authoritative/RL64_SOURCE_REGISTER.md, with its Level A/B/C definitions unchanged. Rows not listed here are unchanged.

## Changed rows

| ID | Source | RL63 status | RL64 status (effective at closeout) | Basis |
|---|---|---|---|---|
| RL63-SRC-03 | Dvořák, Norin, Rahman, "Every graph with no K_7^= minor is 6-colorable", **arXiv:2609.17760v1** (submitted 15 Sep 2026; manuscript dated 23 Aug 2026). PDF sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907. | C | **A (statement)**: unrefereed preprint, proof unread, version-pinned v1. Caveats: §1.1 AI-usage disclosure (AI produced proofs from the authors' outlines); depends on unrefereed [Dvo26]. Also recorded at Level A statement: Thm 1.3, Thm 2.8, Thm 1.6 and Conjecture 1.5 (a conjecture, *not* a theorem). | RL64_ADMISSION_RECORD.md |
| RL63-SRC-04 | **Norin, Totschnig**, "Every graph with no K_7^{\vee}-minor is 6-colorable", **arXiv:2507.03244v1** (submitted 4 Jul 2025), CC BY 4.0. PDF sha256 14c465983a80a6f48e69b92d56c8d1d40c7428e495bc144ab322070478ca1245. | C | **A (statement)**: unrefereed preprint, proof unread, version-pinned v1. Also recorded at Level A statement: Thm 6. Conjectures 19, 20 and 21 recorded as conjectures; Conjecture 19 is now F1's theorem. | RL64_ADMISSION_RECORD.md |
| RL63-SRC-01 | Mader, Math. Ann. 175 (1968) 243–252 | C (located). Its statement is B via RL12-SRC-01. | **B**, with one more restatement: F1 Thm 7.1 cites this paper: "For every k ≥ 7, every k-contraction-critical graph other than Kk is 7-connected." FL-063 is **still unsatisfied** because the original is not inspected. | Input table, row 1 |
| RL63-GAP-02 | Jakobsen 1971 | C (not located) | **B**. Restated as F2 Thm 2 [Jak71] = Studia Sci. Math. Hungar. 6 (1971) 151–160, and by F1 citing [Jak71b], Aarhus Preprint Series 22 (1971). The two papers attribute it to different items. Superseded by U8. | Input table, row 5 |
| RL63-SRC-05 | Waterloo seminar listing (Totschnig, Feb 2026) | C | C, unchanged. Its claims are now consistent with inspected SRC-04. | — |

## Unchanged rows (explicitly)

- **RL63-SRC-02**, Mader Math. Ann. 178 (1968), K7 extremal function: stays **C**. **Not cited** by either frontier paper.
- **RL63-GAP-01**, Gallai: stays **C**. Not cited.
- **RL63-GAP-03**, order bounds: unchanged.
- **SRC-0025**, KT05: stays A at statement level.
- **SRC-0003**, RST93: stays A at statement level.
- **SRC-0004**, 4CT: unchanged.
- **RL12-SRC-01**: stays B.

## New rows (all Level B: restatements inspected in F1/F2)

| ID | Source (as cited) | Statement restated in | Used by |
|---|---|---|---|
| RL64-SRC-01 | W. Mader, "Homomorphieeigenschaften und mittlere Kantendichte von Graphen", Math. Ann. 174 (1967) 265–268 | F2 Thm 16: "For all k ≥ 7 every k-contraction-critical graph is 7-connected." **Attribution differs from F1/RL12. As literally worded it omits the K_k exception.** | F2 Claim 4.1 |
| RL64-SRC-02 | G. A. Dirac, J. Reine Angew. Math. 204 (1960) 116–131 | F1 Thm 7.3; F2 Thm 15 (alpha(G[N(v)]) <= deg v − k + 2) | F1 Lemma 7.6, F2 §4. Already proved in-repo at k=7 as U4. |
| RL64-SRC-03 | Robertson, Seymour, Thomas, Combinatorica 13 (1993) 279–361, items (2.4), (2.6) | F2 Thms 13, 8 | F2 §2–3 |
| RL64-SRC-04 | L. K. Jørgensen, "Contractions to K8", J. Graph Theory 18(5) (1994) 431–448: Lemma 16(2), Lemma 17, and the 4n−7 K4,4 theorem | F2 Lemma 10, Thm 11, Thm 5 | F2 §2–3 |
| RL64-SRC-05 | M. Kriesell, S. Mohr, "Kempe chains and rooted minors", arXiv:1911.09998 (2019), Lemma 2 | F1 Thm 7.5; F2 Thm 14 | Both: the exceptional (Moser-spindle) degree-7 case |
| RL64-SRC-06 | Kawarabayashi, Luo, Niu, Zhang, European J. Combin. 26(3) (2005) 293–308 | F2 Thm 18 | F2 §4 |
| RL64-SRC-07 | Kawarabayashi–Toft 2005, Lemma 3(i) | F2 Lemma 17 | F2 §4 |
| RL64-SRC-08 | Kawarabayashi–Toft 2005, Section 2 (alpha<=2 on 7 vertices ⇒ K4 or Moser spindle) | F1 Thm 7.4 | F1 Lemma 7.6 |
| RL64-SRC-09 | Z. Dvořák, "Extremal function for rooted K5 minors", arXiv 2609.13818 (2026): Thm 4, Cor 13, Cor 16 | F1 Thms 2.6, 2.7, 2.9 | F1 Thm 1.3 (load-bearing) |
| RL64-SRC-10 | Fabila-Monroy, Wood, "Rooted K4-minors", Electron. J. Combin. 20(2) (2013) P64 | F1, via Thm 2.7 | indirect |

## Source questions carried forward

| Q | After RL64 |
|---|---|
| SQ1 | **RESOLVED**: F1 and F2 admitted at Level A (statement); inputs extracted; obstruction mapped. |
| SQ2 | Mader 178 / 5n−15. Open, and **de-prioritised**: neither frontier proof consumes it. |
| SQ3 | Mader 7-connectivity. Open. New information: an attribution discrepancy (Math. Ann. 174 (1967) per F2; Math. Ann. 175 (1968) per F1, RL12 and RL62). It is load-bearing inside both frontier proofs, but U8 does not need it. |
| SQ4 | Gallai. Open, low priority, not used by the frontier. |
| SQ5 | Small-graph / order bounds. Open, low priority. |
| SQ6 (new) | Inspect F1 Sections 2–6 and [Dvo26] at the level needed for a K7^- density attack. That is the RL65 task, if selected. |
