<a id="top"></a>

# Cloud Migration Assessment Workbook

## 1. Purpose

Before building anything in AWS, the business must understand what it owns, what depends on what, and what risk exists.

This workbook helps collect the minimum practical information needed for a small business cloud migration.

---

## 2. Server Inventory

| Field | Example |
|---|---|
| Server Name | SCOS-WEB01 |
| OS | Windows Server 2016 |
| Location | Adelaide server room |
| Business Owner | Operations Manager |
| Technical Owner | Systems Administrator |
| IP Address | 192.168.10.25 |
| CPU / RAM | 4 vCPU / 8 GB |
| Storage | 120 GB |
| Application | Customer portal |
| Criticality | High |
| Backup Method | Local NAS |
| Current Issue | Slow during peak traffic |
| Migration Strategy | Replatform |

Use: [Server Inventory Template](../../templates/server-inventory-template.csv)

---

## 3. Application Inventory

| Field | Example |
|---|---|
| Application Name | Customer Order Portal |
| Users | Customers and internal sales team |
| Peak Usage | EOFY and back-to-school periods |
| Runtime | PHP / IIS currently, Linux target |
| Database | MySQL |
| Dependencies | MySQL DB, product image folder, SMTP relay |
| Authentication | Local app login |
| RTO | 4 hours |
| RPO | 1 hour |
| Migration Strategy | Replatform to EC2 + RDS |

Use: [Application Inventory Template](../../templates/application-inventory-template.csv)

---

## 4. Dependency Questions

Ask these questions before migration:

1. What database does the application use?
2. What ports are required?
3. Does it use local file paths?
4. Does it call internal IP addresses?
5. Does it require SMTP?
6. Does it use scheduled tasks?
7. Does it store credentials in config files?
8. How is backup currently performed?
9. How is restore tested?
10. Who signs off user acceptance testing?

---

## 5. Migration Strategy Selection

| Strategy | Meaning | When to Use |
|---|---|---|
| Retain | Keep as-is | Not ready to move or business reason to keep |
| Retire | Shut down | No longer needed |
| Rehost | Lift and shift | Fast move with minimal changes |
| Replatform | Small changes to use managed services | Good for moving DB to RDS |
| Refactor | Rebuild application | Needed for major modernization |
| Repurchase | Move to SaaS | Replace old software with SaaS |
| Relocate | Move platform with minimal architecture change | VMware or platform relocation scenario |

---

## 6. Workload Prioritisation Matrix

| Workload | Business Value | Complexity | Risk | Recommended Wave |
|---|---:|---:|---:|---|
| Customer portal | High | Medium | Medium | Wave 1 |
| File archive | Medium | Low | Low | Wave 1 |
| Finance system | High | High | High | Wave 3 |
| Domain controller | High | Medium | High | Wave 2 |
| Reporting database | Medium | Medium | Medium | Wave 2 |

---

## 7. Cloud Readiness Checklist

| Area | Question | Status |
|---|---|---|
| Business | Is there executive sponsorship? | Pending |
| People | Is the IT team trained on AWS basics? | In Progress |
| Governance | Are naming and tagging standards defined? | In Progress |
| Platform | Is the VPC design approved? | Pending |
| Security | Is MFA enforced? | Pending |
| Operations | Are backup and monitoring runbooks ready? | Pending |

---

## 8. Risk Register

| Risk | Impact | Likelihood | Mitigation |
|---|---|---:|---|
| DNS cutover fails | Website outage | Medium | Lower TTL before cutover and document rollback |
| RDS connection fails | App unavailable | Medium | Test Security Groups and DB endpoint before cutover |
| Cost exceeds budget | Finance concern | Medium | Enable AWS Budget and cost tags |
| Staff lack AWS skills | Operational issues | High | Provide runbooks and training |
| Backup restore untested | Data loss risk | Medium | Run restore test before go-live |

Use: [Risk Register Template](../../templates/risk-register.md)

[⬆ Back to Top](#top)
