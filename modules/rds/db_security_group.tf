# Security Group allowing PostgreSQL access from ECS backend
resource "aws_security_group" "postgres_sg" {
  name        = "postgres-sg"
  description = "Allow Postgres access from ECS backend"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Postgres port from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Allow access from VPC CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "postgres-sg"
  }
}
