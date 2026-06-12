<a id="top"></a>

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
