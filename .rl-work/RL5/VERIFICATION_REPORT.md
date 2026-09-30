# RL5 bounded checkpoint verification

Date: 2026-09-30. Status: **NOT PROMOTED — work-branch checkpoint only.**

## Checks actually performed

| Check | Result and domain |
|---|---|
| Live default branch | GitHub repository metadata confirms main. Its live SHA is BASE_HEAD e345884d1656fe1b7c77bafb0d6b6df0027bfb28. |
| Authority identity | All 39 authority blobs match the pinned Git bytes and snapshot SHA256 values. Authority tree 55e4b84008084a14a3e04e4caf96c0e910b4ff40; background tree remains 2524a0821e56d09fe2d49cdf4850d358ed21b38f. |
| Unique start gate | START_HERE names only RL5 and RL5_CR6_SOURCE_AND_NEW_INPUT_GATE_BRIEF.md. Required current reads completed; no unresolved integrity failure identified. Explicit source gaps remain. |
| Corpus verifier | PASS: 31 sources, 31 results, 14 topics, 8 open/source gaps, 30 terms; 13 checked primary, 2 checked authoritative secondary, 16 not directly checked, 0 project-originated corpus claims. Packaging/provenance only. |
| Finite-base verifier | PASS: one labeled 9-vertex, 20-edge graph; all 130 deletion sets through size 3, all 3125 root-model assignments and all 19683 three-color assignments. Explicit K4 model and 4-coloring checked. Regenerated certificate is byte-identical. |
| Source/version inspection | New source's v1 identity and journal publication date checked. Both primary HTML statements inspected; published construction text inspected. PDF/figure and full-proof certification limits retained in SOURCE_GATE_LEDGER.md. |
| Scope and falsification review | Same-worker review rejects the shifted rooted-model exclusion as a CR_6 resolution. Nonempty and empty coloring-relation cases distinguished. No root-equivalent input, fixed-root substitute or unproved sharp assembly is accepted. No positive critical case or negative witness is claimed. |
| Preserved mathematics and limits | All inherited authority, corpus, certificate and earlier frozen-session bytes remain unchanged. M1 was not restarted; no source label, mathematical classification or coverage range was promoted/demoted. |
| Checkpoint packaging | JSON, internal links, full candidate path set and manifest hashes checked before publication. Exactly the eight RL5 work files are added; no default-branch transition or successor installation. |

Verifier commands actually run from the repository root:

    python3 -I authoritative/background/verification/verify_corpus.py
    python3 -I authoritative/verification/verify_rooted_barrier.py
    git diff --exit-code

No mathematical files were changed after those runs. Their finite/provenance domains do not verify CR_6 or full Hadwiger. The scope review is neither independent external review nor formal proof checking.

## Publication boundary

The checkpoint is stored on work/rl5-cr6-input-gate-20260930, with BASE_HEAD as sole parent and additions confined to .rl-work/RL5/. Immediately before publishing its ref, reconfirm live main still equals BASE_HEAD. Read back the checkpoint ref, exact artifact tree and report bytes, and verify main/authority remain unchanged. Created object identities and remote readback are recorded in the worker's publication receipt; the immutable checkpoint commit need not be embedded in its own hashed files.

RL5 remains open, with one bounded unit complete and a recommendation to finish. A later `finish up` alone triggers deterministic numbered closeout under AGENTS.md and docs/VERIFICATION_AND_CLOSEOUT.md. This checkpoint does not claim a frozen RL5 or an incoming RL6.
