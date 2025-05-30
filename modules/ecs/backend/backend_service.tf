# ECS Service for Backend
resource "aws_ecs_service" "backend" {
  name            = "b3-backend-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.backend.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [aws_security_group.backend_ecs.id]
    assign_public_ip = false
  }

  # Service Discovery for internal communication
  service_registries {
    registry_arn = aws_service_discovery_service.backend.arn
  }

  tags = {
    Name = "b3-backend-service"
  }
}
