<a id="top"></a>

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
