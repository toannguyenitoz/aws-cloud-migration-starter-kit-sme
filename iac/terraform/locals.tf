locals {
  az_count = 2

  public_subnets = {
    public-a = {
      cidr = "10.20.0.0/24"
      az_i = 0
    }
    public-b = {
      cidr = "10.20.1.0/24"
      az_i = 1
    }
  }

  private_app_subnets = {
    app-a = {
      cidr = "10.20.10.0/24"
      az_i = 0
    }
    app-b = {
      cidr = "10.20.11.0/24"
      az_i = 1
    }
  }

  private_db_subnets = {
    db-a = {
      cidr = "10.20.20.0/24"
      az_i = 0
    }
    db-b = {
      cidr = "10.20.21.0/24"
      az_i = 1
    }
  }

  tags = merge(
    var.common_tags,
    {
      Project     = var.project
      Environment = var.environment
    }
  )
}
