// RL70 census tool B: rooted row-ordered DFS, task-parallel (std only).
//
// Enumerates (with repetitions) every graph G on n vertices such that
//   (1) minimum degree >= 7,
//   (2) every edge has an end of degree exactly 7 (edge-minimal for (1)),
//   (3) G has no K7 minor.
// Such a graph (if it has an edge) has a vertex v of degree exactly 7.
// Layout: vertex 0 = v, vertices 1..7 = N(v) carrying one representative H of each
// isomorphism class of 7-vertex graphs, vertices 8.. = R, added one at a time, where
//   * the N(v)-patterns of the R-vertices are non-increasing (sound: R can be relabelled
//     so that it is sorted by pattern),
//   * the first (= largest) pattern is maximal in its Aut(H)-orbit (sound: apply the
//     automorphism of H that maximises the largest pattern, then sort),
//   * a partial graph is pruned if some vertex can no longer reach degree 7, if an edge
//     has both ends of degree >= 8 (degrees only grow), or if it has a K7 minor
//     (the partial graph is an induced subgraph of the final graph).
// No canonical forms are used.
//
// Build: rustc -O censusB.rs -o censusB.exe   (needs core.rs alongside)
// Usage: censusB.exe <n> <threads> [shard nshards]
#![allow(dead_code)]
include!("core.rs");

use std::sync::atomic::{AtomicU64, AtomicUsize, Ordering};
use std::sync::Mutex;

struct Search {
    m: usize,
    nodes: u64,
    minor_tests: u64,
    sols: Vec<G>,
}

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

// add vertex x = g.n with neighbour mask nb; returns false (and leaves it added) if pruned
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

impl Search {
    // i = number of R vertices already placed; prev = pattern of the last one
    fn rec(&mut self, g: &mut G, i: usize, prev: u32) {
        self.nodes += 1;
        let m = self.m;
        if i == m {
            self.sols.push(g.clone());
            return;
        }
        let rem_after = (m - i - 1) as u32;
        for p in (0..=prev).rev() {
            let pc = p.count_ones();
            if pc + i as u32 + rem_after < 7 {
                continue;
            }
            for q in 0..(1u32 << i) {
                if pc + q.count_ones() + rem_after < 7 {
                    continue;
                }
                add_vertex(g, (p << 1) | (q << 8));
                let x = g.n - 1;
                let mut ok = (1..=x).all(|w| g.deg(w) + rem_after >= 7);
                if ok && edge_min_violation(g) {
                    ok = false;
                }
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
    let threads: usize = args[2].parse().unwrap();
    assert!(n >= 8 && n <= 20);
    // optional sharding: process only tasks with index % nshards == shard
    let shard: usize = args.get(3).map(|x| x.parse().unwrap()).unwrap_or(0);
    let nshards: usize = args.get(4).map(|x| x.parse().unwrap()).unwrap_or(1);
    let m = n - 8;
    let perms = perms7();
    let reps = seven_vertex_classes(&perms);
    eprintln!("7-vertex iso classes: {}", reps.len());
    // tasks = (H mask, first pattern)
    let mut tasks: Vec<(u32, u32)> = Vec::new();
    let mut base_classes = 0;
    let mut base_solutions = 0;
    for &mask in &reps {
        let g = rooted_base(mask);
        if (1..=7).any(|a| g.deg(a) + (m as u32) < 7) {
            continue;
        }
        if has_kt_minor(&g, 7, u64::MAX).0 != Some(false) {
            continue;
        }
        base_classes += 1;
        if m == 0 {
            base_solutions += 1;
            continue;
        }
        let auts: Vec<[usize; 7]> = perms.iter().filter(|p| perm_mask(mask, p) == mask).cloned().collect();
        for p in (0..128u32).rev() {
            if p.count_ones() + (m as u32 - 1) < 7 {
                continue;
            }
            if auts.iter().any(|a| perm_pat(p, a) > p) {
                continue;
            }
            tasks.push((mask, p));
        }
    }
    eprintln!("n={} admissible root classes={} tasks={}", n, base_classes, tasks.len());
    let next = AtomicUsize::new(0);
    let done = AtomicUsize::new(0);
    let nodes = AtomicU64::new(0);
    let tests = AtomicU64::new(0);
    let sols: Mutex<Vec<String>> = Mutex::new(Vec::new());
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
                let mut g = rooted_base(mask);
                add_vertex(&mut g, p << 1);
                let rem_after = (m - 1) as u32;
                let mut ok = (1..g.n).all(|w| g.deg(w) + rem_after >= 7);
                if ok && edge_min_violation(&g) {
                    ok = false;
                }
                if ok && has_kt_minor(&g, 7, u64::MAX).0 != Some(false) {
                    ok = false;
                }
                if ok {
                    let mut s = Search { m, nodes: 0, minor_tests: 0, sols: Vec::new() };
                    s.rec(&mut g, 1, p);
                    nodes.fetch_add(s.nodes, Ordering::Relaxed);
                    tests.fetch_add(s.minor_tests, Ordering::Relaxed);
                    if !s.sols.is_empty() {
                        let mut gl = sols.lock().unwrap();
                        for h in &s.sols {
                            gl.push(format!("SOL n={} m={} g6={} 6col={}", h.n, h.m(), g6(h), colourable(h, 6)));
                        }
                    }
                }
                let d = done.fetch_add(1, Ordering::Relaxed) + 1;
                if d % 2000 == 0 || d == tasks.len() {
                    eprintln!(
                        "progress {}/{} tasks, nodes={} tests={} sols={} t={:.0}s",
                        d,
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
    for s in &sols {
        println!("{}", s);
    }
    println!(
        "DONE n={} shard={}/{} root_classes={} tasks={} nodes={} minor_tests={} base_solutions={} solutions_with_repetition={} t={:.1}s",
        n,
        shard,
        nshards,
        base_classes,
        tasks.len(),
        nodes.load(Ordering::Relaxed),
        tests.load(Ordering::Relaxed),
        base_solutions,
        sols.len(),
        t0.elapsed().as_secs_f64()
    );
}
