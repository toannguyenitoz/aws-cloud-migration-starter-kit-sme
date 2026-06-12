data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-web-vpc"
  })
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-web-igw"
  })
}

resource "aws_subnet" "public" {
  for_each                = local.public_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = data.aws_availability_zones.available.names[each.value.az_i]
  map_public_ip_on_launch = false

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-${each.key}"
    Tier = "public"
  })
}

resource "aws_subnet" "private_app" {
  for_each          = local.private_app_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = data.aws_availability_zones.available.names[each.value.az_i]

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-${each.key}"
    Tier = "private-app"
  })
}

resource "aws_subnet" "private_db" {
  for_each          = local.private_db_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = data.aws_availability_zones.available.names[each.value.az_i]

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-${each.key}"
    Tier = "private-db"
  })
}

resource "aws_eip" "nat" {
  count  = var.create_nat_gateway ? 1 : 0
  domain = "vpc"

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-nat-eip"
  })
}

resource "aws_nat_gateway" "main" {
  count         = var.create_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public["public-a"].id

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-nat-a"
  })

  depends_on = [aws_internet_gateway.main]
}
