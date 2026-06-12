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

# Setup 06 - Monitoring, Logging, Backup, and Disaster Recovery

## 1. Objective

Create operational visibility and recovery capability.

A cloud environment is not complete until the IT team can answer:

- Is the application healthy?
- What changed?
- Who accessed what?
- Are backups working?
- Can we restore?
- How much are we spending?

---

## 2. Monitoring Services

| Service | Purpose |
|---|---|
| CloudWatch Metrics | CPU, memory through agent, ALB metrics, RDS metrics |
| CloudWatch Logs | Application and system logs |
| CloudWatch Alarms | Notifications for thresholds |
| CloudTrail | API activity audit trail |
| AWS Config | Resource configuration history |
| GuardDuty | Threat detection |
| AWS Backup | Centralized backup |

---

## 3. Minimum CloudWatch Alarms

| Alarm | Threshold Example | Action |
|---|---:|---|
| ALB 5XX errors | > 10 in 5 minutes | Notify IT |
| Target unhealthy | >= 1 unhealthy target | Investigate app |
| EC2 CPU high | > 80% for 10 minutes | Check load / scaling |
| RDS CPU high | > 80% for 10 minutes | Check queries |
| RDS free storage low | < 20% | Increase storage |
| Estimated charges | 80% of budget | Review cost |
| Backup job failed | Any failure | Investigate immediately |

---

## 4. Log Retention

| Log Type | Suggested Retention |
|---|---|
| Application logs | 30 to 90 days |
| Web access logs | 90 days |
| Security logs | 1 year or business requirement |
| CloudTrail logs | 1 to 7 years depending on compliance |
| Debug logs | Short retention, usually 7 to 14 days |

---

## 5. Backup Plan

| Resource | Backup Method | Frequency | Retention |
|---|---|---:|---:|
| RDS | Automated backup + snapshot | Daily | 7-35 days |
| EC2 EBS | AWS Backup | Daily | 14-30 days |
| S3 | Versioning + lifecycle | Continuous | Policy-based |
| Config files | Git repository / S3 | On change | Long-term |
| Runbooks | Git repository | On change | Long-term |

---

## 6. Disaster Recovery Terms

| Term | Meaning |
|---|---|
| RTO | How long the business can tolerate downtime |
| RPO | How much data loss the business can tolerate |
| Backup | Copy of data |
| Restore | Recovering from backup |
| Failover | Switching to standby system |
| DR Test | Planned test of recovery process |

---

## 7. Example DR Targets

| Workload | RTO | RPO |
|---|---:|---:|
| Customer portal | 4 hours | 1 hour |
| Product images | 8 hours | 24 hours |
| Finance exports | 24 hours | 24 hours |
| Reporting jobs | 24 hours | 24 hours |

---

## 8. Monthly Operations Tasks

- Review CloudWatch alarms.
- Check AWS Budget.
- Review IAM users and roles.
- Confirm no public RDS.
- Review Security Groups.
- Test one backup restore.
- Patch EC2 instances.
- Review S3 public access.
- Update documentation.
- Review old unused resources.

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

