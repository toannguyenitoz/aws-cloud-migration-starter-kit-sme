variable "aws_region" {
  description = "AWS Region to deploy into."
  type        = string
  default     = "ap-southeast-2"
}

variable "project" {
  description = "Project tag."
  type        = string
  default     = "CloudMigration"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "name_prefix" {
  description = "Prefix for resource names."
  type        = string
  default     = "scos-dev"
}

variable "vpc_cidr" {
  description = "Main VPC CIDR."
  type        = string
  default     = "10.20.0.0/16"
}

variable "allowed_admin_cidr" {
  description = "Your public IP CIDR for temporary admin access. Avoid 0.0.0.0/0."
  type        = string
  default     = "203.0.113.10/32"
}

variable "create_nat_gateway" {
  description = "Create a NAT Gateway. Disable for lower cost lab if not needed."
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Additional tags."
  type        = map(string)
  default = {
    Owner       = "IT"
    CostCentre  = "Operations"
    ManagedBy   = "Terraform"
    Repository  = "aws-cloud-migration-starter-kit-sme"
  }
}
