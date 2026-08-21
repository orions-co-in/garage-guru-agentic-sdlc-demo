#!/usr/bin/env bash
set -euo pipefail
# Install a GarageGuru Cursor role + GitHub SDLC files into one product repo.
# Usage: ./scripts/install-role.sh <backend|web|flutter|qa|tech-lead> /path/to/their-repo

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ROLE="${1:-}"
TARGET="${2:-}"

usage() {
  echo "Usage: $0 <backend|web|flutter|qa|tech-lead> /path/to/repo"
  exit 1
}

[[ -n "$ROLE" && -n "$TARGET" && -d "$TARGET" ]] || usage
[[ -d "$ROOT/roles/$ROLE" ]] || { echo "Unknown role: $ROLE"; exit 1; }

mkdir -p "$TARGET/.cursor/rules" "$TARGET/.github/workflows" "$TARGET/.githooks"

cp "$ROOT/roles/shared/.cursor/rules/gg-sdlc.mdc" "$TARGET/.cursor/rules/"
cp "$ROOT/roles/$ROLE/.cursor/rules/"*.mdc "$TARGET/.cursor/rules/"
cp "$ROOT/templates/github/PULL_REQUEST_TEMPLATE.md" "$TARGET/.github/"
cp "$ROOT/templates/github/workflows/jira-traceability.yml" "$TARGET/.github/workflows/"
cp "$ROOT/templates/git/commit-msg" "$TARGET/.githooks/commit-msg"
chmod +x "$TARGET/.githooks/commit-msg"

case "$ROLE" in
  backend)
    cp "$ROOT/templates/github/workflows/api-quality-gates.yml" "$TARGET/.github/workflows/ci.yml"
    cp "$ROOT/templates/github/workflows/staging-gate.yml" "$TARGET/.github/workflows/staging-gate.yml"
    ;;
  web)
    cp "$ROOT/templates/github/workflows/web-quality-gates.yml" "$TARGET/.github/workflows/ci.yml"
    cp "$ROOT/templates/github/workflows/staging-gate.yml" "$TARGET/.github/workflows/staging-gate.yml"
    ;;
  flutter)
    cp "$ROOT/templates/github/workflows/flutter-quality-gates.yml" "$TARGET/.github/workflows/ci.yml"
    ;;
esac

echo "Installed '$ROLE' SDLC pack into $TARGET"
echo "Open that folder in Cursor. Developers stay in this repo only."
