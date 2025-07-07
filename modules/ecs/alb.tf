# Application Load Balancer
resource "aws_lb" "main" {
  name               = "b3-main-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  # WebSocket compatibility settings
  idle_timeout = 300  # 5 minutes - increased for WebSocket connections
  enable_http2 = true # Enable HTTP/2 for better performance

  tags = {
    Name = "b3-main-alb"
  }
}

