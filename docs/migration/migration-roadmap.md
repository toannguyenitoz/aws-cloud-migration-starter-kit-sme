<a id="top"></a>

<!-- PROJECT STANDARD HEADER START -->

<p align="center">
  <img src="../../assets/aws-cloud-migration-banner.svg" alt="AWS Cloud Migration Starter Kit for SMEs" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Cloud">
  <img src="https://img.shields.io/badge/Cloud-Migration-blue?style=for-the-badge" alt="Cloud Migration">
  <img src="https://img.shields.io/badge/Console-Manual%20Setup-7C3AED?style=for-the-badge" alt="AWS Console Manual Setup">
  <img src="https://img.shields.io/badge/Portfolio-Project-22C55E?style=for-the-badge" alt="Portfolio Project">
</p>

<p align="center">
  <a href="../../README.md">🏠 Home</a> •
  <a href="../../docs/README.md">📚 Docs</a> •
  <a href="../../docs/setup/09-aws-console-manual-setup.md">🖱️ AWS Console Setup</a> •
  <a href="../../docs/setup/10-aws-console-build-checklist.md">✅ Checklist</a> •
  <a href="../../iac/terraform/README.md">⚙️ Terraform</a> •
  <a href="../../AUTHOR.md">👤 Author</a>
</p>

---

<!-- PROJECT STANDARD HEADER END -->

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

---

<!-- PROJECT STANDARD FOOTER START -->

<p align="center">
  <a href="#top">⬆ Back to Top</a> •
  <a href="../../README.md">🏠 Home</a> •
  <a href="../../docs/README.md">📚 Documentation</a> •
  <a href="../../docs/setup/09-aws-console-manual-setup.md">🖱️ AWS Console Manual Setup</a> •
  <a href="../../AUTHOR.md">👤 Author</a>
</p>

<p align="center">
  <strong>AWS Cloud Migration Starter Kit for SMEs</strong><br>
  Created by <strong>Xuan Toan Nguyen</strong><br>
  IT Support &amp; Systems Administration Candidate — Adelaide, South Australia, Australia<br>
  <a href="https://www.linkedin.com/in/toan-nguyen-it-oz">LinkedIn</a> •
  <a href="https://github.com/toannguyenitoz">GitHub</a>
</p>

<p align="center">
  <em>Learn → Build → Document → Share</em><br>
  <strong>#ToanNguyenITOz</strong>
</p>

<!-- PROJECT STANDARD FOOTER END -->

