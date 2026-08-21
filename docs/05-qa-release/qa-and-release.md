# QA checklist — GG-142

- [ ] AC-1 to AC-6 executed on http://localhost:5173
- [ ] `npm test` green
- [ ] `dart test packages/booking_policy` green
- [ ] Event log shows garage notification on successful cancel
- [ ] BK-1004 and BK-1005 cannot cancel
- [ ] Release note draft reviewed

# Release note draft

**GG-142 — Customer booking cancellation**

Customers can cancel pending and confirmed service bookings from web. Confirmed bookings inside 2 hours of the slot incur a 50% fee. Garage and technician are notified. Slots are released. Completed or in-progress jobs cannot be cancelled in product.
