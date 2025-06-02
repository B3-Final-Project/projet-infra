variable "region" {
  description = "The AWS region where the backend service will be deployed."
  type        = string
}

variable "aws_access_key" {
  description = "The AWS access key for authentication."
  type        = string
}

variable "aws_secret_key" {
  description = "The AWS secret key for authentication."
  type        = string
}

variable "ecs_cluster_id" {
  description = "The ID of the ECS cluster where the backend service will be deployed."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the backend service."
  type        = list(string)
}

variable "ecs_task_role_arn" {
  description = "The arn of the ECS task role."
  type        = string
}

variable "ecs_task_execution_role_arn" {
  description = "The arn of the ECS task execution role."
  type        = string
}

variable "ecr_backend_repository_url" {
  description = "The URL of the ECR repository for the backend service."
  type        = string
}
variable "frontend_ecs_security_group_id" {
    description = "The security group ID for the frontend ECS tasks."
    type        = string
}
variable "vpc_id" {
    description = "The ID of the VPC where the backend service will be deployed."
    type        = string
}

// RDS variables
variable "rds_endpoint" {
  description = "The endpoint of the RDS instance."
  type        = string
}
variable "db_name" {
  description = "The name of the database."
  type        = string
}
variable "db_username" {
  description = "The username for the database."
  type        = string
}
variable "db_password_secret_arn" {
  description = "The ARN of the AWS Secrets Manager secret containing the database password."
  type        = string
}
variable "aws_service_discovery_main_dns_namespace" {
    description = "The ID of the main service discovery DNS namespace."
    type        = string
}

variable "cognito_user_pool_id" {
  description = "The ID of the Cognito User Pool."
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for storing files."
  type        = string
}

variable "frontend_url" {
  description = "The URL of the frontend application."
  type        = string
}
