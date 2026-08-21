# GitHub Actions automation

These workflows are the PPT quality gates. They already ran on [PR #1](https://github.com/orions-co-in/garage-guru-agentic-sdlc-demo/pull/1).

| Workflow | File | When | What it does |
| --- | --- | --- | --- |
| Jira gate | `.github/workflows/jira-traceability.yml` | PR opened / updated | Fails if branch or title has no `GG-n`. Comments the Jira URL. |
| Quality gates | `.github/workflows/ci.yml` | PR and `main` | Lint, unit tests (Node + Dart policy), web build, `npm audit`. |
| Staging readiness | `.github/workflows/staging-gate.yml` | Push to `main` | Confirms the merge commit has a Jira key. Does **not** deploy GCP or production. |

## What to open in the demo

1. https://github.com/orions-co-in/garage-guru-agentic-sdlc-demo/pull/1
2. Checks tab: **Lint**, **Unit tests**, **Build**, **Security check**, **require-gg-key**
3. The bot comment **Jira gate** linking [GG-2](https://anka.atlassian.net/browse/GG-2)

## What is intentionally not automated

- Merge approval (human)
- GCP staging deploy (needs project secrets)
- Production deploy / rollback / secrets (Level 5)
