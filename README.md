# GarageGuru — Agentic SDLC

Operating model from the team PPT: **Requirement → Jira → GitHub → Actions → (later) GCP**.

`apps/api` and `apps/web` are the development code for the first slice: **customer booking cancellation** ([GG-2](https://anka.atlassian.net/browse/GG-2)).

```
apps/api          Node API
apps/web          React web
packages/         Shared cancel policy (JSON + Dart for Flutter)
.github/          PR template + quality gates + Jira key check
sdlc/             Requirements, repo impact, DoR/DoD
```

## Run

```bash
npm install
npm run start
```

- Web: http://localhost:5173
- API: http://localhost:8787/health

| Booking | Result |
| --- | --- |
| BK-1001 pending | Cancel, no fee |
| BK-1002 confirmed, 5h | Cancel, no fee |
| BK-1003 confirmed, 45m | 50% fee |
| BK-1004 en route | Blocked |
| BK-1005 completed | Blocked |

## SDLC links

| Step | Where |
| --- | --- |
| Board | https://anka.atlassian.net/jira/software/projects/GG |
| Story | https://anka.atlassian.net/browse/GG-2 |
| PR | https://github.com/orions-co-in/garage-guru-agentic-sdlc-demo/pull/1 |
| Requirements | `sdlc/requirements.md` |
| Which apps change | `sdlc/repos.md` |
| DoR / DoD / AI levels | `sdlc/governance.md` |

Branch: `feature/GG-2-booking-cancellation`  
PR title: `[GG-2] …`  
CI: lint, tests, build, security, Jira key. No production deploy.
