# Which systems change for GG-2

| System | Path / app | Change |
| --- | --- | --- |
| Node API | `apps/api` | Cancel endpoint, fee, slot, notifications |
| React web | `apps/web` | Job cards, fee warning, blocked states |
| Flutter customer | `garage_guru_app`, `customer_app` | Same policy via `packages/booking_policy` |
| Flutter staff / technician | `staff_app` | Status + notification only |
| Other Flutter apps | retailer, distributor, QC, CEO | No cancel UI |
| Shared rules | `packages/shared-contracts` | One cutoff / fee / status list |

Do not commit production app zips (`google-services.json`).
