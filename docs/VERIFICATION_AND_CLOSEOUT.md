# Verification and atomic closeout

`AGENTS.md` is binding. This procedure applies after `CLOSEOUT_LOCK`.

## Candidate gate

Before changing remote authority:

1. freeze the exact proposed research state;
2. classify every promoted item;
3. record exact scope, dependencies, barriers, corrections/demotions, and open obligations;
4. prove any promoted finite certificate is gap-free over its claimed domain;
5. run all current required verifiers/red teams;
6. ensure the handover contains all load-bearing definitions and provenance needed by a fresh worker;
7. confirm the handover reproduces the frozen candidate state;
8. confirm incoming `authoritative/` still matches `BASE_HEAD` and the recorded snapshot/tree identity;
9. confirm the successor RL is exactly one number ahead;
10. inspect the complete intended final repository path set/tree.

If a mathematical or authority-integrity step fails, do not promote.

## Atomic repository transaction

Only after the candidate gate passes:

1. reconfirm live default-branch HEAD still equals `BASE_HEAD`;
2. freeze the completed incoming generation under `sessions/RL<N>/`;
3. replace `authoritative/` with only the verified successor incoming state;
4. preserve historical provenance;
5. create one atomic numbered RL-transition commit with no unrelated cleanup;
6. advance/push the intended remote branch/ref once;
7. read the remote ref back and require its SHA to equal the new commit;
8. read back the frozen session entry point and successor `authoritative/START_HERE.md`;
9. confirm no half-transition remains.

The invariant is:

> The remote commit contains the complete verified numbered transition, or the numbered transition does not exist.

## Successor handover

The successor `authoritative/START_HERE.md` must identify exactly one incoming RL and exactly one current session brief. It must carry forward the minimum load-bearing state needed to continue without conversation history.

Do not silently create a long-horizon roadmap during closeout. Preserve only current state, exact open obligations, and the next session brief unless the user has explicitly requested broader planning.

## Final reporting

After successful promotion, report succinctly:

- completed incoming RL;
- main promoted results and classifications;
- any correction/demotion;
- verifier/red-team status;
- successor RL and brief path;
- promotion commit SHA;
- confirmation that the intended remote ref points at it.

For an unpromoted job, say clearly that authority did not change and report the last verified checkpoint plus exact remaining work.
