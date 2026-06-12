<a id="top"></a>

# Cloud Migration Roadmap

## Overview

This roadmap uses a practical small-business sequence:

1. Assess
2. Mobilize
3. Build foundation
4. Pilot
5. Migrate
6. Cutover
7. Optimize
8. Modernize

---

## 12-Week Migration Plan

| Week | Phase | Activities | Output |
|---:|---|---|---|
| 1 | Assess | Inventory servers, apps, users, data, risks | Current-state report |
| 2 | Assess | Confirm business goals, RTO/RPO, migration scope | Migration scope |
| 3 | Mobilize | Create AWS account structure, budgets, IAM baseline | Cloud foundation plan |
| 4 | Mobilize | Design VPC, security groups, logging, backup model | Architecture sign-off |
| 5 | Build | Deploy VPC, subnets, routing, logging | Network foundation |
| 6 | Build | Deploy ALB, EC2 test app, RDS test DB | Pilot environment |
| 7 | Pilot | Migrate sample database and test application | Pilot results |
| 8 | Pilot | Security review, monitoring, backup restore test | Go/no-go checkpoint |
| 9 | Migrate | Prepare production data migration | Migration execution plan |
| 10 | Cutover | DNS cutover and production validation | Go-live |
| 11 | Stabilize | Monitor performance, cost, errors | Stabilization report |
| 12 | Optimize | Rightsize resources, update runbooks | Optimized environment |

---

## Migration Wave Plan

| Wave | Workload | Strategy | Reason |
|---|---|---|---|
| Wave 0 | Cloud foundation | New build | Required before migration |
| Wave 1 | Customer portal | Replatform | Improve availability and scalability |
| Wave 1 | Product image archive | Replatform | Move to S3 |
| Wave 2 | Reporting jobs | Rehost / Replatform | Move after core app stable |
| Wave 2 | Backup archive | Replatform | Improve restore capability |
| Wave 3 | Finance system | Retain / Review | Higher risk and vendor dependency |
| Wave 3 | Identity integration | Hybrid | Requires careful planning |

---

## Cutover Strategy

### Before Cutover

- Freeze application changes.
- Confirm latest backup.
- Lower DNS TTL.
- Confirm RDS connectivity.
- Confirm ALB target health.
- Confirm monitoring alarms.
- Prepare rollback checklist.
- Communicate downtime window.

### During Cutover

- Put old application into maintenance mode.
- Perform final database sync or export/import.
- Validate application login.
- Update DNS record to ALB or CloudFront.
- Confirm external access.
- Confirm user acceptance testing.
- Monitor logs and metrics.

### After Cutover

- Keep old environment available for rollback period.
- Monitor error rate and latency.
- Review cost dashboard.
- Confirm backup job success.
- Update documentation.

---

## Rollback Strategy

Rollback is required if:

- Users cannot access the application.
- Database writes fail.
- Data integrity check fails.
- Performance is unacceptable.
- Security issue is discovered.

Rollback steps:

1. Stop new writes if possible.
2. Restore DNS to old endpoint.
3. Confirm old application availability.
4. Notify users.
5. Capture logs and root cause.
6. Reschedule cutover after remediation.

See: [Rollback Runbook](../runbooks/rollback-runbook.md)

[⬆ Back to Top](#top)
