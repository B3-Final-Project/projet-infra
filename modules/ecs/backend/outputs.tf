output "backend_target_group_arn" {
  description = "ARN of the backend target group"
  value       = aws_lb_target_group.backend_api.arn
}

output "backend_security_group_id" {
  description = "ID of the backend security group"
  value       = aws_security_group.backend_ecs.id
}
