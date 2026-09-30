# Hadwiger research repository — start here

The repository is the research-state carrier; worker conversations are disposable.

Read, in order:

1. [`AGENTS.md`](AGENTS.md) — binding conveyor rules;
2. [`authoritative/START_HERE.md`](authoritative/START_HERE.md) — unique incoming RL;
3. only the exact current files named by that authoritative entry point.

Before beginning mathematics, complete the start gate in `AGENTS.md`.

## Connector fast path

A connector worker should:

- pin the live default-branch `BASE_HEAD`;
- read `AGENTS.md`;
- read `authoritative/START_HERE.md`;
- read the exact current session brief and any exact authority files it names;
- keep a compact non-authoritative resume state keyed by `BASE_HEAD` and the authoritative tree/snapshot identity.

Do not recursively preload `sessions/`, `Archive/`, or `knowledge/`. Historical material is opened only when a live dependency requires an exact path.

## Local scratch

Shell/local scratch belongs under ignored `.rl-work/RL<incoming>/`. Connector workers may use equivalent sandbox artifacts.

Scratch is never authority.

## Initial condition

This scaffold intentionally contains no mathematical roadmap, no selected proof route, and no mathematical claim. RL1 is the first incoming exploratory session.
