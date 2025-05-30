variable "aws_ecs_cluster_id" {
    description = "The ID of the ECS cluster where the frontend service will be deployed."
    type        = string
}
variable "public_subnet_ids" {
    description = "List of public subnet IDs for the frontend service."
    type        = list(string)
}
variable "ecs_task_execution_role_arn" {
    description = "ARN of the ECS task execution role."
    type        = string
}
variable "ecs_task_role_arn" {
    description = "ARN of the ECS task role."
    type        = string
}
variable "ecr_frontend_repository_url" {
    description = "ECR repository URL for the frontend Docker image."
    type        = string
}
variable "region" {
    description = "AWS region where the resources will be deployed."
    type        = string
}
variable "aws_alb_security_group_id" {
    description = "ARN of the security group for the Application Load Balancer (ALB)."
    type        = string
}
variable "vpc_id" {
    description = "The ID of the VPC where the frontend service will be deployed."
    type        = string
}
variable "main_alb_arn" {
    description = "ARN of the main Application Load Balancer (ALB) for the frontend service."
    type        = string
}

variable "cognito_user_pool_id" {
  description = "The ID of the Cognito User Pool."
  type        = string
}

variable "cognito_user_pool_client_id" {
  description = "The ID of the Cognito User Pool Client."
  type        = string
}

variable "cognito_hosted_ui_domain" {
  description = "The hosted UI domain for Cognito."
  type        = string
}

variable "frontend_url" {
  description = "The URL of the frontend application (ALB DNS name)."
  type        = string
}

variable "backend_url" {
  description = "The backend URL for the frontend application."
  type        = string
}

variable "s3_bucket_name" {
  description = "The S3 bucket name for the frontend application."
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS"
  type        = string
  default     = null
}
