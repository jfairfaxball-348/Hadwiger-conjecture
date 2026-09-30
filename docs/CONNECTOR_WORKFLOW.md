# Connector worker workflow

`AGENTS.md` is binding. This document is connector-specific efficiency/resumability guidance.

## Hot startup set

After pinning the live default-branch `BASE_HEAD` and authoritative tree/snapshot identity, read only:

1. `AGENTS.md`;
2. `authoritative/START_HERE.md`;
3. the exact session brief named there;
4. any exact current files that brief or entry point explicitly requires.

Do not recursively enumerate `sessions/`, `Archive/`, `authoritative/`, or `knowledge/` merely to rediscover current paths.

## Compact resume state

Maintain a non-authoritative resume record with at least:

```json
{
  "format": "rl-connector-resume-v1",
  "base_head": "<commit>",
  "authoritative_tree": "<tree-or-snapshot-id>",
  "incoming_rl": 1,
  "session_brief": "authoritative/<brief>",
  "validated_authority_paths": [],
  "last_verified_frontier": "<compact statement>",
  "completed_artifacts": [],
  "unpromoted_or_uncovered": [],
  "next_exact_operation": "<single next operation>",
  "do_not_recompute": [],
  "failure_lesson_ids": [],
  "recovery_mode": null,
  "changed_input_or_mechanism": null,
  "next_task_bounds": null,
  "retry_conditions": [],
  "stop_and_repair_active": false
}
```

This record aids resumability only. It cannot promote mathematics.

Update it after startup validation, before and after long computation, after material intermediate results, before switching branches, before a long connector sequence, and immediately before closeout.

A blocked route must carry a provenance-linked failure record and a next bounded recovery task under `docs/RESEARCH_RECOVERY_PROTOCOL.md`. Preserve exact unsuccessful queries and inspected passages so a connector does not replay them without a concrete change. Recovery candidates remain unpromoted until justified.

## Bare continue fast path

On a later bare `continue`:

1. read the compact resume state;
2. fetch the live default-branch HEAD;
3. if HEAD still equals `BASE_HEAD` and authority identity is unchanged, reuse the validated start gate;
4. load only files needed by `next_exact_operation`;
5. execute one bounded continuation work unit;
6. persist the durable frontier before another expensive branch.

## Search discipline

Prefer exact current paths first, then exact frozen provenance paths, then narrow repository search. Broad recursive history scans are exceptional diagnostics.

## Closeout

Freeze candidate files before remote mutation. Record candidate hashes and created Git object IDs. Construct one complete candidate tree, perform a final live `BASE_HEAD` comparison, advance the ref once, then read back the frozen session and successor authority.

Immutable Git objects should be reused after interruption rather than recreated.
