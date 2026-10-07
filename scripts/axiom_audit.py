#!/usr/bin/env python3
"""Audit every Lean declaration named in blueprint/BLUEPRINT.md with `#print axioms`, and
check that the status recorded in the blueprint is the status the kernel actually supports.

Status of a theorem-like entry, computed from the build:

  STATED         one of its declarations has a direct `sorry` (it is in the ledger)
  PROVED_MODULO  no direct `sorry`, but `sorryAx` is among its axioms (a dependency is open)
  DONE           axioms are a subset of {propext, Classical.choice, Quot.sound}

A definition entry (status DEFINED or MATHLIB) must exist and must not depend on `sorryAx`
or on any non-standard axiom.

Any axiom other than the three standard ones and `sorryAx` fails the audit outright.

Usage:  python scripts/axiom_audit.py     (run after `lake build`; exit 1 on any mismatch)
"""
import os
import re
import subprocess
import sys

import leanscan

THEOREM_STATUSES = ["STATED", "PROVED_MODULO", "DONE"]
DEFINITION_STATUSES = ["DEFINED", "MATHLIB"]
UNSTATED = "NOT_STATED"


def run_print_axioms(names):
    audit_dir = os.path.join(leanscan.ROOT, ".lake", "audit")
    os.makedirs(audit_dir, exist_ok=True)
    path = os.path.join(audit_dir, "Audit.lean")
    with open(path, "w", encoding="utf8", newline="\n") as fh:
        fh.write("import Hadwiger\n\n")
        for n in names:
            fh.write("#print axioms %s\n" % n)
    proc = subprocess.run(["lake", "env", "lean", path], cwd=leanscan.ROOT,
                          capture_output=True, text=True, encoding="utf8")
    out = proc.stdout + "\n" + proc.stderr
    if proc.returncode != 0:
        print(out)
        print("FAIL: `lean` rejected the audit file (unknown declaration, or build not up to date).")
        sys.exit(1)
    axioms = {}
    for m in re.finditer(r"'([^']+)' depends on axioms: \[([^\]]*)\]", out, re.S):
        axioms[m.group(1)] = {a.strip() for a in m.group(2).split(",") if a.strip()}
    for m in re.finditer(r"'([^']+)' does not depend on any axioms", out):
        axioms[m.group(1)] = set()
    return axioms


def main():
    entries = leanscan.blueprint_entries()
    if not entries:
        print("FAIL: no blueprint entries found in %s" % leanscan.BLUEPRINT)
        return 1
    direct = {decl for _f, decl, kind in leanscan.scan_flags() if kind in ("sorry", "admit")}

    names = []
    for e in entries:
        for n in e["lean"]:
            if n not in names:
                names.append(n)
    axioms = run_print_axioms(names)

    problems = []
    tally = {}
    for e in entries:
        status = e["status"]
        tally[status] = tally.get(status, 0) + 1
        if status == UNSTATED:
            if e["lean"]:
                problems.append("%s: status NOT_STATED but a Lean name is given" % e["id"])
            continue
        if status not in THEOREM_STATUSES + DEFINITION_STATUSES:
            problems.append("%s: unknown status %r" % (e["id"], status))
            continue
        if not e["lean"]:
            problems.append("%s: status %s but no Lean name" % (e["id"], status))
            continue
        ranks = []
        for n in e["lean"]:
            if n not in axioms:
                problems.append("%s: no `#print axioms` result for %s" % (e["id"], n))
                continue
            ax = axioms[n]
            extra = ax - leanscan.STANDARD_AXIOMS - {"sorryAx"}
            if extra:
                problems.append("%s: %s uses non-standard axiom(s) %s" % (e["id"], n, sorted(extra)))
            if n in direct:
                ranks.append(0)
            elif "sorryAx" in ax:
                ranks.append(1)
            else:
                ranks.append(2)
        if not ranks:
            continue
        if status in DEFINITION_STATUSES:
            if min(ranks) < 2:
                problems.append("%s: definition depends on `sorry`" % e["id"])
            continue
        actual = THEOREM_STATUSES[min(ranks)]
        if actual != status:
            problems.append("%s: blueprint says %s but the build supports %s" % (e["id"], status, actual))

    print("Blueprint entries: %d  (%s)" % (
        len(entries), ", ".join("%s %d" % (k, v) for k, v in sorted(tally.items()))))
    print("Declarations audited: %d" % len(names))
    for p in problems:
        print("MISMATCH: " + p)
    if problems:
        print("FAIL: the blueprint does not match the build.")
        return 1
    print("OK: every blueprint status matches the build and no non-standard axiom is used.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
