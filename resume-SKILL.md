# Instructions for editing this resume

Use this file as the source of truth for the resume's current visual style. Keep this guidance short and follow the existing design unless the user asks for a format change.

## Files and responsibilities

- `private/profile.typ` contains all candidate details and resume content. It is private and ignored by Git. Create it if it does not exist, using the fields imported by `resume.typ`.
- `resume.typ` controls page setup, typography, colors, section order, spacing, and layout. When the user asks for a formatting change, update this file so the preference persists in future builds.
- `private/resume.pdf` is generated. Never edit it directly.
- `./compile.sh` compiles `resume.typ` into `private/resume.pdf`.

## Normal workflow

1. Interpret the user's requested content or design change.
2. Edit `private/profile.typ` for resume content, or `resume.typ` for formatting. Edit both only if needed.
3. Run `./compile.sh` after edits so the user gets an updated PDF.
4. Report which source file changed and where the PDF was saved. If compilation fails, explain the error and fix it when possible.

When the user edits `private/profile.typ` manually, the next build is simply `./compile.sh`. There is no separate sync step.

## Content guidance

- Preserve the user's facts. Never invent employers, dates, metrics, tools, degrees, or outcomes.
- Improve clarity and relevance without changing the meaning. Ask for missing facts only when they are needed to make a requested claim accurate.
- Keep bullets concise, specific, and focused on the user's contribution and result. Use numbers only when supplied or verified by the user.
- Tailor to a supplied job description by emphasizing genuinely matching skills and experience; do not add keywords unsupported by the user's history.
- Preserve the current section order and content unless the user requests a change.

## Formatting and Typst guidance

- Preserve the existing visual style unless the user asks to change it. Treat requested format preferences as durable and record their implementation in `resume.typ`.
- Keep the resume readable and ATS-friendly: normal text flow, clear standard headings, and only simple grids for aligned short fields such as dates or skill labels.
- The current design targets one US Letter page. Keep it to one page when reasonably possible, but do not make text too small or margins uncomfortably narrow to force a fit. If content overflows, first suggest trimming or tightening content.
- In Typst markup, escape `@` in email text (`\@`) where needed. Prefer en dashes (`–`) for ranges and labels that might be misread as list syntax.
- Keep candidate data in `private/profile.typ`; do not move personal information into tracked documentation or layout source.

## Build and review

Run `./compile.sh` after each requested edit. Confirm the command succeeds and that `private/resume.pdf` is produced. If layout changes are substantial, inspect the rendered PDF when preview tools are available and make obvious corrections before reporting completion.
