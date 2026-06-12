<a id="top"></a>

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
