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

# Setup 05 - Amazon RDS and S3

## 1. Objective

Move the business application data layer to managed AWS services.

This setup includes:

- Amazon RDS for relational database
- S3 for product files, backup archive, and static assets
- Security controls for private data

---

## 2. Amazon RDS Design

| Setting | Recommended Value |
|---|---|
| Engine | MySQL or PostgreSQL |
| Deployment | Multi-AZ for production |
| Public Access | No |
| Subnet Group | Private DB subnets |
| Security Group | Allow DB port only from App Security Group |
| Backup Retention | 7 to 35 days depending on business needs |
| Encryption | Enabled |
| Monitoring | CloudWatch and Enhanced Monitoring if required |

---

## 3. RDS Creation Steps

1. Create DB subnet group using private DB subnets.
2. Create RDS Security Group.
3. Allow inbound DB port only from Application Security Group.
4. Create RDS instance.
5. Disable public access.
6. Enable encryption.
7. Set backup retention.
8. Store credentials in Secrets Manager or secure password vault.
9. Test connection from application instance.

Example test:

```bash
mysql -h <rds-endpoint> -P 3306 -u <username> -p
```

---

## 4. S3 Design

| Bucket | Purpose |
|---|---|
| scos-prod-app-assets | Product images and static files |
| scos-prod-backup-archive | Backup exports |
| scos-prod-logs | Central logs |

---

## 5. S3 Security Baseline

- Block Public Access enabled.
- Bucket versioning enabled where appropriate.
- Encryption enabled.
- Lifecycle rules configured.
- Access through IAM roles.
- Public website hosting disabled unless explicitly required.
- Sensitive data not stored without classification and approval.

---

## 6. S3 Lifecycle Example

| Object Type | Action |
|---|---|
| Daily backup files | Move to infrequent access after 30 days |
| Old backup files | Move to archive after 90 days |
| Expired temporary files | Delete after 30 days |
| Logs | Retain based on compliance needs |

---

## 7. Data Migration Options

| Source | Target | Method |
|---|---|---|
| MySQL dump | RDS | mysqldump and import |
| Product images folder | S3 | aws s3 sync |
| Backup archive | S3 | AWS CLI sync |
| Large data transfer | S3 | Consider multipart upload or AWS DataSync |

Example:

```bash
aws s3 sync ./product-images s3://scos-prod-app-assets/product-images/
```

---

## 8. Validation

| Test | Expected Result |
|---|---|
| App connects to RDS | Successful database query |
| RDS public access | Disabled |
| S3 public access | Blocked |
| App reads S3 objects | IAM role allows required access |
| Backup file upload | Successful |
| Lifecycle policy | Visible and enabled |

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

