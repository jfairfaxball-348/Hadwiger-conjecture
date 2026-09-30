# RL3 closeout verification and retained limits

Closeout date/cutoff: 2026-09-30. RL3 is CLOSED/FROZEN; RL4 is the unique successor. This report records the candidate checks and the required atomic publication/readback procedure. Local-only construction is not a completed transition.

## Input identity and scope freeze

The live main base was rechecked at d5a978dd4e37040a63645a83e5c39c94c3b5182e, with authoritative tree 8f8e3c6f077d2879ca5f25933d2e7be90aacbc91. All 27 pinned input blobs and all checkpoint manifest artifact hashes passed. The full incoming authority and all 13 checkpoint artifacts are preserved byte-identically as the immutable incoming/ and checkpoint/ subtrees of sessions/RL3/. The original checkpoint is 50f5c52f0b449346e9d399b907eb8393bf8e25ac.

Closeout followed AGENTS.md, docs/CLOSEOUT_LOCK.md and docs/VERIFICATION_AND_CLOSEOUT.md. It performed no new mathematics or route discovery. Status/path/control wording was normalized explicitly; mathematical statements, proof classifications, source limits and N1's quantifiers and stopping rules were retained. A candidate link check found a preserved-corpus reference to the old brief path; an explicit retired-entrypoint redirect repairs navigation without altering any corpus bytes or installing another current brief. No mathematical corrections or demotions occurred.

## Checks actually performed

| Check | Result and domain |
|---|---|
| Input and checkpoint blob integrity | PASS; exact Git blob and SHA-256 identities where the checkpoint manifest supplies them |
| Carried background identity | PASS; all frozen and successor bytes equal the inherited RL2 tree 2524a0821e56d09fe2d49cdf4850d358ed21b38f |
| Corpus verifier, both copies | PASS; 31 sources, 31 results, 14 topics, 8 open/source gaps, 30 glossary terms; 13 checked primaries, 2 checked authoritative secondaries, 16 not directly checked, 0 project-originated claims in that inherited corpus |
| Finite-base verifier, both copies | PASS; one 9-vertex P, all 130 deletion sets through size 3, all 3125 rooted-model assignments and all 19683 possible 3-colorings; explicit K4 model and 4-coloring checked; regenerated certificate equals the checkpoint certificate |
| Mathematical scope review | Root quantifiers, A1-A11 distinctions, BR-00 through BR-08 scopes, both dichotomy alternatives and the finite prefix, sharpness, simultaneous compatibility and non-circular sufficiency retained from the verified checkpoint |
| Falsification review | CM-B/CM-D have chi<t; CM-R has noncolorful roots. These refute only the weaker premises recorded. None is a counterexample to ordinary Hadwiger or to CR_6 |
| Portability and links | Exact entrypoints, required current reads, definitions, classifications, source gaps, proofs, verifier instructions and sole RL4 brief carried; relative Markdown file links and inherited catalog IDs checked |
| Successor identity | Exactly RL4 follows completed RL3. N1's exact target and one-work-unit stopping rule are unchanged. No RL4 research has begun |

The corpus check is mechanical packaging/provenance validation, not a proof verifier. The exact finite certificate covers only P. The unbounded join family has a separate analytic proof. There is no full-Hadwiger certificate, novelty claim, formal proof certification or independent external reviewer certification.

## Open obligations preserved

Full sharp Hadwiger and its universal critical completion remain unresolved in this project at every t>=7 and arbitrary graph order. A proof of CR_6 would imply ordinary t=7 only. OPEN-0005, OPEN-0008 / SRC-0014 / RES-0015, all inherited unchecked-source limits, RL3-GAP-01 and RL3-GAP-02 remain. Checked preprint statements retain their stated verification limits. These are source/research gaps, not unexplained integrity failures.

## Required transaction and reproducibility

Run `python3 -I verification/verify_rooted_barrier.py` from this state directory; run `python3 -I background/verification/verify_corpus.py` for the carried corpus. Both commands were executed separately from the candidate frozen and successor directories and passed.

The complete intended Git tree must be inspected against RL3_CLOSEOUT_MANIFEST.json before publication. Preserve all previous session trees and unrelated root entries, freeze sessions/RL3/, replace authoritative/ with only incoming RL4, and update the root navigation in one commit with parent BASE_HEAD. Recheck live main and incoming authority before the single non-forced ref advance. Afterward read back the remote ref, full intended tree, frozen entrypoint, successor entrypoint and candidate blobs; do not report completion until these pass. The created commit supplies its own immutable identity, avoiding a self-referential commit hash in this report. The closing worker records the exact created objects and readback in its receipt and completion response.

The historical checkpoint verification remains unchanged under checkpoint/VERIFICATION_REPORT.md. It describes the earlier non-authoritative publication, not the numbered transition.
