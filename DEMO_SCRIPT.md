# 12-minute demo script

Use the PPT for the operating model. Use this repo for the live proof.

**Goal:** show that AI prepares work, humans keep the gates, and one booking-cancellation change stays traceable from notes → Jira → branch → tests.

## Before the meeting (2 minutes)

1. Open the PPT.
2. In a terminal:

   ```bash
   cd ~/Projects/garage-guru-agentic-sdlc-demo
   npm run demo
   ```

3. Keep three things ready:
   - PPT
   - this repo in Cursor
   - browser at http://localhost:5173
   - Jira story https://anka.atlassian.net/browse/GG-2
   - GitHub repo https://github.com/orions-co-in/garage-guru-agentic-sdlc-demo

## 0:00–2:00 — Why this exists (slides 1–3)

Say: GarageGuru is not one app. It is Node, React, and six Flutter apps, with three deploy targets. The risk is not only coding. It is unclear requirements moving into development.

Point at the flow on slide 3: Requirement → Jira → GitHub → CI/CD → GCP.

## 2:00–4:00 — Requirement agent (slides 4–5)

Open `docs/00-incoming/meeting-notes.md`.

Read the raw line: *“Customer should be able to cancel a GarageGuru service booking.”*

Then open `docs/01-requirements/open-questions.md` and show that the agent asked the same five questions from the slide:

- Which statuses can be cancelled?
- Allowed after garage confirmation?
- Cutoff / fee?
- Notify garage / technician?
- What happens to payment, slot, and history?

Open `docs/01-requirements/acceptance-criteria.md` and say: **this is now testable**. Development does not start from a one-line request.

## 4:00–6:00 — Docs + Jira + human gate (slide 6)

Open the live Jira story https://anka.atlassian.net/browse/GG-2 (epic https://anka.atlassian.net/browse/GG-1). Keep `docs/02-jira/` only as a backup snapshot.

Show the split:

- Epic = booking cancellation capability
- Story = customer cancels a booking
- Tasks = Node / React / Flutter / QA

Say the naming standard out loud:

- Branch: `feature/GG-2-booking-cancellation`
- Commit: `GG-2 add booking cancellation API`
- PR: `[GG-2] Implement service booking cancellation`

Human gate: requirement reviewed, scope confirmed, approved for development. AI did not skip that.

## 6:00–7:30 — Impact analysis (slide 7)

Open `docs/03-impact-analysis/repo-impact.md`.

Make the point: the agent names **which** apps change.

- Customer app: cancel action
- Garage / operations app: status + notification
- Technician app: notification only
- Node API: rules, refund, slot release
- React web: confirmation + fee + failure states

This is why we do impact analysis before coding.

## 7:30–10:30 — Live product (slides 8–10)

Browser: http://localhost:5173

Walk the five bookings:

1. **BK-1001** pending → cancel, no fee, garage notified.
2. **BK-1002** confirmed, 5 hours out → cancel, no fee.
3. **BK-1003** confirmed, 45 minutes out → fee warning, then cancel.
4. **BK-1004** en route → blocked.
5. **BK-1005** completed → blocked.

Then in the terminal:

```bash
npm test
```

Say: no ticket moves to Done until ACs, automated checks, and QA evidence exist.

Optional: open `.github/PULL_REQUEST_TEMPLATE.md` and `.github/workflows/ci.yml`. AI may open the PR. It does not merge itself or ship production.

## 10:30–12:00 — Governance and rollout (slides 12–14)

Open `docs/governance/ai-permission-model.md`.

One sentence: **Level 3 is the demo you just saw** (branch, code, tests, PR). **Level 5 stays human** (production, secrets, rollback).

Close with Phase 1 from the PPT: templates, branch rules, DoR/DoD — this repo is that Phase 1 sample, plus a working cancellation slice.

## If someone asks “is this replacing engineers?”

No. Agents extract facts, draft tickets, implement on a branch, and generate tests. Leads still approve requirements, review PRs, and release production.
