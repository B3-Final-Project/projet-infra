# ALB Listener Rules for routing API requests to backend
resource "aws_lb_listener_rule" "backend_api" {
  listener_arn = module.frontend.frontend_https_listener_arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = module.backend.backend_target_group_arn
  }

  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }

  tags = {
    Name = "backend-api-rule"
  }
}

# WebSocket specific rule for /socket.io requests
resource "aws_lb_listener_rule" "websocket_socketio" {
  listener_arn = module.frontend.frontend_https_listener_arn
  priority     = 90  # Higher priority than /api/* rule

  action {
    type             = "forward"
    target_group_arn = module.backend.backend_target_group_arn
  }

  condition {
    path_pattern {
      values = ["/socket.io/*"]
    }
  }

  tags = {
    Name = "websocket-socketio-rule"
  }
}

# Optional: Add a rule for health checks
resource "aws_lb_listener_rule" "backend_health" {
  listener_arn = module.frontend.frontend_https_listener_arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = module.backend.backend_target_group_arn
  }

  condition {
    path_pattern {
      values = ["/health", "/api/health"]
    }
  }

  tags = {
    Name = "backend-health-rule"
  }
}
