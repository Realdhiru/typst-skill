# Typst Resume Engine

A minimalist, high-density, single-page technical resume engine built with [Typst](https://typst.app/).

Designed for software engineers and systems builders who require a deterministic, ATS-compliant, single-page resume with precise typesetting without LaTeX overhead.

---

## Features

- **Decoupled Architecture:** Core typesetting and layout (`resume.typ`) are decoupled from candidate data (`profile.typ`). Personal data is kept outside git tracking.
- **Deterministic 1-Page Layout:** Typographic rhythm calibrated to fit extensive technical experience onto exactly one page.
- **ATS Compliant:** Generates a clean, linear text stream without nested tables, text boxes, or unparsed glyphs.
- **Sub-Second Live Rebuilds:** Hot-reloads on save via `./watch.sh`.
- **Integrated AI Agent Playbook:** Includes `resume-SKILL.md` containing operational rules for aligning bullets with job descriptions.

---

## Repository Structure

The public repository contains only the engine code and schema templates:

```
typst-skill/
├── resume.typ          # Core typesetting and layout engine
├── profile.example.typ # Public schema template with placeholder data
├── resume-SKILL.md     # AI agent playbook and operational standards
├── compile.sh          # One-step compilation script
├── watch.sh            # Live-reload watch daemon
├── Makefile            # Build targets (all, watch, clean)
├── .gitignore          # Rules preventing accidental upload of personal data
└── README.md           # Documentation
```

---

## Quick Start (For Cloned Repositories)

### 1. Requirements

The project uses [Typst](https://github.com/typst/typst). On systems with Nix, dependencies are resolved dynamically:

```bash
# Executed automatically via `nix shell nixpkgs#typst` inside compile scripts
```

On other systems, install `typst` using your package manager or cargo:

```bash
cargo install --locked typst-cli
```

### 2. Configure Profile Data

The layout engine imports candidate data from `profile.typ`. You can either create it directly in the project root (it is git-ignored) or store it in your private local directory and symlink it.

#### Option A: Direct local file
```bash
cp profile.example.typ profile.typ
```

#### Option B: Dedicated private directory (Recommended for git contributors)
Keep your personal data outside the repository tree:
```bash
# 1. Create a private directory outside your git tree
mkdir -p ~/.local/share/resume-private

# 2. Copy the template and edit it
cp profile.example.typ ~/.local/share/resume-private/profile.typ
$EDITOR ~/.local/share/resume-private/profile.typ

# 3. Symlink it into the repository
ln -s ~/.local/share/resume-private/profile.typ ./profile.typ
```

### 3. Build & Preview

```bash
# Compile to resume.pdf
./compile.sh

# Or start the live-reload watch daemon
./watch.sh
```

View the generated PDF (`resume.pdf`) in your preferred document viewer (e.g., Zathura, Evince, or VS Code PDF preview).

---

## Privacy Policy

The repository is configured to exclude personal data from source control:
- `profile.typ` is ignored by `.gitignore`.
- Generated artifacts (`*.pdf`, `*.png`) are ignored.
- Only the engine layout, mock schema, and build scripts are tracked.

---

## License

MIT
