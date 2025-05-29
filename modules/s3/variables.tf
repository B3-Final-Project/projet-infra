variable "bucket_name" {
  description = "The name of the S3 bucket (must be globally unique)"
  type        = string
  default     = "tf--holomatch-images"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "b3-dating-app"
  }
}
