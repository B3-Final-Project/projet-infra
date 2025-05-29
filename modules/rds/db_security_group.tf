# Security Group allowing PostgreSQL access from the internet
resource "aws_security_group" "postgres_sg" {
  name        = "postgres-sg"
  description = "Allow Postgres access"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Postgres port"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
