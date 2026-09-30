# RL4 closeout verification and retained limits

Closeout date/cutoff: 2026-09-30. **RL4 CLOSED/FROZEN; RL5 is the unique successor.** No new mathematics, source retrieval, route exploration or optional historical audit was undertaken during CLOSEOUT_LOCK.

## Input and checkpoint identity

Live main was rechecked at BASE_HEAD 779339630af6e819cd047462941bed97a571630b, with incoming authoritative tree 5fe85255f41270f3bf5a5b808f706c319c6696e3. All 31 input blobs agree with RL4_INCOMING_SNAPSHOT.json. The verified work checkpoint is 2711e0d9370698566f2bfdca25affc0743706cd8; its nine-file artifact tree is 014f81fb6722b7e0e6661a990460c1f314c69e59.

All original checkpoint bytes and all original incoming authority bytes are retained under sessions/RL4/checkpoint/ and sessions/RL4/incoming/. The carried background remains the inherited RL2 tree 2524a0821e56d09fe2d49cdf4850d358ed21b38f. All earlier frozen session trees and unrelated repository entries are preserved.

## Checks actually performed

| Check | Result and exact domain |
|---|---|
| Incoming and checkpoint integrity | PASS: all 31 incoming blobs, every original checkpoint file and all eight non-self manifest hashes match the pinned Git objects. The manifest itself is preserved byte-identically. |
| Corpus verifier, frozen and successor copies | PASS: 31 sources, 31 results, 14 topics, 8 open/source gaps and 30 glossary terms; 13 checked primaries, 2 checked authoritative secondaries, 16 not directly checked, and 0 project-originated claims in the inherited corpus. |
| Exact finite-base verifier, frozen and successor copies | PASS: one nine-vertex, 20-edge base; all 130 deletion sets through size 3, all 3125 rooted-model assignments, and all 19683 three-color assignments. Explicit K4 model and four-coloring checked. Regenerated certificate bytes equal the original certificate. |
| Carried corpus and certificate bytes | PASS: the entire background and both certificate/verifier copies agree byte-for-byte with BASE_HEAD; no enlarged certificate domain is inferred. |
| P01/P02 proof scope | Retained complete analytic deductions: all-colorings factorization and one simultaneous rooted K6 on H=K2 join P, chi(P)=4, every colorful S and arbitrary graph order/root-set size, using inherited checked CR_4. |
| P03 relevance scope | Retained analytic proof using inherited ordinary order 6: no G-v in a hypothetical minimal 7-counterexample contains a universal vertex. M1 covers none of that critical frontier. |
| Universal and source-status guards | Universal CR_6 remains NOT PROMOTED / INCONCLUSIVE. The current primary resolution was not recovered; openness is not certified. All source-access failures and distinct-negative scopes are retained. |
| Falsification / compatibility audit | All six branches and fifteen adjacencies coexist in P02; no fixed-root substitution, K12 input, chromatic loss or circular sharp upgrade. CM-R is noncolorful; the routing and dominating negatives do not refute CR_6. No ordinary counterexample is claimed. |
| Portability and successor | Definitions, complete scoped proofs, canonical classifications, inherited dependencies, source limits, stopping conditions and exact verifier instructions are carried. Exactly RL5 follows RL4, with one current source/new-input gate brief. No RL5 research has begun. |

The scope audit is retained from the same-worker checkpoint review, not independent external review or formal proof checking. The corpus verifier checks packaging/provenance, not mathematical proofs. The finite certificate covers only the specified base; its unbounded join lift has a separate inherited analytic proof. External theorem statements retain their recorded inspection limits. No novelty or independent recertification is claimed.

## Explicit closeout normalizations

The completed flat reports change only status/path/control wording. Mathematical proof sections P01-P03, full quantifiers, source statements and retrieval limits are retained. The original work-unit records remain untouched under checkpoint/.

The old RL3-to-RL4 handover path and old RL3 brief path are retired navigation records. The completed RL4 brief is historical in the frozen session and a retired redirect in successor authority, so carried roadmap/corpus links remain valid without creating another incoming brief. Root navigation now identifies completed RL4 and unique incoming RL5. No infrastructure or unrelated cleanup is included.

No previously promoted mathematical claim was corrected or demoted. The canonical combined proof-state file incorporates RL4's exact restricted deductions and relevance barrier while retaining all prior valid scopes. Freezing the inconclusive universal assessment does not prove CR_6.

## Residual obligations and successor boundary

Full sharp ordinary Hadwiger remains unresolved by this project at every ordinary t>=7 and arbitrary order. Universal CR_6 is not established; even a future proof would imply ordinary order 7 only, leaving every t>=8 and every CR_s for s>=7. M1's added universal-vertex premise is not a coverage reduction for the critical application.

RL3-GAP-01 is narrowed but remains. OPEN-0005, OPEN-0008 / SRC-0014 / RES-0015, all sixteen inherited unchecked labels and RL3-GAP-02 are unchanged. Original Holroyd full-text access, published-version access and comprehensive cutoff-status verification remain limited as recorded in SOURCE_STATUS_AND_SEARCH_LOG.md.

The sole RL5 brief is RL5_CR6_SOURCE_AND_NEW_INPUT_GATE_BRIEF.md. It requires a named primary resolution/status lead or independently grounded root-relevant input; absent one it records a blocked result and stops. It does not restart M1, select a second mechanism, or create a new global roadmap.

## Reproducibility and atomic publication

The following commands were executed from both the candidate frozen state and the candidate successor state:

    python3 -I verification/verify_rooted_barrier.py
    python3 -I background/verification/verify_corpus.py

Before publication, validate relative file links, JSON, artifact hashes, canonical status/brief identity and the complete intended final path set against RL4_CLOSEOUT_MANIFEST.json. The full candidate must preserve previous session trees, freeze completed RL4 plus its exact incoming/checkpoint subtrees, replace authority with only incoming RL5, and update root navigation in one commit with BASE_HEAD as sole parent.

Recheck live main immediately before one non-forced ref advance. Then read back main, the complete intended Git tree, the frozen RL4 entrypoint and successor RL5 entrypoint. The created commit supplies its immutable identity, avoiding a self-referential commit hash in this report. Exact created objects and remote readback results are recorded in the closing worker's receipt and completion response. Local-only or partially written construction is not a completed transition.
