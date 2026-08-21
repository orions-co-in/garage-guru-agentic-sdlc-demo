#!/usr/bin/env bash
set -euo pipefail
# Print the live GG-2 story URL and expected Git naming for the demo.
cat <<'EOF'
Jira (source of truth)
  Epic  https://anka.atlassian.net/browse/GG-1
  Story https://anka.atlassian.net/browse/GG-2
  Node  https://anka.atlassian.net/browse/GG-3
  Web   https://anka.atlassian.net/browse/GG-4
  Apps  https://anka.atlassian.net/browse/GG-5
  QA    https://anka.atlassian.net/browse/GG-6

GitHub naming for this story
  git checkout -b feature/GG-2-booking-cancellation
  git commit -m "GG-2 add booking cancellation API"
  PR title: [GG-2] Implement service booking cancellation
EOF
