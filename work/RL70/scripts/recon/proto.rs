// RL70 rooted-search PROTOTYPE (std only). NON-AUTHORITATIVE scratch: exact K_t-minor test,
// 6-colourability, and random sampling of min-degree>=7 graphs.
// Build: rustc -O recon.rs -o recon.exe
use std::collections::HashSet;

const MAXN: usize = 32;

#[derive(Clone)]
struct G {
    n: usize,
    adj: [u32; MAXN],
}

impl G {
    fn new(n: usize) -> G {
        G { n, adj: [0; MAXN] }
    }
    fn add(&mut self, a: usize, b: usize) {
        if a != b {
            self.adj[a] |= 1 << b;
            self.adj[b] |= 1 << a;
        }
    }
    fn del(&mut self, a: usize, b: usize) {
        self.adj[a] &= !(1 << b);
        self.adj[b] &= !(1 << a);
    }
    fn has(&self, a: usize, b: usize) -> bool {
        self.adj[a] >> b & 1 == 1
    }
    fn deg(&self, a: usize) -> u32 {
        self.adj[a].count_ones()
    }
    fn m(&self) -> u32 {
        (0..self.n).map(|v| self.deg(v)).sum::<u32>() / 2
    }
    fn mindeg(&self) -> u32 {
        (0..self.n).map(|v| self.deg(v)).min().unwrap()
    }
}

// ---------- exact K_t minor test -------------------------------------------------
// State: current graph on "alive" super-vertices; each super-vertex = set of original
// vertices (bag mask). frozen = super-vertices declared singleton branch sets.
struct MinorSearch {
    t: u32,
    memo: HashSet<Vec<u32>>,
    nodes: u64,
    limit: u64,
    aborted: bool,
}

fn has_clique(adj: &[u32; MAXN], cand: u32, need: u32) -> bool {
    if need == 0 {
        return true;
    }
    if cand.count_ones() < need {
        return false;
    }
    let mut c = cand;
    while c != 0 {
        if c.count_ones() < need {
            return false;
        }
        let v = c.trailing_zeros() as usize;
        c &= c - 1;
        if has_clique(adj, c & adj[v], need - 1) {
            return true;
        }
    }
    false
}

impl MinorSearch {
    fn new(t: u32, limit: u64) -> Self {
        MinorSearch { t, memo: HashSet::new(), nodes: 0, limit, aborted: false }
    }

