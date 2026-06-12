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

# Setup 08 - End-to-End Hands-On Lab

## Goal

Build a practical AWS environment for the fictional company.

The lab follows this order:

1. Account safety
2. VPC network
3. Security Groups
4. S3 bucket
5. RDS database
6. EC2 web server test
7. AMI or Launch Template
8. Target Group
9. Application Load Balancer
10. Auto Scaling Group
11. Monitoring
12. Backup
13. Cutover simulation
14. Clean-up

---

## Lab Naming

Use this prefix:

```text
scos-dev
```

Examples:

```text
scos-dev-web-vpc
scos-dev-public-a
scos-dev-app-a
scos-dev-rds-sg
scos-dev-alb
scos-dev-asg
```

---

## Step 1 - Account Safety

Before building:

- Enable MFA.
- Create a budget.
- Use an admin role, not root.
- Confirm the working Region.
- Create a project tag.

---

## Step 2 - Create VPC

Create:

| Resource | Name |
|---|---|
| VPC | scos-dev-web-vpc |
| CIDR | 10.20.0.0/16 |
| DNS hostnames | Enabled |
| DNS resolution | Enabled |

---

## Step 3 - Create Subnets

| Name | CIDR | Type |
|---|---:|---|
| scos-dev-public-a | 10.20.0.0/24 | Public |
| scos-dev-public-b | 10.20.1.0/24 | Public |
| scos-dev-app-a | 10.20.10.0/24 | Private App |
| scos-dev-app-b | 10.20.11.0/24 | Private App |
| scos-dev-db-a | 10.20.20.0/24 | Private DB |
| scos-dev-db-b | 10.20.21.0/24 | Private DB |

---

## Step 4 - Routing

Create:

- Internet Gateway for public subnets.
- NAT Gateway for private application subnet outbound internet.
- Public route table.
- Private app route table.
- Private DB route table.

---

## Step 5 - Security Groups

Create:

| Security Group | Inbound |
|---|---|
| scos-dev-alb-sg | 80/443 from internet |
| scos-dev-app-sg | 80 from ALB SG |
| scos-dev-rds-sg | 3306 from App SG |

---

## Step 6 - Create S3 Bucket

Create a private bucket for:

- Product images
- Test uploads
- Backup archive

Enable:

- Block Public Access
- Encryption
- Versioning
- Lifecycle rule

---

## Step 7 - Create RDS

Create:

| Setting | Value |
|---|---|
| Engine | MySQL or MariaDB |
| Public access | No |
| Subnets | Private DB A and B |
| Security Group | scos-dev-rds-sg |
| Backup | Enabled |
| Encryption | Enabled |

Load sample data from:

```text
sample-app/db.sql
```

---

## Step 8 - Create Test EC2

Launch one temporary EC2 instance to validate the application.

Install web server:

```bash
sudo dnf update -y
sudo dnf install -y httpd php php-mysqli mariadb105
sudo systemctl enable --now httpd
```

Copy sample app files:

```bash
sudo cp sample-app/index.php /var/www/html/
sudo cp sample-app/health.html /var/www/html/
```

Test health:

```bash
curl http://localhost/health.html
```

---

## Step 9 - Create Launch Template

Include:

- Approved AMI
- Instance type
- IAM role
- Security Group
- User data script
- No public IP
- CloudWatch monitoring as required

Use:

```text
scripts/ec2_user_data.sh
```

---

## Step 10 - Create Target Group and ALB

Target Group:

- Type: Instance
- Protocol: HTTP
- Port: 80
- Health path: `/health.html`

ALB:

- Internet-facing
- Public Subnet A and B
- Listener HTTP 80
- Forward to target group

---

## Step 11 - Create Auto Scaling Group

Settings:

| Setting | Value |
|---|---:|
| Desired | 2 |
| Minimum | 2 |
| Maximum | 4 |
| Subnets | Private App A and B |
| Scaling Metric | CPU |
| Target | 60% |

---

## Step 12 - Validate

Check:

- ALB DNS loads the application.
- Target Group has healthy instances.
- EC2 instances are in private subnets.
- RDS is not publicly accessible.
- App can query database.
- CloudWatch logs and metrics are visible.
- S3 upload works.

---

## Step 13 - Cutover Simulation

Instead of changing real DNS, simulate:

1. Add a test DNS record.
2. Point it to ALB.
3. Test from outside network.
4. Confirm rollback record is documented.
5. Monitor logs.

---

## Step 14 - Clean Up

When finished:

- Delete Auto Scaling Group.
- Delete Load Balancer.
- Delete Target Group.
- Delete RDS if not needed.
- Empty and delete S3 test bucket.
- Delete NAT Gateway and Elastic IP.
- Delete subnets, route tables, Internet Gateway, VPC.

Or run Terraform destroy if deployed by Terraform:

```bash
terraform destroy
```

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

