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

# Cloud Computing Core Concepts

## 1. What Is Cloud Computing?

Cloud computing means using computing resources such as servers, storage, networking, databases, security, and monitoring through a cloud provider instead of owning all physical infrastructure yourself.

For an IT support or systems administration role, the cloud does not remove the need for technical knowledge. It changes the work from hardware maintenance to service configuration, monitoring, automation, security, and cost management.

---

## 2. Why Businesses Move to Cloud

| Reason | Practical Example |
|---|---|
| Scalability | Add more web servers during a sales event |
| Availability | Run resources across multiple Availability Zones |
| Backup | Store backups in S3 instead of only local NAS |
| Security | Central logging, IAM, MFA, encryption |
| Cost visibility | Track spending by account, tag, service, or workload |
| Speed | Deploy new environments faster |
| Disaster recovery | Restore systems even if the office server room fails |

---

## 3. Cloud Service Models

| Model | Meaning | Example |
|---|---|---|
| IaaS | You manage OS and application, cloud provider manages physical hardware | EC2 |
| PaaS | Provider manages more of the platform | Elastic Beanstalk, RDS |
| SaaS | Complete application delivered as a service | Microsoft 365, Salesforce |
| Serverless | Run code or services without managing servers | Lambda, S3, API Gateway |

---

## 4. Cloud Deployment Models

| Model | Meaning |
|---|---|
| Public Cloud | Shared cloud platform such as AWS |
| Private Cloud | Cloud-like platform for one organization |
| Hybrid Cloud | Mix of on-premises and cloud |
| Multi-Cloud | Use of more than one public cloud provider |

---

## 5. Shared Responsibility Model

The cloud provider is responsible for security **of** the cloud.  
The customer is responsible for security **in** the cloud.

### Provider Responsibilities

- Physical data centre security
- Physical servers
- Storage hardware
- Network hardware
- Managed service infrastructure

### Customer Responsibilities

- IAM users, roles, and permissions
- Data classification
- Application configuration
- Operating system patching for self-managed EC2
- Security Group rules
- Encryption settings
- Backup policies
- Logging and monitoring
- Cost control

---

## 6. AWS Global Infrastructure Concepts

| Term | Meaning |
|---|---|
| Region | Geographic location where AWS services operate |
| Availability Zone | Isolated data centre group inside a Region |
| Edge Location | Location used by services such as CloudFront |
| Local Zone | Infrastructure closer to large population or business centres |

---

## 7. AWS Core Services for This Project

| Service | Role in Project |
|---|---|
| AWS Organizations | Multi-account management |
| IAM Identity Center | Workforce identity access |
| IAM | Permissions and roles |
| VPC | Network boundary |
| EC2 | Virtual server for app tier |
| Auto Scaling | Adds/removes app instances |
| ALB | Distributes web traffic |
| RDS | Managed database |
| S3 | Object storage and backup |
| CloudWatch | Monitoring and alarms |
| CloudTrail | Audit log |
| AWS Config | Resource compliance tracking |
| AWS Backup | Backup management |
| Systems Manager | Patch, inventory, session access |

---

## 8. Common Beginner Mistakes

1. Putting databases in public subnets.
2. Opening SSH/RDP to the internet.
3. Using root account for daily work.
4. Forgetting to enable MFA.
5. Hardcoding access keys into scripts.
6. Not setting a budget alarm.
7. Not tagging resources.
8. Leaving test resources running.
9. Creating overlapping CIDR ranges.
10. Moving workloads without a rollback plan.

---

## 9. Cloud Vocabulary for IT Support

| Term | Meaning |
|---|---|
| Workload | An application or service that performs a business function |
| Landing Zone | Foundational AWS account, network, security, and governance setup |
| Least Privilege | Give users and systems only the access they need |
| High Availability | Design that continues running when a component fails |
| Disaster Recovery | Ability to recover after a major outage |
| RTO | Maximum acceptable downtime |
| RPO | Maximum acceptable data loss |
| Tagging | Applying metadata to resources for cost, ownership, and automation |
| Cutover | Switching production traffic from old system to new system |
| Rollback | Returning to the previous system if cutover fails |

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

