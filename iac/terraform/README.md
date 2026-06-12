<a id="top"></a>

# ⚙️ Terraform Lab - AWS Cloud Migration Foundation

<p align="center">
  <img src="https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform">
  <img src="https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Cloud">
  <img src="https://img.shields.io/badge/Level-Learning%20Lab-22C55E?style=for-the-badge" alt="Learning Lab">
  <img src="https://img.shields.io/badge/Manual%20First-Console%20Then%20IaC-0EA5E9?style=for-the-badge" alt="Manual First">
</p>

<p align="center">
  <a href="../../README.md">Main README</a> •
  <a href="../../docs/setup/09-aws-console-manual-setup.md">Manual AWS Console Guide</a> •
  <a href="../../docs/setup/10-aws-console-build-checklist.md">Build Checklist</a>
</p>

---

## Purpose

This Terraform folder is a learning lab for rebuilding the AWS cloud migration foundation after you understand the manual AWS Console configuration.

Recommended order:

1. Build the environment manually using the AWS Console guide.
2. Take screenshots and understand each service.
3. Review the Terraform files in this folder.
4. Deploy the same foundation using Infrastructure as Code.
5. Compare manual configuration with Terraform-managed resources.

---

## What This Deploys

This Terraform lab creates a simplified AWS foundation:

- VPC
- Public subnets
- Private application subnets
- Private database subnets
- Internet Gateway
- NAT Gateway
- Route tables
- Security Groups
- S3 bucket
- Optional EC2 launch template and Auto Scaling structure

The files are intentionally written for learning and readability.

---

## Folder Files

| File | Purpose |
|---|---|
| `providers.tf` | AWS provider configuration |
| `variables.tf` | Input variables |
| `locals.tf` | Naming and common values |
| `network.tf` | VPC, subnets and networking foundation |
| `routes.tf` | Internet Gateway, NAT Gateway and route tables |
| `security_groups.tf` | ALB, app and database security group model |
| `storage.tf` | S3 bucket example |
| `compute_skeleton.tf` | Starter EC2 / Auto Scaling structure |
| `outputs.tf` | Useful deployment outputs |
| `terraform.tfvars.example` | Example variable values |

---

## Prerequisites

- Terraform installed
- AWS CLI installed and configured
- AWS account with appropriate permissions
- Lab region selected, recommended: `ap-southeast-2`
- Basic understanding of the manual AWS Console setup guide

---

## Quick Start

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

---

## Suggested Validation

After deployment, verify:

- VPC exists with expected CIDR
- Subnets are created across two Availability Zones
- Public route table has a route to Internet Gateway
- Private app route table has a route to NAT Gateway
- Database subnets do not have direct internet route
- Security Groups follow least privilege model
- S3 bucket is private
- Outputs are displayed successfully

---

## Cost Warning

Running this lab may create AWS costs. NAT Gateway, ALB, EC2, RDS, CloudWatch and data transfer can generate charges.

Use a lab account and destroy resources after testing.

```bash
terraform destroy
```

Then check AWS Billing Dashboard.

---

## Security Warning

Never commit real AWS credentials or sensitive values.

Do not commit:

```text
AWS Access Key
AWS Secret Key
.pem private key
RDS password
Production customer data
terraform.tfstate with sensitive values in public repositories
```

For public GitHub portfolio use, keep `terraform.tfvars` out of Git and only commit `terraform.tfvars.example`.

---

## Author

**Xuan Toan Nguyen**  
IT Support & Systems Administration Candidate  
Adelaide, South Australia, Australia

- LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

[⬆ Back to Top](#top)
