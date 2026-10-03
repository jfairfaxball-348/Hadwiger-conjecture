#!/usr/bin/env python3
"""Check one explicit RL8 core/witness; no graph, coloring or path census.

Universal claims are proved in RL8_UNCOLORED_ROUTING_REPORT.md. This checker
validates the fixed premises, supplied star colorings, capacity obstruction,
five paths and simultaneous positive models. All finite bounds are in
WORK_UNIT_SCOPE.md, written before this checker was executed.
"""
import json
from itertools import combinations
from pathlib import Path


def edge(a, b):
    return frozenset((a, b))


def check_model(vertices, edges, branches, roots):
    used = set()
    witnesses = []
    for branch in branches:
        b = set(branch)
        assert b and len(b) == len(branch) and b <= vertices
        assert not (used & b) and b & roots
        used |= b
        reached = {next(iter(b))}
        while True:
            expanded = reached | {
                a for a in b if any(edge(a, z) in edges for z in reached)
            }
            if expanded == reached:
                break
            reached = expanded
        assert reached == b, ("disconnected branch", branch)
    for i, j in combinations(range(len(branches)), 2):
        pairs = [
            [a, b] for a in branches[i] for b in branches[j]
            if edge(a, b) in edges
        ]
        assert pairs, ("missing adjacency", i, j)
        witnesses.append({"branches": [i, j], "edge": pairs[0]})
    return witnesses


def main():
    data = json.loads(Path(__file__).with_name("UNCOLORED_CORE_WITNESS.json").read_text())
    assert data["format"] == "rl8-uncolored-core-witness-v1"
    S, T = data["S_cycle"], data["T"]
    assert S == [f"u{i}" for i in range(7)]
    assert T == [f"t{i}" for i in range(5)]
    types = data["helper_types"]
    assert types == [0, 0, 1, 1, 4]
    vertices = set(S + T)
    assert len(vertices) == 12
    cycle = {edge(S[i], S[(i + 1) % 7]) for i in range(7)}
    F = cycle | {
        edge(t, S[(k + offset) % 7])
        for t, k in zip(T, types) for offset in (2, 4, 6)
    }
    assert len(F) == 22
    triples = list(combinations(S + T, 3))
    assert len(triples) == 220
    assert not any(
        all(edge(a, b) in F for a, b in combinations(triple, 2))
        for triple in triples
    )
    H = {edge(a, b) for a, b in combinations(S + T, 2)} - F
    assert len(H) == 44
    assert all(edge(a, b) in H for a, b in combinations(T, 2))
    assert {edge(a, b) for a, b in combinations(S, 2)} - H == cycle

    rows = data["star_matching_rows"]
    assert len(rows) == 7 and [row["i"] for row in rows] == list(range(7))
    v = "v"
    G = H | {edge(v, u) for u in S}
    for row in rows:
        i = row["i"]
        pair = [S[i], S[(i + 1) % 7]]
        partners = row["T_partners"]
        assert len(partners) == 5 and set(partners) == set(S) - set(pair)
        classes = [pair] + [[t, u] for t, u in zip(T, partners)]
        assert all(edge(*group) in F for group in classes)
        colors = {a: k for k, group in enumerate(classes) for a in group}
        assert set(colors) == vertices and set(colors.values()) == set(range(6))
        assert all(colors[a] != colors[b] for a, b in map(tuple, H))
        w = f"w{i}"
        image = {a: w if a in {v, *pair} else a for a in vertices | {v}}
        J = {
            edge(image[a], image[b]) for a, b in map(tuple, G)
            if image[a] != image[b]
        }
        cJ = {w: 0} | {
            a: k for k, group in enumerate(classes[1:], 1) for a in group
        }
        assert set(cJ) == set(image.values()) and len(cJ) == 11
        assert all(cJ[a] != cJ[b] for a, b in map(tuple, J))

    # Exactly seven common-helper sets of this ONE graph, not path search.
    common = {
        i: [t for t in T if edge(S[i], t) in H and edge(t, S[(i + 1) % 7]) in H]
        for i in range(7)
    }
    assert {i for i, ts in common.items() if ts} == {0, 1, 4}
    assert sum(bool(ts) for ts in common.values()) + 1 == 4 < 5

    positive = data["UP6_witness"]
    omit = positive["omitted"]
    i = positive["star_i"]
    assert omit in {S[i], S[(i + 1) % 7]}
    R = set(S) - {omit}
    missing = {edge(a, b) for a, b in combinations(sorted(R), 2)} - H
    paths = positive["paths"]
    assert len(paths) == len(missing) == 5
    assert {edge(p[0], p[-1]) for p in paths} == missing
    internal = set()
    for path in paths:
        assert 2 <= len(path) - 1 <= 3
        assert len(set(path)) == len(path) and set(path) <= vertices
        assert all(edge(a, b) in H for a, b in zip(path, path[1:]))
        interior = set(path[1:-1])
        assert not (interior & R) and not (interior & internal)
        internal |= interior
    assert sum(omit in p[1:-1] for p in paths) == 1
    assert internal == set(T) | {omit}
    branches = data["rooted_K6_branches"]
    assert len(branches) == 6
    assert all(len(set(branch) & R) == 1 for branch in branches)
    model6 = check_model(vertices, H, branches, set(S))
    assert len(model6) == 15
    model7 = check_model(vertices | {v}, G, branches + [[v]], set(S) | {v})
    assert len(model7) == 21 and len(vertices | {v}) > 7
    print(json.dumps({
        "result": "PASS",
        "H_vertices": 12,
        "H_edges": 44,
        "triples_checked": 220,
        "seven_supplied_star_colorings_checked": 7,
        "helper_capacity_edge_types": [0, 1, 4],
        "all_two_edge_routing_capacity_upper_bound": 4,
        "supplied_UP6_path_edge_lengths": [len(p) - 1 for p in paths],
        "omitted_root_internal_uses": 1,
        "rooted_K6_adjacencies": model6,
        "G_K7_adjacency_count": len(model7),
        "scope": "one fixed graph and supplied witnesses; universal proofs are analytic",
        "graph_coloring_or_path_search": False
    }, indent=2))


if __name__ == "__main__":
    main()
