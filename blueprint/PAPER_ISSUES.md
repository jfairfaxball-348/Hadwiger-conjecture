# Paper issues

Everything found in the paper that is wrong, missing, or unclear. A finding here is a
**result** of the project. It is recorded exactly and reported to the user; it is never
closed with an axiom or a silently changed statement (`AGENTS.md`).

Kinds (`docs/STATUS_CLASSIFICATIONS.md`): `ERROR` (false as written, with a precise
refutation), `GAP` (a step that does not follow, no repair found), `UNCLEAR` (more than one
reading, or something left out; the reading adopted is recorded), `REPAIRED`.

**How far the paper has been checked.** Sections 1 to 3 were read in full, proofs
included, on 2026-10-07; the arguments there were followed step by step on paper and no
error was found, but nothing in them is machine-checked yet. Sections 4 to 14 and
Appendix A were read for their statements and structure; **their proofs have not been
checked**. The absence of an entry below for those sections means "not examined", not
"found correct".

No `ERROR` and no `GAP` has been established so far.

---

## PI-001 — Theorem 1.1 has no proof of its own

- Kind: `UNCLEAR` (structural; not a doubt about the mathematics).
- Where: §1, Theorem 1.1 (`thm:main`); §3, Proposition 3.4 (`prop:raw-to-graph`).
- What the paper does: states Theorem 1.1 in the introduction and never returns to it.
  Proposition 3.4 says that, assuming the conclusion of Theorem 3.1 at a given sufficiently
  large `n`, the sampled graph on `m = 2^{C_0 g N}` positions has `α(G) ≤ 2` and
  `cm(G) < m/100` with probability `1 − exp(−Ω(m))`.
- Reading adopted: Theorem 1.1 is Theorem 3.1 plus Proposition 3.4. For every sufficiently
  large `n` the probability is positive, so a graph with both properties exists; its order
  is `m = 2^{C_0 g M_0 n}`, which is unbounded in `n`.
- Consequence for the formalisation: Theorem 1.1 needs only "probability greater than 0"
  from Proposition 3.4, at each large `n`. The rate `1 − exp(−Ω(m))`, and the uniformity of
  the implied constant in `n`, are stronger than what Theorem 1.1 uses. Milestone M4 may
  therefore target the weaker statement; if it does, that is a recorded difference from
  Proposition 3.4 as printed, not a silent one.
- Blueprint entries: T-1.1, P-3.4.
