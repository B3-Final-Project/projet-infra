output "db_instance_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.postgres.address
}

output "db_instance_address" {
  description = "RDS instance address"
  value       = aws_db_instance.postgres.address
}

output "db_instance_port" {
  description = "RDS instance port"
  value       = aws_db_instance.postgres.port
}

output "db_instance_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.postgres.identifier
}

output "db_password_secret_arn" {
  description = "ARN of the secret containing the database password"
  value       = aws_secretsmanager_secret.db_password.arn
}

output "db_security_group_id" {
  description = "Security group ID for the database"
  value       = aws_security_group.postgres_sg.id
}
