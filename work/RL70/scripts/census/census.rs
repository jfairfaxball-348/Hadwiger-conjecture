// RL70 census tool A (std only).
//
// Enumerates, up to isomorphism, every graph G on n vertices such that
//   (1) minimum degree >= 7,
//   (2) G is edge-minimal for (1): every edge has an end of degree exactly 7,
//   (3) G has no K7 minor.
// Then (mode "closure") closes the list upward: all K7-minor-free graphs with
// minimum degree >= 7 on n vertices are obtained by adding edges to graphs of the list.
//
// Method A ("rooted level search with isomorph rejection by canonical form"):
//   An edge-minimal graph with min degree >= 7 and at least one edge has a vertex v of
//   degree exactly 7.  Put v = vertex 0, N(v) = vertices 1..7, R = the other n-8 vertices.
//   Level i holds all pairwise non-isomorphic (as rooted graphs) induced subgraphs
//   P = G[{v} u N(v) u R_i], |R_i| = i, that pass the hereditary filters
//      (a) P has no K7 minor,
//      (b) every vertex w != v can still reach degree 7: deg_P(w) + (n - |P|) >= 7,
//      (c) no edge of P has both ends of degree >= 8 in P,
//      (d) deg_P(v) = 7.
//   Every induced subgraph (containing N[v]) of a target graph passes (a)-(d), so extending
//   every member of level i by one new vertex in all admissible ways and reducing modulo
//   rooted isomorphism yields a level i+1 that contains every admissible P on 9+i vertices.
//
// Build:  rustc -O census.rs -o census.exe
// Usage:  census.exe <n> <threads> [closure]

use std::collections::HashSet;
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::Mutex;

const MAXN: usize = 24;
type Adj = [u32; MAXN];

static MINOR_CALLS: AtomicU64 = AtomicU64::new(0);
static MINOR_EXACT_NEG: AtomicU64 = AtomicU64::new(0);

#[derive(Clone, PartialEq, Eq, Hash)]
struct G {
    n: usize,
    adj: Adj,
}

