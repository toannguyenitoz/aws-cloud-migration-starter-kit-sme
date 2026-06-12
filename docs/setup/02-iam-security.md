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

# Setup 02 - IAM and Security Baseline

## 1. Objective

Configure identity and access in a secure, supportable way.

Cloud security starts with identity. Most incidents in beginner AWS environments come from excessive permissions, exposed keys, no MFA, or public network access.

---

## 2. Identity Model

Recommended approach:

- Use IAM Identity Center for human users.
- Use IAM roles for AWS services.
- Avoid IAM users unless there is a clear legacy requirement.
- Avoid long-term access keys.
- Enforce MFA for privileged roles.
- Use least privilege.

---

## 3. Example Permission Sets

| Permission Set | Intended User |
|---|---|
| CloudAdmin | Senior system administrator |
| CloudReadOnly | Auditor, manager, junior support |
| CloudSupport | IT support staff |
| BillingViewOnly | Finance |
| SecurityAudit | Security reviewer |
| DeveloperPowerUser | Developer without billing/admin rights |

---

## 4. Service Role Examples

| Role | Used By | Purpose |
|---|---|---|
| EC2AppRole | EC2 instances | Read S3 config, write CloudWatch logs |
| BackupRole | AWS Backup | Backup selected resources |
| LambdaOpsRole | Lambda scripts | Small automation jobs |
| CodeDeployRole | Deployment pipeline | Deploy application updates |

---

## 5. Security Baseline Checklist

- MFA enabled for admin access.
- Root account locked down.
- CloudTrail enabled in all Regions.
- GuardDuty enabled where appropriate.
- S3 Block Public Access enabled.
- IAM Access Analyzer reviewed.
- No public RDS instances.
- No unrestricted SSH/RDP from the internet.
- Security Groups documented.
- Secrets are stored in Secrets Manager or Parameter Store.
- CloudWatch alarms created for critical events.

---

## 6. Secure Access to EC2

Preferred approach:

1. Put EC2 in private subnets.
2. Do not assign public IPs.
3. Use Systems Manager Session Manager for shell access.
4. Attach an EC2 role with SSM permissions.
5. Log session activity if required.

Avoid:

```text
SSH 22 from 0.0.0.0/0
RDP 3389 from 0.0.0.0/0
```

---

## 7. Example Least-Privilege Thinking

Instead of giving an EC2 instance full S3 access:

Bad:

```text
s3:*
Resource: *
```

Better:

```text
Allow read/write only to the required bucket and prefix.
```

---

## 8. Security Deliverables

- IAM permission model
- Admin access process
- Security Group matrix
- Logging and audit baseline
- Secrets management plan
- Incident response contact list

See also: [Security Baseline](../security/security-baseline.md)

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