    // adj: adjacency among alive super-vertices; alive mask; frozen mask (subset of alive);
    // bag[i] = original-vertex mask of super-vertex i.
    fn rec(&mut self, adj: &mut [u32; MAXN], alive: u32, frozen: u32, bag: &mut [u32; MAXN]) -> bool {
        self.nodes += 1;
        if self.nodes > self.limit {
            self.aborted = true;
            return false;
        }
        let t = self.t;
        let cnt = alive.count_ones();
        if cnt < t {
            return false;
        }
        // edge count bound
        let mut e = 0u32;
        let mut a = alive;
        while a != 0 {
            let v = a.trailing_zeros() as usize;
            a &= a - 1;
            e += (adj[v] & alive).count_ones();
        }
        e /= 2;
        if e < t * (t - 1) / 2 {
            return false;
        }
        // frozen vertices must keep degree >= t-1
        let mut f = frozen;
        while f != 0 {
            let v = f.trailing_zeros() as usize;
            f &= f - 1;
            if (adj[v] & alive).count_ones() < t - 1 {
                return false;
            }
        }
        // success: a t-clique containing all frozen vertices?  (any t-clique suffices)
        // restrict to vertices of degree >= t-1
        let mut cand = 0u32;
        let mut a = alive;
        while a != 0 {
            let v = a.trailing_zeros() as usize;
            a &= a - 1;
            if (adj[v] & alive).count_ones() >= t - 1 {
                cand |= 1 << v;
            }
        }
        if has_clique(adj, cand, t) {
            return true;
        }
        let free = alive & !frozen;
        if free == 0 {
            return false;
        }
        // number of vertices that could be singleton bags or merged: need cnt >= t (checked)
        // memo
        let mut key: Vec<u32> = Vec::with_capacity(cnt as usize + 1);
        let mut a = free;
        while a != 0 {
            let v = a.trailing_zeros() as usize;
            a &= a - 1;
            key.push(bag[v]);
        }
        key.sort_unstable();
        let mut fm = 0u32;
        let mut f = frozen;
        while f != 0 {
            let v = f.trailing_zeros() as usize;
            f &= f - 1;
            fm |= bag[v];
        }
        key.push(fm);
        if self.memo.contains(&key) {
            return false;
        }
        // choose free vertex of minimum degree
        let mut best = usize::MAX;
        let mut bd = u32::MAX;
        let mut a = free;
        while a != 0 {
            let v = a.trailing_zeros() as usize;
            a &= a - 1;
            let d = (adj[v] & alive).count_ones();
            if d < bd {
                bd = d;
                best = v;
            }
        }
        let v = best;
        let nb = adj[v] & alive;
        let free_nb = nb & !frozen;
        // Branch 1: contract v into each free neighbour u
        let mut us = free_nb;
        // order: prefer neighbours with fewest common neighbours (keeps more edges)
        let mut order: Vec<(u32, usize)> = Vec::new();
        while us != 0 {
            let u = us.trailing_zeros() as usize;
            us &= us - 1;
            order.push(((adj[u] & nb).count_ones(), u));
        }
        order.sort_unstable();
        for &(_, u) in &order {
            // contract v into u
            let saved_adj = *adj;
            let saved_bag_u = bag[u];
            let nv = adj[v] & alive & !(1 << u);
            let mut x = nv;
            while x != 0 {
                let w = x.trailing_zeros() as usize;
                x &= x - 1;
                adj[w] |= 1 << u;
                adj[w] &= !(1 << v);
            }
            adj[u] |= nv;
            adj[u] &= !(1 << v);
            adj[u] &= !(1 << u);
            adj[v] = 0;
            bag[u] |= bag[v];
            let r = self.rec(adj, alive & !(1 << v), frozen, bag);
            *adj = saved_adj;
            bag[u] = saved_bag_u;
            if r {
                return true;
            }
            if self.aborted {
                return false;
            }
        }
        // Branch 2: freeze v as a singleton bag
        if bd >= t - 1 && frozen.count_ones() < t && (adj[v] & frozen) == frozen {
            if self.rec(adj, alive, frozen | (1 << v), bag) {
                return true;
            }
            if self.aborted {
                return false;
            }
        }
        // Branch 3: delete v, only needed if v has no free neighbour
        if free_nb == 0 {
            let saved_adj = *adj;
            let mut x = nb;
            while x != 0 {
                let w = x.trailing_zeros() as usize;
                x &= x - 1;
                adj[w] &= !(1 << v);
            }
            adj[v] = 0;
            let r = self.rec(adj, alive & !(1 << v), frozen, bag);
            *adj = saved_adj;
            if r {
                return true;
            }
            if self.aborted {
                return false;
            }
        }
        self.memo.insert(key);
        false
    }
}

// Some(true)/Some(false) exact; None if node limit hit.
fn has_kt_minor(g: &G, t: u32, limit: u64) -> (Option<bool>, u64) {
    let mut s = MinorSearch::new(t, limit);
    let mut adj = g.adj;
    let mut bag = [0u32; MAXN];
    for i in 0..g.n {
        bag[i] = 1 << i;
    }
    let alive = if g.n == 32 { u32::MAX } else { (1u32 << g.n) - 1 };
    let r = s.rec(&mut adj, alive, 0, &mut bag);
    if s.aborted {
        (None, s.nodes)
    } else {
        (Some(r), s.nodes)
    }
}

