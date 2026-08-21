# Open questions the requirement agent must ask

These are the questions from the presentation, answered from stakeholders for this demo. In a live run, the agent stops here until humans answer.

| # | Question | Answer | Blocking? |
| --- | --- | --- | --- |
| 1 | Which booking statuses can be cancelled? | `pending` and `confirmed` only. | Yes |
| 2 | Is cancellation allowed after garage confirmation? | Yes, while status is still `confirmed` and the technician is not en route. | Yes |
| 3 | Is there a cancellation cutoff or fee? | Free if slot is more than 2 hours away. 50% cancellation fee if slot is 2 hours or less away. | Yes |
| 4 | Should the garage / technician be notified? | Yes. Emit `booking.cancelled` to garage and assigned technician. | Yes |
| 5 | What happens to payment, slot availability and booking history? | Record refund of the cancellable amount, release the slot, keep the booking row with status `cancelled` and `cancelledAt`. | Yes |

No remaining blocking unknowns for GG-142.
