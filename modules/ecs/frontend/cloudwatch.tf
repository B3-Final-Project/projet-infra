resource "aws_cloudwatch_log_group" "frontend" {
  name              = "/ecs/b3-frontend"
  retention_in_days = 7

  tags = {
    Name = "b3-frontend-logs"
  }
}
