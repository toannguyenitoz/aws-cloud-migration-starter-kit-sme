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

# Quick Revision Notes

## AWS Cloud Migration

- Migration starts with business goals and assessment.
- Build landing zone before moving production workloads.
- Use MFA and least privilege from day one.
- Plan IP ranges before creating VPCs.
- Avoid overlapping CIDR blocks.
- Public subnet is for internet-facing components.
- Private subnet is for app and database resources.
- ALB receives traffic and forwards to healthy targets.
- Auto Scaling maintains desired capacity.
- RDS should not be publicly accessible.
- S3 should block public access unless intentionally public.
- CloudWatch monitors.
- CloudTrail audits.
- AWS Backup protects.
- Budget alerts prevent billing surprises.
- Cutover needs rollback.

---

## Core AWS Shortcuts

| Short Name | Meaning |
|---|---|
| VPC | Virtual Private Cloud |
| AZ | Availability Zone |
| IGW | Internet Gateway |
| NAT GW | NAT Gateway |
| ALB | Application Load Balancer |
| ASG | Auto Scaling Group |
| RDS | Relational Database Service |
| S3 | Simple Storage Service |
| IAM | Identity and Access Management |
| SG | Security Group |
| NACL | Network ACL |
| CW | CloudWatch |
| CT | CloudTrail |
| DR | Disaster Recovery |
| RTO | Recovery Time Objective |
| RPO | Recovery Point Objective |

---

## One-Line Summary

A secure AWS migration is built on clear business requirements, strong identity, segmented networking, private data, monitoring, backups, cost control, and documented operations.

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

