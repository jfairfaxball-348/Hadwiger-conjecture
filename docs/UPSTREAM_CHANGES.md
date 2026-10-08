# Changes to the upstream files under `OAI/`

`OAI/` holds 288 files of `openai/math` at commit
`fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb` (Apache-2.0); see `NOTICE`. This file lists every
change made to them in this repository, as section 4(b) of the licence requires.

## State at the commit that added them (2026-10-08)

**None.** The files are byte for byte the upstream blobs: each was written from upstream's
git object and its `git hash-object` was compared with the blob hash in upstream's tree.

Built here unchanged, with Lean `v4.34.1` and Mathlib `d13f23b` (upstream's own pins): 288
modules, no error, no warning. `#print axioms` on
`OAI.HadwigerCounterexample.exists_counterexamples` and on
`OAI.HadwigerCounterexample.not_hadwiger_conjecture` gives `propext`, `Classical.choice`,
`Quot.sound` and nothing else.

To check again: for a file `OAI/X.lean`, `git hash-object OAI/X.lean` at that commit equals
the blob of `lean/OAI/X.lean` in `git ls-tree -r fd4aeeb` of `openai/math`.

## Port to Lean's module system (2026-10-08)

All 288 files were changed, mechanically and in the same way, by
`scripts/port_to_modules.py`:

- a two-line comment was put at the top of each file, saying that it comes from
  `openai/math` and has been modified;
- a line `module` was put before the imports;
- every `import X` became `public import X`;
- a line `@[expose] public section` was put after the imports.

Nothing else was changed: no declaration, no statement, no proof. After this change the
whole tree built with Lean `v4.34.1` and Mathlib `d13f23b`, with no error and no warning
(before the comment lines were added, which are the only later difference).

To see the change for one file: `git diff 435a157 -- OAI/X.lean`.

## Move to Lean `v4.35.0-rc2` and the Mathlib commit tagged `v4.35.0-rc2` (2026-10-08)

**No upstream file was changed for this.** After the port above, all 288 files built on the
new pins as they stood, with no error and no warning. (The Mathlib commit is 69 commits
after the one upstream pins.) The one repair the move needed was in this project's own
files: two sanity lemmas about `ZMod 2`, where a new Mathlib instance had to be switched off
locally (`Hadwiger/Sanity/HoleRelation.lean`, `Hadwiger/Sanity/Supersaturation.lean`).
