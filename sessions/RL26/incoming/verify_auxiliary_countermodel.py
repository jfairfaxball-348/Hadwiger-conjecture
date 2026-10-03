#!/usr/bin/env python3
"""Check the single desk-derived RL7 witness, not a graph/color/path census.

The all-colorings and all-bichromatic-path negative proof is in the report.
This script verifies its structural premises and the listed positive witnesses.
"""
import json
from itertools import combinations
from pathlib import Path


def edge(a, b):
    return frozenset((a, b))


def check_model(vertices, edges, branches, roots):
    used = set()
    for branch in branches:
        b = set(branch)
        assert len(b) == len(branch) and b and b <= vertices
        assert not (used & b) and b & roots
        used |= b
        reached = {next(iter(b))}
        while True:
            enlarged = reached | {
                x for x in b if any(edge(x, y) in edges for y in reached)
            }
            if enlarged == reached:
                break
            reached = enlarged
        assert reached == b, ("disconnected branch", branch)
    for left, right in combinations(branches, 2):
        assert any(edge(a, b) in edges for a in left for b in right)
    return len(branches) * (len(branches) - 1) // 2


def main():
    data = json.loads(Path(__file__).with_name("AUXILIARY_COUNTERMODEL.json").read_text())
    assert data["format"] == "rl7-cyclic-auxiliary-countermodel-v1"
    S, T = data["S_cycle"], data["T"]
    assert S == [f"u{i}" for i in range(7)]
    assert T == [f"t{i}" for i in range(5)]
    vertices = set(S + T)
    assert len(vertices) == 12
    cycle = {edge(S[i], S[(i + 1) % 7]) for i in range(7)}
    F = cycle | {
        edge(t, u) for t in T for u in data["F_T_neighbors"][t]
    }
    assert len(F) == 22 and all(len(e) == 2 and e <= vertices for e in F)
    assert all(len(data["F_T_neighbors"][t]) == 3 for t in T)
    assert not any(
        all(edge(a, b) in F for a, b in combinations(triple, 2))
        for triple in combinations(vertices, 3)
    ), "F must be triangle-free (alpha(H)<=2)"
    H = {edge(a, b) for a, b in combinations(vertices, 2)} - F
    assert len(H) == 44
    assert {edge(a, b) for a, b in combinations(S, 2)} - H == cycle
    assert all(edge(a, b) in H for a, b in combinations(T, 2))
    assert all(any(edge(a, b) not in H for b in vertices - {a}) for a in vertices)

    v = data["G_added_vertex"]
    assert v not in vertices
    G = H | {edge(v, u) for u in S}
    assert len(G) == 51
    rows = data["star_coloring_matching_rows"]
    assert len(rows) == 7 and [row["i"] for row in rows] == list(range(7))
    for row in rows:
        i = row["i"]
        pair = [S[i], S[(i + 1) % 7]]
        assert row["repeated_S"] == pair
        partners = row["T_partners"]
        assert len(partners) == 5 and set(partners) == set(S) - set(pair)
        classes = [pair] + [[t, u] for t, u in zip(T, partners)]
        assert all(edge(*c) in F for c in classes)
        cH = {a: color for color, c in enumerate(classes) for a in c}
        assert set(cH) == vertices and set(cH.values()) == set(range(6))
        assert all(cH[a] != cH[b] for a, b in map(tuple, H))
        merged = {v, *pair}
        w = f"w{i}"
        image = {a: w if a in merged else a for a in vertices | {v}}
        J = {edge(image[a], image[b]) for a, b in map(tuple, G) if image[a] != image[b]}
        J_vertices = set(image.values())
        assert len(J_vertices) == 11
        cJ = {w: 0} | {a: color for color, c in enumerate(classes[1:], 1) for a in c}
        assert set(cJ) == J_vertices and set(cJ.values()) == set(range(6))
        assert all(cJ[a] != cJ[b] for a, b in map(tuple, J))

    # Fixed positive paths only. No all-coloring or all-path search is performed.
    positive = data["uncolored_positive_paths"]
    omission = positive["omitted"]
    assert omission in rows[positive["star_i"]]["repeated_S"]
    R = set(S) - {omission}
    missing = {edge(a, b) for a, b in combinations(R, 2)} - H
    paths = positive["paths"]
    assert len(missing) == len(paths) == 5
    assert {edge(path[0], path[-1]) for path in paths} == missing
    interiors = set()
    for path in paths:
        assert len(path) == len(set(path)) and set(path) <= vertices
        assert all(edge(a, b) in H for a, b in zip(path, path[1:]))
        interior = set(path[1:-1])
        assert not (interior & R) and not (interior & interiors)
        interiors |= interior

    branches = data["rooted_K6_branches"]
    assert len(branches) == 6
    assert check_model(vertices, H, branches, set(S)) == 15
    assert check_model(vertices | {v}, G, branches + [[v]], set(S) | {v}) == 21
    assert len(vertices | {v}) > 7  # Exhibited K7 is proper: G is not C_7.
    print(json.dumps({
        "result": "PASS",
        "H_vertices": 12,
        "H_edges": 44,
        "F_triangle_free": True,
        "T_clique_size": 5,
        "no_universal_H_vertex": True,
        "listed_H_and_J_colorings_checked": 7,
        "listed_uncolored_paths_checked": 5,
        "rooted_K6_adjacencies_checked": 15,
        "G_K7_adjacencies_checked": 21,
        "scope": "one explicit graph and listed witnesses; all-coloring/path exclusion remains the analytic report's proof",
        "enumerated_arbitrary_graphs_colorings_paths": False
    }, indent=2))


if __name__ == "__main__":
    main()
