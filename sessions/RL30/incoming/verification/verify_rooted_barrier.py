#!/usr/bin/env python3
"""Exact checks for the nine-vertex rooted-model barrier; no graph census."""
import itertools
import json
from pathlib import Path

# x_i=i, y_i=4+i, z=8. Indices on the two cycles are modulo four.
vertices = set(range(9))
edges = set()
def add(u, v):
    edges.add(tuple(sorted((u, v))))
for i in range(4):
    add(i, (i+1) % 4)
    add(4+i, 4+(i+1) % 4)
    add(i, 4+i)
    add(i, 4+(i-1) % 4)
    add(8, 4+i)
adj = {v: set() for v in vertices}
for u, v in edges:
    adj[u].add(v)
    adj[v].add(u)

def connected(part):
    if not part:
        return False
    seen = {next(iter(part))}
    todo = list(seen)
    while todo:
        v = todo.pop()
        new = (adj[v] & part) - seen
        seen.update(new)
        todo.extend(new)
    return seen == part

def complete_model(parts):
    if any(not connected(part) for part in parts):
        return False
    if sum(map(len, parts)) != len(set().union(*parts)):
        return False
    return all(any(adj[v] & b for v in a)
               for a, b in itertools.combinations(parts, 2))

cuts_checked = 0
for size in range(4):
    for removed in itertools.combinations(sorted(vertices), size):
        cuts_checked += 1
        assert connected(vertices - set(removed)), removed
assert cuts_checked == 130
assert len(adj[0]) == 4
assert not connected(vertices - adj[0])

# Four prescribed roots x_0,...,x_3 lie in their four distinct branch sets.
# Each of the five other vertices belongs to a branch 0..3 or is unused (4).
# This is every possible rooted minor model, including models with unused vertices.
root_assignments_checked = 0
rooted_models = 0
for assignment in itertools.product(range(5), repeat=5):
    root_assignments_checked += 1
    parts = [{i} for i in range(4)]
    for v, label in zip(range(4, 9), assignment):
        if label < 4:
            parts[label].add(v)
    rooted_models += int(complete_model(parts))
assert root_assignments_checked == 3125
assert rooted_models == 0

k4_witness = [{8}, {4}, {5}, {6, 7}]
assert complete_model(k4_witness)
four_coloring = [2, 3, 2, 3, 0, 1, 0, 1, 2]
assert all(four_coloring[u] != four_coloring[v] for u, v in edges)
three_colorings_checked = 0
three_colorable = False
for c in itertools.product(range(3), repeat=9):
    three_colorings_checked += 1
    if all(c[u] != c[v] for u, v in edges):
        three_colorable = True
        break
assert three_colorings_checked == 19683
assert not three_colorable

# In the displayed optimal coloring, the outer-root set misses colors 0 and 1.
assert {four_coloring[i] for i in range(4)} == {2, 3}
report = {
    "status": "PASS", "domain": "one labeled graph P on vertices 0..8",
    "vertex_labels": {"x": [0, 1, 2, 3], "y": [4, 5, 6, 7], "z": 8},
    "edges": sorted(edges), "n": 9, "m": len(edges),
    "connectivity": 4, "cuts_of_size_at_most_3_checked": cuts_checked,
    "root_set": [0, 1, 2, 3],
    "rooted_model_assignments_checked": root_assignments_checked,
    "rooted_K4_models": rooted_models,
    "K4_witness": [sorted(p) for p in k4_witness],
    "chromatic_number": 4, "three_colorings_checked": three_colorings_checked,
    "four_coloring": four_coloring,
    "root_set_colorful": False,
    "limits": "Exact finite base only. Universal join lift has a separate analytic proof; no Hadwiger counterexample or general graph census."
}
out = Path(__file__).resolve().parent / 'ROOTED_BARRIER_CERTIFICATE.json'
out.write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({k: v for k, v in report.items() if k not in ('edges', 'vertex_labels', 'four_coloring', 'K4_witness')}, indent=2))
