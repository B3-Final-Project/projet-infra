resource "aws_s3_bucket" "tf--holomatch-images" {
  bucket        = "holomatch-images"
  force_destroy = "false"

  grant {
    id          = "7e9d7bdbc3b085bed62867e92d7ebcdade230fee442ff2d5717d083b0447bff3"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}
