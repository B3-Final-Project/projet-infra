# HTTPS Listener (for second deployment after certificate is ready)
# Certificate is now validated - enabling HTTPS!

# HTTPS Listener 
resource "aws_lb_listener" "frontend_https" {
  load_balancer_arn = var.main_alb_arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}

# HTTP to HTTPS redirect
resource "aws_lb_listener" "frontend_http_redirect" {
  load_balancer_arn = var.main_alb_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
