# Application Load Balancer
resource "aws_lb" "main" {
  name               = "b3-main-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "b3-main-alb"
  }
}

