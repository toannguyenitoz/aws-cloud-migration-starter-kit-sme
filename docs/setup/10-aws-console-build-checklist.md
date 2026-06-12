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

# Setup 10 - AWS Console Build Checklist

This checklist is used together with:

```text
docs/setup/09-aws-console-manual-setup.md
```

Use this file when you build the lab manually in the AWS Management Console. It helps you track what has been configured, what evidence to capture, and what should be validated before moving to the next stage.

---

## 1. Lab Metadata

| Item | Value |
|---|---|
| Project | Southern Cross Office Supplies AWS Migration Lab |
| Environment | Dev |
| Region | `ap-southeast-2` |
| VPC CIDR | `10.20.0.0/16` |
| Build Method | AWS Management Console |
| Build Date | `YYYY-MM-DD` |
| Built By | `Your Name` |

---

## 2. Account Safety Checklist

| Check | Done | Evidence / Notes |
|---|---|---|
| MFA enabled for root user | [ ] | Screenshot IAM security credentials |
| Admin user or role used instead of root | [ ] | IAM screenshot |
| AWS Budget created | [ ] | Budget screenshot |
| Billing alert email confirmed | [ ] | Email/SNS confirmation |
| Project tags defined | [ ] | Tag list documented |
| Region confirmed as Sydney | [ ] | Console region screenshot |

---

## 3. Network Checklist

| Resource | Expected Value | Done | Evidence / Notes |
|---|---|---|---|
| VPC | `scos-dev-web-vpc` / `10.20.0.0/16` | [ ] | VPC screenshot |
| DNS resolution | Enabled | [ ] | VPC settings screenshot |
| DNS hostnames | Enabled | [ ] | VPC settings screenshot |
| Public subnet A | `10.20.0.0/24` | [ ] | Subnet list screenshot |
| Public subnet B | `10.20.1.0/24` | [ ] | Subnet list screenshot |
| Private app subnet A | `10.20.10.0/24` | [ ] | Subnet list screenshot |
| Private app subnet B | `10.20.11.0/24` | [ ] | Subnet list screenshot |
| Private DB subnet A | `10.20.20.0/24` | [ ] | Subnet list screenshot |
| Private DB subnet B | `10.20.21.0/24` | [ ] | Subnet list screenshot |
| Internet Gateway | Attached to VPC | [ ] | IGW screenshot |
| NAT Gateway | Available in public subnet A | [ ] | NAT Gateway screenshot |
| Public route table | `0.0.0.0/0` to IGW | [ ] | Route table screenshot |
| Private app route table | `0.0.0.0/0` to NAT Gateway | [ ] | Route table screenshot |
| Private DB route table | Local route only | [ ] | Route table screenshot |

---

## 4. Security Group Checklist

| Security Group | Rule | Done | Evidence / Notes |
|---|---|---|---|
| `scos-dev-alb-sg` | HTTP 80 from internet or trusted range | [ ] | SG inbound screenshot |
| `scos-dev-alb-sg` | HTTPS 443 if using ACM certificate | [ ] | Optional |
| `scos-dev-app-sg` | HTTP 80 from ALB SG only | [ ] | SG inbound screenshot |
| `scos-dev-app-sg` | SSH 22 only from your IP, lab only | [ ] | Remove after testing |
| `scos-dev-rds-sg` | MySQL 3306 from App SG only | [ ] | SG inbound screenshot |
| Outbound rules | Required outbound access configured | [ ] | SG outbound screenshot |

Security note:

```text
Do not open RDS to 0.0.0.0/0.
Do not leave SSH open to 0.0.0.0/0.
```

---

## 5. IAM Checklist

| Resource | Expected Value | Done | Evidence / Notes |
|---|---|---|---|
| EC2 IAM Role | `scos-dev-ec2-app-role` | [ ] | IAM role screenshot |
| SSM permission | `AmazonSSMManagedInstanceCore` | [ ] | Policy screenshot |
| CloudWatch permission | `CloudWatchAgentServerPolicy` | [ ] | Policy screenshot |
| S3 access | Least-privilege project bucket policy | [ ] | Custom policy screenshot |
| Access keys | No hardcoded keys in repo | [ ] | Local repo checked |

---

## 6. S3 Checklist

| Resource / Setting | Expected Value | Done | Evidence / Notes |
|---|---|---|---|
| Bucket name | Globally unique project bucket | [ ] | Bucket screenshot |
| Public access | Block all public access enabled | [ ] | Permissions screenshot |
| Versioning | Enabled | [ ] | Properties screenshot |
| Encryption | SSE-S3 or SSE-KMS enabled | [ ] | Properties screenshot |
| Folder structure | `app-assets/`, `backups/`, `logs/`, `test-uploads/` | [ ] | Object list screenshot |
| Lifecycle rule | Backup lifecycle rule created | [ ] | Management screenshot |

---

## 7. RDS Checklist

| Resource / Setting | Expected Value | Done | Evidence / Notes |
|---|---|---|---|
| DB subnet group | Private DB subnets A and B | [ ] | RDS subnet group screenshot |
| Engine | MySQL or MariaDB | [ ] | DB screenshot |
| Public access | No | [ ] | Connectivity screenshot |
| Security Group | `scos-dev-rds-sg` | [ ] | Connectivity screenshot |
| Database name | `scosapp` | [ ] | DB config screenshot |
| Backups | Enabled | [ ] | Backup config screenshot |
| Encryption | Enabled | [ ] | Storage screenshot |
| Test query | `SELECT * FROM products;` works | [ ] | Terminal screenshot |

