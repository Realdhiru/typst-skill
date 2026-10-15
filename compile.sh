#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
nix shell nixpkgs#typst -c typst compile resume.typ resume.pdf
echo "Successfully compiled resume.typ -> resume.pdf"
