# Security Group for Frontend ECS Tasks
resource "aws_security_group" "frontend_ecs" {
  name_prefix = "b3-frontend-ecs-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [var.aws_alb_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "b3-frontend-ecs-sg"
  }
}
