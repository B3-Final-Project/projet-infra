
variable "google_client_id" {
  sensitive = true
}

variable "google_client_secret" {
  sensitive = true
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "profile" {
  description = "AWS profile to use for authentication"
  type        = string
}
