# Business rules — booking cancellation

Source of truth for implementation and tests: `packages/shared-contracts/cancellation-policy.json`.

1. Only the booking owner can cancel.
2. Cancellable statuses: `pending`, `confirmed`.
3. Non-cancellable statuses: `technician_en_route`, `in_progress`, `completed`, `cancelled`.
4. If status is `confirmed` and hours until slot `> 2`, fee = 0.
5. If status is `confirmed` and hours until slot `<= 2`, fee = 50% of `amountPaise`.
6. If status is `pending`, fee = 0 regardless of slot time.
7. Successful cancel must:
   - set `status = cancelled`
   - set `cancelledAt`
   - set `cancellationFeePaise`
   - set `refundPaise = amountPaise - cancellationFeePaise`
   - set `slotReleased = true`
   - append notification events for garage and technician when assigned
8. Repeat cancel on an already cancelled booking returns `409`.
9. Cancel on a blocked status returns `409` with `reason = NOT_CANCELLABLE`.
