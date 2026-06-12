<a id="top"></a>

# Cloud Cost Control

## 1. Why Cost Control Matters

Cloud cost can grow quickly when resources are left running, oversized, or deployed without tagging.

The goal is not always to minimize cost. The goal is to align cost with business value and risk.

---

## 2. Cost Controls

| Control | Purpose |
|---|---|
| AWS Budget | Alert before overspend |
| Tags | Attribute cost to workload or owner |
| Rightsizing | Reduce oversized resources |
| Scheduling | Stop non-production resources outside business hours |
| Lifecycle Policies | Reduce storage cost over time |
| Reserved Capacity | Reduce predictable long-term compute/database cost |
| Log Retention | Avoid unlimited log growth |

---

## 3. Common Cost Surprises

| Service | Cost Risk |
|---|---|
| NAT Gateway | Hourly cost and data processing |
| ALB | Hourly and usage-based cost |
| RDS | Instance hours, storage, backup |
| CloudWatch Logs | Ingestion and retention |
| EBS | Unattached volumes |
| Snapshots | Old backup copies |
| Data Transfer | Cross-AZ and internet transfer |

---

## 4. Cost Review Questions

1. Which resources are running 24/7?
2. Which resources are unused?
3. Are all resources tagged?
4. Is NAT Gateway required in the lab?
5. Is RDS sized correctly?
6. Are logs retained too long?
7. Are snapshots old or duplicated?
8. Can non-production shut down after hours?

---

## 5. Budget Alert Example

| Alert | Threshold |
|---|---:|
| Early warning | 50% |
| Action required | 80% |
| Escalation | 100% |

[⬆ Back to Top](#top)
