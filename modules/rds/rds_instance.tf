# Subnet group for RDS
resource "aws_db_subnet_group" "default" {
  name       = "postgres-subnet-group"
  subnet_ids = var.aws_subnet_ids
  tags = {
    Name = "postgres-subnet-group"
  }
}

# AWS Secrets Manager secret for database password
resource "aws_secretsmanager_secret" "db_password" {
  name        = "b3-db-password-tf-2"
  description = "Password for the B3 PostgreSQL database"

  tags = {
    Name = "b3-db-password"
  }
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = var.db_password
}

# RDS PostgreSQL instance (free-tier eligible)
resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "17.3"
  instance_class         = "db.t4g.micro"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
  skip_final_snapshot    = true

  tags = {
    Name = "postgres-db"
  }
}
