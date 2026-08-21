# AI permission model

| Level | What AI may do | This demo |
| --- | --- | --- |
| 1 | Read Jira, GitHub, docs, logs | Incoming notes + docs |
| 2 | Prepare docs, Jira drafts, test cases, plans | `docs/01`–`docs/04` |
| 3 | Create branch, modify code, run tests, open PR | `apps/*`, tests, PR template |
| 4 | Deploy staging, prepare release candidate | Not automated here |
| 5 | Production deploy, rollback, secrets, infra | **Human only** |

Rule from the PPT: AI can prepare, implement, and recommend. Critical approvals stay with leads, reviewers, and QA.
