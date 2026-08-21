# Acceptance criteria — GG-142

## AC-1 Eligible pending booking

Given booking BK-1001 is `pending`  
When the customer confirms cancel  
Then the booking becomes `cancelled`, fee is 0, the slot is released, and a garage notification is recorded.

## AC-2 Confirmed booking more than 2 hours away

Given booking BK-1002 is `confirmed` and the slot is more than 2 hours away  
When the customer confirms cancel  
Then cancel succeeds with fee 0 and garage + technician notifications are recorded.

## AC-3 Confirmed booking inside 2 hours

Given booking BK-1003 is `confirmed` and the slot is 45 minutes away  
When the customer views cancel  
Then the UI shows a 50% fee warning  
When they confirm  
Then cancel succeeds with fee = 50% of the booking amount.

## AC-4 Technician already en route

Given booking BK-1004 is `technician_en_route`  
When the customer attempts cancel  
Then the API rejects with `NOT_CANCELLABLE` and the UI does not complete cancel.

## AC-5 Completed booking

Given booking BK-1005 is `completed`  
When the customer attempts cancel  
Then cancel is blocked and history remains `completed`.

## AC-6 History retained

Given a successful cancel  
Then the booking remains visible in history with status `cancelled` and `cancelledAt` populated.
