---
name: typst-resume-architect
description: Comprehensive operational standard and playbook for crafting, maintaining, and tailoring high-impact, single-page software engineering and systems resumes using Typst.
---

# Typst Resume Architecture & Maintenance Guide

This skill is the single unified standard for engineering, maintaining, and tailoring single-page technical resumes using **Typst**. It synthesizes principles from top ATS screening engines, technical recruiters, and systems engineering standards.

---

## 1. Non-Negotiable Operational Invariants

1. **Strict Single-Page Constraint (`Pages: 1`)**:
   - Undergraduate and early-career software resumes MUST fit on **exactly one page**.
   - After any change, run:
     ```bash
     nix shell nixpkgs#poppler-utils -c pdfinfo resume.pdf | grep "Pages:"
     # Must assert: Pages: 1
     ```
   - If content spills onto Page 2, sequentially tune:
     1. **Prune weak details / merge lines**: Check Education or bullet lengths (a bullet spilling 2 words onto a new line wastes 14pt).
     2. **Bullet rhythm**: Tune `#set list(spacing: 3.8pt - 4.2pt)`.
     3. **Paragraph leading**: Tune `#set par(leading: 0.52em - 0.55em)`.
     4. **Margins**: Keep within safe limits `(x: 0.44in, top: 0.32in, bottom: 0.30in)`. Never reduce below `0.28in`.

2. **Decoupled Architecture (PII Separation)**:
   - Layout code (`resume.typ`) MUST be decoupled from candidate data (`profile.typ`).
   - `profile.typ` contains personal identifiable information (name, phone, email, experience) and is ignored by git (`.gitignore`).
   - `profile.example.typ` provides a safe, generic schema template for open-source repositories.

3. **Typographic Standard (Classic Ivy / Jake's Serif Archetype)**:
   - **Typefaces**: High-contrast, clean serifs (`Liberation Serif`, `TeX Gyre Termes`, `DejaVu Serif`).
   - **Header Hierarchy**:
     - Candidate Name: `16.5pt` – `17.5pt`, bold, all-caps, centered.
     - Contact Line: `8.9pt` – `9.1pt`, centered, with bullet or pipe (`|`) delimiters.
     - Section Headers: `9.9pt` – `10.2pt`, bold, all-caps, followed immediately by a thin rule (`0.55pt + black`).
     - Body Text: `9.1pt` – `9.3pt`, justified (`justify: true`), leading `0.52em` – `0.56em`.
     - Hyperlinks: Clean corporate cobalt (`rgb("#0047AB")`), underlined with slight offset (`offset: 1.5pt`), escape `@` characters as `\@`.

---

## 2. High-Impact Content Frameworks

### The Bullet Point Formula (Google X-Y-Z Method)
Every bullet must demonstrate engineering complexity and measurable results:
> **Accomplished [X] as measured by [Y] by doing [Z]**

* ❌ **Passive/Weak:** "Worked on Linux and created shell scripts."
* ✅ **Engineered/Impact:** "Architected a reproducible, declarative Linux environment on NixOS using hermetic Nix Flakes, custom kernel sysctl parameters, and unified hardware profile abstractions."
* ❌ **Passive/Weak:** "Built a rate limiter using AWS."
* ✅ **Engineered/Impact:** "Engineered a high-throughput distributed rate limiter implementing Token Bucket with zero race conditions using Amazon DynamoDB atomic conditional writes."

### High-Impact Verb Categories
* **Architecture:** *Architected, Engineered, Designed, Deployed, Standardized, Decoupled.*
* **Performance:** *Optimized, Accelerated, Streamlined, Minimized, Scaled, Throttled.*
* **Reliability:** *Hardened, Automated, Instrumented, Remediated, Isolated, Audited.*

---

## 3. ATS Screening & Verification Standard

Applicant Tracking Systems (Workday, Greenhouse, Lever) convert PDFs into raw plaintext. Ensure:
1. **Clean Text Layer**: Verify text extraction using:
   ```bash
   nix shell nixpkgs#poppler-utils -c pdftotext -layout resume.pdf - | head -n 30
   ```
2. **Standard Section Names**: Use universally parsed headings:
   - `PROFESSIONAL SUMMARY`
   - `FEATURED ENGINEERING PROJECTS`
   - `EXPERIENCE & INTERNSHIPS`
   - `OPEN SOURCE & COMMUNITY`
   - `TECHNICAL SKILLS`
   - `EDUCATIONAL QUALIFICATIONS`
3. **No Multi-Column Tables for Text**: Keep narrative descriptions in full-width blocks; only use simple 2-column key-value grids for skills and header rows.

---

## 4. Role Tailoring Runbook (Job Description Matching)

When tailoring a resume for a specific job description:
1. **Extract Core Hard Skills & Requirements**: Identify 4–6 core keywords from the JD (e.g. *Distributed Systems, Go, Kubernetes, Terraform, Observability*).
2. **Re-rank Skills**: Move matching keywords to the front of the relevant category in `profile.typ`.
3. **Align Summary Statement**: Directly mirror the target role title and top 3 requirements in the first sentence.
4. **Mirror Project Metrics**: Ensure the top 2 projects highlight challenges and technologies referenced in the JD.

---

## 5. Directory Structure & Workflows

```
Projects/resume/
├── resume.typ          # Typst layout & styling engine (Public safe)
├── profile.example.typ # Schema template with placeholder data (Public safe)
├── profile.typ         # Real candidate content & PII (Ignored by git)
├── resume.pdf          # Compiled single-page artifact (Ignored by git)
├── compile.sh          # Quick compile script
├── watch.sh            # Live-reload watch daemon
├── Makefile            # Build targets
├── .gitignore          # Prevents accidental upload of PII
├── resume-SKILL.md     # This unified operational playbook
└── archive/            # Reference materials & text extracts
```

### Compilation Commands
```bash
# Build PDF
./compile.sh

# Live watch during editing
./watch.sh
```

---

## 6. Critical Typst Syntax Guards

* **Email Escaping**: In Typst markup `[...]`, `@` initiates an internal label reference. Always escape email addresses with `\@` (e.g. `user\@domain.com`).
* **Dash List-Item Trap**: If a parameter starts with `- `, Typst may parse it as a bullet list. Always use en-dashes `– ` or `-- `.
* **Parameter Shadowing**: Never name template variables `right` or `left` inside grid helper functions, as they shadow Typst alignment keywords.
