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

# Security Baseline

## 1. Security Principles

- Verify identity.
- Use least privilege.
- Segment networks.
- Encrypt data.
- Log all important activity.
- Monitor continuously.
- Patch regularly.
- Test recovery.
- Avoid public exposure by default.

---

## 2. Baseline Controls

| Control | Required Setting |
|---|---|
| Root MFA | Enabled |
| IAM admin access | Through roles and MFA |
| CloudTrail | Enabled |
| GuardDuty | Enabled where available |
| AWS Config | Enabled for key resources |
| S3 public access | Blocked |
| RDS public access | Disabled |
| EC2 SSH/RDP | Not open to internet |
| Secrets | Not in GitHub or scripts |
| Encryption | Enabled for S3, RDS, EBS |
| Backups | Enabled and tested |
| Budget | Enabled |

---

## 3. Security Group Rules

| Security Group | Inbound |
|---|---|
| ALB-SG | HTTP/HTTPS from internet |
| APP-SG | HTTP from ALB-SG only |
| RDS-SG | DB port from APP-SG only |
| ADMIN-SG | Restricted admin access or SSM only |

---

## 4. Incident Response Mini-Runbook

When a security issue is suspected:

1. Do not delete evidence.
2. Capture time, user, resource, and symptoms.
3. Review CloudTrail.
4. Review CloudWatch logs.
5. Isolate affected resource if required.
6. Rotate exposed credentials.
7. Remove public access.
8. Notify business owner.
9. Document root cause.
10. Add preventive control.

---

## 5. GitHub Safety

Never commit:

- AWS access keys
- Private SSH keys
- Database passwords
- `.env` files with secrets
- Customer data
- Production certificates
- Backup files

Use:

- `.gitignore`
- Secrets Manager
- SSM Parameter Store
- GitHub secret scanning
- Environment variables

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

