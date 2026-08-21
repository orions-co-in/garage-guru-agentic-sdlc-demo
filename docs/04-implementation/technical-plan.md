# Technical plan — GG-142

1. Load cancellation policy from shared JSON (do not hard-code 2 hours / 50% in three places).
2. Node: in-memory store for the demo, same route shape as production would use.
3. React: read bookings, preview fee via policy endpoint, then POST cancel.
4. Flutter customer app: same HTTP contract; this demo proves rule parity with Dart tests.
5. Feature branch only. No direct commits to main in the operating model.
6. PR must include test evidence and residual risks (goodwill refunds still manual).
