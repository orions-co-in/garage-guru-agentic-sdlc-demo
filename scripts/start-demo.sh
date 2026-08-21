#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
export PATH="${PATH}:/Users/mac/development/flutter/bin"

if [[ ! -d node_modules ]]; then
  npm install
fi

echo
echo "GarageGuru Agentic SDLC demo"
echo "  Web   http://localhost:5173"
echo "  API   http://localhost:8787/health"
echo "  Script: DEMO_SCRIPT.md"
echo

cleanup() {
  if [[ -n "${API_PID:-}" ]]; then
    kill "$API_PID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

npm run start:api &
API_PID=$!
sleep 0.5
npm run start:web
