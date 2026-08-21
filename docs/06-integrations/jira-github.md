# Real Jira + GitHub wiring

Local markdown in `docs/02-jira/` is a snapshot. **Source of truth is Jira project GG.**

| Ticket | Type | URL |
| --- | --- | --- |
| GG-1 | Epic | https://anka.atlassian.net/browse/GG-1 |
| GG-2 | Story | https://anka.atlassian.net/browse/GG-2 |
| GG-3 | Subtask — Node API | https://anka.atlassian.net/browse/GG-3 |
| GG-4 | Subtask — React web | https://anka.atlassian.net/browse/GG-4 |
| GG-5 | Subtask — Flutter apps | https://anka.atlassian.net/browse/GG-5 |
| GG-6 | Subtask — QA | https://anka.atlassian.net/browse/GG-6 |

## Naming (enforced in GitHub Actions)

- Branch: `feature/GG-2-booking-cancellation`
- Commit: `GG-2 add booking cancellation API`
- PR title: `[GG-2] Implement service booking cancellation`

CI fails any PR whose title and branch omit `GG-n`. On open, the workflow comments the Jira URL.

## Agent loop (what to demo)

1. Read the Jira story (not a local file).
2. Use `docs/06-integrations/repo-inventory.md` to name affected backend / web / Flutter apps.
3. Create a feature branch named after the Jira key.
4. Implement only in the listed apps.
5. Open a PR that includes the Jira key.
6. Humans review and merge. Agents do not push to `main` or deploy production.

## GitHub org note

This GitHub account (`sameer320`) cannot see `garage-guru/garage_guru_app`. The live GitHub demo uses this control-plane repo. Point `repo-inventory.md` at the GarageGuru org remotes once this account has org access.
