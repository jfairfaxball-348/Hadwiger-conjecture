# Session log

Notes made while working, newest session last. This is where failed attempts, surprises
and decisions go. It is a log, not authority: statuses live in the blueprint.

---

## 2026-10-07 — reorganisation session

Branch `lean-formalisation`, started from main `0d17783` (RL69 closeout).

### Step 0 (before any change)

- main was `0d17783`, equal to `origin/main`, as the instruction expected.
- `rl70-frontier-push` was local only, five commits ahead of main. Its one uncommitted
  change (three progress lines in `work/RL70/logs/census_B_n14_shard0of6.err`) was in
  `stash@{0}`, not in the working tree. The working tree, on main, held ten untracked
  `.exe`/`.pdb` build products under `work/RL70/scripts/census/`.
- Installed: git 2.54, elan 4.2.3, Lean and Lake 4.34.1 (also 4.32.0, 4.32.2), Python
  3.12, gh, curl, pdftotext. Nothing was installed.
- Paper, licence, and the search for an existing formalisation: `docs/PROVENANCE.md`.
- **Stop at Step 0.3.** A partial upstream formalisation exists. Reported to the user
  before any change. The user chose to proceed independently (`START_HERE.md`).

### Measuring what upstream had done

At the user's request the upstream Lean library was swept completely and its files for
this paper were compiled. Result: Proposition 3.5 and the conditional Corollary 1.2 chain
for `χ`, nothing else; about 1% of the total effort. Basis for that figure in
`blueprint/MILESTONES.md`.

**Mechanical failure met on the way, not a mathematical one.** The first compile attempt
ran in a deep temporary directory. Five Mathlib modules with long names could not be
written there (Windows long paths are disabled on this machine), so the three upstream
files that `import Mathlib` did not build, while the other seven did. Moving the scratch
project to a short path fixed it and all ten built. Lesson recorded in
`docs/LEAN_WORKFLOW.md`: keep the checkout at a short path.

### What was done

1. `rl70-frontier-push`: stash restored; log and `work/RL70/ABANDONED.md` committed
   (`7aec886`). Not pushed, not merged.
2. `lean-formalisation` created from main.
3. HC7 state frozen under `frozen-hc7-programme/` by `git mv`, unedited.
4. Lean project created; Mathlib checkout reused from the scratch build.
5. Statement layer written: definitions and target statements, 10 `sorry`.
6. Ledger, audit scripts, CI workflow.
7. `START_HERE.md`, `AGENTS.md`, `README.md`, `CONTRIBUTING.md`, `docs/`.
8. Blueprint, fidelity notes, paper issues, milestones.

### Lean notes

- At this Mathlib commit the `SimpleGraph` structure's fields are
  `symm : Std.Symm Adj` and `loopless : Std.Irrefl Adj`, so both need the anonymous
  constructor around the function (`⟨fun _ _ h => …⟩`). A bare function fails to elaborate.
- Mathlib's linter prefers `have` to `haveI` for a `Prop`-valued instance.
- `exact_mod_cast` carries `(h : ℝ) < (k : ℝ)` down to `ℕ` and up to `ℕ∞` in two steps
  without help.
- The Markdown table parser in `scripts/leanscan.py` splits cells on unescaped `|`. Write
  `\|` for a literal bar inside a table cell (for example `\|V\|`). An unescaped one
  shifted the columns and the audit reported an "unknown status"; the audit caught it.

### What was proved in this session

Only what is trivial, as instructed: `Hole.symm` (`DONE`); the final theorem and
`not_hadwigerConjecture` as glue from Corollary 1.2 (`PROVED_MODULO`, so still resting on
`sorry`).

### The full read of the paper

- The whole paper was read once, proofs included: Sections 1 to 3 before the reorganisation,
  Sections 4 to 14 and Appendix A during it. What was checked, and the six places where the
  argument could not be followed on one reading, are in `blueprint/PAPER_ISSUES.md`.
- The "Depends on" columns of the blueprint were seeded mechanically, from the
  cross-references inside each statement and its proof in the TeX source, then adjusted by
  hand: forward pointers that are not logical dependencies were removed, and dependencies
  on definitions and constructions were added. They have not been checked against the
  proofs line by line.
- Nothing in Sections 4 to 14 was verified. No error or gap was established.

### A mistake made and corrected in this session

Commit `b014739` recorded PI-001, "Theorem 1.1 has no proof of its own", and the blueprint
entry T-1.1 said the same. Both were written after reading only Sections 1 to 3. The paper
proves Theorem 1.1 in the last paragraph of Section 14.4. The mechanical cross-reference
scan surfaced a proof block naming `thm:main`, which exposed the error. T-1.1 was corrected
in `33af424`; PI-001 is kept in `PAPER_ISSUES.md` as withdrawn, with the reason. Lesson: do
not record what a paper lacks before reading all of it.

### Tooling notes

- Shell heredocs lose backslashes in this environment. It happened twice, to a Python
  script and to a blueprint append containing `\|`. Write such files with the editor
  tools, not with `cat <<EOF`.
- The audit script must be run after `lake build`; it compiles a generated file under
  `.lake/audit/` that imports `Hadwiger`.

### Not done, and why

- CI has not run: the branch is not pushed (the user is to be asked first).
- The fidelity notes are unreviewed; that is milestone M0.
- Lean Zulip was not searched directly for an existing formalisation (needs an account).
- Theorem 3.1, Proposition 3.4 and the construction of Sections 2.2 to 2.4 are not stated
  in Lean. Theorem 3.1 cannot be stated until the construction and the parameter
  structure exist (milestone M5).

### Push, first CI run, and merge (later the same day)

The user was asked whether to push and answered, verbatim:

```text
Yes do it all push commit merge etc. Lets get this show on the road. When done give me the prompt to start in a new session
```

- `lean-formalisation` (at `e906875`) and `rl70-frontier-push` (at `7aec886`) were pushed
  to `origin`. The push first waited on a GitHub sign-in: this machine had no stored git
  credentials, and the account the `gh` tool is signed into has read-only access to the
  repository. The user signed in with the owning account and the push completed.
- First CI run: workflow "Lean", run `37596760893`, on `e906875`. **Passed**: `lake build`,
  the ledger check and the axiom audit, in 2 minutes 49 seconds. So the "CI has not run"
  item above no longer holds. Two warnings, neither a failure: `actions/checkout@v4`
  targets a deprecated Node.js version, and `ubuntu-latest` changes image on 2026-10-19.
- `main` was then fast-forwarded to `lean-formalisation` and pushed. `rl70-frontier-push`
  was not merged, as intended.

This authorisation covered this push and this merge. The standing rule in `AGENTS.md`
(ask before pushing, and before merging into `main`) is unchanged for later sessions
unless the user says otherwise.

---

## 2026-10-07 — M0 session (statement layer reviewed)

Branch `m0-statement-layer`, started from main `e482512`.

### Start gate

- On `main`, working tree clean, `main` = `origin/main` = `e482512` (checked after
  `git fetch origin`).
- Read: `START_HERE.md`, `AGENTS.md`, the blueprint, the ledger, the milestones, the
  fidelity notes, the paper issues, and the reorganisation entry of this log.
- `lake build` passed. `check_ledger.py`: 10 `sorry`, 10 rows, OK. `axiom_audit.py`: 127
  entries, 30 declarations, OK.
- `paper/paper.pdf` sha256 matches the pin in `docs/PROVENANCE.md`.

### Sanity lemmas

Written in three new files under `Hadwiger/Sanity/` and entered in the blueprint under
"Sanity checks (not in the paper)", IDs `S-M0.*`. Statuses are in the blueprint.

- Every lemma in the M0 list of `blueprint/MILESTONES.md` was proved as listed. **None
  turned out to be false**, so no definition was changed and none needed changing.
- Further checks were added beyond the list, each with its reason in the blueprint:
  the `K_0`/`K_1` edge cases; `K_t` minor iff `t ≤ h(G)`; `h(G) = |V|` iff `G` is complete;
  an edge is a `K_2` minor; `h(G) < χ(G)` in `ℕ∞` iff `χ(G)` is a natural number above
  `h(G)`; and the infimum defining `χ_f` is attained.
- A one-off cross-check (run by hand, not a repository script) confirmed that all 53
  declarations in `Hadwiger/Sanity/` are named in the blueprint and that no `S-M0` row was
  dropped by the table parser. The audit script checks blueprint against build, not the
  reverse; a declaration left out of the blueprint would not be audited. Possible later
  infrastructure change, not made here: have the audit fail on an unlisted theorem.

Scope note. `FractionalColoring.card_le_mul_total` (if every independent set has at most
`k` vertices then `|V| ≤ k · total`) was needed for `χ_f(K_n) = n` and `χ_f(C_5) = 5/2`.
It is the counting step of the paper's proof of Corollary 1.2. M1 was **not** started: the
three `sorry`s of `Hadwiger/ChromaticBounds.lean` are untouched and S-1.a, S-1.b, S-1.c
are still `STATED`.

### Attempts that failed, and why

All were mechanical; none was mathematical.

- `SimpleGraph.top_adj` takes its two vertices explicitly at this Mathlib commit, so
  `top_adj.mp` is not a constant; write `(top_adj _ _).mp`.
- `first | exact ⟨1, by simp, 2, by simp, by decide⟩ | …` does **not** fall through to the
  next alternative when a nested `by simp` reduces its goal to `False`: the nested block
  reports "unsolved goals" as a logged error instead of failing the alternative. The file
  did not compile, so nothing was silently wrong, but the pattern is unusable. Give
  membership proofs as terms (`Or.inr rfl`, `rfl`) and write the cases out.
- `support_subgraphOfAdj` is `SimpleGraph.support_subgraphOfAdj`, not in the `Subgraph`
  namespace.
- `Nat.sSup_mem ⟨0, …⟩ h` could not infer the set from an `∃` goal; pass `(s := {k | …})`.
- `rcases ha with rfl | rfl` on `ha : a = i ∨ a = i + 2` substituted the bound variable `i`
  away; keep the equations and rewrite.
- In `∀ s, ¬ G.IsIndepSet (s : Set V) → f s = 0` the binder was elaborated as a `Set V`;
  annotate it `∀ s : Finset V`.

### Lean notes

