// RL70 shared core (std only): graph type, exact K_t-minor test, k-colourability, graph6.
// Included by the census tools with include!("core.rs").
use std::collections::HashSet;

const MAXN: usize = 32;

#[derive(Clone, PartialEq, Eq, Hash)]
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
// Exact K_t-minor test (contraction search), allocation-free on the fast path.
// Completeness: let v be a non-frozen vertex and suppose a K_t model exists in which every
// frozen vertex is a singleton bag.
//   * v in a bag with >= 2 vertices: some neighbour u of v is in that bag (u not frozen);
//     contracting vu keeps a model.
//   * v a singleton bag: the "freeze v" branch keeps it (needs deg >= t-1, adjacency to all
//     frozen vertices, fewer than t frozen).
//   * v in no bag: if v has a non-frozen neighbour u then G/vu contains G-v, so a contraction
//     branch keeps the model; otherwise the explicit deletion branch does.
// "true" is returned only when the current graph, a minor of the input, contains K_t.
// The memo stores exact states (sorted bags of free super-vertices + union of frozen bags);
// a state determines the current graph, so a failed state can be skipped.
// ------------------------------------------------------------------------------------
const KEYLEN: usize = 21;

struct MinorSearch {
    t: u32,
    memo: Option<HashSet<[u32; KEYLEN]>>,
    nodes: u64,
    limit: u64,
    aborted: bool,
}

fn has_clique(adj: &[u32; MAXN], cand: u32, need: u32) -> bool {
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

impl MinorSearch {
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
            return false; // a frozen singleton bag fell below degree t-1
        }
        if has_clique(adj, cand, t) {
            return true;
        }
        let free = alive & !frozen;
        if free == 0 {
            return false;
        }
        let use_memo = self.nodes > 24;
        let mut key = [0u32; KEYLEN];
        if use_memo {
            let mut k = 0;
            let mut a = free;
            while a != 0 {
                let v = a.trailing_zeros() as usize;
                a &= a - 1;
                key[k] = bag[v];
                k += 1;
            }
            key[..k].sort_unstable();
            let mut fm = 0u32;
            let mut f = frozen;
            while f != 0 {
                let v = f.trailing_zeros() as usize;
                f &= f - 1;
                fm |= bag[v];
            }
            key[KEYLEN - 1] = fm;
            if self.memo.is_none() {
                self.memo = Some(HashSet::new());
            }
            if self.memo.as_ref().unwrap().contains(&key) {
                return false;
            }
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
        let mut order = [(0u32, 0usize); MAXN];
        let mut no = 0;
        let mut us = free_nb;
        while us != 0 {
            let u = us.trailing_zeros() as usize;
            us &= us - 1;
            order[no] = ((adj[u] & nb).count_ones(), u);
            no += 1;
        }
        order[..no].sort_unstable();
        for oi in 0..no {
            let u = order[oi].1;
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
        if use_memo {
            self.memo.as_mut().unwrap().insert(key);
        }
        false
    }
}

// (Some(true)/Some(false) exact; None if the node limit was hit), nodes used.
fn has_kt_minor(g: &G, t: u32, limit: u64) -> (Option<bool>, u64) {
    assert!(g.n < KEYLEN);
    let mut s = MinorSearch { t, memo: None, nodes: 0, limit, aborted: false };
    let mut adj = g.adj;
    let mut bag = [0u32; MAXN];
    for i in 0..g.n {
        bag[i] = 1 << i;
    }
    let alive = (1u32 << g.n) - 1;
    let r = s.rec(&mut adj, alive, 0, &mut bag);
    if s.aborted {
        (None, s.nodes)
    } else {
        (Some(r), s.nodes)
    }
}

// ------------------------------------------------------------------------------------
// k-colourability (DSATUR-style backtracking, colours used in first-fit order).
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

// 7-vertex graphs: edge index and permutations (used to enumerate root neighbourhoods).
fn eidx(a: usize, b: usize) -> usize {
    let (a, b) = if a < b { (a, b) } else { (b, a) };
    b * (b - 1) / 2 + a
}
fn perms7() -> Vec<[usize; 7]> {
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
    let mut out = Vec::new();
    heap(7, &mut [0, 1, 2, 3, 4, 5, 6], &mut out);
    assert_eq!(out.len(), 5040);
    out
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
// smallest edge mask of every isomorphism class of 7-vertex graphs
fn seven_vertex_classes(perms: &Vec<[usize; 7]>) -> Vec<u32> {
    let mut seen = vec![false; 1 << 21];
    let mut reps = Vec::new();
    for mask in 0u32..(1 << 21) {
        if seen[mask as usize] {
            continue;
        }
        reps.push(mask);
        for p in perms {
            seen[perm_mask(mask, p) as usize] = true;
        }
    }
    reps
}
// root v = 0 joined to 1..7, which carry the 7-vertex graph `mask`
fn rooted_base(mask: u32) -> G {
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
    g
}
