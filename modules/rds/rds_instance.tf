# Subnet group for RDS
resource "aws_db_subnet_group" "default" {
  name       = "postgres-subnet-group"
  subnet_ids = var.aws_subnet_ids
  tags = {
    Name = "postgres-subnet-group"
  }
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
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
  skip_final_snapshot    = true

  tags = {
    Name = "postgres-db"
  }
}
