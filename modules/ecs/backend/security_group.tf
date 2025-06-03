# Security Group for Backend ECS Tasks
resource "aws_security_group" "backend_ecs" {
  name_prefix = "b3-backend-ecs-sg"
  vpc_id      = var.vpc_id

  # Allow access from frontend ECS tasks (for internal service discovery)
  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [var.frontend_ecs_security_group_id]
  }

  # Allow access from ALB for API requests
  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "b3-backend-ecs-sg"
  }
}