---

## 8. EC2 Builder Checklist

| Task | Done | Evidence / Notes |
|---|---|---|
| EC2 builder instance launched | [ ] | Instance screenshot |
| IAM role attached | [ ] | Instance details screenshot |
| Apache/httpd installed | [ ] | Terminal screenshot |
| PHP and MariaDB client installed | [ ] | Terminal screenshot |
| `/health.html` returns `OK` | [ ] | Curl/browser screenshot |
| RDS connection tested from EC2 | [ ] | MySQL terminal screenshot |
| Sample app page loads | [ ] | Browser screenshot |

Useful commands:

```bash
sudo dnf update -y
sudo dnf install -y httpd php php-mysqli mariadb105
sudo systemctl enable --now httpd
curl http://localhost/health.html
mysql -h <rds-endpoint> -P 3306 -u admin -p
```

---

## 9. AMI / Launch Template Checklist

| Task | Expected Value | Done | Evidence / Notes |
|---|---|---|---|
| AMI created | `scos-dev-web-ami` | [ ] | AMI screenshot |
| Launch Template created | `scos-dev-web-lt` | [ ] | LT screenshot |
| AMI selected | Custom AMI or approved Amazon Linux AMI | [ ] | LT version screenshot |
| Security Group | `scos-dev-app-sg` | [ ] | LT network screenshot |
| IAM role | `scos-dev-ec2-app-role` | [ ] | LT advanced details screenshot |
| IMDSv2 | Required if available | [ ] | LT advanced details screenshot |

---

## 10. ALB and Auto Scaling Checklist

| Resource / Setting | Expected Value | Done | Evidence / Notes |
|---|---|---|---|
| Target Group | `scos-dev-web-tg` | [ ] | TG screenshot |
| Health check path | `/health.html` | [ ] | TG health check screenshot |
| ALB | `scos-dev-web-alb` | [ ] | ALB screenshot |
| ALB scheme | Internet-facing | [ ] | ALB screenshot |
| ALB subnets | Public A and Public B | [ ] | Network mapping screenshot |
| Listener | HTTP 80 forward to target group | [ ] | Listener screenshot |
| ASG | `scos-dev-web-asg` | [ ] | ASG screenshot |
| ASG subnets | Private app A and B | [ ] | ASG network screenshot |
| Desired / Min / Max | 2 / 2 / 4 | [ ] | ASG group size screenshot |
| Scaling policy | CPU target tracking 60% | [ ] | ASG policy screenshot |
| Targets healthy | 2 healthy targets | [ ] | Target health screenshot |
| ALB DNS works | Web page loads | [ ] | Browser screenshot |

---

## 11. Monitoring and Backup Checklist

| Check | Done | Evidence / Notes |
|---|---|---|
| CloudWatch EC2 metrics visible | [ ] | Metric screenshot |
| ALB metrics visible | [ ] | Metric screenshot |
| RDS metrics visible | [ ] | Metric screenshot |
| Unhealthy host alarm created | [ ] | Alarm screenshot |
| EC2 CPU alarm created | [ ] | Alarm screenshot |
| RDS CPU/storage alarm created | [ ] | Alarm screenshot |
| Billing or budget alert exists | [ ] | Budget screenshot |
| RDS manual snapshot created | [ ] | Snapshot screenshot |
| S3 versioning and lifecycle verified | [ ] | S3 screenshot |
| Optional AWS Backup plan created | [ ] | Backup plan screenshot |

---

## 12. Final Portfolio Evidence

Capture these screenshots for GitHub, LinkedIn, or job interview discussion:

1. VPC and subnet list
2. Route tables
3. Security Groups
4. IAM role attached to EC2
5. S3 bucket security settings
6. RDS private database configuration
7. EC2 builder test page
8. RDS query from EC2
9. AMI or Launch Template
10. Target Group healthy instances
11. ALB DNS loading web page
12. Auto Scaling Group desired/min/max capacity
13. CloudWatch alarms
14. Budget alert
15. Cleanup confirmation

Suggested portfolio summary:

```text
I manually configured a three-tier AWS cloud environment for a simulated Adelaide-based SME. The build included VPC segmentation, public and private subnets, least-privilege Security Groups, IAM roles, private RDS, S3 backup storage, an Application Load Balancer, EC2 Auto Scaling, CloudWatch monitoring, and cost controls. I documented the manual build process and compared it with script and Infrastructure as Code deployment options.
```

---

## 13. Cleanup Checklist

Delete resources in this order:

| Order | Resource | Done |
|---:|---|---|
| 1 | Auto Scaling Group | [ ] |
| 2 | EC2 instances not managed by ASG | [ ] |
| 3 | Launch Template if not needed | [ ] |
| 4 | Application Load Balancer | [ ] |
| 5 | Target Group | [ ] |
| 6 | RDS database | [ ] |
| 7 | RDS snapshots not required | [ ] |
| 8 | S3 objects and bucket | [ ] |
| 9 | NAT Gateway | [ ] |
| 10 | Elastic IP released | [ ] |
| 11 | Route tables | [ ] |
| 12 | Subnets | [ ] |
| 13 | Internet Gateway detached and deleted | [ ] |
| 14 | VPC | [ ] |
| 15 | CloudWatch alarms and log groups | [ ] |
| 16 | IAM roles and policies created for the lab | [ ] |

Important:

```text
After deleting the NAT Gateway, check Elastic IPs and release unused Elastic IP addresses.
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

