"""Shared helpers: scan Lean sources and parse the blueprint and ledger tables.

Standard library only, so it runs unchanged locally and in CI.
"""
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SOURCE_DIRS = ["Hadwiger", "OAI"]
SOURCE_FILES = ["Hadwiger.lean"]
BLUEPRINT = os.path.join(ROOT, "blueprint", "BLUEPRINT.md")
LEDGER = os.path.join(ROOT, "blueprint", "SORRY_AXIOM_LEDGER.md")

STANDARD_AXIOMS = {"propext", "Classical.choice", "Quot.sound"}

BS = chr(92)
# A cell separator is a pipe that is not escaped with a backslash.
UNESCAPED_PIPE = re.compile("(?<!" + BS + BS + ")" + BS + "|")

DECL_RE = re.compile(
    r"^\s*(?:@\[[^\]]*\]\s*)*"
    r"(?:(?:private|protected|noncomputable|unsafe|partial|nonrec)\s+)*"
    r"(theorem|lemma|def|instance|abbrev|structure|inductive|class|axiom|opaque)\s+"
    r"([^\s:({\[]+)"
)
NAMESPACE_RE = re.compile(r"^\s*namespace\s+(\S+)")
END_RE = re.compile(r"^\s*end\s+(\S+)")
FLAG_RES = {
    "sorry": re.compile(r"(?<![\w.'])sorry(?![\w'])"),
    "admit": re.compile(r"(?<![\w.'])admit(?![\w'])"),
    "native_decide": re.compile(r"(?<![\w.'])native_decide(?![\w'])"),
}


def lean_files():
    out = []
    for f in SOURCE_FILES:
        p = os.path.join(ROOT, f)
        if os.path.exists(p):
            out.append(p)
    for d in SOURCE_DIRS:
        for base, _dirs, files in os.walk(os.path.join(ROOT, d)):
            for f in sorted(files):
                if f.endswith(".lean"):
                    out.append(os.path.join(base, f))
    return sorted(out)


def strip_comments(text):
    """Blank out line comments and (nested) block comments, keeping line structure."""
    out = []
    i = 0
    depth = 0
    n = len(text)
    while i < n:
        two = text[i:i + 2]
        if depth == 0 and two == "--":
            while i < n and text[i] != "\n":
                i += 1
            continue
        if two == "/-":
            depth += 1
            i += 2
            continue
        if depth > 0 and two == "-/":
            depth -= 1
            i += 2
            continue
        ch = text[i]
        if depth > 0:
            out.append("\n" if ch == "\n" else " ")
        else:
            out.append(ch)
        i += 1
    return "".join(out)


def scan_flags():
    """Return a sorted list of (relative file, qualified declaration, kind)."""
    found = set()
    for path in lean_files():
        rel = os.path.relpath(path, ROOT).replace(os.sep, "/")
        with open(path, encoding="utf8") as fh:
            text = strip_comments(fh.read())
        namespaces = []
        current = "<top level>"
        for line in text.split("\n"):
            m = NAMESPACE_RE.match(line)
            if m:
                namespaces.append(m.group(1))
                continue
            m = END_RE.match(line)
            if m and namespaces and namespaces[-1] == m.group(1):
                namespaces.pop()
                continue
            m = DECL_RE.match(line)
            if m:
                current = ".".join(namespaces + [m.group(2)])
                if m.group(1) == "axiom":
                    found.add((rel, current, "axiom"))
            for kind, rx in FLAG_RES.items():
                if rx.search(line):
                    found.add((rel, current, kind))
    return sorted(found)


def table_rows(path, min_cols):
    """Yield the cells of every Markdown table body row with at least `min_cols` cells."""
    with open(path, encoding="utf8") as fh:
        for line in fh:
            line = line.strip()
            if not line.startswith("|") or not line.endswith("|"):
                continue
            cells = [c.strip().replace(BS + "|", "|") for c in UNESCAPED_PIPE.split(line[1:-1])]
            if len(cells) < min_cols:
                continue
            if all(re.fullmatch(r":?-+:?", c) for c in cells):
                continue
            yield cells


ID_RE = re.compile(r"^[A-Z]+-[A-Za-z0-9.\-]+$")
NAME_RE = re.compile(r"`([^`]+)`")


def blueprint_entries():
    """Blueprint rows: | ID | Kind | Paper location | Statement | Depends on | Lean | Status |"""
    entries = []
    for cells in table_rows(BLUEPRINT, 7):
        if not ID_RE.match(cells[0]):
            continue
        entries.append({
            "id": cells[0],
            "kind": cells[1],
            "paper": cells[2],
            "statement": cells[3],
            "deps": [d.strip() for d in cells[4].split(",") if ID_RE.match(d.strip())],
            "lean": NAME_RE.findall(cells[5]),
            "status": cells[6],
        })
    return entries


def ledger_rows():
    """Ledger rows: | File | Declaration | Kind | Blueprint ID | Milestone | Note |"""
    rows = []
    for cells in table_rows(LEDGER, 6):
        if not cells[0].endswith(".lean`") and not cells[0].endswith(".lean"):
            continue
        rows.append((cells[0].strip("`"), cells[1].strip("`"), cells[2].strip("`"), cells[3], cells[4], cells[5]))
    return rows
