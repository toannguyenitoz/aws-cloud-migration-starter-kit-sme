<a id="top"></a>

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
