# RL22 append-only candidate lesson event — FL-025

Date: 2026-10-02 Europe/Madrid.
Status: RL22 checkpoint only / NOT PROMOTED.

## FL-025 — T_2 blocker emptiness can hold while a one-sided leaf remains the target-color blocker

- **Origin/evidence:** RL22 bounded fixed-defect target-color blocker assessment at BASE_HEAD 33176e4691c1a657ae114cdd058664c544f81a40, fixed RL21 repair pattern X={a},Y={b}, one fixed disjoint-star coloring c.
- **Classification:** method barrier / recovery lesson; not a mathematical error, counterexample, theorem demotion or source-status change.
- **Expectation tested:** whether forcing Z_a=empty or Z_b=empty is enough, under the fixed repair pattern and source coloring, to certify the corresponding one-endpoint recoloring.
- **Actual observation:** Y={b} forces N_H(a) intersect T_2=empty, hence Z_a=empty. The recoloring a->beta is safe against S, B and T_2.
- **First missing dependency:** x is adjacent to a but not b. Properness gives c(x)!=alpha but does not force c(x)!=beta. Thus ax can remain a target-color blocker outside Z_a.
- **Surviving valid scope:** the T_2 blocker set Z_a is genuinely empty in this fixed pattern; no claim is made that c(x)=beta actually occurs in every or any full C_7 instance.
- **Downstream effect:** no five-color boundary compression is certified, no selected repair pattern is eliminated, and no named inherited obligation is reduced.
- **Lesson:** in repair patterns where x sees only the recolored endpoint, T_2 target-color exclusion is not a sufficient safety certificate; the leaf color must be controlled separately.
- **Retry condition:** do not repeat the same Z_a/Z_b test in this pattern without a new premise controlling c(x) relative to the opposite endpoint color, or a genuinely different recoloring certificate.
- **Next bounded recovery:** assess the conditional branch c(x)=beta for the same fixed pattern and fixed coloring, seeking either a contradiction from currently unused fixed-side/resource structure or a precise compatibility barrier. Do not choose a second coloring or switch resource sides.
- **Sources/computation:** zero new mathematical source queries/opens and zero numerical mathematics.
- **Programme:** ACTIVE.
