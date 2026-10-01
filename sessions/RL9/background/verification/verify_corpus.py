#!/usr/bin/env python3
"""Validate the RL2 literature package. This is not a mathematical proof verifier."""
import json
import re
import sys
from collections import Counter
from pathlib import Path

BACKGROUND = Path(__file__).resolve().parents[1]
SPEC = json.loads((BACKGROUND / "verification/RECORD_SPEC.json").read_text())
META = json.loads((BACKGROUND / "CORPUS_METADATA.json").read_text())
CUTOFF = META["research_cutoff_date"]
ERRORS = []

def check(condition, message):
    if not condition:
        ERRORS.append(message)

def parse_lines(filename):
    rows = []
    for number, line in enumerate((BACKGROUND / filename).read_text().splitlines(), 1):
        check(bool(line.strip()), f"{filename}:{number}: blank JSONL record")
        try:
            value = json.loads(line)
        except json.JSONDecodeError as error:
            ERRORS.append(f"{filename}:{number}: {error}")
            continue
        check(isinstance(value, dict), f"{filename}:{number}: expected object")
        if isinstance(value, dict):
            rows.append(value)
    return rows

catalogs = [
    ("SOURCE_CATALOG.jsonl", "source_id", "SRC", "source_catalog_fields", "sources"),
    ("RESULT_CATALOG.jsonl", "result_id", "RES", "result_catalog_fields", "results"),
    ("TOPIC_CATALOG.jsonl", "topic_id", "TOP", "topic_catalog_fields", "topics"),
    ("OPEN_CASE_CATALOG.jsonl", "open_case_id", "OPEN", "open_case_catalog_fields", "open_cases"),
    ("GLOSSARY.jsonl", "term_id", "TERM", "glossary_fields", "glossary_terms"),
]
all_ids = {}
data = {}
for filename, id_field, prefix, schema_field, count_key in catalogs:
    rows = parse_lines(filename)
    data[prefix] = rows
    check(len(rows) == META["counts"][count_key], f"{filename}: count mismatch")
    for row in rows:
        rid = row.get(id_field)
        check(isinstance(rid, str) and bool(re.fullmatch(prefix + r"-\d{4}", rid or "")),
              f"{filename}: invalid ID {rid!r}")
        check(rid not in all_ids, f"duplicate ID {rid}")
        if isinstance(rid, str):
            all_ids[rid] = row
        for field in SPEC[schema_field]["required"]:
            check(field in row, f"{rid}: missing required field {field}")
        check(row.get("research_cutoff_date") == CUTOFF, f"{rid}: cutoff mismatch")

reference_fields = {
    "source_ids": "SRC", "topics": "TOP", "topic_ids": "TOP",
    "technique_topic_ids": "TOP", "variant_topic_ids": "TOP",
    "related_topic_ids": "TOP", "result_ids": "RES", "dependencies": "RES",
    "implies": "RES", "implied_by": "RES", "related_result_ids": "RES",
    "open_case_ids": "OPEN",
}
for rid, row in all_ids.items():
    for field, prefix in reference_fields.items():
        if field not in row:
            continue
        values = row[field]
        check(isinstance(values, list), f"{rid}.{field}: expected list")
        if not isinstance(values, list):
            continue
        check(len(values) == len(set(values)), f"{rid}.{field}: duplicate reference")
        for value in values:
            check(value in all_ids and value.startswith(prefix + "-"),
                  f"{rid}.{field}: unresolved/wrong-kind reference {value}")
    # Check embedded IDs in notes and optional link fields as well.
    for value in re.findall(r"\b(?:SRC|RES|TOP|OPEN|TERM)-\d{4}\b", json.dumps(row)):
        check(value in all_ids, f"{rid}: unresolved embedded reference {value}")

enums = SPEC["enum_guidance"]
for row in data["SRC"]:
    sid = row["source_id"]
    check(row["primary_status"] in enums["primary_status"], f"{sid}: primary-status enum")
    check(row["verification_status"] in enums["verification_status"], f"{sid}: verification enum")
    check(isinstance(row["authors"], list) and bool(row["authors"]), f"{sid}: authors")
    check(row["year"] is None or (isinstance(row["year"], int) and not isinstance(row["year"], bool)),
          f"{sid}: publication year")
    check(bool(row["stable_locator"]), f"{sid}: empty stable locator")
    check(bool(row.get("verification_basis")), f"{sid}: missing actual inspection basis")
    if "url" in row:
        check(bool(re.match(r"^https?://", row["url"])), f"{sid}: URL is not HTTP(S)")
    if row["verification_status"] == "checked_primary":
        check(row["primary_status"] == "primary", f"{sid}: checked-primary class mismatch")
    if row["verification_status"] == "checked_authoritative_secondary":
        check(row["primary_status"] == "authoritative_secondary", f"{sid}: checked-survey class mismatch")

