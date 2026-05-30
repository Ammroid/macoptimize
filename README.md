# macoptimize

> MacBook Pro M1/M2/M3 Performance Optimizer & Monitor — pure bash, zero dependencies, no App Store needed.

Built for developers running **Android, iOS, AI agents, and CLI tools** on Apple Silicon. Detects resource hogs, cleans dev caches, and keeps your Mac fast while your AI tools work hard.

---

## Install

### Homebrew (recommended)

```bash
brew install ammroid/tap/macoptimize
```

### One-line installer

```bash
curl -fsSL https://raw.githubusercontent.com/Ammroid/macoptimize/main/install.sh | bash
```

### Manual

```bash
curl -fsSL https://raw.githubusercontent.com/Ammroid/macoptimize/main/macoptimize -o ~/bin/macoptimize
chmod +x ~/bin/macoptimize
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
```

### Upgrade

```bash
brew upgrade macoptimize         # via Homebrew
# or just re-run install.sh        # one-liner
```

**Requirements:** macOS 12+ · Apple Silicon or Intel · bash (pre-installed) · no dependencies

---

## Commands

```
macoptimize status          # System health report (CPU, RAM, swap, disk, thermal)
macoptimize hogs            # Detect resource hogs & abnormal processes
macoptimize monitor         # Live dashboard — refreshes every 3s
macoptimize storage         # Interactive storage manager (TUI)
macoptimize clean           # Interactive cleanup (Xcode, Gradle, npm, Docker caches)
macoptimize cache           # Universal cache scanner — node/python/rust/go/mobile/ide/...
macoptimize optimize        # Performance tweaks (DNS, Spotlight, animations)
macoptimize quick           # Fast safe 1-command cleanup
macoptimize dev             # Developer environment health check
macoptimize kill-devservers # Kill orphaned webpack/vite/metro/expo servers
macoptimize all             # Full report: status + hogs + dev
```

### `cache` — universal cache scanner

Inventories 50+ caches across categories with size + location, then asks before cleaning each:

```bash
macoptimize cache                    # Scan everything, interactive clean
macoptimize cache --report           # Report-only, no cleaning
macoptimize cache --node             # Only node ecosystem
macoptimize cache --python           # Only Python
macoptimize cache --mobile           # Only Xcode/Gradle/CocoaPods
macoptimize cache --projects         # Also scan local repos for node_modules, .next, .turbo, __pycache__, target…
macoptimize cache --clean            # Skip prompts (auto-clean)
```

Covers: **node** (npm, yarn, pnpm, bun, Playwright, Cypress, Puppeteer, Electron), **python** (pip, poetry, uv, pipenv, conda, HuggingFace, PyTorch), **rust/go/ruby/deno**, **mobile** (Xcode DerivedData, iOS DeviceSupport, Gradle, CocoaPods, Carthage), **IDE** (VS Code, Cursor, JetBrains), **system** (Homebrew, QuickLook, logs), **browsers** (Safari, Chrome, Firefox, Arc).

---

## Demo

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  System Health Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

▸ CPU & Memory
  ─────────────────────────────────
  ✓ CPU: 31.2% average per core
  ✓ Memory free: 50%
  ✗ Swap used: 3469M (HIGH - causing SSD wear & slowness)

▸ Disk
  ─────────────────────────────────
  ✓ Disk usage: 49% (16Gi free)

▸ Thermal & Power
  ─────────────────────────────────
  ✓ No thermal throttling detected
  ℹ Power: Battery Power
```

---

## What It Detects

| Problem | Command | Severity |
|---------|---------|----------|
| High CPU >80% per core | `status` | 🔴 |
| Memory free <15% | `status` | 🔴 |
| Swap >500MB | `status` | 🔴 |
| Disk >90% full | `status` | 🔴 |
| CPU thermal throttling | `status` | 🔴 |
| Process >20% CPU sustained | `hogs` | 🔴 |
| Process >5% RAM | `hogs` | 🟡 |
| Zombie processes | `hogs` | 🔴 |
| Orphaned dev servers | `dev` | 🟡 |
| Spotlight heavy indexing | `optimize` | 🟡 |

---

## Dev Cache Cleanup

`macoptimize clean` targets (interactive, asks before deleting):

| Cache | Typical Size Freed |
|-------|--------------------|
| Xcode DerivedData | 2–20 GB |
| Xcode Archives | 1–10 GB |
| iOS DeviceSupport | 2–15 GB |
| Gradle caches | 1–5 GB |
| Android AVDs | 5–30 GB |
| CocoaPods cache | 0.5–3 GB |
| npm/yarn/pnpm/bun | 1–5 GB |
| Docker images | 5–50 GB |
| Old system logs | 0.1–2 GB |

---

## Safety

- **Never deletes without asking** — interactive prompts on `clean`
- `quick` and `optimize` apply only safe, reversible changes
- `kill-devservers` confirms before killing each process group
- No system files modified · No third-party dependencies

---

## Typical Workflow

```bash
# Morning check
macoptimize status

# Mac feels slow — find the culprit
macoptimize hogs

# Weekly cleanup (free up 10–50 GB)
macoptimize clean

# Before a big build
macoptimize quick

# Watch system during heavy AI workload
macoptimize monitor

# After a long session
macoptimize kill-devservers
```

---

## License

MIT — free to use, modify, and distribute.

---

*Built for developers who run AI agents, Android emulators, iOS simulators, and everything else simultaneously on Apple Silicon.*
