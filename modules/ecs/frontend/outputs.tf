output "aws_frontend_ecs_security_group_id" {
  value = aws_security_group.frontend_ecs.id
}

output "frontend_https_listener_arn" {
  description = "ARN of the frontend HTTPS listener"
  value       = aws_lb_listener.frontend_https.arn
}
