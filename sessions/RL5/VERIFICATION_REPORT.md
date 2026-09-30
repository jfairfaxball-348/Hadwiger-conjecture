# RL5 closeout verification and retained limits

Closeout date/cutoff: 2026-09-30. **RL5 CLOSED/FROZEN; RL6 is the unique incoming successor.** CLOSEOUT_LOCK performed no further mathematics, source retrieval, route exploration or optional historical audit.

## Identity and preservation

BASE_HEAD: e345884d1656fe1b7c77bafb0d6b6df0027bfb28.
Incoming authority tree: 55e4b84008084a14a3e04e4caf96c0e910b4ff40, with 39 blobs.
Verified checkpoint: bdd710f2ca5323b308462812dc3e55ee59d1e4ef on work/rl5-cr6-input-gate-20260930.
Checkpoint artifact tree: 4fed67ed34e0503b85b93c9328a2c4a1a7f68c3c, with eight files.
Inherited RL2 background tree: 2524a0821e56d09fe2d49cdf4850d358ed21b38f.

All original incoming and checkpoint bytes are preserved under sessions/RL5/incoming/ and sessions/RL5/checkpoint/. The complete background, finite certificate/verifier, and previous frozen sessions remain byte-identical. All non-self checkpoint hashes and the original manifest match their recorded objects. RL5_INCOMING_SNAPSHOT.json is historical input provenance, not a later worker's BASE_HEAD.

## Checks actually performed

| Check | Result and exact scope |
|---|---|
| Incoming identity and freeze | PASS: all 39 blobs match the pinned authority and their snapshot hashes. |
| Checkpoint freeze | PASS: all eight files match the remotely verified checkpoint artifact tree and retain original bytes. |
| Corpus verifier, frozen and successor | PASS on both actual candidate copies: 31 sources, 31 results, 14 topics, 8 open/source gaps, 30 terms; 13 checked primaries, 2 checked authoritative secondaries, 16 not directly checked, 0 project-originated corpus claims. |
| Finite-base verifier, frozen and successor | PASS on both actual candidate copies: one 9-vertex, 20-edge base, all 130 deletion sets through size 3, 3125 rooted-model assignments, and 19683 three-color assignments. Explicit K4 model and 4-coloring checked. Regenerated certificates equal their inherited bytes. |
| Source/scope retention | PASS: RL5's checked theorem-scope and comparison section, root/target/sufficiency audit and residual domains remain byte-identical at their substantive scopes. Incoming canonical mathematical scope remains byte-identical, with the explicit completed RL5 addendum only. |
| Frozen/successor consistency | PASS: completed load-bearing reports, source ledger, classifications, brief, handover and snapshot agree between frozen and successor copies. |
| Same-worker sufficiency/falsification audit | Retains BLOCKED / INCONCLUSIVE. No CR_6 resolution, compatible sharp model, sufficient independent non-universal-vertex input, finite negative witness or ordinary counterexample is promoted. No source status is inferred from failed recovery. |
| Portability and navigation | Relative file links and JSON checked; one current RL6 entrypoint and one current brief, with no accepted new input. Old briefs/handovers are explicitly historical redirects. Exact path/hash counts are in RL5_CLOSEOUT_MANIFEST.json. |
| Entire candidate tree | Full path set/hashes inspected against BASE_HEAD. Only frozen RL5, successor authority and root handoff navigation change; previous sessions and unrelated entries remain. |

The same-worker scope audit is not independent external review or formal proof checking. The corpus verifier checks packaging/provenance, not mathematical proofs. The finite certificate covers only its exact base, not the unbounded analytic lift, CR_6 or full Hadwiger. External source statements keep their original inspection limits; no full proof or cited dependency was independently recertified in RL5.

## Explicit closeout normalizations

Completed flat files change status, links and finished/next control wording only. The eight original work-unit files remain untouched in checkpoint/. The 39 incoming authority blobs remain untouched in incoming/. Their original relative links refer to their original layout; current load-bearing navigation uses the completed flat records. Historical snapshot and manifest filenames do not define future worker inputs.

The canonical proof state adds the checked RL5 gate outcome without changing any inherited mathematical scope. No prior mathematical claim is repaired or demoted. The successor is an input-admission hold, not a new roadmap, repeated source sweep or second mechanism. Exactly one numbered transition is prepared.

## Retained obligations and successor

Full sharp Hadwiger remains unresolved by this project at every ordinary t>=7 and arbitrary order. Universal CR_6 is NOT PROMOTED / INCONCLUSIVE. Even a future general CR_6 proof implies ordinary order 7 only; every t>=8 and every CR_s for s>=7 remains. A CR_6 countermodel is distinct from an ordinary counterexample with rigorous h(G)<chi(G).

M1 still covers none of the critical order-7 frontier. No qualifying independently justified new input is inherited. Preserve RL3-GAP-01, original Holroyd/published-version access limits and incomplete cutoff coverage, RL3-GAP-02, OPEN-0005, OPEN-0008 / SRC-0014 / RES-0015 and all sixteen inherited unchecked-source limits. No resolution or current-openness certificate is claimed.

The sole RL6 brief is [RL6_BLOCKED_FRONTIER_INPUT_ADMISSION_BRIEF.md](RL6_BLOCKED_FRONTIER_INPUT_ADMISSION_BRIEF.md). It requires a specified genuinely new input before research; absent one, preserve HOLD / BLOCKED and stop after startup validation. No RL6 research has begun.

## Reproducibility and atomic publication

Commands executed from each actual candidate state directory:

    python3 -I verification/verify_rooted_barrier.py
    python3 -I background/verification/verify_corpus.py

Before publication, validate all intended paths, hashes, JSON, relative links, authority uniqueness, frozen/successor consistency and scope retention against RL5_CLOSEOUT_MANIFEST.json. Reconfirm live main equals BASE_HEAD immediately before one non-forced ref advance. Create one numbered RL5 transition with BASE_HEAD as sole parent. Read back main, the complete intended Git tree, frozen RL5 and successor RL6 entrypoints. Immutable object IDs and readback results belong in the closing worker's receipt; the commit supplies its own identity without a self-referential hash in this report. A local or partial construction is not a completed transition.
