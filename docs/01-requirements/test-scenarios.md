# Test scenarios — GG-142

| ID | Layer | Scenario | Expected |
| --- | --- | --- | --- |
| TS-01 | API unit | pending cancel | fee 0, status cancelled |
| TS-02 | API unit | confirmed, 5h to slot | fee 0 |
| TS-03 | API unit | confirmed, 45m to slot | 50% fee |
| TS-04 | API unit | en_route | 409 NOT_CANCELLABLE |
| TS-05 | API unit | completed | 409 NOT_CANCELLABLE |
| TS-06 | API unit | already cancelled | 409 |
| TS-07 | Policy (Dart) | same cutoff math as Node | identical fee |
| TS-08 | Web | fee warning on BK-1003 | warning visible before confirm |
| TS-09 | Web | blocked CTA on BK-1004 | cancel disabled / error |
| TS-10 | QA manual | garage notification appears in event log after cancel | pass |
