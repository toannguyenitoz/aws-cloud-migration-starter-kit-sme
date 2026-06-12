<a id="top"></a>

# Setup 01 - AWS Account and Landing Zone

## 1. Objective

Create a safe AWS foundation before deploying workloads.

A landing zone is the starting structure for cloud operations. For a small business, it can start simple but should still include identity, logging, budget, security controls, and naming standards.

---

## 2. Recommended Account Structure

| Account | Purpose |
|---|---|
| Management | Billing and account governance only |
| Security | Central security logs and tools |
| Log Archive | Immutable log storage |
| Shared Services | DNS, directory, shared tools |
| Non-Production | Testing and development |
| Production | Business workloads |

For a very small lab, one non-production account can be used, but production business systems should not be mixed with personal experiments.

---

## 3. First-Day Setup Checklist

- Enable MFA on root account.
- Do not use root account for daily work.
- Create an admin role through IAM Identity Center.
- Create an AWS Budget.
- Enable CloudTrail.
- Enable AWS Config if required.
- Enable GuardDuty if available in the account.
- Define naming standard.
- Define tagging standard.
- Create a secure S3 bucket for logs.
- Review default VPCs and remove unused default resources if appropriate.

---

## 4. Naming Standard

Format:

```text
<company>-<environment>-<workload>-<resource>-<region>
```

Examples:

```text
scos-prod-web-vpc-syd
scos-prod-web-alb-syd
scos-prod-web-asg-syd
scos-prod-web-rds-syd
scos-prod-logs-s3-syd
```

---

## 5. Tagging Standard

| Tag Key | Example Value | Purpose |
|---|---|---|
| Project | CloudMigration | Project reporting |
| Environment | Prod / Dev / Test | Separation |
| Owner | IT | Responsibility |
| CostCentre | Operations | Billing |
| Criticality | High / Medium / Low | Support priority |
| Backup | Yes / No | Backup automation |
| DataClassification | Public / Internal / Confidential | Security handling |

---

## 6. AWS Budget Setup

Recommended beginner budget:

| Budget | Threshold |
|---|---:|
| Monthly lab warning | 50 AUD |
| Monthly project warning | 150 AUD |
| Production review | Approved by business |

Create email alerts at 50%, 80%, and 100%.

---

## 7. Root Account Protection

Rules:

- Use root account only for account-level tasks.
- Enable MFA.
- Store root credentials in a business password vault.
- Do not create root access keys.
- Review root account activity through CloudTrail.

---

## 8. Deliverables

At the end of this setup:

- Account access is protected.
- Budget alerts are active.
- Naming and tagging standards are defined.
- Logging foundation is planned.
- The team has a safe structure for cloud build.

[⬆ Back to Top](#top)
