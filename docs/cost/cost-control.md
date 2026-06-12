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

# Cloud Cost Control

## 1. Why Cost Control Matters

Cloud cost can grow quickly when resources are left running, oversized, or deployed without tagging.

The goal is not always to minimize cost. The goal is to align cost with business value and risk.

---

## 2. Cost Controls

| Control | Purpose |
|---|---|
| AWS Budget | Alert before overspend |
| Tags | Attribute cost to workload or owner |
| Rightsizing | Reduce oversized resources |
| Scheduling | Stop non-production resources outside business hours |
| Lifecycle Policies | Reduce storage cost over time |
| Reserved Capacity | Reduce predictable long-term compute/database cost |
| Log Retention | Avoid unlimited log growth |

---

## 3. Common Cost Surprises

| Service | Cost Risk |
|---|---|
| NAT Gateway | Hourly cost and data processing |
| ALB | Hourly and usage-based cost |
| RDS | Instance hours, storage, backup |
| CloudWatch Logs | Ingestion and retention |
| EBS | Unattached volumes |
| Snapshots | Old backup copies |
| Data Transfer | Cross-AZ and internet transfer |

---

## 4. Cost Review Questions

1. Which resources are running 24/7?
2. Which resources are unused?
3. Are all resources tagged?
4. Is NAT Gateway required in the lab?
5. Is RDS sized correctly?
6. Are logs retained too long?
7. Are snapshots old or duplicated?
8. Can non-production shut down after hours?

---

## 5. Budget Alert Example

| Alert | Threshold |
|---|---:|
| Early warning | 50% |
| Action required | 80% |
| Escalation | 100% |

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

