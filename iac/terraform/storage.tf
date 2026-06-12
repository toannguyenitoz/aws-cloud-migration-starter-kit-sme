resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "app_assets" {
  bucket = "${var.name_prefix}-app-assets-${random_id.bucket_suffix.hex}"

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-app-assets"
  })
}

resource "aws_s3_bucket_public_access_block" "app_assets" {
  bucket                  = aws_s3_bucket.app_assets.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "app_assets" {
  bucket = aws_s3_bucket.app_assets.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_assets" {
  bucket = aws_s3_bucket.app_assets.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