for row in data["RES"]:
    rid = row["result_id"]
    check(row["result_status"] in enums["result_status"], f"{rid}: result-status enum")
    check(isinstance(row["primary_source_verified"], bool), f"{rid}: primary flag type")
    check(bool(row["source_ids"]), f"{rid}: no source provenance")
    check(row.get("origin") == "literature_inherited", f"{rid}: not explicitly inherited")
    check(bool(row.get("checked_locator")), f"{rid}: missing statement locator/gap")
    check(bool(row.get("verification_meaning")), f"{rid}: missing verification limit")
    checked = [all_ids[s] for s in row["source_ids"] if s in all_ids]
    if row["primary_source_verified"]:
        check(any(s.get("verification_status") == "checked_primary" for s in checked),
              f"{rid}: primary flag lacks an inspected primary")
    if row["result_status"] == "proved":
        check(any(s.get("verification_status") in ("checked_primary", "checked_authoritative_secondary")
                  for s in checked), f"{rid}: theorem supported only by unchecked/orientation sources")
    if row["result_status"] == "uncertain":
        check(not row["primary_source_verified"], f"{rid}: uncertain statement marked primary verified")

for row in data["OPEN"]:
    check(row["as_of_date"] == CUTOFF, f'{row["open_case_id"]}: as-of mismatch')
    check(bool(row["source_ids"]), f'{row["open_case_id"]}: no status provenance')
    check(bool(row.get("uncertainty")), f'{row["open_case_id"]}: missing status/freshness limit')
for row in data["TERM"]:
    check(bool(row.get("source_ids")), f'{row["term_id"]}: no definition provenance')

for path in SPEC["required_outputs"]:
    check((BACKGROUND / path.removeprefix("background/")).is_file(), f"missing required output {path}")
for path in BACKGROUND.glob("*.md"):
    text = path.read_text()
    check(CUTOFF in text, f"{path.name}: no explicit cutoff")
    for rid in re.findall(r"\b(?:SRC|RES|TOP|OPEN|TERM)-\d{4}\b", text):
        check(rid in all_ids, f"{path.name}: unresolved human-readable ID {rid}")

# Human theorem table must agree exactly with the structured summaries/scopes.
def esc(value):
    return str(value).replace("|", "\\|").replace("\n", " ")
known = (BACKGROUND / "KNOWN_RESULTS.md").read_text()
for row in data["RES"]:
    expected = f'| {row["result_id"]} / {row["result_status"]} | {esc(row["statement_summary"])} | {esc(row["scope"])} |'
    check(known.count(expected) == 1, f'{row["result_id"]}: human/structured summary mismatch')

# Specific promotion guards for the actual cutoff hazards.
check(all_ids["RES-0001"]["result_status"] == "open", "root conjecture accidentally promoted")
check(all_ids["SRC-0014"]["verification_status"] == "not_directly_checked", "unretrieved source promoted")
check(all_ids["RES-0015"]["result_status"] == "uncertain", "September lead promoted")
check(all_ids["OPEN-0008"]["status"] == "source_gap", "September source gap erased")
check(all_ids["OPEN-0005"]["status"] == "open_as_last_checked", "fractional freshness caveat erased")
check(META["project_originated_claims"] == 0, "unexpected project-originated mathematics")
check(META["status"] in ("NOT PROMOTED", "PROMOTED BACKGROUND"), "unknown package status")
expected_header = ("NOT PROMOTED — working research checkpoint." if META["status"] == "NOT PROMOTED"
                   else "PROMOTED BACKGROUND — frozen RL2 and inherited successor corpus.")
for path in BACKGROUND.glob("*.md"):
    check("Status: " + expected_header in path.read_text(), f"{path.name}: package/header status mismatch")
inspection_counts = dict(Counter(row["verification_status"] for row in data["SRC"]))
check(inspection_counts == META["source_inspection_counts"], "inspection counts mismatch")

if ERRORS:
    print(json.dumps({"status": "FAIL", "errors": ERRORS}, indent=2))
    sys.exit(1)
print(json.dumps({
    "status": "PASS",
    "cutoff": CUTOFF,
    "counts": META["counts"],
    "inspection_counts": inspection_counts,
    "project_originated_claims": 0,
    "limits": "Mechanical packaging/provenance validation only; not a mathematical proof verifier.",
}, indent=2))
