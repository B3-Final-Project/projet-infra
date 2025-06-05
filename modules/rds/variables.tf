variable "aws_vpc_id" {
  description = "VPC ID where the RDS instance will be created"
  type        = string
}

variable "aws_subnet_ids" {
  description = "List of subnet IDs where the RDS instance will be created"
  type        = list(string)
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
  default     = "postgres_admin"
}
