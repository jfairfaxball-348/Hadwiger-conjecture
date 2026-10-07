// RL70 cross-check of the exact K_t-minor tester in core.rs against an independent
// second algorithm (spanning branch-set partition search).
//
// Tester 2: a connected graph C has a K_t minor iff V(C) can be partitioned into t
// connected, pairwise adjacent sets (extend the bags of any model greedily over C).
// The lowest unassigned vertex always belongs to the next bag, the last bag is the rest.
//
// Build: rustc -O crosscheck.rs -o crosscheck.exe
// Usage: crosscheck.exe random <trials> <seed>      random graphs, n in 7..=14
//        crosscheck.exe stdin  <t>                  graph6 lines on stdin: print both answers
#![allow(dead_code)]
include!("core.rs");

fn connected(adj: &[u32; MAXN], set: u32) -> bool {
    if set == 0 {
        return false;
    }
    let mut seen = 1u32 << set.trailing_zeros();
    loop {
        let mut nb = 0u32;
        let mut s = seen;
        while s != 0 {
            let v = s.trailing_zeros() as usize;
            s &= s - 1;
            nb |= adj[v];
        }
        let nxt = seen | (nb & set);
        if nxt == seen {
            break;
        }
        seen = nxt;
    }
    seen == set
}
fn nbhd(adj: &[u32; MAXN], set: u32) -> u32 {
    let mut nb = 0u32;
    let mut s = set;
    while s != 0 {
        let v = s.trailing_zeros() as usize;
        s &= s - 1;
        nb |= adj[v];
    }
    nb & !set
}

struct P2<'a> {
    adj: &'a [u32; MAXN],
    t: usize,
    bags: Vec<u32>,
}
impl<'a> P2<'a> {
    // choose bag number bags.len()+1 inside `un` (unassigned vertices of the component)
    fn next_bag(&mut self, un: u32) -> bool {
        let k = self.bags.len();
        if k == self.t - 1 {
            // last bag = everything left
            if !connected(self.adj, un) {
                return false;
            }
            let nb = nbhd(self.adj, un);
            return self.bags.iter().all(|&b| b & nb != 0);
        }
        if (un.count_ones() as usize) < self.t - k {
            return false;
        }
        let root = un.trailing_zeros() as usize;
        self.grow(1 << root, un & !(1 << root), un)
    }
    // enumerate connected sets S containing the root: `cur` = current set, `avail` = vertices
    // that may still be added (un minus cur minus excluded)
    fn grow(&mut self, cur: u32, avail: u32, un: u32) -> bool {
        // try cur as the bag
        let nb = nbhd(self.adj, cur);
        if self.bags.iter().all(|&b| b & nb != 0) {
            let rest = un & !cur;
            // every earlier bag and this one must still see the rest (more bags to come)
            let nrest_ok = self.bags.iter().all(|&b| nbhd(self.adj, b) & rest != 0) && nb & rest != 0;
            if nrest_ok {
                self.bags.push(cur);
                let r = self.next_bag(rest);
                self.bags.pop();
                if r {
                    return true;
                }
            }
        }
        // extend by a boundary vertex; standard exclusion to avoid repeats
        let mut cand = nb & avail;
        let mut avail2 = avail;
        while cand != 0 {
            let v = cand.trailing_zeros() as usize;
            cand &= cand - 1;
            avail2 &= !(1 << v);
            if self.grow(cur | (1 << v), avail2, un) {
                return true;
            }
        }
        false
    }
}

fn has_kt_minor2(g: &G, t: usize) -> bool {
    let all = (1u32 << g.n) - 1;
    let mut left = all;
    while left != 0 {
        // component of the lowest remaining vertex
        let mut comp = 1u32 << left.trailing_zeros();
        loop {
            let nxt = comp | (nbhd(&g.adj, comp) & left);
            if nxt == comp {
                break;
            }
            comp = nxt;
        }
        left &= !comp;
        if (comp.count_ones() as usize) < t {
            continue;
        }
        let mut p = P2 { adj: &g.adj, t, bags: Vec::new() };
        if p.next_bag(comp) {
            return true;
        }
    }
    false
}

struct Rng(u64);
impl Rng {
    fn next(&mut self) -> u64 {
        self.0 ^= self.0 << 13;
        self.0 ^= self.0 >> 7;
        self.0 ^= self.0 << 17;
        self.0
    }
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

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args[1] == "stdin" {
        let t: usize = args[2].parse().unwrap();
        let mut line = String::new();
        let mut disagree = 0;
        let mut cnt = 0;
        while std::io::stdin().read_line(&mut line).unwrap() > 0 {
            let s = line.trim().to_string();
            line.clear();
            if s.is_empty() {
                continue;
            }
            let g = from_g6(&s);
            let a = has_kt_minor(&g, t as u32, u64::MAX).0.unwrap();
            let b = has_kt_minor2(&g, t);
            cnt += 1;
            if a != b {
                disagree += 1;
            }
            println!("{} n={} m={} K{}minor: tester1={} tester2={} 6col={}", s, g.n, g.m(), t, a, b, colourable(&g, 6));
        }
        println!("STDIN graphs={} disagreements={}", cnt, disagree);
        return;
    }
    let trials: u64 = args[2].parse().unwrap();
    let seed: u64 = args[3].parse().unwrap();
    let mut rng = Rng(seed | 1);
    let mut disagree = 0u64;
    let mut pos = [0u64; 9];
    let mut neg = [0u64; 9];
    for _ in 0..trials {
        let n = 7 + (rng.next() % 8) as usize; // 7..=14
        let t = 4 + (rng.next() % 4) as usize; // 4..=7
        // density chosen so that both answers occur: around the K_t extremal density
        let target = ((t as f64 - 2.0) * n as f64 * (0.55 + (rng.next() % 60) as f64 / 100.0)) as u32;
        let mut g = G::new(n);
        let maxe = (n * (n - 1) / 2) as u32;
        let target = target.min(maxe);
        while g.m() < target {
            let a = (rng.next() % n as u64) as usize;
            let b = (rng.next() % n as u64) as usize;
            g.add(a, b);
        }
        let a = has_kt_minor(&g, t as u32, u64::MAX).0.unwrap();
        let b = has_kt_minor2(&g, t);
        if a != b {
            disagree += 1;
            println!("DISAGREE t={} g6={} tester1={} tester2={}", t, g6(&g), a, b);
        }
        if a {
            pos[t] += 1;
        } else {
            neg[t] += 1;
        }
    }
    println!("RANDOM trials={} seed={} disagreements={} positives(t=4..7)={:?} negatives(t=4..7)={:?}", trials, seed, disagree, &pos[4..8], &neg[4..8]);
}
