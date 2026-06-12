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

# Cloud Interview Questions and Answers

## Beginner Level

| Question | Answer |
|---|---|
| What is cloud computing? | Using compute, storage, networking, databases, and other IT services from a cloud provider instead of owning all physical infrastructure. |
| What is AWS EC2? | A virtual server service used to run applications. |
| What is S3? | Object storage used for files, backups, logs, and static content. |
| What is a VPC? | A logically isolated network in AWS. |
| What is a subnet? | A smaller IP range inside a VPC. |
| What is IAM? | Identity and access management for users, roles, and permissions. |
| What is a Security Group? | A stateful virtual firewall attached to AWS resources. |

---

## Intermediate Level

| Question | Answer |
|---|---|
| What is the difference between public and private subnet? | A public subnet has a route to an Internet Gateway. A private subnet does not expose resources directly to the internet. |
| Why use NAT Gateway? | To allow private resources to access the internet outbound without exposing them inbound. |
| Why use ALB? | To distribute HTTP/HTTPS traffic across multiple healthy targets. |
| Why use Auto Scaling? | To maintain availability and adjust capacity based on demand. |
| Why use RDS? | To reduce database administration effort such as backups, patching, and high availability configuration. |
| What is CloudWatch? | Monitoring and logging service for metrics, logs, alarms, and dashboards. |
| What is CloudTrail? | Service that records AWS API activity for audit and investigation. |

---

## Scenario Questions

### 1. A private EC2 instance cannot install updates. What do you check?

Check the private route table, NAT Gateway, public subnet route to Internet Gateway, NACLs, DNS, and Security Group outbound rules.

### 2. A website behind ALB returns 503. What is the likely issue?

The target group probably has no healthy targets. Check health check path, app service, Security Groups, and instance state.

### 3. The app cannot connect to RDS. What do you check?

Check RDS endpoint, database port, RDS Security Group, application Security Group, DB credentials, and database availability.

### 4. How would you migrate a small business customer portal to AWS?

Assess dependencies, build landing zone, create VPC, deploy app tier behind ALB, migrate database to RDS, move files to S3, test, cut over DNS, monitor, and keep rollback plan.

### 5. How do you control AWS cost?

Use budgets, tagging, rightsizing, lifecycle policies, stopping unused resources, reviewing NAT/RDS/EC2 costs, and setting log retention.

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

