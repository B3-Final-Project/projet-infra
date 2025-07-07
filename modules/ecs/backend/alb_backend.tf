# ALB Target Group for Backend API
resource "aws_lb_target_group" "backend_api" {
  name        = "b3-backend-api-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  # Sticky sessions for WebSocket connections
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 86400  # 24 hours
    enabled         = true
  }

  # WebSocket-specific settings
  deregistration_delay = 60  # 60 seconds for graceful WebSocket disconnection

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 10
    interval            = 60
    path                = "/api/health"  # Adjust if your backend has a different health endpoint
    matcher             = "200,404"  # Accept both 200 and 404 for now
    port                = "traffic-port"
    protocol            = "HTTP"
  }

  tags = {
    Name = "b3-backend-api-tg"
  }
}
