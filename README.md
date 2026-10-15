# Typst Resume Engine

A minimalist, high-density, single-page technical resume engine built with [Typst](https://typst.app/).

Designed for software engineers, systems programmers, and DevOps practitioners who require a deterministic, ATS-compliant, single-page resume with precise typesetting without LaTeX overhead.

---

## Features

- **Decoupled Architecture:** Layout and typography (`resume.typ`) are strictly separated from candidate data (`profile.typ`). Personal data is excluded via `.gitignore` by default.
- **Deterministic 1-Page Layout:** Balanced typographic margins and vertical line height calibrated to fit technical experience onto a single page.
- **ATS Compliant:** Generates a linear, machine-parseable text stream without multi-column table constructs or unparsed glyphs.
- **Sub-Second Compilation:** Live-reload preview on document modification via `./watch.sh`.
- **Integrated Agent Playbook:** Includes `resume-SKILL.md` defining operational standards for tailoring bullet points to target job specifications.

---

## Requirements

The project uses Typst. On systems with Nix installed, dependencies are resolved dynamically via the shell wrapper:

```bash
# Handled via `nix shell nixpkgs#typst` inside compile scripts
```

Standalone binary installation options are detailed in the [upstream repository](https://github.com/typst/typst):

```bash
cargo install --locked typst-cli
```

---

## Usage

### 1. Configure Profile Data

Copy the example schema and populate candidate fields:

```bash
cp profile.example.typ profile.typ
```

Populate contact coordinates, work history, projects, and education in `profile.typ`.

### 2. Compilation and Live Preview

```bash
# Single build -> resume.pdf
./compile.sh

# Continuous rebuild daemon
./watch.sh
```

View the generated PDF (`resume.pdf`) using any Wayland/X11 document viewer (e.g., Zathura, Evince).

---

## Project Structure

```
.
├── resume.typ          # Core layout engine and typography definitions
├── profile.example.typ # Public schema template with mock data
├── profile.typ         # Candidate profile data (untracked)
├── resume.pdf          # Compiled output document (untracked)
├── resume-SKILL.md     # Operational standard and tailoring playbook
├── compile.sh          # Batch compilation script
├── watch.sh            # Inotify-driven compile daemon
├── Makefile            # POSIX make targets (all, watch, preview, clean)
└── .gitignore          # Exclusion rules for local artifacts and PII
```

---

## Privacy Policy

The repository is configured to exclude personal data from source control:
- `profile.typ` is ignored.
- Generated binaries (`*.pdf`) and raster previews (`*.png`) are ignored.
- Only the core layout engine, build tooling, and schema definitions are tracked.

---

## License

MIT
