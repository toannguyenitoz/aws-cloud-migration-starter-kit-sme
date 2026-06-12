<a id="top"></a>

# Cloud Operations Checklist

## Daily Checks

- Review open CloudWatch alarms.
- Check application availability.
- Check RDS health.
- Review failed login or access anomalies.
- Check backup job status for critical systems.

---

## Weekly Checks

- Review AWS cost trend.
- Review EC2 and RDS utilization.
- Check Auto Scaling activity.
- Confirm patch status.
- Review recent security group changes.
- Review IAM access changes.
- Check S3 public access status.
- Review open support tickets.

---

## Monthly Checks

- Perform at least one restore test.
- Review unused resources.
- Rightsize EC2 and RDS.
- Review Budget alerts.
- Review IAM permissions.
- Review CloudTrail events.
- Update runbooks.
- Review disaster recovery plan.
- Confirm tags are applied.

---

## Quarterly Checks

- Run Well-Architected review.
- Test disaster recovery.
- Review vendor contracts.
- Review cloud skills training plan.
- Review business requirements.
- Review architecture diagram.
- Test rollback procedure.

---

## Support Escalation Matrix

| Severity | Example | Response |
|---|---|---|
| Sev 1 | Customer portal down | Immediate response |
| Sev 2 | Database performance degraded | Same business day |
| Sev 3 | Backup warning | Within 1 business day |
| Sev 4 | Documentation update | Planned work |

[⬆ Back to Top](#top)
