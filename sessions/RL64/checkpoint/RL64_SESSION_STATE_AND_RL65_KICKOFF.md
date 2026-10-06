# RL64 session state and RL65 kickoff

RL64: CLOSED/FROZEN on promotion.
RL65: READY / NOT STARTED.
Sole RL65 brief: authoritative/RL65_HC7_K7MINUS_DENSITY_CANDIDATE_GATE_BRIEF.md.
Root: HC7 only.

## Certified frontier
- U1–U7 unchanged: minor-minimal, full-C7 critical, connected, delta>=7, the degree-7-or-delta>=8 split, and a K4,4 minor (SRC-0025, statement level).
- **U8 (new, RL64):** K7 minus any two edges as minors. Source: F1 arXiv:2609.17760v1 and F2 arXiv:2507.03244v1, Level A statement, unrefereed preprints, proofs unread.

## Frontier items
| Item | Statement | Gate status |
|---|---|---|
| S1 | 7-connected | Level B (RL12-SRC-01, F1 Thm 7.1, F2 Thm 16; conflicting Mader citations); FL-063-gated |
| S2 | delta in {7,8,9} | Level C; not used by the frontier |
| S3 | n>=13 | Level C; not used by the frontier |
| S4 | K7 minus any two edges | **certified as U8** |
| K7^- | K7^- minor in every chi>=7 graph | OPEN; documented target F1 Conjecture 1.5 via F1 Thm 1.6 |
| K7 | HC7 | OPEN; density method documented false (5n−15 2-apex planar examples) |

## Kickoff steps for RL65
1. Pin live main. The expected predecessor is the RL64 closeout commit (its SHA is reported at closeout).
2. Confirm sessions/RL65 is absent.
3. Read the RL65 brief and its required files.
4. Check the arxiv.org access precondition. The F1 v1 PDF is sha256-pinned.
5. Execute the single C65 candidate gate:
   - bridge B65;
   - falsification test;
   - the K7^- analogue at the first F1 deficiency locus.
6. Stop at the first missing dependency or falsifier.

## Standing rules
- Frontier rule (FL-064 as extended by FL-065).
- RL70 periodic audit still owed.
- All FL-001..FL-065 retry conditions in force.
