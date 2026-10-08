#!/usr/bin/env python3
"""Port Lean source files to Lean's module system, mechanically.

For each file given (or every .lean file under the directories given):

  * a line `module` is put before the first import, after any leading comment;
  * every `import X` becomes `public import X`;
  * `@[expose] public section` is put after the imports.

That is the shape Mathlib's own port has. It keeps every declaration visible to importers,
with its body, as it was before the port. It does not change any statement or proof.
Files that already start with `module` are left alone. The script prints what it changed.

Usage:  python scripts/port_to_modules.py OAI Hadwiger Hadwiger.lean
"""
import io
import os
import re
import sys

IMPORT = re.compile(r"^import\s+(\S.*)$")


def port(text):
    lines = text.split("\n")
    first = next((i for i, l in enumerate(lines) if IMPORT.match(l)), None)
    if first is None:
        return None, "no import line"
    if any(l.strip() == "module" for l in lines[:first]):
        return None, "already a module"
    last = first
    for i in range(first, len(lines)):
        if IMPORT.match(lines[i]):
            last = i
        elif lines[i].strip() and not lines[i].lstrip().startswith("--"):
            break
    out = lines[:first] + ["module", ""]
    for i in range(first, last + 1):
        m = IMPORT.match(lines[i])
        out.append("public import " + m.group(1) if m else lines[i])
    out += ["", "@[expose] public section"]
    out += lines[last + 1:]
    return "\n".join(out), "ported (%d imports)" % sum(1 for l in lines[first:last + 1] if IMPORT.match(l))


def files(args):
    for a in args:
        if os.path.isdir(a):
            for base, _dirs, names in os.walk(a):
                for n in sorted(names):
                    if n.endswith(".lean"):
                        yield os.path.join(base, n)
        else:
            yield a


def main():
    counts = {}
    for path in files(sys.argv[1:]):
        with io.open(path, encoding="utf8", newline="") as fh:
            text = fh.read()
        new, what = port(text)
        counts[what.split(" (")[0]] = counts.get(what.split(" (")[0], 0) + 1
        if new is not None:
            with io.open(path, "w", encoding="utf8", newline="") as fh:
                fh.write(new)
    for k, v in sorted(counts.items()):
        print("%s: %d file(s)" % (k, v))


if __name__ == "__main__":
    main()
