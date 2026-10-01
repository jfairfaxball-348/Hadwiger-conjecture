# RL10 work verification and limits

Date: 2026-10-01 Europe/Madrid. Completed audit checkpoint, **NOT PROMOTED**. No numbered RL10 transition has occurred.

## Checks actually performed

| Check | Actual result and domain |
|---|---|
| Live start gate | PASS: main equals expected `bf3ebc0b9e5470b8170c00ff17094882a6adf689`; root rules and unique current RL10 brief agree. No frozen RL10 exists. |
| Incoming content identity | PASS: all 94 local authority files equal their pinned Git blob identities and recorded SHA-256 values; authority tree `7afef1a1971df6ae955a78568831c484493de4d9`. |
| Lineage | PASS: nine numbered transition commits, with both non-RL process amendments distinguished. Every frozen RL1–RL9 tree is unchanged since its creation. RL2–RL9 incoming trees equal the respective transition-parent authority trees; both renamed/preserved RL1 authority blobs match. |
| Retained corpus/base/Collatz identity | PASS: background equals frozen RL2, finite-base verifier/certificate equals frozen RL3, Collatz review equals frozen RL2. No source or certificate scope change. |
| RL8 fixed checker | PASS: one 12-vertex/44-edge graph, all 220 triples, seven supplied star colorings, five supplied paths of lengths 2,2,2,2,3, one omitted-root use and all fifteen/21 model adjacencies. |
| RL7 fixed checker | PASS: one 12-vertex/44-edge graph, its triangle-free complement, seven supplied quotient colorings, five supplied uncolored paths and all fifteen/21 model adjacencies. |
| Rooted-barrier finite-base checker | PASS: one 9-vertex/20-edge graph; all 130 cuts through size three, 3125 rooted assignments and 19683 three-colorings. Explicit positive model/coloring checked. Regenerated certificate bytes unchanged. |
| Corpus checker | PASS: 31 sources/results, 14 topics, 8 gaps, 30 terms; 13 checked primary, 2 checked secondary, 16 unchecked; zero project-originated claims in inherited corpus. Schema/provenance/package validation only. |
| Analytic review | Completed at exact scopes in DEPENDENCY_SCOPE_AUDIT.md: RL6–RL9 P01–P04, earlier consuming reductions/barriers, C2/C3, complete matching criterion, all residual deletion cases and every-edge extension. No invalid inference found at those scopes. |
| MK2 boundary | Only conditional sufficiency/circularity/scheduling audited. No proof/disproof assessment executed; original authoritative deferred record unchanged. |
| Mathematical/source activity | Zero new graph/coloring/path census or sampling; zero new mathematical numerical computation; zero new source queries. Only the recorded four inherited checkers and finite repository packaging/identity operations. |
| Preservation during work | PASS: tracked working tree remains clean; all work is in the ignored RL10 scratch area until isolated checkpoint publication. Main authority is untouched. |

Exact script stdout and return codes are preserved in [VERIFIER_RESULTS.json](VERIFIER_RESULTS.json). Exact lineage/tree identities are in [LINEAGE_AND_PRESERVATION.json](LINEAGE_AND_PRESERVATION.json). Before publication, artifact JSON, local links, hashes and complete intended tree are checked and recorded in CHECKPOINT_MANIFEST.json. Its own hash is excluded to avoid self-reference; the final Git-tree comparison includes the manifest itself.

The scripts were read before execution, and their fixed domains were recorded first in WORK_UNIT_SCOPE.md. They were run once from authoritative/ using:

```bash
python3 -I verify_uncolored_core.py
python3 -I verify_auxiliary_countermodel.py
python3 -I verification/verify_rooted_barrier.py
python3 -I background/verification/verify_corpus.py
```

## What these checks do not certify

Fixed-witness passes do not certify universal colorfulness proofs, universal routing impossibility, RL8-P02's analytic case proof, EX5, or the matching criterion. The finite base does not certify its unbounded join lift. Corpus validation does not certify source theorems or complete/current literature discovery. Fresh current-worker analytic review is not external independent certification, formal proof checking or a novelty audit. No unrestricted graph domain has been exhaustively computed.

All inherited source/access/cutoff/citation limitations and the imported Collatz review's unrerun-certificate limitation remain. No ordinary Hadwiger proof or finite h<chi counterexample is claimed.

## Checkpoint and future promotion

Publish only an isolated non-authoritative checkpoint with BASE_HEAD as parent and artifacts under `work-checkpoints/RL10-20261001/`. No modification of authoritative/, sessions/, policy files or existing sources is included. Recheck live main and the entire intended tree, publish the work branch, and read back its commit/artifact identities plus unchanged main. Immutable publication IDs and readback results go in the external receipt, avoiding a self-referential commit ID in these files.

The audit recommends normal finish. Per AGENTS.md, that recommendation is not itself closeout. On the user's finish instruction, enter CLOSEOUT_LOCK and deterministically preserve the already-completed audit, append FL-012/no-demotion record, freeze RL10 and install the single prepared RL11 brief. Carry all retained scopes and original deferred MK2 provenance; make clear that only the new successor mandate authorizes its future assessment. Run required checks on the actual frozen/successor copies, inspect the full intended tree, and publish/read back one atomic numbered transition. No new research is part of that closeout.
