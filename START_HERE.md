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

## Current handoff

RL5 is CLOSED/FROZEN under `sessions/RL5/`. RL6 is the unique incoming session, with an input-admission hold after the completed CR6 gate. Full sharp Hadwiger remains the root, accepting either a rigorous proof or an actual verified counterexample. Begin through `authoritative/START_HERE.md` and its sole RL6 brief. No new qualifying input is carried; do not repeat the completed gate without a named premise-changing resource or independently justified input.
