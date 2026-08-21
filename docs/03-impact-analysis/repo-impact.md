# Repository impact — GG-142

Output attached to the Jira ticket / PR, matching slide 7.

| Repository | Agent responsibility | Demo output |
| --- | --- | --- |
| GarageGuru Node backend | API, policy, refund, slot, notifications | `apps/api` — `POST /api/bookings/:id/cancel` |
| GarageGuru React web | Screen, state, API client, confirmation, failure | `apps/web` — booking list + cancel modal |
| Flutter customer app | Cancel action + policy | `packages/booking_policy` (customer-app rules) |
| Flutter garage / operations | Status + notification | Impact only — show `cancelled` and inbound event |
| Flutter technician | Notification | Impact only — inbound `booking.cancelled` |
| Remaining Flutter apps | Confirm no change | No booking-cancel UI |
| Shared contracts | Status enum, cutoff, fee | `packages/shared-contracts/cancellation-policy.json` |

## Shared code

Update `BookingStatus`, cancellation rules, and the cancel API contract once. Do not fork fee math in each app.
