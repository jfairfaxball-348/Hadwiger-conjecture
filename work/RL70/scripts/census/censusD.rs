// RL70 tool D: exhaustive search for a minimal HC7 counterexample on exactly n vertices.
//
// A minimal HC7 counterexample G (chi = 7, no K7 minor, every proper minor 6-colourable)
// satisfies, for every vertex w:
//   (D1) deg(w) >= 7                                  [Dirac; elementary, see RL70 report]
//   (D2) alpha(G[N(w)]) <= deg(w) - 5                 [Dirac; elementary, see RL70 report]
//   (D3) G has no K7 minor
//   (D4) |E(G)| <= 5n - 15                            [Mader 1968; INHERITED theorem]
//   (D5) G is not 6-colourable
// By (D4) and n <= 29 the minimum degree d is 7 or 8.  This tool fixes d in {7,8}, puts a
// vertex v of minimum degree d at index 0, N(v) at 1..d (one representative H of every
// isomorphism class of d-vertex graphs with alpha(H) <= d-5), and adds the remaining
// m = n-1-d vertices ("R") one at a time.  Symmetry breaking is as in tool B:
// N(v)-patterns of R non-increasing; first pattern maximal in its Aut(H)-orbit.
//
// Pruning of a partial graph P (an INDUCED subgraph of G on the first k vertices), with
// rem = n - k vertices still to come.  For w in P let
//     L(w) = max(d, deg_P(w), alpha(P[N_P(w)]) + 5)
// (a lower bound for deg_G(w): N_P(w) is a subset of N_G(w) and independence is inherited).
//   * L(w) - deg_P(w) <= rem for w != v, and L(v) = d;
//   * sum_w L(w) + d*rem <= 10n - 30                  [degree sum <= 2(5n-15)]
//   * P has no K7 minor.
// A leaf is a graph on n vertices passing (D1)-(D4) with minimum degree exactly d at v;
// it is printed as CANDIDATE with its 6-colourability.  A CANDIDATE with 6col=false would be
// a graph with chi >= 7 and no K7 minor.
//
// Build: rustc -O censusD.rs -o censusD.exe   (needs core.rs alongside)
// Usage: censusD.exe <n> <d> <threads> [shard nshards]
#![allow(dead_code)]
include!("core.rs");

use std::sync::atomic::{AtomicU64, AtomicUsize, Ordering};
use std::sync::Mutex;

fn alpha(adj: &[u32; MAXN], set: u32) -> u32 {
    // maximum independent set inside `set`
    let mut best_v = usize::MAX;
    let mut best_d = 0;
    let mut s = set;
    while s != 0 {
        let v = s.trailing_zeros() as usize;
        s &= s - 1;
        let d = (adj[v] & set).count_ones();
        if d > best_d {
            best_d = d;
            best_v = v;
        }
    }
    if best_v == usize::MAX {
        return set.count_ones();
    }
    let a = alpha(adj, set & !(1 << best_v));
    let b = 1 + alpha(adj, set & !(1 << best_v) & !adj[best_v]);
    a.max(b)
}

