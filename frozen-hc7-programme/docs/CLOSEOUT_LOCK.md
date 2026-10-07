# CLOSEOUT_LOCK

`AGENTS.md` is binding.

## Trigger

Enter `CLOSEOUT_LOCK` when the user asks to finish, close, hand over, commit/push, end, or promote the current RL, or when continuing research materially risks losing the ability to close cleanly.

Only an explicit instruction to resume mathematics unlocks the job before successful promotion.

## Required compact closeout state

Record enough non-authoritative state to finish deterministically without relying on conversation memory:

- `BASE_HEAD` and authoritative snapshot/tree identity;
- incoming and successor RL numbers;
- current session brief;
- promoted results and classifications;
- corrections/demotions;
- barriers and open obligations;
- candidate paths/hashes;
- verifier/red-team results, if any;
- intended frozen-session paths;
- intended successor-authority paths;
- intended commit/ref;
- for connector workers, already-created blob/tree/commit object IDs;
- exact remaining deterministic operation.

## Behaviour while locked

Do not begin new mathematics, scans, route exploration, broad historical audits, or opportunistic cleanup.

Permitted work is only:

1. freeze and classify the candidate;
2. run required verifiers/red teams;
3. ensure the handover is complete and portable;
4. confirm incoming authority still matches `BASE_HEAD`/snapshot;
5. construct one atomic repository transition;
6. advance/push the intended ref once;
7. read back the committed session and successor authority.

If a genuine mathematical error appears, make the smallest explicit correction/demotion necessary, reverify, and continue closeout.

## Connector idempotency

Connector closeout should record immutable Git object IDs as soon as they are created. If interrupted, reuse existing blobs/trees/commits rather than recreating them. Perform the final live-`BASE_HEAD` comparison immediately before the ref move.

If the ref already equals the recorded candidate commit after interruption, do not move it again; proceed with readback.
