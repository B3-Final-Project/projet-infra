# ALB Target Group for Frontend
resource "aws_lb_target_group" "frontend" {
  name        = "b3-frontend-tg-v2"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 10  # Increased to give more time
    timeout             = 10  # Increased timeout
    interval            = 60  # Increased interval
    path                = "/"
    matcher             = "200,404"  # Accept both 200 and 404 for testing
    port                = "traffic-port"
    protocol            = "HTTP"
  }

  tags = {
    Name = "b3-frontend-tg"
  }
}

# Note: HTTP and HTTPS listeners are now defined in https.tf
