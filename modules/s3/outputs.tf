output "bucket_name" {
  description = "Name of the S3 bucket"
  value = aws_s3_bucket.tf--holomatch-images.id
}

output "aws_s3_bucket_tf--holomatch-images_id" {
  value = "${aws_s3_bucket.tf--holomatch-images.id}"
}
