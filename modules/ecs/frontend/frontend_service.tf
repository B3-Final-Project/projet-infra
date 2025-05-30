# ECS Service for Frontend
resource "aws_ecs_service" "frontend" {
  name            = "b3-frontend-service"
  cluster         = var.aws_ecs_cluster_id
  task_definition = aws_ecs_task_definition.frontend.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.public_subnet_ids
    security_groups  = [aws_security_group.frontend_ecs.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.frontend.arn
    container_name   = "frontend"
    container_port   = 3000
  }

  depends_on = [
    aws_lb_listener.frontend_https,
    aws_lb_listener.frontend_http_redirect
  ]

  tags = {
    Name = "b3-frontend-service"
  }
}