// ---------- k-colourability -------------------------------------------------------
fn colourable(g: &G, k: u32) -> bool {
    // DSATUR-style backtracking
    fn rec(g: &G, k: u32, col: &mut [u8; MAXN], used_max: u32, done: usize) -> bool {
        if done == g.n {
            return true;
        }
        // pick uncoloured vertex with most distinct neighbour colours
        let mut best = usize::MAX;
        let mut bs = -1i32;
        let mut bmask = 0u32;
        for v in 0..g.n {
            if col[v] != 255 {
                continue;
            }
            let mut mask = 0u32;
            let mut x = g.adj[v];
            while x != 0 {
                let w = x.trailing_zeros() as usize;
                x &= x - 1;
                if col[w] != 255 {
                    mask |= 1 << col[w];
                }
            }
            let s = (mask.count_ones() * 64 + g.deg(v)) as i32;
            if s > bs {
                bs = s;
                best = v;
                bmask = mask;
            }
        }
        let v = best;
        let lim = (used_max + 1).min(k);
        for c in 0..lim {
            if bmask >> c & 1 == 1 {
                continue;
            }
            col[v] = c as u8;
            let um = if c == used_max { used_max + 1 } else { used_max };
            if rec(g, k, col, um, done + 1) {
                return true;
            }
            col[v] = 255;
        }
        false
    }
    let mut col = [255u8; MAXN];
    rec(g, k, &mut col, 0, 0)
}

// ---------- rng ---------------------------------------------------------------------
struct Rng(u64);
impl Rng {
    fn next(&mut self) -> u64 {
        self.0 ^= self.0 << 13;
        self.0 ^= self.0 >> 7;
        self.0 ^= self.0 << 17;
        self.0
    }
    fn below(&mut self, n: usize) -> usize {
        (self.next() % n as u64) as usize
    }
}

fn icosahedron() -> G {
    // vertices: 0 top, 1..5 upper ring, 6..10 lower ring, 11 bottom
    let mut g = G::new(12);
    for i in 0..5 {
        g.add(0, 1 + i);
        g.add(11, 6 + i);
        g.add(1 + i, 1 + (i + 1) % 5);
        g.add(6 + i, 6 + (i + 1) % 5);
        g.add(1 + i, 6 + i);
        g.add(1 + i, 6 + (i + 1) % 5);
    }
    g
}

fn join_apex(g: &G, k: usize, clique: bool) -> G {
    let mut h = G::new(g.n + k);
    h.adj = g.adj;
    for a in 0..k {
        for v in 0..g.n {
            h.add(g.n + a, v);
        }
        if clique {
            for b in 0..a {
                h.add(g.n + a, g.n + b);
            }
        }
    }
    h
}

fn complete_multipartite(parts: &[usize]) -> G {
    let n: usize = parts.iter().sum();
    let mut g = G::new(n);
    let mut part = vec![0usize; n];
    let mut idx = 0;
    for (p, &s) in parts.iter().enumerate() {
        for _ in 0..s {
            part[idx] = p;
            idx += 1;
        }
    }
    for a in 0..n {
        for b in 0..a {
            if part[a] != part[b] {
                g.add(a, b);
            }
        }
    }
    g
}

// random graph with min degree >= d, built greedily then edge-minimalised
fn random_mindeg(n: usize, d: u32, rng: &mut Rng) -> G {
    let mut g = G::new(n);
    loop {
        let low: Vec<usize> = (0..n).filter(|&v| g.deg(v) < d).collect();
        if low.is_empty() {
            break;
        }
        let v = low[rng.below(low.len())];
        // prefer a low-degree non-neighbour
        let mut cands: Vec<usize> = (0..n).filter(|&u| u != v && !g.has(u, v) && g.deg(u) < d).collect();
        if cands.is_empty() {
            cands = (0..n).filter(|&u| u != v && !g.has(u, v)).collect();
        }
        let u = cands[rng.below(cands.len())];
        g.add(u, v);
    }
    // random switches to mix
    for _ in 0..200 {
        let a = rng.below(n);
        let b = rng.below(n);
        let c = rng.below(n);
        let e = rng.below(n);
        if a == b || c == e || a == c || a == e || b == c || b == e {
            continue;
        }
        if g.has(a, b) && g.has(c, e) && !g.has(a, c) && !g.has(b, e) {
            g.del(a, b);
            g.del(c, e);
            g.add(a, c);
            g.add(b, e);
        }
    }
    // edge-minimalise: remove edges whose both ends have degree > d
    let mut edges: Vec<(usize, usize)> = Vec::new();
    for a in 0..n {
        for b in 0..a {
            if g.has(a, b) {
                edges.push((a, b));
            }
        }
    }
    for i in (1..edges.len()).rev() {
        let j = rng.below(i + 1);
        edges.swap(i, j);
    }
    for &(a, b) in &edges {
        if g.deg(a) > d && g.deg(b) > d {
            g.del(a, b);
        }
    }
    g
}

