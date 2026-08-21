# GarageGuru repo inventory (impact analysis)

Use this list when a Jira ticket asks “which apps change?”. Sample customer app called out in the brief: `garage_guru_app`.

| System | Role | Sample / local evidence | GG-2 impact |
| --- | --- | --- | --- |
| Node backend | APIs, job cards, customers | `apps/api` in this repo; Swagger `openapi.yaml` from GarageGuru docs | **Yes** — cancel API, fee, slot, notifications |
| React web | Customer / ops web | `apps/web` in this repo | **Yes** — cancel CTA, fee warning, blocked states |
| garage_guru_app | Flutter sample named for the demo | Local zip `garage_guru_app-develop` | **Yes** — customer cancel uses shared policy |
| customer_app | Flutter customer | Local zip `customer_app-develop` | **Yes** — same cancel UX |
| staff_app | Flutter staff / technician | Local zip `staff_app-develop` | Notification + status only |
| retailer_app | Flutter retailer | Local zip `retailer_app-develop` | Confirm no cancel UI |
| distributor_app | Flutter distributor | Local zip `distributor_app-develop` | Confirm no cancel UI |
| quality_control | Flutter QC | Local zip `quality_control-develop` | Confirm no cancel UI |
| gg_ceo_app | Flutter CEO | Local zip `gg_ceo_app-master` | Confirm no cancel UI |
| Shared policy | Fee / cutoff / statuses | `packages/shared-contracts` + `packages/booking_policy` | **Yes** — single source of rules |

Do not copy production app zips into git. They contain `google-services.json` and other secrets. Agents read this inventory, then work in the listed GitHub remotes once org access exists.
