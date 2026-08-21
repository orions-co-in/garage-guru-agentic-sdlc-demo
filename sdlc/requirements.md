# GG-2 — Customer booking cancellation

**Jira:** https://anka.atlassian.net/browse/GG-2  
**Policy file:** `packages/shared-contracts/cancellation-policy.json`

Incoming request was only: *Customer should be able to cancel a GarageGuru service booking.* Development starts after these answers:

| Question | Answer |
| --- | --- |
| Which statuses can be cancelled? | `pending`, `confirmed` |
| After garage confirmation? | Yes, while still `confirmed` |
| Cutoff / fee? | Free if slot is more than 2 hours away; 50% if 2 hours or less (`confirmed` only) |
| Notify garage / technician? | Yes (`booking.cancelled`) |
| Payment, slot, history? | Refund minus fee, release slot, keep row as `cancelled` |

## Rules

- Pending: always free.
- Confirmed: 50% fee inside the 2-hour cutoff.
- `technician_en_route`, `in_progress`, `completed`, `cancelled`: reject `409 NOT_CANCELLABLE`.

## Acceptance criteria

1. BK-1001 pending → cancelled, fee 0, slot released, garage notified.
2. BK-1002 confirmed, 5h out → cancelled, fee 0, garage + technician notified.
3. BK-1003 confirmed, 45m out → UI shows 50% fee, then cancel.
4. BK-1004 en route → blocked.
5. BK-1005 completed → blocked.
6. History keeps the booking with `cancelledAt`.