fn g6(g: &G) -> String {
    let mut s = String::new();
    s.push((g.n as u8 + 63) as char);
    let mut bits: Vec<u8> = Vec::new();
    for j in 1..g.n {
        for i in 0..j {
            bits.push(if g.has(i, j) { 1 } else { 0 });
        }
    }
    while bits.len() % 6 != 0 {
        bits.push(0);
    }
    for ch in bits.chunks(6) {
        let mut x = 0u8;
        for &b in ch {
            x = x << 1 | b;
        }
        s.push((x + 63) as char);
    }
    s
}


// ---------- rooted exhaustive search prototype ---------------------------------------
// Target: all edge-minimal min-degree>=7 graphs on n vertices with no K7 minor.
// Layout: vertex 0 = root v (degree exactly 7), 1..=7 = N(v), 8.. = R.
fn perms7() -> Vec<[usize; 7]> {
    let mut out = Vec::new();
    let mut p = [0usize, 1, 2, 3, 4, 5, 6];
    fn heap(k: usize, p: &mut [usize; 7], out: &mut Vec<[usize; 7]>) {
        if k == 1 {
            out.push(*p);
            return;
        }
        for i in 0..k {
            heap(k - 1, p, out);
            if k % 2 == 0 {
                p.swap(i, k - 1);
            } else {
                p.swap(0, k - 1);
            }
        }
    }
    heap(7, &mut p, &mut out);
    out
}
fn eidx(a: usize, b: usize) -> usize {
    let (a, b) = if a < b { (a, b) } else { (b, a) };
    b * (b - 1) / 2 + a
}
fn perm_mask(mask: u32, p: &[usize; 7]) -> u32 {
    let mut r = 0u32;
    for b in 1..7 {
        for a in 0..b {
            if mask >> eidx(a, b) & 1 == 1 {
                r |= 1 << eidx(p[a], p[b]);
            }
        }
    }
    r
}
fn perm_pat(pat: u32, p: &[usize; 7]) -> u32 {
    let mut r = 0u32;
    for a in 0..7 {
        if pat >> a & 1 == 1 {
            r |= 1 << p[a];
        }
    }
    r
}

struct Search {
    n: usize,
    m: usize,
    nodes: u64,
    minor_tests: u64,
    minor_neg: u64,
    sols: Vec<G>,
    auts: Vec<[usize; 7]>,
    use_edge_min: bool,
}

