# GarageGuru SDLC kit

This repo is **not** where feature code lives. GarageGuru is **one Jira project, many GitHub repos**. Each developer works in their own codebase with their own Cursor role.

```
Jira GG  →  backend repo PR
         →  web repo PR
         →  each Flutter app PR
```

## Repos

| Role | Repo | Jira for GG-2 |
| --- | --- | --- |
| SDLC / process | this repo | — |
| Backend | https://github.com/orions-co-in/garageguru-api | [GG-3](https://anka.atlassian.net/browse/GG-3) |
| Web | https://github.com/orions-co-in/garageguru-web | [GG-4](https://anka.atlassian.net/browse/GG-4) |
| Flutter apps | existing app repos (`garage_guru_app`, customer, staff, …) | [GG-5](https://anka.atlassian.net/browse/GG-5) |

Story: https://anka.atlassian.net/browse/GG-2

## What each developer does

1. Clone **their** repo (API or web or one Flutter app).
2. Open that folder in Cursor. Role rules are already in `.cursor/rules/` for API and web.
3. For an existing Flutter/QA repo, install the role pack from this kit (see below).
4. Pick the Jira task for their layer. Create `feature/GG-n-…` in **their** repo only.
5. Open a PR. GitHub Actions in that repo check lint/tests and the Jira key.
6. They do not put API + web + Flutter in one PR.

Their AI (Cursor / Copilot) stays on their machine. The role rule tells it: this repo only, Jira key required, no production deploy.

## Install a role onto an existing repo

From this kit:

```bash
./scripts/install-role.sh backend /path/to/garageguru-api
./scripts/install-role.sh web /path/to/react-repo
./scripts/install-role.sh flutter /path/to/garage_guru_app
./scripts/install-role.sh qa /path/to/any-gg-repo
./scripts/install-role.sh tech-lead /path/to/any-gg-repo
```

That copies Cursor rules, PR template, Jira-key workflow, and the matching quality pipeline.

## Run the GG-2 slice locally

Two terminals:

```bash
cd ~/Projects/garageguru-api && npm start
cd ~/Projects/garageguru-web && npm install && npm run dev
```

Web: http://localhost:5173 (proxies to the API on 8787).
