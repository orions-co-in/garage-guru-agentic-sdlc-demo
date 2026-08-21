# Governance

## Definition of Ready

- Requirement is clear
- Acceptance criteria are testable
- Open questions are resolved
- Affected systems are identified (`sdlc/repos.md`)
- Dependencies and risks are captured

## Definition of Done

- Code reviewed
- CI passed
- Tests completed
- Staging verified
- Production deployed and smoke-tested (human)
- Release note updated

## AI permission

| Level | Allowed |
| --- | --- |
| 1 | Read Jira, GitHub, docs |
| 2 | Draft docs, tickets, tests, plans |
| 3 | Branch, code, tests, open PR |
| 4 | Prepare staging (not GCP yet) |
| 5 | Production, secrets, rollback — **human only** |

AI prepares and implements. Humans approve requirements, merge, and production.
