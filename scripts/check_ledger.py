#!/usr/bin/env python3
"""Check that every `sorry`, `admit`, `axiom` and `native_decide` in the Lean sources is
listed in blueprint/SORRY_AXIOM_LEDGER.md, and that the ledger lists nothing stale.

Usage:  python scripts/check_ledger.py          (exit 1 on any mismatch)
        python scripts/check_ledger.py --list   (print what the sources contain)
"""
import sys

import leanscan


def main():
    found = leanscan.scan_flags()
    if "--list" in sys.argv:
        for rel, decl, kind in found:
            print("| `%s` | `%s` | `%s` |" % (rel, decl, kind))
        print("%d flagged occurrence(s)." % len(found))
        return 0

    listed = sorted((f, d, k) for f, d, k, _id, _ms, _note in leanscan.ledger_rows())
    missing = [x for x in found if x not in listed]
    stale = [x for x in listed if x not in found]

    for rel, decl, kind in missing:
        print("NOT IN LEDGER: %s in %s (%s)" % (kind, decl, rel))
    for rel, decl, kind in stale:
        print("STALE LEDGER ROW: %s in %s (%s) is no longer in the sources" % (kind, decl, rel))

    counts = {}
    for _rel, _decl, kind in found:
        counts[kind] = counts.get(kind, 0) + 1
    summary = ", ".join("%d %s" % (v, k) for k, v in sorted(counts.items())) or "none"
    print("Sources contain: %s. Ledger rows: %d." % (summary, len(listed)))

    if missing or stale:
        print("FAIL: the ledger does not match the sources.")
        return 1
    print("OK: the ledger matches the sources.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
