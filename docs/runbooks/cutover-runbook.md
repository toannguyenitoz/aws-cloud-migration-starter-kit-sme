<a id="top"></a>

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
