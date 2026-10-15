#!/usr/bin/env bash
cd "$(dirname "$0")"
echo "Watching resume.typ for changes (Press Ctrl+C to stop)..."
nix shell nixpkgs#typst -c typst watch resume.typ resume.pdf