impl Search {
    fn rec(&mut self, g: &mut G, i: usize, prev: u32) {
        // i = number of R vertices already placed
        self.nodes += 1;
        let m = self.m;
        if i == m {
            self.sols.push(g.clone());
            return;
        }
        let x = 8 + i; // new vertex index
        let rem_after = (m - i - 1) as u32;
        for p in (0..=prev).rev() {
            let pc = p.count_ones();
            if pc + i as u32 + rem_after < 7 {
                continue;
            }
            if i == 0 {
                // orbit-maximal under Aut(H)
                let mut ok = true;
                for a in &self.auts {
                    if perm_pat(p, a) > p {
                        ok = false;
                        break;
                    }
                }
                if !ok {
                    continue;
                }
            }
            for q in 0..(1u32 << i) {
                if pc + q.count_ones() + rem_after < 7 {
                    continue;
                }
                // add row
                let nb = (p << 1) | (q << 8);
                g.adj[x] = nb;
                let mut y = nb;
                while y != 0 {
                    let w = y.trailing_zeros() as usize;
                    y &= y - 1;
                    g.adj[w] |= 1 << x;
                }
                g.n = x + 1;
                let mut ok = true;
                // degree feasibility
                for w in 1..=x {
                    if g.deg(w) + rem_after < 7 {
                        ok = false;
                        break;
                    }
                }
                // edge-minimality: no edge with both ends of degree >= 8
                if ok && self.use_edge_min {
                    let mut big = 0u32;
                    for w in 0..=x {
                        if g.deg(w) >= 8 {
                            big |= 1 << w;
                        }
                    }
                    let mut b = big;
                    while b != 0 {
                        let w = b.trailing_zeros() as usize;
                        b &= b - 1;
                        if g.adj[w] & big != 0 {
                            ok = false;
                            break;
                        }
                    }
                }
                if ok {
                    self.minor_tests += 1;
                    let (r, _) = has_kt_minor(g, 7, u64::MAX);
                    if r == Some(true) {
                        ok = false;
                    } else {
                        self.minor_neg += 1;
                    }
                }
                if ok {
                    self.rec(g, i + 1, p);
                }
                // remove row
                let mut y = nb;
                while y != 0 {
                    let w = y.trailing_zeros() as usize;
                    y &= y - 1;
                    g.adj[w] &= !(1 << x);
                }
                g.adj[x] = 0;
                g.n = x;
            }
        }
    }
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let n: usize = args[1].parse().unwrap();
    let use_edge_min = args.get(2).map(|s| s != "noem").unwrap_or(true);
    let m = n - 8;
    let perms = perms7();
    // iso classes of 7-vertex graphs: smallest mask in each orbit
    let mut seen = vec![false; 1 << 21];
    let mut reps: Vec<u32> = Vec::new();
    for mask in 0u32..(1 << 21) {
        if seen[mask as usize] {
            continue;
        }
        reps.push(mask);
        for p in &perms {
            seen[perm_mask(mask, p) as usize] = true;
        }
    }
    eprintln!("7-vertex iso classes: {}", reps.len());
    let mut total_nodes = 0u64;
    let mut total_sols = 0usize;
    let mut tests = 0u64;
    let mut negs = 0u64;
    let t0 = std::time::Instant::now();
    for (hi, &mask) in reps.iter().enumerate() {
        let mut g = G::new(8);
        for a in 1..=7 {
            g.add(0, a);
        }
        let mut mind = 7u32;
        for b in 1..7 {
            for a in 0..b {
                if mask >> eidx(a, b) & 1 == 1 {
                    g.add(a + 1, b + 1);
                }
            }
        }
        for a in 1..=7 {
            mind = mind.min(g.deg(a));
        }
        if mind + (m as u32) < 7 {
            continue;
        }
        if has_kt_minor(&g, 7, u64::MAX).0 == Some(true) {
            continue;
        }
        let auts: Vec<[usize; 7]> = perms.iter().filter(|p| perm_mask(mask, p) == mask).cloned().collect();
        let mut s = Search { n, m, nodes: 0, minor_tests: 0, minor_neg: 0, sols: Vec::new(), auts, use_edge_min };
        s.rec(&mut g, 0, 127);
        total_nodes += s.nodes;
        tests += s.minor_tests;
        negs += s.minor_neg;
        total_sols += s.sols.len();
        for h in &s.sols {
            println!("SOL H#{} mask={} m={} g6={} 6col={}", hi, mask, h.m(), g6(h), colourable(h, 6));
        }
        if s.nodes > 2_000_000 || !s.sols.is_empty() {
            eprintln!("H#{} mask={:#x} e(H)={} aut={} nodes={} tests={} neg={} sols={} t={:?}", hi, mask, mask.count_ones(), s.auts.len(), s.nodes, s.minor_tests, s.minor_neg, s.sols.len(), t0.elapsed());
        }
        let _ = s.n;
    }
    eprintln!("n={} total nodes={} minor tests={} negatives={} solutions(with duplicates)={} time={:?}", n, total_nodes, tests, negs, total_sols, t0.elapsed());
}
