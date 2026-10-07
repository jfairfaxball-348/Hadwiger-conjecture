// RL70 closure tool: from the edge-minimal K7-minor-free graphs with min degree >= 7 on n
// vertices (graph6 lines on stdin; lines may repeat and may be prefixed, the graph6 token is
// taken after "g6=" if present) compute ALL K7-minor-free graphs with min degree >= 7 on n
// vertices (Lemma E: add one edge at a time while K7-minor-free), up to isomorphism, and test
// each for 6-colourability and for the lock conditions of Lemma L.
//
// Build: rustc -O closure.rs -o closure.exe   (needs core.rs alongside)
// Usage: closure.exe < solutions.txt
#![allow(dead_code)]
include!("core.rs");

// ---- canonical form: colour refinement + individualisation with twin pruning ---------------
fn refine(g: &G, col: &mut [u8; MAXN]) -> usize {
    let n = g.n;
    let mut ncol = {
        let mut seen = [false; MAXN + 1];
        let mut c = 0;
        for v in 0..n {
            if !seen[col[v] as usize] {
                seen[col[v] as usize] = true;
                c += 1;
            }
        }
        c
    };
    loop {
        let mut sigs: Vec<([u8; MAXN + 1], usize)> = Vec::with_capacity(n);
        for v in 0..n {
            let mut s = [0u8; MAXN + 1];
            s[0] = col[v];
            let mut x = g.adj[v];
            while x != 0 {
                let w = x.trailing_zeros() as usize;
                x &= x - 1;
                s[1 + col[w] as usize] += 1;
            }
            sigs.push((s, v));
        }
        sigs.sort_unstable();
        let mut newc = 0u8;
        let mut new_col = [0u8; MAXN];
        for i in 0..n {
            if i > 0 && sigs[i].0 != sigs[i - 1].0 {
                newc += 1;
            }
            new_col[sigs[i].1] = newc;
        }
        let cnt = newc as usize + 1;
        *col = new_col;
        if cnt == ncol {
            return cnt;
        }
        ncol = cnt;
    }
}
fn canon_rec(g: &G, col: &mut [u8; MAXN], best: &mut Option<Vec<u32>>) {
    let n = g.n;
    let ncol = refine(g, col);
    if ncol == n {
        let mut rows = vec![0u32; n];
        for v in 0..n {
            let mut r = 0u32;
            let mut x = g.adj[v];
            while x != 0 {
                let w = x.trailing_zeros() as usize;
                x &= x - 1;
                r |= 1 << col[w];
            }
            rows[col[v] as usize] = r;
        }
        match best {
            Some(b) if *b <= rows => {}
            _ => *best = Some(rows),
        }
        return;
    }
    let mut size = [0u8; MAXN + 1];
    for v in 0..n {
        size[col[v] as usize] += 1;
    }
    let c = (0..ncol).find(|&c| size[c] > 1).unwrap() as u8;
    let members: Vec<usize> = (0..n).filter(|&v| col[v] == c).collect();
    let mut tried: Vec<usize> = Vec::new();
    for &u in &members {
        if tried.iter().any(|&t| (g.adj[u] & !(1 << t)) == (g.adj[t] & !(1 << u))) {
            continue; // twin of a tried vertex: swapping twins is an automorphism
        }
        tried.push(u);
        let mut c2 = *col;
        for w in 0..n {
            if c2[w] > c || (c2[w] == c && w != u) {
                c2[w] += 1;
            }
        }
        canon_rec(g, &mut c2, best);
    }
}
fn canon(g: &G) -> G {
    let mut col = [0u8; MAXN];
    let mut best = None;
    canon_rec(g, &mut col, &mut best);
    let rows = best.unwrap();
    let mut h = G::new(g.n);
    for i in 0..g.n {
        h.adj[i] = rows[i];
    }
    h
}

