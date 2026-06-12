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

# Rollback Runbook

## 1. Purpose

Rollback returns service to the previous on-premises environment if the AWS cutover fails.

---

## 2. Rollback Triggers

- DNS cutover fails.
- Application cannot process orders.
- Database connection fails.
- Data integrity issue.
- Security misconfiguration.
- Business owner requests rollback.

---

## 3. Rollback Steps

| Step | Action |
|---:|---|
| 1 | Announce rollback decision |
| 2 | Stop new writes to AWS application if possible |
| 3 | Capture application and database logs |
| 4 | Repoint DNS to old portal |
| 5 | Confirm old portal access |
| 6 | Confirm database consistency |
| 7 | Notify users |
| 8 | Document issue and timeline |
| 9 | Schedule root cause review |

---

## 4. Evidence to Capture

- CloudWatch logs
- ALB target health
- Application error screenshots
- RDS events
- Security Group changes
- DNS records before and after
- Time of issue
- Users impacted

---

## 5. After Rollback

Do not immediately delete AWS resources. Preserve evidence until the cause is understood.

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

