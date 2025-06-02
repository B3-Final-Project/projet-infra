resource "aws_s3_bucket" "tf--holomatch-images" {
  bucket = var.bucket_name
  tags = var.tags
}

# Block all public access at the bucket level
resource "aws_s3_bucket_public_access_block" "tf--holomatch-images-public-access-block" {
  bucket                  = aws_s3_bucket.tf--holomatch-images.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_access_point" "s3_dev_access_point" {
  bucket = aws_s3_bucket.tf--holomatch-images.id
  name   = "tf-dev-access-point"
}

resource "aws_s3_bucket_ownership_controls" "bucket_ownership_controls" {
  bucket = var.bucket_name
  rule {
      object_ownership = "ObjectWriter"
  }
}
