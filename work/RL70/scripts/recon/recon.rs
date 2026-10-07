// RL70 recon tool (std only). NON-AUTHORITATIVE scratch: exact K_t-minor test,
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

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let mode = args.get(1).map(|s| s.as_str()).unwrap_or("sanity");
    if mode == "sanity" {
        let ico = icosahedron();
        println!("icosahedron n={} m={} K5minor={:?} 4col={} 3col={}", ico.n, ico.m(), has_kt_minor(&ico, 5, 1 << 40), colourable(&ico, 4), colourable(&ico, 3));
        let a1 = join_apex(&ico, 1, true);
        println!("K1+ico n={} m={} K6minor={:?} K5minor={:?}", a1.n, a1.m(), has_kt_minor(&a1, 6, 1 << 40), has_kt_minor(&a1, 5, 1 << 40));
        let a2 = join_apex(&ico, 2, true);
        println!("K2+ico n={} m={} mindeg={} K7minor={:?} K6minor={:?} 6col={} 5col={}", a2.n, a2.m(), a2.mindeg(), has_kt_minor(&a2, 7, 1 << 40), has_kt_minor(&a2, 6, 1 << 40), colourable(&a2, 6), colourable(&a2, 5));
        let a3 = join_apex(&ico, 3, true);
        println!("K3+ico K8minor={:?} K7minor={:?}", has_kt_minor(&a3, 8, 1 << 40), has_kt_minor(&a3, 7, 1 << 40));
        let k = complete_multipartite(&[2, 2, 2, 2, 2]);
        println!("K_2x5 m={} K7minor={:?} K8minor={:?} 5col={} 4col={}", k.m(), has_kt_minor(&k, 7, 1 << 40), has_kt_minor(&k, 8, 1 << 40), colourable(&k, 5), colourable(&k, 4));
        let k = complete_multipartite(&[2, 2, 2, 2]);
        println!("K_2x4 m={} K6minor={:?} K7minor={:?}", k.m(), has_kt_minor(&k, 6, 1 << 40), has_kt_minor(&k, 7, 1 << 40));
        let k5 = join_apex(&G::new(8), 5, true);
        println!("K5+8K1 m={} K7minor={:?} K6minor={:?}", k5.m(), has_kt_minor(&k5, 7, 1 << 40), has_kt_minor(&k5, 6, 1 << 40));
        let k = complete_multipartite(&[3, 3, 3, 3]);
        println!("K_3x4 m={} K7minor={:?} K8minor={:?}", k.m(), has_kt_minor(&k, 7, 1 << 40), has_kt_minor(&k, 8, 1 << 40));
        return;
    }
    if mode == "sample" {
        let n: usize = args[2].parse().unwrap();
        let trials: u64 = args[3].parse().unwrap();
        let seed: u64 = args.get(4).map(|s| s.parse().unwrap()).unwrap_or(88172645463325252);
        let mut rng = Rng(seed);
        let mut free = 0u64;
        let mut unknown = 0u64;
        let mut maxnodes = 0u64;
        let mut hist = std::collections::BTreeMap::new();
        for _ in 0..trials {
            let g = random_mindeg(n, 7, &mut rng);
            *hist.entry(g.m()).or_insert(0u64) += 1;
            let (r, nodes) = has_kt_minor(&g, 7, 50_000_000);
            maxnodes = maxnodes.max(nodes);
            match r {
                Some(true) => {}
                Some(false) => {
                    free += 1;
                    println!("K7-MINOR-FREE mindeg>=7 graph: n={} m={} g6={} 6col={}", n, g.m(), g6(&g), colourable(&g, 6));
                }
                None => {
                    unknown += 1;
                    println!("UNKNOWN (limit) g6={}", g6(&g));
                }
            }
        }
        println!("n={} trials={} K7-minor-free={} unknown={} maxnodes={} edge-hist={:?}", n, trials, free, unknown, maxnodes, hist);
    }
}