fn perms_d(d: usize) -> Vec<Vec<usize>> {
    fn heap(k: usize, p: &mut Vec<usize>, out: &mut Vec<Vec<usize>>) {
        if k == 1 {
            out.push(p.clone());
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
    heap(d, &mut (0..d).collect(), &mut out);
    out
}
fn pmask(mask: u32, p: &[usize], d: usize) -> u32 {
    let mut r = 0u32;
    for b in 1..d {
        for a in 0..b {
            if mask >> eidx(a, b) & 1 == 1 {
                r |= 1 << eidx(p[a], p[b]);
            }
        }
    }
    r
}
fn ppat(pat: u32, p: &[usize], d: usize) -> u32 {
    let mut r = 0u32;
    for a in 0..d {
        if pat >> a & 1 == 1 {
            r |= 1 << p[a];
        }
    }
    r
}
fn base(mask: u32, d: usize) -> G {
    let mut g = G::new(d + 1);
    for a in 1..=d {
        g.add(0, a);
    }
    for b in 1..d {
        for a in 0..b {
            if mask >> eidx(a, b) & 1 == 1 {
                g.add(a + 1, b + 1);
            }
        }
    }
    g
}
// isomorphism class representatives (smallest mask) of d-vertex graphs passing `keep`
fn classes(d: usize, perms: &Vec<Vec<usize>>) -> Vec<u32> {
    let bits = d * (d - 1) / 2;
    let total = 1usize << bits;
    let mut seen = vec![0u64; total / 64 + 1];
    let mut reps = Vec::new();
    for mask in 0..total {
        if seen[mask / 64] >> (mask % 64) & 1 == 1 {
            continue;
        }
        reps.push(mask as u32);
        for p in perms {
            let r = pmask(mask as u32, p, d) as usize;
            seen[r / 64] |= 1 << (r % 64);
        }
    }
    reps
}

fn add_vertex(g: &mut G, nb: u32) {
    let x = g.n;
    g.adj[x] = nb;
    let mut y = nb;
    while y != 0 {
        let w = y.trailing_zeros() as usize;
        y &= y - 1;
        g.adj[w] |= 1 << x;
    }
    g.n = x + 1;
}
fn remove_last(g: &mut G) {
    let x = g.n - 1;
    let mut y = g.adj[x];
    while y != 0 {
        let w = y.trailing_zeros() as usize;
        y &= y - 1;
        g.adj[w] &= !(1 << x);
    }
    g.adj[x] = 0;
    g.n = x;
}

struct Search {
    n: usize,
    d: usize,
    m: usize,
    nodes: u64,
    minor_tests: u64,
    sols: Vec<G>,
}

impl Search {
    // cheap necessary conditions on the partial graph g (k = g.n vertices)
    fn feasible(&self, g: &G) -> bool {
        let rem = (self.n - g.n) as u32;
        let d = self.d as u32;
        let mut sum = d * rem;
        for w in 0..g.n {
            let dg = g.deg(w);
            let mut l = dg.max(d);
            if l < 10 + 0 {
                // alpha can only matter if it exceeds l-5
                let a = alpha(&g.adj, g.adj[w]);
                l = l.max(a + 5);
            } else {
                let a = alpha(&g.adj, g.adj[w]);
                l = l.max(a + 5);
            }
            if w == 0 {
                if l != d {
                    return false;
                }
            } else if l - dg > rem {
                return false;
            }
            sum += l;
        }
        sum <= (10 * self.n - 30) as u32
    }

    fn rec(&mut self, g: &mut G, i: usize, prev: u32) {
        self.nodes += 1;
        let m = self.m;
        let d = self.d;
        if i == m {
            self.sols.push(g.clone());
            return;
        }
        let rem_after = (m - i - 1) as u32;
        for p in (0..=prev).rev() {
            let pc = p.count_ones();
            if pc + i as u32 + rem_after < d as u32 {
                continue;
            }
            for q in 0..(1u32 << i) {
                if pc + q.count_ones() + rem_after < d as u32 {
                    continue;
                }
                add_vertex(g, (p << 1) | (q << (d + 1)));
                let mut ok = self.feasible(g);
                if ok {
                    self.minor_tests += 1;
                    if has_kt_minor(g, 7, u64::MAX).0 != Some(false) {
                        ok = false;
                    }
                }
                if ok {
                    self.rec(g, i + 1, p);
                }
                remove_last(g);
            }
        }
    }
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let n: usize = args[1].parse().unwrap();
    let d: usize = args[2].parse().unwrap();
    let threads: usize = args[3].parse().unwrap();
    let shard: usize = args.get(4).map(|x| x.parse().unwrap()).unwrap_or(0);
    let nshards: usize = args.get(5).map(|x| x.parse().unwrap()).unwrap_or(1);
    assert!(d == 7 || d == 8);
    assert!(n >= d + 1 && n <= 20);
    let m = n - 1 - d;
    let perms = perms_d(d);
    let reps = classes(d, &perms);
    eprintln!("{}-vertex iso classes: {}", d, reps.len());
    let proto = Search { n, d, m, nodes: 0, minor_tests: 0, sols: Vec::new() };
    let mut tasks: Vec<(u32, u32)> = Vec::new();
    let mut base_classes = 0;
    let mut base_solutions: Vec<G> = Vec::new();
    for &mask in &reps {
        let g = base(mask, d);
        if !proto.feasible(&g) {
            continue;
        }
        if has_kt_minor(&g, 7, u64::MAX).0 != Some(false) {
            continue;
        }
        base_classes += 1;
        if m == 0 {
            base_solutions.push(g);
            continue;
        }
        let auts: Vec<&Vec<usize>> = perms.iter().filter(|p| pmask(mask, p, d) == mask).collect();
        for p in (0..(1u32 << d)).rev() {
            if p.count_ones() + (m as u32 - 1) < d as u32 {
                continue;
            }
            if auts.iter().any(|a| ppat(p, a, d) > p) {
                continue;
            }
            tasks.push((mask, p));
        }
    }
    eprintln!("n={} d={} admissible root classes={} tasks={}", n, d, base_classes, tasks.len());
    let next = AtomicUsize::new(0);
    let done = AtomicUsize::new(0);
    let nodes = AtomicU64::new(0);
    let tests = AtomicU64::new(0);
    let sols: Mutex<Vec<G>> = Mutex::new(base_solutions);
    let t0 = std::time::Instant::now();
    std::thread::scope(|sc| {
        for _ in 0..threads {
            sc.spawn(|| loop {
                let ti = next.fetch_add(1, Ordering::Relaxed);
                if ti >= tasks.len() {
                    break;
                }
                if ti % nshards != shard {
                    done.fetch_add(1, Ordering::Relaxed);
                    continue;
                }
                let (mask, p) = tasks[ti];
                let mut g = base(mask, d);
                add_vertex(&mut g, p << 1);
                let mut s = Search { n, d, m, nodes: 0, minor_tests: 0, sols: Vec::new() };
                if s.feasible(&g) && has_kt_minor(&g, 7, u64::MAX).0 == Some(false) {
                    s.rec(&mut g, 1, p);
                    nodes.fetch_add(s.nodes, Ordering::Relaxed);
                    tests.fetch_add(s.minor_tests, Ordering::Relaxed);
                    if !s.sols.is_empty() {
                        sols.lock().unwrap().extend(s.sols.drain(..));
                    }
                }
                let dn = done.fetch_add(1, Ordering::Relaxed) + 1;
                if dn % 2000 == 0 || dn == tasks.len() {
                    eprintln!(
                        "progress {}/{} tasks, nodes={} tests={} leaves={} t={:.0}s",
                        dn,
                        tasks.len(),
                        nodes.load(Ordering::Relaxed),
                        tests.load(Ordering::Relaxed),
                        sols.lock().unwrap().len(),
                        t0.elapsed().as_secs_f64()
                    );
                }
            });
        }
    });
    let sols = sols.into_inner().unwrap();
    let mut cands = 0;
    let mut bad = 0;
    for h in &sols {
        // exact leaf checks (D1)-(D4)
        let dmin = (0..h.n).map(|w| h.deg(w)).min().unwrap();
        let dirac = (0..h.n).all(|w| alpha(&h.adj, h.adj[w]) + 5 <= h.deg(w));
        let ok = dmin as usize == d && h.deg(0) as usize == d && dirac && h.m() as usize <= 5 * n - 15 && has_kt_minor(h, 7, u64::MAX).0 == Some(false);
        if !ok {
            continue;
        }
        cands += 1;
        let c6 = colourable(h, 6);
        if !c6 {
            bad += 1;
        }
        println!("CANDIDATE n={} d={} m={} g6={} 6col={}", h.n, d, h.m(), g6(h), c6);
    }
    println!(
        "DONE n={} d={} shard={}/{} root_classes={} tasks={} nodes={} minor_tests={} leaves={} candidates_with_repetition={} not_6_colourable={} t={:.1}s",
        n,
        d,
        shard,
        nshards,
        base_classes,
        tasks.len(),
        nodes.load(Ordering::Relaxed),
        tests.load(Ordering::Relaxed),
        sols.len(),
        cands,
        bad,
        t0.elapsed().as_secs_f64()
    );
}