- Renamed at this Mathlib commit (the old names still work but warn): `ENat.coe_ne_top` →
  `ENat.natCast_ne_top`; `Set.setOf_forall` → `Set.ofPred_forall`; `continuous_finset_sum`
  → `continuous_finsetSum`; `if_neg` is deprecated.
- `SimpleGraph.cycleGraph n` has a kernel-evaluable `DecidableRel` instance, so facts about
  `cycleGraph 4` and `cycleGraph 5` can be proved by `decide`. `pathGraph n` is `hasse`;
  use `pathGraph_adj` and `simp`.
- Useful and present: `induce_pair_connected_of_adj`, `induce_singleton_eq_top`,
  `Connected.map`, `induceHom`, `Subgraph.IsMatching.iSup`,
  `Subgraph.IsMatching.subgraphOfAdj`, `Subgraph.edgeSet_iSup`,
  `Subgraph.edgeSet_subgraphOfAdj`, `sum_degrees_eq_twice_card_edges`,
  `IsCompact.exists_isMinOn`.
- The `cover` field of `FractionalColoring` carries a classical decidability instance.
  Inside a proof that starts with `classical`, `Finset.sum_filter` rewrites it and the
  instances agree up to `rfl`. A lemma that takes `[DecidableEq V]` as a hypothesis has a
  different instance; `exists_fractionalColoring_of_family` handles that once, with `simp`.
- `exists_isConnectedMatching_of_family` builds a `Subgraph` matching from an indexed list
  of disjoint edges and computes its `edgeSet.ncard`. `blueprint/MILESTONES.md` names this
  as a gap for M2; it now exists.

### The fidelity re-read and the review sheet

- Every note in `blueprint/FIDELITY.md` was re-read against the paper's TeX source
  (Sections 1, 2.1 and 3.3) and against the Mathlib source at the pinned commit. The
  Mathlib definitions quoted in the notes (`indepNum`, `IsNIndepSet`, `IsIndepSet`,
  `chromaticNumber`, `Colorable`, `Coloring`, `Subgraph.IsMatching`, `Connected`,
  `induce`) are as the notes say.
- **This re-read is not the review.** It was done by a worker, not by the user, and the
  worker is not independent of the one who wrote the notes. No note was marked reviewed.
- Result: `blueprint/M0_REVIEW_SHEET.md`, 19 items (11 definitions, 8 stated results),
  each with the paper's sentence, the Lean text, what is machine-checked, the doubts, and
  an empty sign-off line; and 7 questions that need a decision.
- No definition was found to disagree with the paper.
- Found on the way, and recorded on the sheet:
  - `FIDELITY.md` cited a section of Diestel's book from memory. Not checked; now flagged
    as unchecked in the note.
  - `FIDELITY.md` had no note for S-1.a, S-1.b, S-1.c, S-2.3 or T-NOT-HC. Their differences
    in form were only in Lean doc comments, which `AGENTS.md` allows. Notes were added,
    unreviewed, so that the sheet and the notes cover the same items.
  - Two sentences of the paper have no Lean statement: the second half of equation (2.3),
    `χ(G) ≥ ⌈m/2⌉`, and the last clause of Corollary 1.2, that `χ_f(G) ≤ h(G)` is false
    (blueprint S-1.d). Neither is used later. Both are put to the user as questions.
  - Nothing in Lean shows that `Hole` can hold. A hand example is on the sheet. It is an
    example worked on paper, not a proof.
- `FIDELITY.md` was updated to say which former "to prove at M0" items are now proved, with
  their blueprint IDs. Each note ends "Review: not reviewed".

### Mistake made and corrected in this session

`blueprint/MILESTONES.md` was first given a line count for the sanity files (761) that had
been written before it was measured. `wc -l` gives 809. Corrected before the commit.

### Push and CI

