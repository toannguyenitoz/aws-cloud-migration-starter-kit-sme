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

# Cutover Runbook

## 1. Purpose

This runbook describes the steps for switching production traffic from the old on-premises customer portal to the new AWS-hosted portal.

---

## 2. Roles

| Role | Person |
|---|---|
| Cutover Lead | Systems Administrator |
| Business Approver | Operations Manager |
| Web App Tester | Web Developer |
| User Communication | IT Support Officer |
| Rollback Approver | Managing Director |

---

## 3. Pre-Cutover Checklist

- Change freeze approved.
- Backup completed.
- Restore test completed.
- RDS migration tested.
- ALB target group healthy.
- DNS TTL reduced.
- SSL certificate validated.
- CloudWatch dashboard open.
- Rollback endpoint confirmed.
- Stakeholders notified.

---

## 4. Cutover Steps

| Step | Action | Owner |
|---:|---|---|
| 1 | Put old app in maintenance mode | Web Developer |
| 2 | Export final database changes | Systems Administrator |
| 3 | Import final data into RDS | Systems Administrator |
| 4 | Validate data count | Web Developer |
| 5 | Update DNS to new endpoint | Systems Administrator |
| 6 | Test customer login | Web Developer |
| 7 | Test order creation | Operations |
| 8 | Monitor ALB and app logs | IT Support |
| 9 | Confirm business sign-off | Operations Manager |

---

## 5. Go/No-Go Criteria

Go-live continues if:

- DNS resolves correctly.
- Application loads.
- Login works.
- Database reads and writes work.
- Error rate remains acceptable.
- Business owner signs off.

Rollback is triggered if:

- Application unavailable for more than agreed window.
- Data integrity issue appears.
- Critical business function fails.
- Security issue is detected.

---

## 6. Post-Cutover

- Keep old environment available.
- Monitor for 24-48 hours.
- Review costs.
- Review logs.
- Update documentation.
- Schedule lessons learned meeting.

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

