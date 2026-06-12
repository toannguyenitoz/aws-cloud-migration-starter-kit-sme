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

# Target AWS Architecture

## 1. Architecture Objective

The target architecture is designed for a small business moving a customer order portal to AWS.

The design focuses on:

- Clear network segmentation
- No direct public access to application or database servers
- Load balancing
- Auto Scaling
- Managed database
- Central logging
- Backup
- Cost visibility
- Simple operations for a small IT team

---

## 2. High-Level Architecture

```mermaid
flowchart TD
    Internet[Internet Users] --> DNS[Route 53 DNS]
    DNS --> CDN[CloudFront]
    CDN --> WAF[AWS WAF]
    WAF --> ALB[Application Load Balancer]

    subgraph Account[AWS Production Account]
      subgraph VPC[VPC 10.20.0.0/16]
        subgraph AZA[Availability Zone A]
          PubA[Public Subnet A<br/>10.20.0.0/24]
          AppA[Private App Subnet A<br/>10.20.10.0/24]
          DbA[Private DB Subnet A<br/>10.20.20.0/24]
        end

        subgraph AZB[Availability Zone B]
          PubB[Public Subnet B<br/>10.20.1.0/24]
          AppB[Private App Subnet B<br/>10.20.11.0/24]
          DbB[Private DB Subnet B<br/>10.20.21.0/24]
        end

        ALB --> ASG[EC2 Auto Scaling Group]
        ASG --> RDS[(RDS Multi-AZ)]
        ASG --> S3[(S3 Bucket)]
      end
    end

    OnPrem[On-Prem Adelaide Office] -. Site-to-Site VPN .-> VPC
```

---

## 3. Network Design

| Network Segment | CIDR | Purpose |
|---|---:|---|
| VPC | 10.20.0.0/16 | Main cloud network |
| Public Subnet A | 10.20.0.0/24 | ALB, NAT Gateway |
| Public Subnet B | 10.20.1.0/24 | ALB, optional NAT Gateway |
| Private App Subnet A | 10.20.10.0/24 | EC2 application instances |
| Private App Subnet B | 10.20.11.0/24 | EC2 application instances |
| Private DB Subnet A | 10.20.20.0/24 | RDS subnet group |
| Private DB Subnet B | 10.20.21.0/24 | RDS subnet group |
| Management Subnet A | 10.20.30.0/24 | Future admin tools |
| Management Subnet B | 10.20.31.0/24 | Future admin tools |

---

## 4. Routing Design

### Public Route Table

| Destination | Target |
|---|---|
| 10.20.0.0/16 | Local |
| 0.0.0.0/0 | Internet Gateway |

### Private Application Route Table

| Destination | Target |
|---|---|
| 10.20.0.0/16 | Local |
| 0.0.0.0/0 | NAT Gateway |

### Private Database Route Table

| Destination | Target |
|---|---|
| 10.20.0.0/16 | Local |

Database subnets do not require direct outbound internet access for this basic design.

---

## 5. Security Group Design

### ALB Security Group

| Direction | Protocol | Port | Source |
|---|---|---:|---|
| Inbound | TCP | 80 | 0.0.0.0/0 |
| Inbound | TCP | 443 | 0.0.0.0/0 |
| Outbound | TCP | App Port 80/443 | App Security Group |

### Application Security Group

| Direction | Protocol | Port | Source |
|---|---|---:|---|
| Inbound | TCP | 80 | ALB Security Group |
| Outbound | TCP | 3306/5432 | RDS Security Group |
| Outbound | HTTPS | 443 | AWS APIs / Internet via NAT |

### RDS Security Group

| Direction | Protocol | Port | Source |
|---|---|---:|---|
| Inbound | TCP | 3306 or 5432 | Application Security Group |
| Outbound | Default | Default | Default |

---

## 6. Data Architecture

| Data Type | Target |
|---|---|
| Application relational data | Amazon RDS |
| Product images | S3 |
| Reports | S3 |
| Application logs | CloudWatch Logs |
| Audit events | CloudTrail |
| Backups | AWS Backup + S3 |

---

## 7. Availability Design

| Layer | Availability Choice |
|---|---|
| Network | Two Availability Zones |
| Load Balancer | ALB across public subnets |
| Compute | Auto Scaling Group across private app subnets |
| Database | RDS Multi-AZ |
| Storage | S3 |
| Monitoring | CloudWatch alarms |
| Backup | Automated backup plan |

---

## 8. Future Improvements

After the first migration wave, the business can consider:

- Moving application from EC2 to containers using ECS or EKS
- Adding CI/CD pipeline
- Using Secrets Manager for database credentials
- Adding AWS Network Firewall for advanced inspection
- Implementing centralized multi-account landing zone
- Using AWS Backup cross-region copy
- Replacing legacy VPN with Zero Trust remote access pattern
- Adding Amazon QuickSight for reporting

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

