output "vpc_id" {
  description = "Created VPC ID."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_app_subnet_ids" {
  description = "Private application subnet IDs."
  value       = [for subnet in aws_subnet.private_app : subnet.id]
}

output "private_db_subnet_ids" {
  description = "Private database subnet IDs."
  value       = [for subnet in aws_subnet.private_db : subnet.id]
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name."
  value       = aws_lb.app.dns_name
}

output "s3_app_assets_bucket" {
  description = "S3 bucket for application assets."
  value       = aws_s3_bucket.app_assets.bucket
}