- The user's instruction for this session allows pushing the working branch without
  asking. `m0-statement-layer` was pushed at `7598686`. The push waited several minutes on
  Git Credential Manager (a sign-in window on the user's machine) and then completed.
- CI: workflow "Lean", run `37602381451`, on `7598686`: **passed** in 2 minutes 27 seconds.
- Nothing was merged into `main`.

### Tooling note

A shell heredoc containing an apostrophe failed to parse in this environment ("unexpected
EOF while looking for matching quote"), even with a quoted delimiter. This is the same
family of problem as the lost backslashes recorded in the reorganisation entry. Put
scripts in a file with the editor tools and run the file.

### Not done, and why

- The review itself: it is the user's, by instruction.
- M1: not started, by instruction.
- No sanity lemma for `HoleData`, `Hole` or `positionGraph`: the M0 list has none, and the
  task named the three other definitions. Put to the user as question Q4.
- Transitivity of `IsMinor`, and the equivalence of the branch-set definition with a
  definition by contractions: not attempted. Mathlib has no contraction of simple graphs.

### The user's answers to the seven questions (later the same day)

The checkpoint report put the sheet's seven questions to the user. The answer, verbatim:

```text
q1 - accept, q2 - check it, q3 - accept, q4 - yes, q5 - state it, q6 - state it, q7 - that's fine.
```

What was done with each:

- **Q1 (branch-set definition of minor): accept.** Recorded in F-MINOR.
- **Q2 (the Diestel citation): check it.** Checked against the author's free preview of the
  book, Chapter 1, fetched from the author's site, which describes it as the sixth edition
  (2025). Section 1.7 is "Contraction and minors" (pages 19 to 21 of the chapter). After
  defining minors through a subgraph with connected branch sets, the book restates the
  notion as a map from a subset of `V(Y)` onto `V(X)` with connected fibres and an edge
  between the fibres of the ends of each edge of `X`. That is `MinorModel` clause for
  clause; the book's "connected" (its Section 1.4) means non-empty with connected induced
  subgraph, as Mathlib's does. The deletion-and-contraction characterisation is Corollary
  1.7.2 there, for finite graphs. The tables of contents of the first and second editions
  also have 1.7 "Contraction and minors". So the citation stands, and F-MINOR now says what
  was checked and in which edition. What was checked is the text of the book; the
  equivalence with contractions is still not formalised.
  - A web search summary attributed the deletion-and-contraction statement to
    "Proposition 1.7.1". In the edition checked, 1.7.1 is the partial-order statement and
    the characterisation is 1.7.2. Statement numbers differ between editions; the note
    cites the edition. Lesson: a search summary is not the source.
- **Q3 (dropping finiteness in `HoleData`): accept.** Recorded in F-HOLE.
- **Q4 (a non-vacuity lemma for `Hole`): yes.** Entered in the blueprint as
  S-M3.hole-nonvacuous, `NOT_STATED`, and in the M3 task list. **Not proved in this
  session.** The question as put said the lemma "would belong to M3", and the session's
  instruction was to start nothing beyond M0. Reading "yes" as "yes, at M3" is the worker's
  interpretation; the user has been told so.
- **Q5 (second half of equation (2.3)): state it.** Added
  `HoleData.le_two_mul_chromaticNumber_positionGraph`:
  `∃ k : ℕ, (D.positionGraph o).chromaticNumber = k ∧ m ≤ 2 * k`. `Hadwiger/HoleRelation.lean`
  now imports `Hadwiger/ChromaticBounds.lean` for S-1.a.
- **Q6 (the fractional weakening is false): state it.** Added the definition
  `FractionalHadwigerConjecture` and the theorem `not_fractionalHadwigerConjecture`, with
  blueprint entry D-1.fHC, fidelity note F-FHC and sheet item R-20. The definition is new
  and unreviewed.
- **Q7 (notes added for five statements): "that's fine".** Read as accepting that the notes
  were added. Not read as the sign-off of those items. This reading is the worker's.

A decision taken by the worker, for the user to overrule: the two theorems of Q5 and Q6
were given complete proof bodies instead of `sorry`, because each follows in a few lines
from results already stated. They rest on `sorry`s (the first half of S-2.3 and S-1.a;
Corollary 1.2), so they are `PROVED_MODULO`, not proved. No `sorry` was added or removed:
still 10. The alternative, a `sorry` each and two more ledger rows, was not taken. The
`sorry`s of M1 and M3 are untouched.

**Not done: no fidelity note was marked reviewed.** The user's answer decides the seven
questions. It does not say that the items of the sheet are accepted, and the instruction
for this session was that the worker must not mark a note reviewed. The user is being
asked.

### Push and CI, second round

- The second push also waited on Git Credential Manager, for about twenty minutes, and
  then completed. Remote and local were both `7723329` afterwards.
- CI on `7723329` (run `37604790371`) was still running when this entry was written. Its
  result is not recorded here.

### The sign-off

After the seven questions were carried out, the user was asked two things through a
prompt with fixed options. Questions and answers, verbatim:

```text
How should the sign-off of the 20 review-sheet items be recorded in FIDELITY.md?
  -> Accept all 20 items

Q4, the lemma showing that the hole relation is not vacuous: when should it be proved?
  -> At M3, as recorded
```

The first option's description, as shown to the user: every fidelity note gets the line
"Reviewed by John Fairfax-Ball, 2026-10-07" (name taken from the git configuration), and M0
is then complete.

Done on that instruction:

- `blueprint/FIDELITY.md`: all 19 notes now end "Reviewed by John Fairfax-Ball, 2026-10-07"
  with their sheet item numbers; together they cover the 20 items. The header says how the
  sign-off came about and what it covers: the notes and the Lean text as they stood at the
  commit that records it, and nothing later.
- `blueprint/M0_REVIEW_SHEET.md`: the 20 sign-off lines are filled in, and the question and
  answer are quoted.
- `blueprint/MILESTONES.md`: M0 is complete; the single next task is M1.
- The hole non-vacuity lemma stays where it was put: blueprint S-M3.hole-nonvacuous,
  `NOT_STATED`, for M3. The worker's reading of the answer to Q4 was confirmed.

What the sign-off is and is not. It is the user's acceptance of the notes after reading a
sheet prepared by a worker. The sheet lists every doubt the worker found; it cannot list
doubts the worker did not find. The sanity lemmas are machine-checked; the fidelity
arguments are not.

M1 was not started.

### Push and CI, final state of the session

Written after the fact, in a commit of its own; the CI result of this last commit is
therefore not recorded here.

| Commit | What | On the remote | CI |
|---|---|---|---|
| `7598686` | sanity lemmas and their blueprint section | yes | passed, run `37602381451` |
| `69c8d66` | review sheet, fidelity notes | yes | no run of its own (never a pushed head) |
| `7723329` | blueprint wording fix | yes | passed, run `37604790371` |
| `ee76bde` | the user's decisions carried out | yes | no run of its own (never a pushed head) |
| `1e3367f` | the sign-off recorded; M0 complete | yes | passed, run `37605970094` |

`main` was not touched: it is still `e482512`, equal to `origin/main`. The user has been
asked whether to merge and had not answered when this was written.

**A trap met twice: committing while a push is waiting for a sign-in.** Each push waited
ten to twenty minutes on Git Credential Manager. Twice a commit was made during that wait.
When the push went through, git sent the branch as it stood at that moment, including the
new commit, but printed the older commit in its summary (for example `7723329..ee76bde`
when the remote received `1e3367f`) and set the local remote-tracking ref to that older
commit. So the printed summary and `git status` both understated what was on the remote.
Nothing was wrong on the remote. How it was noticed: `git ls-remote` disagreed with the
push output, and the list of CI runs had no run for the commit the output named.

Rules that follow:

- After a push, check `git ls-remote --heads origin <branch>` against `git rev-parse HEAD`.
  Do not rely on the push summary or on `git status`.
- Run `git fetch origin` afterwards to correct the tracking ref.
- Better: do not commit while a push is waiting.
- Match a CI run to a commit by its hash (`gh run list --json headSha,...`), not by its
  title.

### Why every push asked the user to sign in, and the fix

The user wrote, verbatim:

```text
I can't keep manually authorising each push/commit or merge or whatever. Can I not set global permission - you are on 'bypass permission' mode and the github account should be authorised?
```

Diagnosis (read-only; no secret was displayed):

- The window was not Claude's permission mode, which cannot affect it. It was Git
  Credential Manager (2.7.3, the only credential helper configured, in the system git
  configuration).
- GCM holds two GitHub accounts on this machine, `jball348-svg` and `jfairfaxball-348`.
  The remote URL named neither, so GCM had to ask which to use on every push. That is the
  ten-to-twenty-minute wait recorded above: the push sat until the user chose.
- Test, with `GCM_INTERACTIVE=never` so that nothing could open a window: asking git for
  the github.com credential without a username failed with "Cannot prompt because user
  interactivity has been disabled"; with `username=jfairfaxball-348` it succeeded at once.
- `gh` is signed in as `jball348-svg`, which is not the account that owns the repository.
  `gh` can read the repository and its CI runs; pushes go through git and GCM, not `gh`.

Fix, on the user's approval (question and answer below): the account is now named in the
remote URL of this checkout,

```text
https://jfairfaxball-348@github.com/jfairfaxball-348/Hadwiger-conjecture.git
```

It names the account and holds no secret. It lives in `.git/config`, so it is **not** in
the repository: a fresh clone on this machine needs the same one-line
`git remote set-url`. The next push (`46ab21e`) completed in seconds with interaction
disabled.

The user also asked for a setting that covers every repository. That is a user-wide git
setting about which identity signs in everywhere, with a side effect on any repository
that must push as the other account, so it was left to the user: the command was given to
them and not run. It was tested without being applied (a one-off `-c` override returned the
credential silently).

To avoid opening a window on the user's machine by accident, pushes from a worker session
can be run with `GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0`: if git would need to ask, it
fails at once instead.

### Standing rule changed: pushes no longer need asking

The user was asked two questions through a prompt with options. Questions and answers,
verbatim:

```text
Set this repository to always use the GitHub account jfairfaxball-348, so pushes stop opening the account-picker window?
  -> yes, set it - but I would rather a global permission for all repo's/projects/sessions in claude code

AGENTS.md says to ask before every push and before every merge into main. What standing rule do you want recorded there instead?
  -> Push freely; merge M0 now
```

The second option's description, as shown to the user: "I push working branches without
asking. Merges into main are still asked one at a time, and this one (m0-statement-layer)
is approved now."

Done on that instruction:

- `AGENTS.md`, "Unit of work": working branches may be pushed without asking; never
  force-push; `main` is pushed only to publish an approved merge; each merge into `main`
  is still asked for, one at a time. This is a change to the rules, made in its own commit
  with this entry, as `AGENTS.md` requires. It changes no status.
- The merge of `m0-statement-layer` into `main` is approved, this once. It is to be a
  fast-forward to the commit that contains this entry, after CI has passed on that commit.
  This entry was written before the merge. **If `main` contains this commit, the merge was
  done**; `git log main` is the record.

What was not changed: every other rule. In particular axioms and `native_decide`, changes
to the root or to the pinned paper, changes to the mathematical content of a statement, and
installing anything other than the Lean toolchain still need the user's approval.

---

## 2026-10-07 — M1 session (Corollary 1.2 from Theorem 1.1 and Proposition 3.5)

Branch `m1-corollary-1-2`, started from main `4b022e4`.

### The instruction

The user's first message was "Continue the Lean formalisation in this repository. AGENTS.md
is binding; read it first." The rest arrived in line-sized pieces while the start gate was
being run. It is reproduced line for line as received; blank lines between its parts are
not recoverable and none have been added.

```text
START GATE
1. Pin HEAD. You should be on main, and main should equal origin/main. Expected: 4b022e4
(M0 complete and merged, 2026-10-07). If main does not equal origin/main, or HEAD is
something else, stop and tell me before doing anything else.
2. Read START_HERE.md, AGENTS.md, blueprint/BLUEPRINT.md, blueprint/SORRY_AXIOM_LEDGER.md,
blueprint/MILESTONES.md, blueprint/FIDELITY.md, blueprint/PAPER_ISSUES.md and the last
session entry of docs/SESSION_LOG.md (the M0 session).
3. Run lake build, python scripts/check_ledger.py and python scripts/axiom_audit.py.
Expected: 10 sorry, 152 blueprint entries. If any of them fails, repair that first and
do nothing else.
TASK: milestone M1, "Corollary 1.2 from Theorem 1.1 and Proposition 3.5", as described in
blueprint/MILESTONES.md.
* Create a working branch m1-corollary-1-2 from main.
* Remove these five sorries with real proofs, without changing any statement:
* S-1.a  Hadwiger.card_le_indepNum_mul_of_colorable
* S-1.b  Hadwiger.card_le_indepNum_mul_fractionalChromaticNumber
* S-1.c  Hadwiger.fractionalChromaticNumber_le_of_colorable
* P-3.5, second assertion  Hadwiger.hadwigerNumber_lt_of_indepNum_le_two
* C-1.2  Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber
* Helpers already exist in Hadwiger/Sanity/FractionalColoring.lean
(FractionalColoring.card_le_mul_total, exists_fractionalColoring_of_family,
fractionalChromaticNumber_le_total, le_fractionalChromaticNumber). Either import that
file where needed or move the helpers to a non-sanity file; decide, record the choice in
the session log, and do not ask me.
* Do not touch the other five sorries: Theorem 1.1, the first assertion of Proposition 3.5
(M2), the two open parts of Lemma 2.2 and the first half of S-2.3 (M3). Do not start M2,
M3 or anything else.
* Expected end state, to check against the audit: 5 sorry. S-1.a, S-1.b, S-1.c DONE.
C-1.2 PROVED_MODULO (resting on Theorem 1.1 and the first assertion of Proposition 3.5).
P-3.5 still STATED, because its first assertion is still sorry. If the audit shows
anything else, find out why before going on.
* If a statement turns out to be false or unprovable as stated, that is a result. Stop,
record exactly what failed in docs/SESSION_LOG.md, and tell me. Do not weaken or adjust
the statement without my say-so.
* The statement layer was signed off on 2026-10-07 as it stood then. If you need a new
definition, or need to change a signed-off statement, write its fidelity note, leave it
unreviewed, and put it to me at the end.
* Keep the blueprint and the ledger in step with the Lean in the same commit. A result
counts only when the axiom audit shows it.
WORKING RULES
* Work inline; at most two subagents at a time, only for independent, well-scoped tasks.
* Commit early and often on the working branch. Push it without asking (standing rule in
AGENTS.md). Run pushes with GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0; if a push fails
because it would need a sign-in, stop and tell me instead of opening a window. After
each push, check git ls-remote against HEAD.
* Ask me before merging into main.
* Do not ask me things one at a time. Carry on with everything that does not depend on my
answer, and put all open questions, including the merge, in one prompt at the end.
* Do not consult the upstream openai/math Lean code for this paper.
* End with the checkpoint report that AGENTS.md asks for, and the single next task.
```

### Start gate

- On `main`, working tree clean. `HEAD` = `main` = `origin/main` = `4b022e4`, and
  `git ls-remote --heads origin main` (run with interaction disabled) gave the same hash.
- Read: `START_HERE.md`, `AGENTS.md`, the blueprint in full, the ledger, the milestones,
  the fidelity notes, the paper issues, and the M0 entry of this log.
- `lake build` passed. `check_ledger.py`: 10 `sorry`, 10 rows, OK. `axiom_audit.py`: 152
  entries, 86 declarations, OK. Both as expected.
- `paper/paper.pdf` sha256 matches the pin in `docs/PROVENANCE.md`.
- Before writing proofs, the paper's own text for the five items was read again in the
  local TeX (`sections/01-introduction.tex`, and Proposition 3.5 with its proof in
  `sections/03-distributions.tex`).

### Decision: the helper lemmas are imported, not moved

`Hadwiger/ChromaticBounds.lean` now imports `Hadwiger/Sanity/FractionalColoring.lean`.
Nothing was moved. The user left the choice to the worker. Reasons:

1. No declaration moves. So no `DONE` sanity row, no fidelity note and no file described
   by the M0 sign-off is altered, and the Lean diff of M1 is proof bodies, comments and
   import lines only.
2. The lemmas M1 needs cannot be separated cleanly from the sanity checks.
   `le_fractionalChromaticNumber` needs `range_total_nonempty`, which is itself a lemma of
   the M0 list. A move would either take M0-list lemmas out of `Sanity/` or leave a split
   with no principle behind it.
3. M2 will meet the same question for `Sanity/Minor.lean` and
   `Sanity/ConnectedMatching.lean` (for example `hasCliqueMinor_hadwigerNumber` and
   `exists_isConnectedMatching_of_family`). Importing is one rule that covers all three.
4. The cost, stated plainly: the import closure of the paper's results, and in the end of
   the final theorem, contains files named `Sanity`. The name understates what they are:
   they hold the general lemmas about the definitions as well as the checks. This is
   cosmetic. The kernel checks a proof wherever it lives, and the audit goes by declaration
   name, not by file.
5. Checked: `Hadwiger/Sanity/FractionalColoring.lean` declares theorems only. It has no
   instance, attribute, notation or `simp` lemma, so importing it cannot change how a
   statement elaborates.

Alternative not taken: move the general lemmas to a new non-sanity file, or rename the
folder. Either can be done later as an infrastructure commit without changing a declaration
name or a status. The user may overrule this choice.

### What was proved, and how

Statuses are in the blueprint; this is how the proofs go. Each follows the paper.

- **S-1.a** `card_le_indepNum_mul_of_colorable`. Take a colouring `C` with colours in
  `Fin k`. `|V|` is the sum over colours of the sizes of the colour classes
  (`Finset.card_eq_sum_card_fiberwise`); each class is independent
  (`Coloring.not_adj_of_mem_colorClass`), hence has at most `α(G)` vertices
  (`IsIndepSet.card_le_indepNum`).
- **S-1.b** `card_le_indepNum_mul_fractionalChromaticNumber`. For every fractional
  colouring `w`, `|V| ≤ α(G) · total w` by `FractionalColoring.card_le_mul_total` with
  `k = α(G)`. If `α(G) > 0`, divide and use `le_fractionalChromaticNumber`. If `α(G) = 0`
  the right-hand side is `0` and the bound for any one `w` gives `|V| ≤ 0`. The case
  `α(G) = 0` occurs only for the graph with no vertices; the statement covers that graph,
  so the proof must. Attainment of the infimum (`exists_fractionalColoring_total_eq`) is
  **not** used, in agreement with the fidelity note F-CHIF.
- **S-1.c** `fractionalChromaticNumber_le_of_colorable`. Weight `1` on each of the `k`
  colour classes (`exists_fractionalColoring_of_family`); every vertex lies in exactly one
  class; the total is `k`. A colour class may be empty; the empty set is independent and
  its weight still counts towards the total, which is why the bound is `k`.
- **P-3.5, second assertion** `hadwigerNumber_lt_of_indepNum_le_two`. `k` is the chromatic
  number, finite because `V` is. First inequality: the first assertion with `100·cm < m`,
  by linear arithmetic over `ℝ`. Second: linear arithmetic from `m ≥ 5`. Third: S-1.a with
  `α(G) ≤ 2`. `Nonempty V`, needed by the first assertion, comes from `5 ≤ |V|`. **The
  first assertion is still `sorry`**, so this is `PROVED_MODULO`.
- **C-1.2** `exists_hadwigerNumber_lt_fractionalChromaticNumber`. Theorem 1.1 at
  `max N 5` gives `m ≥ N`, `m ≥ 5` and `G`. The second assertion of P-3.5 gives `k` and the
  first two inequalities. S-1.b with `α(G) ≤ 2` and `χ_f ≥ 0` gives `m/2 ≤ χ_f`. S-1.c
  gives `χ_f ≤ k`. **Theorem 1.1 and the first assertion of P-3.5 are still `sorry`**, so
  this is `PROVED_MODULO`.

No statement was found false or unprovable. No definition, statement or named declaration
was added. No paper issue was found; the three sentences of Section 1, the proof of
Corollary 1.2 and the "final assertion" of Proposition 3.5 are correct as written. That is
five elementary items. It says nothing about the rest of the paper.

### Check that no statement changed

The instruction was to change no statement. Two checks:

- The diff of `Hadwiger/` against `main` adds and removes no line beginning `theorem`,
  `lemma`, `def`, `structure`, `instance`, `abbrev` or `axiom`.
- The fully elaborated statements were compared by machine. A file of `#check @name`
  commands under `set_option pp.all true`, for every theorem and definition of
  `ChromaticBounds.lean`, `MatchingMinor.lean` and `Main.lean` and the two statements of
  equation (2.3) (14 in all), was run at `main` (by stashing the changes and rebuilding)
  and again on the working tree. The two outputs are byte-identical. `pp.all` prints every
  implicit argument, instance and universe level, so this also rules out a change of
  meaning brought in by the new import lines.

The check file lived under the ignored `.lake/audit/`; it is not a repository script.

### What the audit shows

After the change: `check_ledger.py`: 5 `sorry`, 5 rows. `axiom_audit.py`: 152 entries
(`DONE` 26, `PROVED_MODULO` 4, `STATED` 4, `DEFINED` 11, `MATHLIB` 2, `NOT_STATED` 105), 86
declarations. Before: `DONE` 23, `PROVED_MODULO` 3, `STATED` 8.

This is the end state the instruction expected: S-1.a, S-1.b, S-1.c `DONE`; C-1.2
`PROVED_MODULO`; P-3.5 still `STATED`. `#print axioms` on the three `DONE` results shows
`propext`, `Classical.choice`, `Quot.sound` and nothing else.

The five `sorry`s left: Theorem 1.1; the first assertion of Proposition 3.5; the two open
parts of Lemma 2.2; the first half of equation (2.3). None was touched.

### Attempts that failed, and a self-correction

- Nothing failed mathematically, and each of the five proofs compiled as first written.
  That is unusual enough to say why: the hard step, the counting bound, was done at M0.
- Self-correction: the first version added `open Finset SimpleGraph` to
  `Hadwiger/ChromaticBounds.lean`, above the three statements. An `open` changes the
  context in which the signed-off statements are elaborated. It was removed and the names
  inside the proofs were written out in full, before the comparison above was run. The
  comparison would have shown no difference either way; removing the line makes that
  visible in the diff without running anything.

### Records brought into step

- Blueprint: S-1.a, S-1.b, S-1.c to `DONE`; C-1.2 to `PROVED_MODULO`; the text of P-3.5
  says which half is open; a stale remark in S-M0.chif-support corrected; a note on the
  import added to the sanity section.
- Ledger: five rows removed; the two new `PROVED_MODULO` declarations listed.
- `blueprint/FIDELITY.md`: the signed notes said "still `sorry`" of things now proved.
  The signed text was left as it is. A line "Status update after the sign-off" was added
  under each of the five notes concerned, and the header says what such lines are.
- `blueprint/M0_REVIEW_SHEET.md` was **not** edited. It is the signed record of M0, and its
  remarks about what is `sorry` describe that day.
- `START_HERE.md`, `README.md`: "nothing of the paper is proved" replaced by what is now
  true. Doc comments in the Lean files that said "still `sorry`" of proved things corrected.
  This includes one comment in `Hadwiger/HoleRelation.lean`; no statement or `sorry` of
  that file was touched.
- `blueprint/MILESTONES.md`: the next task is M2; the state and measured size of M1.

### Lean notes

- `have hne : Nonempty V := …` in a tactic block is found by instance resolution in the
  rest of the block; no `haveI` is needed.
- `div_le_iff₀' : 0 < c → (a / c ≤ b ↔ a ≤ c * b)` is the form with the factor on the left.
- A membership `v ∈ C.colorClass c` is `C v = c` by definition, so
  `(Finset.mem_filter.mp (Finset.mem_coe.mp hv)).2` is accepted for it.
- `ENat.ne_top_iff_exists` with `chromaticNumber_ne_top_iff_exists` exhibits `χ(G)` as a
  natural number without `.toNat`.

### Tooling notes

- The backslash problem again: in a quoted shell heredoc, `\\|` reached Python as `\|`.
  Python warned ("invalid escape sequence") and produced the intended text, so nothing was
  wrong, but it was luck. Write edits with the editor tools.
- A `cd` inside one shell command changed the working directory of later commands. Start
  each command with an absolute `cd`.

### Not done, and why

- M2 and M3: not started, by instruction.
- Upstream's Lean code for this paper was not consulted. No comparison of statements with
  upstream was made in this session, so `docs/PROVENANCE.md` is unchanged.
- No subagent was used.
- Possible later infrastructure change, not made here: the audit still checks blueprint
  against build and not the reverse (noted at M0). M1 added no declaration, so nothing new
  is unlisted.

### Push and CI

Written after the fact, in a commit of its own; the CI result of that commit is therefore
not recorded here.

| Commit | What | On the remote | CI |
|---|---|---|---|
| `95bdb9d` | the five proofs and all the records above | yes; `git ls-remote` equal to `HEAD` after the push | passed, run `37617983613`, 2 minutes 46 seconds |

- The push was run with `GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0` and completed in
  seconds without asking for anything. The account named in the remote URL (M0 entry) is
  what makes that work.
- `main` on the remote was `4b022e4` before and after.
- The run was matched to the commit by hash, not by title.
- CI printed two warnings from GitHub. Neither is a failure and neither was acted on,
  because a change to CI is an infrastructure change with its own commit:
  - `actions/checkout@v4` targets Node.js 20, which is deprecated; the runner forces it
    onto Node.js 24.
  - the `ubuntu-latest` label moves to Ubuntu 26 beginning 2026-10-19. If CI fails after
    that date on a commit that changes nothing relevant, look there first.

### Merge

Nothing was merged into `main` in the work recorded above. The user is being asked, in the
one prompt at the end of the session, whether to merge `m1-corollary-1-2`. If approved it
is to be a fast-forward to the commit that contains this entry, after CI has passed on that
commit. **If `main` contains this commit, the merge was done**; `git log main` is the
record.

---

## 2026-10-07 — M2 session (Proposition 3.5)

Branch `m2-proposition-3-5`, started from main `9e30110`.

### How M1 ended: the merge

The M1 entry was committed before the user answered, so the answer is recorded here.
Question and answer, verbatim, through a prompt with two options:

```text
M1 is finished on branch m1-corollary-1-2 (head 9e30110, CI passed, 5 sorry left, audit matches your expected end state, no statement changed). Merge it into main?
  -> Merge now (fast-forward)
```

The option's description, as shown: "Fast-forward main from 4b022e4 to 9e30110, push main,
and check the remote against HEAD. No merge commit, no force-push. This approval covers
this merge only."

Done on that approval: `main` was fast-forwarded to `9e30110`, the three checks were run on
it, and it was pushed. `git ls-remote` gave `9e30110` for `main`. CI on `main` at `9e30110`
passed (run `37640561707`); CI on the branch at the same commit had passed before the merge
(run `37618439161`).

### The instruction for this session

After the M1 checkpoint report the user wrote, verbatim:

```text
Can you run the next session here?
```

Nothing else was specified. The worker's reading, which the user may correct:

- "The next session" is the single next task of `blueprint/MILESTONES.md`: M2, the first
  assertion of Proposition 3.5, and nothing beyond it.
- The working rules given for M1 (quoted in the M1 entry) are taken to stand: work inline;
  commit and push the working branch without asking, with interaction disabled; change no
  signed-off statement; ask before merging; one prompt at the end; do not consult
  upstream's Lean code.

### Start gate

- On `main`, working tree clean. `HEAD` = `main` = `origin/main` = `9e30110`, and
  `git ls-remote --heads origin main` gave the same hash.
- The governing files had been read in full earlier the same day for M1; the only changes
  since were the M1 commits. `Hadwiger/Defs/Minor.lean`, `Hadwiger/Defs/ConnectedMatching.lean`,
  `Hadwiger/Sanity/Minor.lean` and `Hadwiger/Sanity/ConnectedMatching.lean` were read for
  this session, and Proposition 3.5 with its proof in the local TeX.
- `lake build` passed. `check_ledger.py`: 5 `sorry`, 5 rows, OK. `axiom_audit.py`: 152
  entries, 86 declarations, OK.
- `paper/paper.pdf` sha256 matches the pin.

### What was proved, and how

`Hadwiger.three_mul_hadwigerNumber_le`: `3·h(G) ≤ m + 4·cm(G) + 2`. The proof is the
paper's. Each sentence of the paper's proof is a lemma in `Hadwiger/MatchingMinor.lean`;
with `b` branch sets, `s` singletons and `e` two-vertex branch sets:

| Paper | Lean |
|---|---|
| "Consider a complete-minor model with `b` branch sets." … "Maximize over all complete-minor models." | a `K_b` model with `b = h(G)`, from `hasCliqueMinor_hadwigerNumber` (M0: the supremum is attained) |
| "Each two-vertex branch is an edge." | `adj_of_connected_induce_pair`: a walk from `x` to `y` inside `{x, y}` has a first step; it leaves `x`, so it ends at `y` |
| "The singleton vertices form a clique, so pairing them gives `⌊s/2⌋` more edges. All these edges together form one touching matching: their vertex sets are disjoint, and adjacency of the original branches guarantees every required contact." … "`c ≥ e + ⌊s/2⌋`" | `MinorModel.exists_isConnectedMatching` (the general statement) and `MinorModel.card_two_add_card_one_div_two_le` (`e + s/2 ≤ cm(G)`, natural-number division) |
| "Every remaining branch has at least three vertices, whence `m ≥ s + 2e + 3(b − s − e) = 3b − 2s − e`." | `MinorModel.sum_ncard_branch_le` and `MinorModel.three_mul_card_le` (`3b ≤ m + 2s + e`, no subtraction) |
| "`3b ≤ m + 2s + e ≤ m + 4c − 3e + 2 ≤ m + 4c + 2`" | `omega` from the two inequalities above |

How the matching is built. The index type is the two-vertex branch sets together with
`Fin (s/2)`. The singleton branch sets are listed in some order `σ 0, …, σ (s − 1)`
(`Finset.equivFin`); pair `j` is `σ (2j), σ (2j + 1)`. Each index gets an edge `a – b` of
`G` and two branch indices `p`, `q` with `a` in the branch set of `p` and `b` in that of
`q` (`p = q` for a two-vertex branch set). Different indices use different branch sets,
which gives disjointness. Two edges touch because the branch sets of their `p`'s are joined
by an edge of `G` and the branch set of `p` has no vertex other than `a` and `b`.

`exists_isConnectedMatching_of_family` from M0 is for families indexed by `Fin k`. A
version for any finite index type was added (`exists_isConnectedMatching_of_fintype_family`),
by composing with `Fintype.equivFin`.

Eight lemmas were added and no definition. The lemmas are in the blueprint as
S-M2.pair-edge, S-M2.count and S-M2.matching, in a new last section, "Steps of the paper's
proofs, proved as separate lemmas".

### What the audit shows

`check_ledger.py`: 4 `sorry`, 4 rows. `axiom_audit.py`: 155 entries (`DONE` 30,
`PROVED_MODULO` 4, `STATED` 3, `DEFINED` 11, `MATHLIB` 2, `NOT_STATED` 105), 94
declarations. Before: 152 entries, `DONE` 26, `STATED` 4, 86 declarations. The three new
entries are the S-M2 rows; the eight new declarations are the lemmas.

- The reverse check, which the audit does not make, was run by hand as at M0: all 92
  declarations in the Lean sources are named in the blueprint. The other two audited names
  are Mathlib's `indepNum` and `chromaticNumber`.
- P-3.5 is `DONE`: `#print axioms` on both of its declarations shows `propext`,
  `Classical.choice`, `Quot.sound` and nothing else. The second assertion, which had been
  `PROVED_MODULO` since M1, became `DONE` without being touched.
- C-1.2, T-FINAL, T-NOT-HC and S-1.d are still `PROVED_MODULO`. They now rest on one
  `sorry`: Theorem 1.1. **The final theorem is not proved.**
- The four `sorry`s left: Theorem 1.1, and the three of M3 (the two open parts of Lemma 2.2
  and the first half of equation (2.3)). None was touched.

### Check that no signed-off statement changed

As at M1: the fully elaborated statements (`pp.all`) of the 14 theorems and definitions of
`ChromaticBounds.lean`, `MatchingMinor.lean` (the two that existed), `Main.lean` and of
equation (2.3) were printed at `main` `9e30110` and on the working tree. Byte-identical.
The output at `9e30110` is also identical to the output at `4b022e4` kept from M1.

The new lemmas sit in a `section` placed before the file's existing `variable` line, so the
two existing statements are elaborated in the same context as before. The diff of
`Hadwiger/` against `main` adds eight `theorem` lines, one `section`, one `variable` inside
it and its `end`, and removes none.

### Junk values

- Branch-set sizes are `Set.ncard`. Every lemma that mentions one has `[Fintype V]`, so the
  sets are finite and `ncard` is the number of elements.
- `s/2` is natural-number division. It is the paper's floor `⌊s/2⌋`, and it appears only
  in a lower bound on `cm(G)`, where rounding down is what the paper does.
- `h(G)` and `cm(G)` are suprema. The proof uses them only through
  `hasCliqueMinor_hadwigerNumber` and `IsConnectedMatching.ncard_le`, both proved at M0
  from boundedness for a finite graph.

### An observation about the statement

The Lean proof does not use the hypothesis `[Nonempty V]`. The inequality also holds for
the graph with no vertices, where it reads `0 ≤ 2`. The hypothesis is the paper's "every
finite nonempty graph" and the statement was left as signed off. This is not a paper issue:
a hypothesis stronger than needed is not an error. It is noted in the doc comment, the
blueprint and the fidelity note.

### Paper issues

None found. Proposition 3.5 and its proof are correct as written.

### Attempts that failed, and corrections

- Nothing failed. The file compiled as first written, including the main lemma. As at M1
  the reason is that the general lemmas were already there from M0. A first-time success
  is not evidence of correctness; the evidence is the kernel (`#print axioms`) and the
  comparison of statements.
- Corrections made before the commit, none of them to Lean:
  - the new blueprint section was first inserted in the middle of "Sanity checks", which
    would have put the planned M3 row under the wrong heading. Moved to the end.
  - **An omission of the M1 session, corrected here.** `blueprint/PAPER_ISSUES.md` still
    said "Nothing has been machine-checked" after M1 had proved three statements of the
    paper. It understated; it did not overstate. It now lists what is machine-checked and
    says that nothing else is.

### Records brought into step

Blueprint (P-3.5 `DONE`; three new rows; the text of C-1.2; the note on imports), ledger
(one row removed), milestones (next task M3), status-update lines under three fidelity
notes, `START_HERE.md` and `README.md` (what is and is not proved), `blueprint/PAPER_ISSUES.md`
(above), doc comments in `Main.lean` and the two `Sanity` files that are now imported.
`blueprint/M0_REVIEW_SHEET.md` was not edited.

No fidelity note was written for the eight new lemmas. The precedent is M0, where the
sanity and support lemmas got blueprint rows and no fidelity notes. The reason it is safe:
they are steps of a proof. If one of them said something other than intended, the proof of
P-3.5 would not go through, and the statement of P-3.5 is the signed-off one. The user has
been told.

### Lean notes

- `Walk.exists_eq_cons_of_ne` gives the first step of a walk between different vertices.
  `induce_adj` is `Iff.rfl`, so an adjacency in `G.induce s` can be used directly as one
  in `G`.
- `Set.ncard_eq_one`, `Set.ncard_eq_two`, `Set.ncard_eq_toFinset_card'`,
  `Set.disjoint_toFinset`, `Finset.card_biUnion` (takes `PairwiseDisjoint`),
  `Finset.equivFin`, `Finset.card_filter`.
- To avoid dependent arguments, the vertices of small branch sets were chosen for **every**
  index with a harmless default (`∀ i, ∃ v, v ∈ B i ∧ (|B i| = 1 → B i = {v})`), then
  `choose`. This keeps the chosen functions total.
- `omega` handles `s / 2` and treats the two `Finset.card (filter …)` terms as atoms,
  provided they are written identically in both hypotheses.
- A lemma that should not get the file's `[Fintype V]` must sit outside the scope of that
  `variable` line: instance variables are included whenever their type variables are.

### Not done, and why

- M3: not started.
- Upstream's Lean code was not consulted and no statement was compared with upstream's.
- No subagent was used.

### A sanity check added afterwards: the bound is attained

In a commit of its own, after the commit above, so that it can be dropped without touching
the proof.

- `Hadwiger.three_mul_hadwigerNumber_top_of_odd`: for odd `n`,
  `3·h(K_n) = n + 4·cm(K_n) + 2` for the complete graph on `Fin n`. Blueprint S-M2.tight,
  kind "sanity (extra)", in the sanity section. It is not in the paper.
- Why: `blueprint/PAPER_ISSUES.md` recorded "tight for `K_1` and `K_3`" as a hand check of
  Proposition 3.5. Both are instances (`n = 1`, `n = 3`), and both instances were
  elaborated once as a check. It also pins the Lean statement of the first assertion from
  the other side, as the M0 lemmas do for the definitions: the assertion is proved, so it
  does not claim too much; at these graphs it is an equality, so it does not claim too
  little there.
- It does not use Proposition 3.5, only `hadwigerNumber_top` and
  `connectedMatchingNumber_top` from M0, and `omega`.
- This was the worker's decision; the instruction did not ask for it. The user has been
  told and may have it removed.
- After it: `axiom_audit.py` reports 156 entries (`DONE` 31) and 95 declarations; the
  sources have 93 declarations, all named in the blueprint. Still 4 `sorry`. The 14
  signed-off statements are again byte-identical to `main`.

### Push and CI

| Commit | What | On the remote | CI |
|---|---|---|---|
| `d915e33` | the proof of Proposition 3.5 and the records | yes; `git ls-remote` equal to `HEAD` after the push | passed, run `37644606479` |

The commit that contains this table adds the sanity check above; its own CI result is
therefore not recorded here. Pushes ran with interaction disabled and did not prompt.
`main` on the remote stayed at `9e30110`.

### Merge

Nothing was merged into `main` in the work recorded above. The user is being asked, in the
one prompt at the end of the session, whether to merge `m2-proposition-3-5`. If approved it
is to be a fast-forward to the commit that contains this entry, after CI has passed on that
commit. **If `main` contains this commit, the merge was done**; `git log main` is the
record. The user's answer, if it comes after this commit, belongs at the head of the next
session's entry, as was done above for M1.

---

## 2026-10-07 — M3 session (Section 2.1: the hole relation)

Branch `m3-hole-relation`, started from main `564e9f0`.

### How M2 ended: the merge

The M2 entry was committed before the user answered its merge question. The user supplied
the record below and asked for it to be put at the head of this entry, verbatim. It arrived
in line-sized pieces and is reproduced line for line as received.

```text
Question: "M2 is finished on branch m2-proposition-3-5: Proposition 3.5 is DONE by the
audit, 4 sorry left, no signed-off statement changed, CI passed on both commits. The
second commit is a sanity check I added without being asked (the bound is attained by
odd complete graphs). What should go into main?"
Answer: "Merge all of it"
The option's description, as shown: "Fast-forward main from 9e30110 to 564e9f0: the
proof of Proposition 3.5 and the extra sanity check. Push main and check the remote.
This approval covers this merge only."
Done on that approval: main was fast-forwarded to 564e9f0 and pushed; git ls-remote gave
564e9f0 for main. CI passed on the branch at 564e9f0 (run 37645142656) and on main at
564e9f0 (run 37655437692).
```

The worker of this session did not perform that merge and did not look up the two CI runs.
The text above is the user's record. What this session checked for itself is under "Start
gate": `main` and `origin/main` were both at `564e9f0`.

### The instruction

The user's first message was "Continue the Lean formalisation in this repository. AGENTS.md
is binding; read it first." The rest arrived in line-sized pieces while the start gate was
being run. It is reproduced line for line as received; blank lines between its parts are
not recoverable and none have been added.

```text
START GATE
1. Pin HEAD. You should be on main, and main should equal origin/main. Expected: 564e9f0
(M2 complete and merged, 2026-10-07). If main does not equal origin/main, or HEAD is
something else, stop and tell me before doing anything else.
2. Read START_HERE.md, AGENTS.md, blueprint/BLUEPRINT.md, blueprint/SORRY_AXIOM_LEDGER.md,
blueprint/MILESTONES.md, blueprint/FIDELITY.md, blueprint/PAPER_ISSUES.md and the last
two session entries of docs/SESSION_LOG.md (the M1 and M2 sessions).
3. Run lake build, python scripts/check_ledger.py and python scripts/axiom_audit.py.
Expected: 4 sorry, 156 blueprint entries, 95 declarations audited. If any of them
fails, repair that first and do nothing else.
A RECORD TO WRITE FIRST
The M2 session entry was committed before I answered its merge question. Put the following
at the head of your own session entry, verbatim, as the M2 entry asks:
Question: "M2 is finished on branch m2-proposition-3-5: Proposition 3.5 is DONE by the
audit, 4 sorry left, no signed-off statement changed, CI passed on both commits. The
second commit is a sanity check I added without being asked (the bound is attained by
odd complete graphs). What should go into main?"
Answer: "Merge all of it"
The option's description, as shown: "Fast-forward main from 9e30110 to 564e9f0: the
proof of Proposition 3.5 and the extra sanity check. Push main and check the remote.
This approval covers this merge only."
Done on that approval: main was fast-forwarded to 564e9f0 and pushed; git ls-remote gave
564e9f0 for main. CI passed on the branch at 564e9f0 (run 37645142656) and on main at
564e9f0 (run 37655437692).
TASK: milestone M3, "Section 2.1", as described in blueprint/MILESTONES.md.
* Create a working branch m3-hole-relation from main.
* Before proving, re-read Section 2.1 of the paper in the local TeX
(paper/build/sections/02-geometry.tex): Definition 2.1, Lemma 2.2 with its proof, and
equation (2.3).
* Remove these three sorries with real proofs, without changing any statement:
* L-2.2, no loops        Hadwiger.HoleData.not_hole_self
* L-2.2, triangle-free   Hadwiger.HoleData.not_hole_triangle
* S-2.3, first half      Hadwiger.HoleData.indepNum_positionGraph_le_two
* State and prove the non-vacuity lemma S-M3.hole-nonvacuous: some HoleData has two
elements with a hole between them. It is a new statement. Choose its exact form, write
that form in its blueprint row and in the session log, leave it unreviewed, and put it
to me at the end. The hand example on blueprint/M0_REVIEW_SHEET.md under R-10 was worked
on paper and is not a proof. If it does not check in Lean, that is a result: record it,
then find an example that does, or tell me if you cannot.
* Follow the paper's proof of Lemma 2.2. If a step of it does not go through as written,
that is a paper issue: record it exactly in blueprint/PAPER_ISSUES.md and tell me. Do
not patch it silently.
* Do not touch Theorem 1.1. Do not start M4 or anything else.
* Expected end state, to check against the audit: 1 sorry (Theorem 1.1). L-2.2 DONE.
S-2.3 DONE; its second half, Hadwiger.HoleData.le_two_mul_chromaticNumber_positionGraph,
should become DONE without being touched. S-M3.hole-nonvacuous DONE, with a Lean name.
C-1.2, T-FINAL, T-NOT-HC and S-1.d still PROVED_MODULO, resting on Theorem 1.1 alone.
If you add no rows for helper lemmas: 156 entries, DONE 34, PROVED_MODULO 4, STATED 1,
NOT_STATED 104. If you add rows, say how many and why. If the audit shows anything else,
find out why before going on.
* If a statement turns out to be false or unprovable as stated, that is a result. Stop,
record exactly what failed in docs/SESSION_LOG.md, and tell me. Do not weaken or adjust
the statement without my say-so.
* Check that no signed-off statement changed, by the pp.all comparison described in the M1
session entry. Run the reverse check described in the M2 entry: every declaration in
the Lean sources is named in the blueprint.
* Keep the blueprint and the ledger in step with the Lean in the same commit. A result
counts only when the axiom audit shows it. Bring every status remark into step as well:
START_HERE.md, README.md, the "How far the paper has been checked" section of
blueprint/PAPER_ISSUES.md, blueprint/MILESTONES.md, and doc comments in the Lean files.
STANDING DECISIONS (already made; do not reopen, do not ask)
* General lemmas stay in Hadwiger/Sanity/ and are imported where needed; nothing is moved.
* Helper lemmas get blueprint rows and no fidelity notes.
* Signed fidelity notes are not rewritten. Add a line "Status update after the sign-off".
* blueprint/M0_REVIEW_SHEET.md is not edited.
WORKING RULES
* Work inline; at most two subagents at a time, only for independent, well-scoped tasks.
* Commit early and often on the working branch. Push it without asking (standing rule in
AGENTS.md). Run pushes with GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0; if a push fails
because it would need a sign-in, stop and tell me instead of opening a window. After
each push, check git ls-remote against HEAD.
* Ask me before merging into main.
* Do not ask me things one at a time. Carry on with everything that does not depend on my
answer, and put all open questions, including the merge and the sign-off of the new
statement, in one prompt at the end.
* Do not consult the upstream openai/math Lean code for this paper.
* End with the checkpoint report that AGENTS.md asks for, and the single next task. The
task after M3 is M4 (Proposition 3.4). Do not start it; list in the report what I have
to decide before it can start.
```

### Start gate

- On `main`, working tree clean. `HEAD` = `main` = `origin/main` = `564e9f0`, and
  `git ls-remote --heads origin main` (run with interaction disabled) gave the same hash.
- Read in full: `START_HERE.md`, `AGENTS.md`, the blueprint, the ledger, the milestones,
  the fidelity notes, the paper issues, and the M1 and M2 entries of this log. Also
  `docs/LEAN_WORKFLOW.md`, the two check scripts and their scanner, and item R-10 of
  `blueprint/M0_REVIEW_SHEET.md`.
- `lake build` passed. `check_ledger.py`: 4 `sorry`, 4 rows, OK. `axiom_audit.py`: 156
  entries, 95 declarations, OK. All as expected.
- `paper/paper.pdf` sha256 matches the pin in `docs/PROVENANCE.md`.
- Before any Lean was written, Section 2.1 was read again in the local TeX
  (`paper/build/sections/02-geometry.tex`, lines 10 to 82): the standing data, Definition
  2.1, Lemma 2.2 with its proof, the graph on positions and equation (2.3).
- Before any Lean was written, the fully elaborated statements were printed at `564e9f0`
  as the baseline for the comparison below.

### What was proved, and how

Three `sorry`s in `Hadwiger/HoleRelation.lean` were replaced by proofs. Each proof is the
paper's.

**`HoleData.not_hole_self`** (Lemma 2.2, no loops).

| Paper | Lean |
|---|---|
| "A loop would have `U_i λ_i = U_i λ_j`, hence `λ_i = λ_j` by injectivity," | `D.U_injective i` applied to the sharing equation |
| "contradicting the last equation" | the last equation becomes `a(λ) + a(λ) = 1`; `CharTwo.add_self_eq_zero` makes the left side `0` |

**`HoleData.not_hole_triangle`** (Lemma 2.2, triangle-freeness). Write `x_pq` for the
witness at `p` of the hole on `{p, q}`.

| Paper | Lean |
|---|---|
| "For a directed incidence `ij`, let `x_ij` be its witness at `i`." | the three `obtain`s: witnesses `xij xji`, `xjk xkj`, `xik xki`, each with its sharing equation, its two functional identities and its parity equation |
| "evaluate the functional identity for `ij` on `x_ik`: `u_j(U_i x_ik) = a(x_ik) + T(x_ij, x_ik)`" | `e1` to `e6`, one for each ordering of the three elements, each by `LinearMap.congr_fun` |
| "Sum over the six ordered choices of `(i,j,k)`." | `hsum`: the sum of the six left sides equals the sum of the six right sides, grouped as the paper groups them |
| "For fixed `j`, the two arguments on the left are equal by the sharing equation for the remaining edge `ik`, so they cancel." | `hleft`: rewrite with the three sharing equations; each pair is then `y + y = 0` |
| "For fixed `i`, the two bilinear terms cancel by symmetry of `T`." | `hbil`: rewrite with `T_symm` three times; each pair is then `y + y = 0` |
| "The remaining sum is `1 + 1 + 1 = 1`, a contradiction." | rewriting `hsum` leaves `0 = 1 + 1 + 1 + 0` in `ZMod 2`, refuted by `decide` |

The six equations, to make the bookkeeping checkable by eye. The first three letters name
the ordering `(p, q, s)`: the identity of the directed incidence `pq` is evaluated on
`x_ps`.

| | ordering | equation | cancels on the left with | bilinear term cancels with |
|---|---|---|---|---|
| `e1` | `(i, j, k)` | `u_j(U_i x_ik) = a(x_ik) + T(x_ij, x_ik)` | `e2`, by sharing on `{i, k}` | `e3` |
| `e2` | `(k, j, i)` | `u_j(U_k x_ki) = a(x_ki) + T(x_kj, x_ki)` | `e1` | `e6` |
| `e3` | `(i, k, j)` | `u_k(U_i x_ij) = a(x_ij) + T(x_ik, x_ij)` | `e4`, by sharing on `{i, j}` | `e1` |
| `e4` | `(j, k, i)` | `u_k(U_j x_ji) = a(x_ji) + T(x_jk, x_ji)` | `e3` | `e5` |
| `e5` | `(j, i, k)` | `u_i(U_j x_jk) = a(x_jk) + T(x_ji, x_jk)` | `e6`, by sharing on `{j, k}` | `e4` |
| `e6` | `(k, i, j)` | `u_i(U_k x_kj) = a(x_kj) + T(x_ki, x_kj)` | `e5` | `e2` |

**`HoleData.indepNum_positionGraph_le_two`** (equation (2.3), first half).

| Paper | Lean |
|---|---|
| "An independent triple of positions would therefore give three distinct elements forming a hole triangle." | an independent set with `α(G)` positions exists (`exists_isNIndepSet_indepNum`); if `α(G) > 2` it has three distinct positions (`Finset.two_lt_card`); distinct non-adjacent positions have a hole between their elements, by the definition of `positionGraph`; `not_hole_triangle` |
| "Equal elements are adjacent because holes have no loops." | not needed in Lean; see below |

### The paper's proof went through as written; two observations

No step of the paper's proof of Lemma 2.2 failed, and nothing had to be added to it. There
is no paper issue. Two observations, neither of them an issue:

1. **The six-term sum does not use distinctness.** The paper supposes "three distinct
   elements", but the computation is about three holes and their six witnesses, and it is
   valid whether or not the elements coincide. So it proves the Lean statement, which has
   no distinctness hypothesis, as it stands. The signed fidelity note F-HOLE justifies
   dropping "distinct" by a different argument (a repeated element would give a loop).
   That argument is correct too, but it is not the one the Lean proof uses, and
   `not_hole_triangle` does not depend on `not_hole_self`.
2. **The six-term sum does not use injectivity of the `U_i`.** Injectivity is used only
   to exclude loops.

In consequence the paper's remark "Equal elements are adjacent because holes have no
loops" has no counterpart in the Lean proof of equation (2.3). The paper needs it to get
three *distinct* elements, because its Lemma 2.2 speaks of distinct elements. In Lean the
triangle lemma applies to any three elements, so `indepNum_positionGraph_le_two` uses
`not_hole_triangle` only. The remark itself is true, and `not_hole_self` proves the fact it
rests on.

### `le_two_mul_chromaticNumber_positionGraph`: what was and was not touched

The instruction expected the second half of equation (2.3) to "become DONE without being
touched". Its statement and its proof body were not touched, and it is `DONE` by the audit.
One thing in its declaration was changed: the last sentence of its **doc comment** said
"The first half of equation (2.3) is still `sorry` (milestone M3), so this theorem is
`PROVED_MODULO`." That became false, and the instruction also asks for doc comments to be
brought into step, so the sentence now says that the theorem rests on nothing unproved. A doc
comment is not part of the statement; the comparison below confirms the statement is
unchanged.

### What the audit shows

After the three proofs, with the non-vacuity lemma not yet added:

- `check_ledger.py`: 1 `sorry`, 1 row.
- `axiom_audit.py`: 156 entries (`DONE` 33, `PROVED_MODULO` 4, `STATED` 1, `DEFINED` 11,
  `MATHLIB` 2, `NOT_STATED` 105), 95 declarations. Before: `DONE` 31, `STATED` 3.
- `#print axioms` on `Hole.symm`, `not_hole_self`, `not_hole_triangle`,
  `indepNum_positionGraph_le_two` and `le_two_mul_chromaticNumber_positionGraph` shows
  `propext`, `Classical.choice`, `Quot.sound` and nothing else. So L-2.2 and S-2.3 are
  `DONE`.
- C-1.2, T-FINAL, T-NOT-HC and S-1.d still show `sorryAx`. They are `PROVED_MODULO` and
  rest on Theorem 1.1 alone. **The final theorem is not proved.**
- The one `sorry` left is Theorem 1.1. It was not touched.

### Check that no signed-off statement changed

As at M1 and M2, with more in it. A file of commands under `set_option pp.all true` was
run at `main` `564e9f0`, before any change, and again on the working tree. It holds:

- the 14 items of the M1 and M2 comparisons, unchanged and in the same order;
- everything else in `Hadwiger/HoleRelation.lean`, which those comparisons did not cover
  and which is the file this milestone changes: `#print` of `HoleData`, `HoleData.r`,
  `HoleData.Hole` and `HoleData.positionGraph`, so that the bodies of the definitions are
  compared and not only their types, and `#check` of `HoleData.mk`, `Hole.symm`,
  `not_hole_self` and `not_hole_triangle`;
- `#print` of the ten other definitions of the statement layer (`MinorModel`, `IsMinor`,
  `HasCliqueMinor`, `hadwigerNumber`, `EdgesTouch`, `IsConnectedMatching`,
  `connectedMatchingNumber`, `FractionalColoring`, `FractionalColoring.total`,
  `fractionalChromaticNumber`).

The two outputs are byte-identical (4,976 lines; sha256
`b79be5d590e3818afe4202beb708cfdeda92cf6144fe2223c96a63156973cfc5`). The earlier
sessions did not keep their outputs, so this one could not be compared with theirs; the
baseline here is `main` at `564e9f0`.

Also: the diff of `Hadwiger/HoleRelation.lean` against `main` adds and removes no line
beginning `theorem`, `lemma`, `def`, `structure`, `instance`, `abbrev`, `axiom`,
`variable`, `open`, `namespace`, `section`, `end` or `import`.

The check file lives under the ignored `.lake/audit/`; it is not a repository script.

### Reverse check

The audit checks blueprint against build, not the reverse. As at M0 and M2 the reverse was
run by hand, with a one-off script that uses the repository's own scanner
(`scripts/leanscan.py`) for the declaration pattern: 93 declarations in the Lean sources,
all named in the blueprint. The other two of the 95 audited names are Mathlib's `indepNum`
and `chromaticNumber`. The script is not in the repository.

### Junk values

- `indepNum` is a supremum. The statement is about a graph on `Fin m`, where independent
  sets are bounded in size and the supremum is the maximum
  (`IsIndepSet.card_le_indepNum`, for a finite vertex type). So `indepNum ≤ 2` says what
  the paper says: no three positions are independent.
- A caution for later users of `exists_isNIndepSet_indepNum`: at the pinned Mathlib it has
  no finiteness hypothesis. For a graph with unboundedly large independent sets
  `indepNum` is the junk value `0` and the lemma returns the empty set. That cannot happen
  on `Fin m`.
- The arithmetic of the six-term sum is in `ZMod 2`: addition only, no subtraction and no
  division.

### Attempts that failed, and corrections

- Nothing failed. The three proofs compiled as first written. The only change after the
  first build was to remove an unused `simp` argument (`add_zero`) in two places, on the
  linter's advice. As the M2 entry says, a first-time success is not evidence of
  correctness; the evidence is the kernel and the comparison of statements.
- No statement was found false or unprovable.

### Records brought into step with the three proofs

- Blueprint: L-2.2 and S-2.3 to `DONE`, with their texts.
- Ledger: three rows removed; one row left. The list of declarations that depend on a
  `sorry` without containing one is down to the four that rest on Theorem 1.1.
- `blueprint/FIDELITY.md`: a line "Status update after the sign-off" under F-HOLE and
  under "L-2.2 and S-2.3". The signed text was not altered.
- `blueprint/M0_REVIEW_SHEET.md` was **not** edited.
- `START_HERE.md`, `README.md`: what is now proved, and that Theorem 1.1 is the only
  `sorry` left. `START_HERE.md` also says that Lemma 2.2 is about the abstract linear data
  of Section 2.1 and that the paper's construction is not stated yet, so that nobody reads
  "`α ≤ 2` is proved" as a statement about the paper's graphs.
- `blueprint/PAPER_ISSUES.md`, "How far the paper has been checked": Lemma 2.2 and
  equation (2.3) are machine-checked; the two observations above; the spot-check row for
  Lemma 2.2.
- `blueprint/MILESTONES.md`: the next task and the state of M3.
- Doc comments in `Hadwiger/HoleRelation.lean`: the file header; how each of the three
  proofs goes; the status sentence of the second half of equation (2.3).

### The non-vacuity lemma, S-M3.hole-nonvacuous

In a commit of its own, after the commit with the three proofs, so that the new statement
can be changed or dropped without touching the proofs of the paper's results.

**The exact form.** It is a new statement. The worker chose the form. **It has not been
reviewed by the user.**

```lean
theorem exists_holeData_hole :
    ∃ D : HoleData (Fin 2 → ZMod 2) (Fin 2 → ZMod 2) (Fin 2), D.Hole 0 1
```

Full name `Hadwiger.exists_holeData_hole`, in the new file
`Hadwiger/Sanity/HoleRelation.lean`. In words: there is linear data in the sense of
Section 2.1 (blueprint D-2.0) with `X` and `V` both equal to `F_2^2` and `Ω` a set of two
elements, in which those two elements have a hole between them (Definition 2.1, D-2.1).

**Why this form, and what else it could have been.**

1. Fixed small types, not "there exist `X`, `V`, `Ω`". An existential over types would
   carry the vector-space instances inside the statement and bring in a choice of
   universe. Fixed types are simpler to read and say more: they show how small an example
   is.
2. `D.Hole 0 1` for the two named elements, not `∃ i j, D.Hole i j`. It is the stronger
   statement and it names the pair. That the two are different elements is visible, and
   by Lemma 2.2 a hole needs different elements in any case.
3. The data is built inside the proof, not given a name by a `def`. A named example would
   be a new definition in the sources for the sake of one check. The cost: the statement
   does not display the data. The doc comment does, and the proof is the witness.
4. `X`, `V` are finite-dimensional and `Ω` is finite. So the example lies in the class of
   the paper, and not only in the larger class that the Lean structure allows (the fidelity
   note F-HOLE dropped "finite-dimensional" and "finite").

**What it does not say.** Nothing about the paper's construction. That the paper's own
`Ω_n` has holes, and many of them, is the content of Theorem 3.1. The lemma shows only that
Definition 2.1 as transcribed can be satisfied, so that Lemma 2.2 and equation (2.3) are
not true for an empty reason. Lemma 2.2 pins the relation from above; this pins it from
below.

**The hand example checked in Lean as written.** The instruction asked for a record if it
did not; it did, so the record is that it did. The data of
`blueprint/M0_REVIEW_SHEET.md`, item R-10, was entered unchanged:

| Sheet | Lean |
|---|---|
| `X = V = F_2^2`, `Ω = {0, 1}` | `Fin 2 → ZMod 2`, `Fin 2`; the sheet's `x_1`, `x_2` are Lean's `x 0`, `x 1` |
| `a(x) = x_1`, `T = 0` | `LinearMap.proj 0`, `0` |
| `U_0 = id`, `U_1` swaps the coordinates | `![LinearMap.id, LinearMap.funLeft (ZMod 2) (ZMod 2) (Equiv.swap 0 1)]` |
| `u_0(y) = y_2`, `u_1(y) = y_1` | `![LinearMap.proj 1, LinearMap.proj 0]` |
| `λ_0 = (1, 0)`, `λ_1 = (0, 1)` | `![1, 0]`, `![0, 1]` |

The five obligations (injectivity of both `U_i`, the sharing equation, the two functional
identities, the parity equation) were each proved separately. No correction to the sheet
was needed and no other example was tried.

**Where it lives.** In a new file under `Hadwiger/Sanity/`, not in
`Hadwiger/HoleRelation.lean`, so that the file for Section 2.1 holds only what is in the
paper. The new file imports `Hadwiger/HoleRelation.lean`; the root module imports the new
file; nothing else does. It declares one theorem and nothing else: no instance, attribute,
notation or `simp` lemma.

**No fidelity note.** By the standing decision, checks and helper lemmas get blueprint
rows and no fidelity notes. The exact form is in the blueprint row, and a status-update
line under F-HOLE says the lemma exists and is outside the sign-off.

### The end state, against the instruction

After the second commit:

- `check_ledger.py`: 1 `sorry` (Theorem 1.1), 1 row.
- `axiom_audit.py`: 156 entries (`DONE` 34, `PROVED_MODULO` 4, `STATED` 1, `DEFINED` 11,
  `MATHLIB` 2, `NOT_STATED` 104), 96 declarations. This is the end state the instruction
  gave for the case that no row is added. **No row was added**: S-M3.hole-nonvacuous had
  its row since M0 and no helper lemma was needed. The audited declarations went from 95
  to 96; the one new name is `Hadwiger.exists_holeData_hole`.
- `#print axioms Hadwiger.exists_holeData_hole`: `propext`, `Classical.choice`,
  `Quot.sound`.
- The kind of the row was renamed from `sanity (planned)` to `sanity (requested)`, since it
  is no longer planned; the list of kinds in the blueprint says so.
- Reverse check: 94 declarations in the Lean sources, all named in the blueprint.
- The `pp.all` comparison was run again on the final tree: byte-identical to `main`
  `564e9f0`. The diff of the tracked Lean files against `main` adds one declaration-level
  line, `import Hadwiger.Sanity.HoleRelation` in the root module; the new file has one
  `theorem` line.

### Records brought into step with the lemma

Blueprint (the row; the kinds; the two sentences that said "planned"), ledger (the remark
on the `Sanity` files), `blueprint/FIDELITY.md` (a second status-update line under F-HOLE),
`START_HERE.md` (one statement is not yet signed off), `docs/LEAN_WORKFLOW.md` (the layout
row for `Hadwiger/Sanity/`), the header of `Hadwiger/HoleRelation.lean` (one sentence
pointing to the check), and `blueprint/MILESTONES.md`: the state of M3, the next task, and
under M4 the list of what the user has to decide before M4 starts.

### Lean notes

- `CharTwo.add_self_eq_zero` applies in `ZMod 2` with no setup; the instance is
  `ZMod.charP`.
- `LinearMap.congr_fun h x`, given the expected type by a `have … : … :=`, unfolds
  composition, the sum of functionals and the project's `r` by definition. No lemma about
  `r` was needed in `Hadwiger/HoleRelation.lean`. In the sanity file `simp [HoleData.r]`
  unfolds it.
- After rewriting with the sharing equations (or with `T_symm`), each pair is literally
  `y + y`, and `simp only [CharTwo.add_self_eq_zero]` then also closes `0 + 0 + 0 = 0`.
- `decide` refutes `0 = 1 + 1 + 1 + 0` in `ZMod 2`.
- `Finset.two_lt_card` gives three distinct elements as
  `∃ a ∈ s, ∃ b ∈ s, ∃ c ∈ s, a ≠ b ∧ a ≠ c ∧ b ≠ c`.
- A family of two linear maps can be written `![f, g]` and taken apart with `fin_cases`.
  `LinearMap.funLeft R M f` is precomposition with `f`; it is injective when `f` is
  surjective (`LinearMap.funLeft_injective_of_surjective`).

### Tooling notes

- The `cd` problem of the M1 entry again: one command that changed into the Mathlib folder
  moved the working directory for the commands after it. Nothing was written in the wrong
  place. Every command now starts with an absolute `cd`.
- A wrapped doc-comment line that began with the word `open` was matched by the grep for
  declaration-level lines. The sentence was reworded, so that the check is empty and does
  not need explaining.
- To split the work into two commits that each pass the three commands, the pieces of the
  second (the new file, the import, five places in the blueprint, one sentence of a file
  header) were set aside in the scratch folder, the first commit was built, checked,
  committed and pushed without them, and they were then restored. Before restoring, the
  saved copies were diffed against the committed files and differed only in those pieces.

### Not done, and why

- M4: not started, by instruction. Section 3 of the paper
  (`paper/build/sections/03-distributions.tex`, lines 1 to 206) was read again, only in
  order to list what the user has to decide first. No Lean for M4 was written and no M4
  definition was drafted.
- Theorem 1.1 was not touched.
- No sanity check beyond the one requested was added. One suggests itself and was **not**
  written: that the bound `α ≤ 2` of equation (2.3) is attained by some graph on positions
  (the list `0, 1` in the example above has no edge), which would be to equation (2.3)
  what S-M2.tight is to Proposition 3.5. The user has been told.
- Upstream's Lean code for this paper was not consulted, and no statement was compared
  with upstream's. Whether upstream has published more Lean for this paper since the
  reorganisation session was not checked in this session.
- No subagent was used.

### Push and CI

| Commit | What | On the remote | CI |
|---|---|---|---|
| `a07528d` | the three proofs and their records | yes; `git ls-remote` equal to `HEAD` after the push | passed, run `37692531079` |
| `6fa5246` | the non-vacuity lemma and its records | yes; `git ls-remote` equal to `HEAD` after the push | passed, run `37693226157` |

The second row was added afterwards, in a commit of its own that changes only this log; the
CI result of that commit is therefore not recorded here. The pushes ran with
`GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0` and did not prompt. `main` on the remote
stayed at `564e9f0`. Each run was matched to its commit by hash. In both runs every step
passed: the build, the ledger check and the axiom audit.

### Questions put to the user at the end of the session

In one prompt, as instructed:

1. the sign-off of the form of S-M3.hole-nonvacuous;
2. whether to merge `m3-hole-relation` into `main`, and how much of it;
3. the decisions that M4 waits for (`blueprint/MILESTONES.md`, under M4).

### Merge

Nothing was merged into `main` in the work recorded above. If a merge is approved it is to
be a fast-forward, after CI has passed on the commit merged. **If `main` contains this
commit, the merge was done**; `git log main` is the record. The user's answers, if they
come after this commit, belong at the head of the next session's entry, as was done above
for M1 and M2.
