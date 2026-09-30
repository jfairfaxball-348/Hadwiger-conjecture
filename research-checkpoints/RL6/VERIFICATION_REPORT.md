# RL6 checkpoint verification and limits

Date: 2026-09-30. Status: **WORK CHECKPOINT VERIFIED; NOT A NUMBERED CLOSEOUT**.
BASE_HEAD: 63af75cde689372a766105d1b3d7cdcac1ad36c8.
Authority tree: 5f109b306dca394f0a48b12b3ed40af7d7ad411a.

## Checks performed

- Pinned live main, root AGENTS, the sole RL6 entrypoint/brief and all required current reads. Historical hold wording is explicitly superseded by the recorded process amendment. No unresolved integrity failure.
- Recorded all 31 flat authority blob identities and its background/verification subtrees without recursively preloading frozen history. Current authority, background, verification and docs trees contain no nested AGENTS.
- Verified exact bytes of all 45 fetched required/support/verifier input blobs against their Git SHA-1 identities. The regenerated finite certificate remains byte-identical.
- Ran python3 -I verification/verify_rooted_barrier.py from the copied authority directory: PASS for one nine-vertex, twenty-edge graph; all 130 deletion sets through size three, all 3125 rooted assignments, all 19683 three-colorings. No claim about an unbounded family, CR_6 or the root.
- Ran python3 -I background/verification/verify_corpus.py from that same directory: PASS, 31 sources / 31 results / 14 topics / 8 gaps / 30 terms; 13 checked primaries / 2 checked authoritative secondaries / 16 unchecked; zero project-originated claims in the unchanged inherited corpus. Packaging/provenance only.
- Performed a same-worker mathematical sufficiency and falsification review of the exact proofs in RL6_RECOVERY_REPORT.md.
- Checked checkpoint JSON, exact artifact path set, hashes, relative links against the pinned repository paths, source-limit retention, one completed work unit and the single next recovery task before publishing the isolated work branch.

## Same-worker mathematical review

| Check | Finding and exact limit |
|---|---|
| Colorfulness / private colors | P01 flips a component of an actual proper six-coloring; uniqueness is on all S, not only six chosen roots. |
| Simultaneous model | P02 checks six nonempty connected rooted branches, disjoint interiors and all 15 adjacencies; the matching ensures disjoint palettes. |
| Critical input | P03 colors an explicitly proper star-contraction minor; its pullback preserves every H edge. Seven neighbors and full colorfulness force exactly one repeated pair and five unique colors. No chromatic minor-monotonicity. |
| No universal-vertex restart | Only local adjacency to five representatives is used. No universal vertex in H or unavailable higher-order minor is assumed. |
| Unbounded scope | Analytic proofs retain graph order, root-set size, outside vertices and path lengths. The example permits every m>=1. |
| Falsification | P04 checks every six-coloring/transversal through the 2,2,1 class pattern in each C5. Its explicit positive rooted model prevents mislabelling it as a CR_6 negative. |
| C2 / C3 sufficiency | Signature counting leaves r unbounded; the separator reduction leaves unavoidability unproved. Neither is consumed as a complete root bridge. |
| Circularity / sharpness | F_6 and proper-minor coloring are independent antecedents. One exact order-six model lifts to order seven. No ordinary order-seven theorem or universal CR_6 is assumed. |
| Source preservation | No retrieval/query; all source labels, RL3 gaps, RL4/RL5 inspection/access limits and Collatz audit limits remain. |
| Root boundary | No general CR_6 proof, actual Hadwiger counterexample, or universal sharp theorem. |

This review is not independent external review or formal proof checking. No numerical experiment or new finite certificate was generated. Newly complete analytic proofs are work results pending normal authority promotion; that status is distinct from calling their proofs incomplete.

## Checkpoint transaction

Publish only research-checkpoints/RL6/ on work/rl6-route-recovery-20260930, based on BASE_HEAD. Build and inspect one complete candidate Git tree with the BASE_HEAD root tree as base. The whole pre-existing repository, including main authority and frozen sessions, must retain its original object identities. The checkpoint commit has BASE_HEAD as sole parent.

Before publishing the branch, recheck live main equals BASE_HEAD. Create the branch at the complete verified checkpoint commit, read back its ref and every checkpoint blob, and recheck that main still points to BASE_HEAD. Immutable commit/tree IDs and the readback receipt are reported by the worker; the commit cannot record its own identity in this file.

No main ref advance, numbered transition, early freeze, successor installation or partial authoritative commit is permitted in this checkpoint. RL6 remains open; normal closeout waits for the user's finish instruction. The recommendation is to finish the RL after preserving this material unit.

## Mechanical incidents

T-001: Git mirror read lacked authentication; supported repository connector operations replace it. T-002: a local read-orchestration expression failed before useful batch output and was corrected; final input byte checks passed. Both are recorded separately in the failure appendix and change no mathematical/source classification.

## Durable frontier

The report, source-preserving residual ledger, FL-001–FL-005 dated events and FL-006–FL-008 new entries are retained. The next task is the changed degree-seven C7 defect with an unproved auxiliary path-selection mechanism. No second investigation has started.