fn from_g6(s: &str) -> G {
    let b = s.as_bytes();
    let n = (b[0] - 63) as usize;
    let mut g = G::new(n);
    let mut bit = 0;
    for j in 1..n {
        for i in 0..j {
            let byte = b[1 + bit / 6] - 63;
            if byte >> (5 - bit % 6) & 1 == 1 {
                g.add(i, j);
            }
            bit += 1;
        }
    }
    g
}

// Lemma L conditions
fn locked(g: &G) -> bool {
    let n = g.n;
    let seven: u32 = (0..n).filter(|&v| g.deg(v) == 7).fold(0, |m, v| m | 1 << v);
    for v in 0..n {
        if g.adj[v] & seven == 0 {
            return false;
        }
    }
    for u in 0..n {
        for v in 0..u {
            if !g.has(u, v) {
                continue;
            }
            let common = g.adj[u] & g.adj[v] & seven;
            let twins = g.deg(u) == 7 && g.deg(v) == 7 && (g.adj[u] | 1 << u) == (g.adj[v] | 1 << v);
            if common == 0 && !twins {
                return false;
            }
        }
    }
    true
}

fn main() {
    let mut line = String::new();
    let mut minimal: HashSet<G> = HashSet::new();
    let mut read = 0;
    while std::io::stdin().read_line(&mut line).unwrap() > 0 {
        let s = line.trim().to_string();
        line.clear();
        if s.is_empty() {
            continue;
        }
        let tok = match s.find("g6=") {
            Some(i) => s[i + 3..].split_whitespace().next().unwrap().to_string(),
            None => s.split_whitespace().next().unwrap().to_string(),
        };
        let g = from_g6(&tok);
        read += 1;
        assert!((0..g.n).all(|v| g.deg(v) >= 7), "input graph with a vertex of degree < 7");
        assert!(has_kt_minor(&g, 7, u64::MAX).0 == Some(false), "input graph has a K7 minor");
        minimal.insert(canon(&g));
    }
    let mut minv: Vec<G> = minimal.iter().cloned().collect();
    minv.sort_by(|a, b| (a.m(), a.adj).cmp(&(b.m(), b.adj)));
    println!("INPUT lines={} distinct isomorphism classes={}", read, minv.len());
    for g in &minv {
        let mut ds: Vec<u32> = (0..g.n).map(|v| g.deg(v)).collect();
        ds.sort();
        println!("MINIMAL n={} m={} g6={} degs={:?}", g.n, g.m(), g6(g), ds);
    }
    let mut all: HashSet<G> = minimal.clone();
    let mut frontier: Vec<G> = minv.clone();
    while !frontier.is_empty() {
        let mut nxt: Vec<G> = Vec::new();
        for g in &frontier {
            for a in 0..g.n {
                for b in 0..a {
                    if g.has(a, b) {
                        continue;
                    }
                    let mut h = g.clone();
                    h.add(a, b);
                    let c = canon(&h);
                    if all.contains(&c) {
                        continue;
                    }
                    if has_kt_minor(&c, 7, u64::MAX).0 == Some(false) {
                        all.insert(c.clone());
                        nxt.push(c);
                    }
                }
            }
        }
        frontier = nxt;
    }
    let mut allv: Vec<G> = all.into_iter().collect();
    allv.sort_by(|a, b| (a.m(), a.adj).cmp(&(b.m(), b.adj)));
    let mut bad = 0;
    for g in &allv {
        let c6 = colourable(g, 6);
        let c5 = colourable(g, 5);
        if !c6 {
            bad += 1;
        }
        let mut ds: Vec<u32> = (0..g.n).map(|v| g.deg(v)).collect();
        ds.sort();
        println!("ALL n={} m={} g6={} 6col={} 5col={} locked={} degs={:?}", g.n, g.m(), g6(g), c6, c5, locked(g), ds);
    }
    println!("CLOSURE total K7-minor-free graphs with mindeg>=7: {}  not-6-colourable: {}", allv.len(), bad);
}
