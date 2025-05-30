resource "aws_cloudwatch_log_group" "backend" {
  name              = "/ecs/b3-backend"
  retention_in_days = 7

  tags = {
    Name = "b3-backend-logs"
  }
}
