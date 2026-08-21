# Requirement summary — Customer booking cancellation

**Stable ID:** REQ-CANCEL-001  
**Jira:** GG-142  
**Source:** meeting notes 18 Aug 2026, SUP-8841, operations email  
**Status:** Ready for development (human-approved for this demo)

## Problem

Customers cannot cancel a service booking in product. Support and WhatsApp become the cancellation channel. Garages keep slots blocked and technicians still receive cancelled jobs.

## Outcome

A customer can cancel an eligible booking from web and the customer mobile app. The API enforces one cancellation policy. Garage and technician are notified. The slot is released. Payment follows the cutoff/fee rule. History keeps the cancelled booking.

## In scope

- Customer-initiated cancel on web and customer Flutter app
- Shared cancellation policy in Node API
- Fee warning before confirm when cutoff is missed
- Notification event to garage and assigned technician
- Slot release and booking history retained as `cancelled`

## Out of scope

- Garage-initiated cancel
- Admin override / goodwill full refund after cutoff
- Reschedule (separate story)
- Wallet vs card refund rails beyond a recorded refund action

## Affected systems

| System | Change |
| --- | --- |
| Node backend | Cancel API, policy, refund action, slot release, notification events |
| React web | Booking detail, cancel CTA, confirmation, fee, failure states |
| Flutter customer app | Same customer flow |
| Flutter garage / operations | Status + inbound notification |
| Flutter technician | Inbound notification only |
| Other Flutter apps | No code change in this slice |
