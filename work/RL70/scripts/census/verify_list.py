"""RL70 independent check of a list of graphs (graph6 after 'g6=' or first token of each line).

For every graph this script verifies, with networkx only (no shared code with the Rust tools):
  * minimum degree >= 7;
  * K7-minor-freeness by a CERTIFICATE: two vertices a, b such that G - {a, b} is planar
    (a K7 minor of G would leave a K5 minor in G - {a, b}; planar graphs have none);
  * 6-colourability by an explicit proper 6-colouring found by backtracking;
  * 5-colourability status (exhaustive backtracking), for information.
Usage: python verify_list.py file.txt
"""
import sys
import itertools
import networkx as nx


def read(path):
    seen = []
    for line in open(path):
        s = line.strip()
        if not s:
            continue
        tok = s.split("g6=")[1].split()[0] if "g6=" in s else s.split()[0]
        if tok not in seen:
            seen.append(tok)
    return seen


def colouring(G, k):
    order = sorted(G.nodes(), key=lambda v: -G.degree(v))
    col = {}

    def rec(i, used):
        if i == len(order):
            return True
        v = order[i]
        forb = {col[u] for u in G[v] if u in col}
        for c in range(min(used + 1, k)):
            if c in forb:
                continue
            col[v] = c
            if rec(i + 1, max(used, c + 1)):
                return True
            del col[v]
        return False

    return dict(col) if rec(0, 0) else None


def two_apex_certificate(G):
    for a, b in itertools.combinations(G.nodes(), 2):
        H = G.copy()
        H.remove_nodes_from([a, b])
        if nx.check_planarity(H)[0]:
            return (a, b)
    return None


def main():
    ok_all = True
    toks = read(sys.argv[1])
    for tok in toks:
        G = nx.from_graph6_bytes(tok.encode())
        n, m = G.number_of_nodes(), G.number_of_edges()
        dmin = min(d for _, d in G.degree())
        apex = two_apex_certificate(G)
        c6 = colouring(G, 6)
        c5 = colouring(G, 5)
        proper = c6 is not None and all(c6[u] != c6[v] for u, v in G.edges())
        ok = dmin >= 7 and apex is not None and proper
        ok_all &= ok
        print(f"{tok} n={n} m={m} mindeg={dmin} two_apex_planar_certificate={apex} "
              f"6-colouring={'found+verified' if proper else 'NONE'} 5-colourable={c5 is not None} OK={ok}")
    print(f"VERIFY graphs={len(toks)} all_ok={ok_all}")


if __name__ == "__main__":
    main()
