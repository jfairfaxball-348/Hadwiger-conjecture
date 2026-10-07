# Lean workflow

## Environment

- Lean toolchain: `leanprover/lean4:v4.34.1` (file `lean-toolchain`), installed by `elan`.
- Mathlib: commit `d13f23b723b8a846827a245b89c10fc7d3f11612` (file `lakefile.toml`, locked
  in `lake-manifest.json`).
- Python 3 for the two check scripts (standard library only). On this Windows machine the
  command is `python`; in CI it is `python3`.

## First-time setup

```bash
lake exe cache get
```

```bash
lake build
```

`lake exe cache get` downloads prebuilt Mathlib (several GB unpacked). Never let Mathlib
build from source; if `lake build` starts compiling Mathlib files, stop it and run the
cache command again.

**Windows path length.** Long paths are not enabled on the machine this project was set
up on. Keep the checkout at a short path such as `C:\Hadwiger-conjecture`. In a deep
directory, a handful of Mathlib files with long names cannot be written and anything that
does `import Mathlib` fails to build. This was observed on 2026-10-07 (see
`docs/SESSION_LOG.md`).

## The three commands that must pass before every commit

```bash
lake build
```

```bash
python scripts/check_ledger.py
```

```bash
python scripts/axiom_audit.py
```

- `check_ledger.py` scans the Lean sources (comments stripped) for `sorry`, `admit`,
  `axiom` and `native_decide`, and compares what it finds with
  `blueprint/SORRY_AXIOM_LEDGER.md`. It fails on an unlisted occurrence and on a stale row.
  `python scripts/check_ledger.py --list` prints what the sources contain, as table rows.
- `axiom_audit.py` runs `#print axioms` on every Lean name in the blueprint and fails if a
  recorded status is not the one the build supports, if a named declaration does not
  exist, or if any axiom beyond the three standard ones appears. Run it after `lake build`.

CI (`.github/workflows/lean.yml`) runs the same three steps on every push and pull request.

## Layout

| Path | Contents |
|---|---|
| `Hadwiger.lean` | Root module; imports everything. |
| `Hadwiger/Defs/` | Definitions that Mathlib lacks: minors and the Hadwiger number, connected matchings, fractional colourings. |
| `Hadwiger/ChromaticBounds.lean` | Section 1: bounds on `χ` and `χ_f` from `α`. |
| `Hadwiger/MatchingMinor.lean` | Proposition 3.5, and the steps of its proof as lemmas (blueprint `S-M2.*`). |
| `Hadwiger/HoleRelation.lean` | Section 2.1: the hole relation, Lemma 2.2, the graph on positions. |
| `Hadwiger/Main.lean` | Theorem 1.1, Corollary 1.2, the final theorem, Hadwiger's conjecture and its negation. |
| `Hadwiger/Sanity/` | Sanity checks on the definitions (milestone M0), and the general lemmas about the definitions that they needed. Not statements of the paper; blueprint IDs `S-M0.*`. Files that prove the paper's results may import these files for the general lemmas; `Hadwiger/ChromaticBounds.lean` has done so since M1 and `Hadwiger/MatchingMinor.lean` since M2. |
| `blueprint/` | Blueprint, ledger, fidelity notes, paper issues, milestones. |
| `scripts/` | The two checks and their shared scanner. |

All project declarations live in the namespace `Hadwiger`, never in `SimpleGraph`, so that
a later Mathlib definition with the same name cannot clash.

## Adding or changing Lean

1. Find the blueprint entry. If there is none, add it first.
2. Write the Lean. Give every declaration a doc comment naming the paper item it
   formalises and stating any difference in form from the paper.
3. New definition: add its fidelity note to `blueprint/FIDELITY.md`.
4. Update the entry's Lean name and status in the blueprint, and the ledger if a `sorry`
   was added or removed.
5. Run the three commands. Commit the Lean, the blueprint and the ledger together.

## Conventions

- `autoImplicit` is off.
- State inequalities without division or truncated subtraction where an equivalent form
  exists (`3 * h ≤ m + 4 * c + 2`, not `h ≤ (m + 4 * c + 2) / 3`), and say so in the doc
  comment.
- An `m`-vertex graph is a `SimpleGraph (Fin m)`. "Arbitrarily large `m`" is
  `∀ N, ∃ m, N ≤ m ∧ …`.
- Mathlib's `chromaticNumber` is in `ℕ∞`. Do not use `.toNat` in a statement; exhibit the
  value as `∃ k : ℕ, G.chromaticNumber = k ∧ …`.
- `import Mathlib` is acceptable. Narrow the imports only if build time becomes a problem.

## Reading the paper

The paper is not stored in the repository. To fetch the pinned version into the ignored
`paper/` folder and check it:

```bash
mkdir -p paper && curl -L -o paper/paper.pdf https://raw.githubusercontent.com/openai/math/adc7f1241b42e322a6451854ab7e4b4c146bf78a/preprints/A-counterexample-to-Hadwigers-conjecture-September-23-2026/paper.pdf
```

```bash
sha256sum paper/paper.pdf
```

The hash must be `a97293542586d3518b9355dcea732012b09d4ce809126da73d285ba0d3906128`. The
TeX source is beside the PDF upstream, under `build/`; the blueprint cites its labels.
