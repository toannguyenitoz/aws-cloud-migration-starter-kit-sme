<a id="top"></a>

# Terraform Lab - AWS Cloud Migration Foundation

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

## Warning

Running this may create AWS costs. NAT Gateway, ALB, EC2, RDS, and CloudWatch can generate charges.

Use a lab account and run:

```bash
terraform destroy
```

after testing.

---

## Prerequisites

- Terraform installed
- AWS CLI configured
- AWS account with appropriate permissions

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

## Clean Up

```bash
terraform destroy
```

[⬆ Back to Top](#top)
