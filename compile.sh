#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

if [[ ! -f private/profile.typ ]]; then
  echo "Missing private/profile.typ. Ask your AI assistant to create it from your resume information." >&2
  exit 1
fi

mkdir -p private
if command -v typst >/dev/null 2>&1; then
  typst compile resume.typ private/resume.pdf
elif command -v nix >/dev/null 2>&1; then
  nix shell nixpkgs#typst -c typst compile resume.typ private/resume.pdf
else
  echo "Typst is not installed. Install Typst or Nix, then run ./compile.sh again." >&2
  exit 1
fi

echo "Resume created at private/resume.pdf"
