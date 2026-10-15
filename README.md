# 📄 Typst Resume Engine

A minimalist, high-density, single-page technical resume engine built with **[Typst](https://typst.app/)**.

Designed for software engineers, DevOps, and systems builders who want an ATS-compliant, single-page resume with pixel-perfect typesetting—without LaTeX bloat or manual layout hassles.

---

## ✨ Features

- **🛡️ Privacy-First (Decoupled Data):** Formatting (`resume.typ`) is completely separated from candidate data (`profile.typ`). Your PII is git-ignored by default, making this repository safe to publish publicly.
- **⚡ Strict 1-Page Layout:** Balanced margins and vertical rhythm engineered to fit an entire technical career onto **exactly one page**.
- **🤖 ATS-Optimized:** Linear text layer without fragile multi-column tables, text boxes, or unparsed glyphs.
- **🔥 Live Preview:** Sub-50ms instant re-renders while typing via `./watch.sh`.
- **🧠 Built-In AI Agent Skill:** Includes `resume-SKILL.md`, enabling AI pair programmers to tailor bullets and re-rank skills against any Job Description.

---

## 🚀 Quick Start

### 1. Requirements

You only need **Typst**. If you use Nix:
```bash
# Handled automatically inside compile scripts via `nix shell nixpkgs#typst`
```
Or install standalone Typst from [typst.app](https://github.com/typst/typst):
```bash
cargo install --locked typst-cli
# or via your package manager (brew, pacman, apt)
```

### 2. Setup Your Profile

Copy the public example template to your private profile:
```bash
cp profile.example.typ profile.typ
```
Open `profile.typ` and fill in your details (name, contact links, experience, and projects).

### 3. Build & Preview

```bash
# Compile once to resume.pdf
./compile.sh

# Or start the live-reload watch daemon
./watch.sh
```

Open `resume.pdf` in any viewer (e.g., Zathura, Evince, VS Code preview). Changes to `profile.typ` or `resume.typ` will recompile immediately on save.

---

## 🛠️ Project Structure

```
.
├── resume.typ          # Layout engine & styling (safe for git)
├── profile.example.typ # Generic dummy data template (safe for git)
├── profile.typ         # Your actual private information (git-ignored)
├── resume.pdf          # Compiled output PDF (git-ignored)
├── resume-SKILL.md     # Engineering guidelines & ATS tailoring playbook
├── compile.sh          # One-step compile script
├── watch.sh            # Live-reload watch daemon
├── Makefile            # Build shortcuts (`make`, `make watch`, `make clean`)
└── .gitignore          # Keeps private PII off GitHub
```

---

## 🔒 Privacy & GitHub Usage

This repo is pre-configured with a `.gitignore` that prevents your personal identifiable information from being staged:
- `profile.typ` (your actual data) is **ignored**.
- `*.pdf` and temporary preview images are **ignored**.
- Only the generic engine, documentation, and `profile.example.typ` will be pushed.

---

## 📜 License

MIT License. Feel free to fork, adapt, and use for your own job search!
