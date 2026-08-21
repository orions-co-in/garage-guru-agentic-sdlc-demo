# GG-143 Task — Node API cancellation

**Type:** Task  
**Parent:** GG-142  
**Owner team:** Backend  
**Points:** 3

Implement `POST /api/bookings/:id/cancel`, load policy from `packages/shared-contracts/cancellation-policy.json`, persist cancelled state, refund action, slot release, and notification events.

Completion: API tests TS-01 to TS-06 pass.
