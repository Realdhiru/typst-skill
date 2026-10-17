# Resume builder

This project turns your resume information into a PDF with Typst. The normal workflow is AI-first: tell your AI assistant what information to add or change, have it update the files, and ask it to rebuild the PDF.

## The three files to know

- `private/profile.typ` — your resume content and personal details. It is private and ignored by Git.
- `resume.typ` — the visual design and formatting rules. Ask the AI to edit this when you want a design or layout change.
- `private/resume.pdf` — the generated resume. Open this to review the result.

`compile.sh` is the one build command. Other files are project setup or Git settings; you do not need to use them in your normal workflow.

## Using the resume builder

1. Tell your AI assistant what to change, for example: “Add this project to my resume…” or “Make the section headings smaller.”
2. The assistant edits `private/profile.typ` for content or `resume.typ` for formatting, then runs `./compile.sh`.
3. Open `private/resume.pdf` and check the result. If something needs adjustment, describe it to the assistant.

You can also edit `private/profile.typ` yourself. Save it, then run `./compile.sh` from this project folder. Open the refreshed `private/resume.pdf`. You do not need to run a separate sync or watch command.

## Build requirement

The build script uses an installed `typst` command when available. Otherwise it uses Nix to run Typst. Install either Typst or Nix once if neither is installed.

## Privacy

`private/` contains personal details, generated resumes, previews, and reference material. Git ignores the entire directory, so it stays on your machine and is not included in commits. Keep your backups of this directory if you need them; ignored files are not stored in the repository history.
