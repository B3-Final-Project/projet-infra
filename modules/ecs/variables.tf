variable "vpc_id" {
  description = "VPC ID where ECS resources will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the load balancer and frontend service"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the backend service"
  type        = list(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "ecr_frontend_repository_url" {
  description = "ECR repository URL for frontend application"
  type        = string
}

variable "ecr_backend_repository_url" {
  description = "ECR repository URL for backend application"
  type        = string
}

variable "rds_endpoint" {
  description = "RDS PostgreSQL endpoint"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "b3db"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "postgres"
}

variable "db_password_secret_arn" {
  description = "ARN of the secret containing the database password"
  type        = string
}

variable "cognito_user_pool_id" {
  description = "The ID of the Cognito User Pool"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for storing files"
  type        = string
}

variable "frontend_url" {
  description = "The URL of the frontend application (ALB DNS name)"
  type        = string
}

variable "cognito_user_pool_client_id" {
  description = "The ID of the Cognito User Pool Client"
  type        = string
}

variable "cognito_hosted_ui_domain" {
  description = "The hosted UI domain for Cognito"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS"
  type        = string
  default     = null
}
