# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "b3-main-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "b3-main-cluster"
  }
}