impl G {
    fn new(n: usize) -> G {
        G { n, adj: [0; MAXN] }
    }
    fn add(&mut self, a: usize, b: usize) {
        self.adj[a] |= 1 << b;
        self.adj[b] |= 1 << a;
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
}

// ------------------------------------------------------------------------------------
// Exact K_t-minor test (contraction search).
// Completeness argument: let v be a non-frozen vertex of the current graph and suppose a
// K_t model exists in which the frozen vertices are singleton bags.
//   * v lies in a bag with >= 2 vertices: some neighbour u of v lies in the same bag, u is
//     not frozen, and contracting vu keeps a model.
//   * v is a singleton bag: "freeze v" keeps the model (needs deg >= t-1 and adjacency to
//     all frozen vertices).
//   * v lies in no bag: if v has a non-frozen neighbour u, G/vu contains G-v, so the
//     contraction branch keeps the model; otherwise the explicit deletion branch does.
// Success is declared only when the current graph (a minor of the input) contains K_t.
// ------------------------------------------------------------------------------------
fn has_clique(adj: &Adj, cand: u32, need: u32) -> bool {
    if need == 0 {
        return true;
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

struct MinorSearch {
    t: u32,
    memo: HashSet<Vec<u32>>,
    nodes: u64,
    limit: u64,
    aborted: bool,
}

impl MinorSearch {
    fn rec(&mut self, adj: &mut Adj, alive: u32, frozen: u32, bag: &mut [u32; MAXN]) -> bool {
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
        let mut e = 0u32;
        let mut cand = 0u32;
        let mut a = alive;
        while a != 0 {
            let v = a.trailing_zeros() as usize;
            a &= a - 1;
            let d = (adj[v] & alive).count_ones();
            e += d;
            if d >= t - 1 {
                cand |= 1 << v;
            }
        }
        e /= 2;
        if e < t * (t - 1) / 2 {
            return false;
        }
        if frozen & !cand != 0 {
            return false; // a frozen singleton bag has fallen below degree t-1
        }
        if has_clique(adj, cand, t) {
            return true;
        }
        let free = alive & !frozen;
        if free == 0 {
            return false;
        }
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
        // free vertex of minimum degree
        let mut v = usize::MAX;
        let mut bd = u32::MAX;
        let mut a = free;
        while a != 0 {
            let w = a.trailing_zeros() as usize;
            a &= a - 1;
            let d = (adj[w] & alive).count_ones();
            if d < bd {
                bd = d;
                v = w;
            }
        }
        let nb = adj[v] & alive;
        let free_nb = nb & !frozen;
        let mut order: Vec<(u32, usize)> = Vec::new();
        let mut us = free_nb;
        while us != 0 {
            let u = us.trailing_zeros() as usize;
            us &= us - 1;
            order.push(((adj[u] & nb).count_ones(), u));
        }
        order.sort_unstable();
        for &(_, u) in &order {
            let saved = *adj;
            let saved_bag = bag[u];
            let nv = nb & !(1 << u);
            let mut x = nv;
            while x != 0 {
                let w = x.trailing_zeros() as usize;
                x &= x - 1;
                adj[w] |= 1 << u;
                adj[w] &= !(1 << v);
            }
            adj[u] |= nv;
            adj[u] &= !(1 << v);
            adj[v] = 0;
            bag[u] |= bag[v];
            let r = self.rec(adj, alive & !(1 << v), frozen, bag);
            *adj = saved;
            bag[u] = saved_bag;
            if r {
                return true;
            }
            if self.aborted {
                return false;
            }
        }
        if bd >= t - 1 && frozen.count_ones() < t && (adj[v] & frozen) == frozen {
            if self.rec(adj, alive, frozen | (1 << v), bag) {
                return true;
            }
            if self.aborted {
                return false;
            }
        }
        if free_nb == 0 {
            let saved = *adj;
            let mut x = nb;
            while x != 0 {
                let w = x.trailing_zeros() as usize;
                x &= x - 1;
                adj[w] &= !(1 << v);
            }
            adj[v] = 0;
            let r = self.rec(adj, alive & !(1 << v), frozen, bag);
            *adj = saved;
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

// Some(true) / Some(false) are exact answers; None = node limit reached.
fn kt_minor(g: &G, t: u32, limit: u64) -> Option<bool> {
    MINOR_CALLS.fetch_add(1, Ordering::Relaxed);
    let mut s = MinorSearch { t, memo: HashSet::new(), nodes: 0, limit, aborted: false };
    let mut adj = g.adj;
    let mut bag = [0u32; MAXN];
    for i in 0..g.n {
        bag[i] = 1 << i;
    }
    let alive = (1u32 << g.n) - 1;
    let r = s.rec(&mut adj, alive, 0, &mut bag);
    if s.aborted {
        None
    } else {
        if !r {
            MINOR_EXACT_NEG.fetch_add(1, Ordering::Relaxed);
        }
        Some(r)
    }
}

// ------------------------------------------------------------------------------------
// Canonical form by colour refinement + individualisation (twin pruning only).
// init colours must be an isomorphism-invariant initial partition.
// ------------------------------------------------------------------------------------
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
    // first non-singleton cell
    let mut size = [0u8; MAXN + 1];
    for v in 0..n {
        size[col[v] as usize] += 1;
    }
    let c = (0..ncol).find(|&c| size[c] > 1).unwrap() as u8;
    let members: Vec<usize> = (0..n).filter(|&v| col[v] == c).collect();
    let mut tried: Vec<usize> = Vec::new();
    for &u in &members {
        if tried.iter().any(|&t| (g.adj[u] & !(1 << t)) == (g.adj[t] & !(1 << u))) {
            continue; // u is a twin of an already tried vertex: swapping them is an automorphism
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

// rooted = true: vertex 0 is the root (own colour), its neighbours a second colour, rest a third.
fn canon(g: &G, rooted: bool) -> G {
    let mut col = [0u8; MAXN];
    if rooted {
        for v in 1..g.n {
            col[v] = if g.has(0, v) { 1 } else { 2 };
        }
    }
    let mut best = None;
    canon_rec(g, &mut col, &mut best);
    let rows = best.unwrap();
    let mut h = G::new(g.n);
    for i in 0..g.n {
        h.adj[i] = rows[i];
    }
    h
}

// ------------------------------------------------------------------------------------
fn colourable(g: &G, k: u32) -> bool {
    fn rec(g: &G, k: u32, col: &mut [u8; MAXN], used: u32, done: usize) -> bool {
        if done == g.n {
            return true;
        }
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
        for c in 0..(used + 1).min(k) {
            if bmask >> c & 1 == 1 {
                continue;
            }
            col[v] = c as u8;
            if rec(g, k, col, if c == used { used + 1 } else { used }, done + 1) {
                return true;
            }
            col[v] = 255;
        }
        false
    }
    let mut col = [255u8; MAXN];
    rec(g, k, &mut col, 0, 0)
}

fn g6(g: &G) -> String {
    let mut s = String::new();
    s.push((g.n as u8 + 63) as char);
    let mut bits: Vec<u8> = Vec::new();
    for j in 1..g.n {
        for i in 0..j {
            bits.push(g.has(i, j) as u8);
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

// ------------------------------------------------------------------------------------
// Extension of a level member P (k vertices) by one new vertex with neighbour set S.
// rem = number of vertices still to be added AFTER the new one.
// ------------------------------------------------------------------------------------
fn edge_min_violation(g: &G) -> bool {
    let mut big = 0u32;
    for w in 0..g.n {
        if g.deg(w) >= 8 {
            big |= 1 << w;
        }
    }
    let mut b = big;
    while b != 0 {
        let w = b.trailing_zeros() as usize;
        b &= b - 1;
        if g.adj[w] & big != 0 {
            return true;
        }
    }
    false
}

struct Ext<'a> {
    p: &'a G,
    rem: u32,
    opt: Vec<usize>,
    quick_limit: u64,
    out: &'a mut HashSet<G>,
    bad: &'a mut HashSet<G>,
}

impl<'a> Ext<'a> {
    fn build(&self, s: u32) -> G {
        let k = self.p.n;
        let mut g = self.p.clone();
        g.n = k + 1;
        g.adj[k] = s;
        let mut x = s;
        while x != 0 {
            let w = x.trailing_zeros() as usize;
            x &= x - 1;
            g.adj[w] |= 1 << k;
        }
        g
    }
    fn dfs(&mut self, idx: usize, s: u32) {
        // feasibility of the new vertex's degree
        let left = (self.opt.len() - idx) as u32;
        if s.count_ones() + left + self.rem < 7 {
            return;
        }
        if idx == self.opt.len() {
            let g = self.build(s);
            if edge_min_violation(&g) {
                return;
            }
            let c = canon(&g, true);
            if self.out.contains(&c) || self.bad.contains(&c) {
                return;
            }
            match kt_minor(&c, 7, u64::MAX) {
                Some(false) => {
                    self.out.insert(c);
                }
                _ => {
                    self.bad.insert(c);
                }
            }
            return;
        }
        let w = self.opt[idx];
        // include w
        let s2 = s | (1 << w);
        let g = self.build(s2);
        // both prunings are monotone in S (degrees and minors only grow with S)
        if !edge_min_violation(&g) {
            let pos = s2.count_ones() >= 2 && kt_minor(&g, 7, self.quick_limit) == Some(true);
            if !pos {
                self.dfs(idx + 1, s2);
            }
        }
        // exclude w
        self.dfs(idx + 1, s);
    }
}

fn extend(p: &G, rem: u32, out: &mut HashSet<G>, bad: &mut HashSet<G>) {
    let k = p.n;
    let mut forced = 0u32;
    let mut opt: Vec<usize> = Vec::new();
    for w in 1..k {
        let d = p.deg(w);
        if d + 1 + rem < 7 {
            return; // w can no longer reach degree 7
        }
        if d + rem < 7 {
            forced |= 1 << w;
        } else {
            opt.push(w);
        }
    }
    // order optional vertices: low degree first (they are the ones most likely needed)
    opt.sort_by_key(|&w| p.deg(w));
    let mut e = Ext { p, rem, opt, quick_limit: 400, out, bad };
    if forced != 0 {
        let g = e.build(forced);
        if edge_min_violation(&g) {
            return;
        }
        if forced.count_ones() >= 2 && kt_minor(&g, 7, e.quick_limit) == Some(true) {
            return;
        }
    }
    e.dfs(0, forced);
}

// 7-vertex graphs up to isomorphism (smallest edge mask of each orbit)
fn eidx(a: usize, b: usize) -> usize {
    let (a, b) = if a < b { (a, b) } else { (b, a) };
    b * (b - 1) / 2 + a
}
fn seven_vertex_classes() -> Vec<u32> {
    let mut perms: Vec<[usize; 7]> = Vec::new();
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
    heap(7, &mut [0, 1, 2, 3, 4, 5, 6], &mut perms);
    assert_eq!(perms.len(), 5040);
    let mut seen = vec![false; 1 << 21];
    let mut reps = Vec::new();
    for mask in 0u32..(1 << 21) {
        if seen[mask as usize] {
            continue;
        }
        reps.push(mask);
        for p in &perms {
            let mut r = 0u32;
            for b in 1..7 {
                for a in 0..b {
                    if mask >> eidx(a, b) & 1 == 1 {
                        r |= 1 << eidx(p[a], p[b]);
                    }
                }
            }
            seen[r as usize] = true;
        }
    }
    reps
}

fn parallel_extend(level: &Vec<G>, rem: u32, threads: usize) -> Vec<G> {
    let next = Mutex::new(HashSet::<G>::new());
    let idx = AtomicU64::new(0);
    let chunk = 16usize;
    std::thread::scope(|sc| {
        for _ in 0..threads {
            sc.spawn(|| {
                let mut out: HashSet<G> = HashSet::new();
                let mut bad: HashSet<G> = HashSet::new();
                loop {
                    let i = idx.fetch_add(chunk as u64, Ordering::Relaxed) as usize;
                    if i >= level.len() {
                        break;
                    }
                    for p in &level[i..(i + chunk).min(level.len())] {
                        extend(p, rem, &mut out, &mut bad);
                    }
                    if bad.len() > 2_000_000 {
                        bad.clear();
                    }
                    if out.len() > 500_000 {
                        let mut gl = next.lock().unwrap();
                        gl.extend(out.drain());
                    }
                }
                let mut gl = next.lock().unwrap();
                gl.extend(out.drain());
            });
        }
    });
    let mut v: Vec<G> = next.into_inner().unwrap().into_iter().collect();
    v.sort_by(|a, b| a.adj.cmp(&b.adj));
    v
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let n: usize = args[1].parse().unwrap();
    let threads: usize = args[2].parse().unwrap();
    let closure = args.get(3).map(|s| s == "closure").unwrap_or(false);
    assert!(n >= 8 && n <= MAXN);
    let m = n - 8;
    let t0 = std::time::Instant::now();
    let reps = seven_vertex_classes();
    eprintln!("[census n={}] 7-vertex classes: {}", n, reps.len());
    // level 0
    let mut level: Vec<G> = Vec::new();
    for &mask in &reps {
        let mut g = G::new(8);
        for a in 1..=7 {
            g.add(0, a);
        }
        for b in 1..7 {
            for a in 0..b {
                if mask >> eidx(a, b) & 1 == 1 {
                    g.add(a + 1, b + 1);
                }
            }
        }
        if (1..=7).any(|w| g.deg(w) + (m as u32) < 7) {
            continue;
        }
        if edge_min_violation(&g) {
            continue;
        }
        if kt_minor(&g, 7, u64::MAX) != Some(false) {
            continue;
        }
        level.push(canon(&g, true));
    }
    level.sort_by(|a, b| a.adj.cmp(&b.adj));
    level.dedup();
    println!("LEVEL n={} i=0 vertices=8 count={} t={:.1}s", n, level.len(), t0.elapsed().as_secs_f64());
    for i in 0..m {
        let rem = (m - i - 1) as u32;
        level = parallel_extend(&level, rem, threads);
        println!(
            "LEVEL n={} i={} vertices={} count={} t={:.1}s minor_calls={} exact_neg={}",
            n,
            i + 1,
            9 + i,
            level.len(),
            t0.elapsed().as_secs_f64(),
            MINOR_CALLS.load(Ordering::Relaxed),
            MINOR_EXACT_NEG.load(Ordering::Relaxed)
        );
    }
    // final: unrooted dedupe + checks
    let mut fin: HashSet<G> = HashSet::new();
    for g in &level {
        assert!((0..g.n).all(|v| g.deg(v) >= 7));
        assert!(!edge_min_violation(g));
        fin.insert(canon(g, false));
    }
    let mut fin: Vec<G> = fin.into_iter().collect();
    fin.sort_by(|a, b| a.adj.cmp(&b.adj));
    println!("RESULT n={} edge-minimal mindeg>=7 K7-minor-free graphs (unrooted iso classes): {}", n, fin.len());
    for g in &fin {
        let mut ds: Vec<u32> = (0..g.n).map(|v| g.deg(v)).collect();
        ds.sort();
        println!("MINIMAL n={} m={} g6={} 6col={} 5col={} degs={:?}", n, g.m(), g6(g), colourable(g, 6), colourable(g, 5), ds);
    }
    if closure {
        // upward closure: add edges while K7-minor-free
        let mut all: HashSet<G> = fin.iter().cloned().collect();
        let mut frontier: Vec<G> = fin.clone();
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
                        let c = canon(&h, false);
                        if all.contains(&c) {
                            continue;
                        }
                        if kt_minor(&c, 7, u64::MAX) == Some(false) {
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
        println!("CLOSURE n={} all K7-minor-free graphs with mindeg>=7: {}", n, allv.len());
        let mut bad = 0;
        for g in &allv {
            let c6 = colourable(g, 6);
            if !c6 {
                bad += 1;
            }
            println!("ALL n={} m={} g6={} 6col={}", n, g.m(), g6(g), c6);
        }
        println!("CLOSURE n={} not-6-colourable: {}", n, bad);
    }
    println!("DONE n={} t={:.1}s minor_calls={} exact_neg={}", n, t0.elapsed().as_secs_f64(), MINOR_CALLS.load(Ordering::Relaxed), MINOR_EXACT_NEG.load(Ordering::Relaxed));
}
