# GarageGuru Agentic SDLC Demo

Local demo for the **GarageGuru — Agentic AI Enabled SDLC** team presentation.

It walks one realistic ticket from a messy request to a running change:

> Customer should be able to cancel a GarageGuru service booking

That maps to live Jira **[GG-2](https://anka.atlassian.net/browse/GG-2)** (epic [GG-1](https://anka.atlassian.net/browse/GG-1)), not a local markdown ticket.

## What this demo shows

| Slide theme | What to open |
| --- | --- |
| Messy incoming request | `docs/00-incoming/` |
| Requirement agent | `docs/01-requirements/` |
| Jira epic / story / tasks | https://anka.atlassian.net/browse/GG-2 |
| Repo impact (Node, React, Flutter) | `docs/03-impact-analysis/` |
| Implementation on a feature branch | `apps/api`, `apps/web` |
| Quality gates | `.github/workflows/ci.yml` + `npm test` |
| DoR / DoD / AI permission levels | `docs/governance/` |

## Quick start

```bash
cd ~/Projects/garage-guru-agentic-sdlc-demo
npm install
npm run demo
```

Then open:

- Web app: http://localhost:5173
- API health: http://localhost:8787/health
- Talk track: [DEMO_SCRIPT.md](DEMO_SCRIPT.md)

## Demo bookings

| Booking | Status | Slot | Expected cancel result |
| --- | --- | --- | --- |
| BK-1001 | Pending | tomorrow | Allowed, no fee |
| BK-1002 | Confirmed | in 5 hours | Allowed, no fee |
| BK-1003 | Confirmed | in 45 minutes | Allowed, 50% fee |
| BK-1004 | Technician en route | now | Blocked |
| BK-1005 | Completed | yesterday | Blocked |

## Quality gates

```bash
npm test
npm run lint
```

CI is defined in `.github/workflows/ci.yml` (lint, unit tests, web build). `.github/workflows/jira-traceability.yml` fails any PR that is missing a `GG-n` key and comments the Jira URL.

This demo does **not** deploy to GCP; staging/production remain a human gate.

## Jira + GitHub

- Board: https://anka.atlassian.net/jira/software/projects/GG
- Story: https://anka.atlassian.net/browse/GG-2
- How they connect: `docs/06-integrations/jira-github.md`
- Which real apps move: `docs/06-integrations/repo-inventory.md`
