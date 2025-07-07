# Backend Task Definition
resource "aws_ecs_task_definition" "backend" {
  family                   = "b3-backend"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn           = var.ecs_task_role_arn

  container_definitions = jsonencode([
    {
      name      = "backend"
      image     = "${var.ecr_backend_repository_url}:b5170548e21f36ad965d122fd11bb1c9e3372219"
      essential = true

      portMappings = [
        {
          containerPort = 8080
          protocol      = "tcp"
        }
      ]

      environment = [
        {name: "AWS_REGION", value: var.region},
        {name: "AWS_ACCESS_KEY_ID", value: var.aws_access_key},
        {name: "AWS_SECRET_ACCESS_KEY", value: var.aws_secret_key},
        {name: "COGNITO_USER_POOL", value: var.cognito_user_pool_domain},
        {name: "COGNITO_CLIENT_ID", value: "m3c4vovah53juakobk8j3jap2" },
        {name: "COGNITO_HOSTED_UI_DOMAIN", value: "https://auth-holomatch.auth.eu-west-3.amazoncognito.com"},
        {name: "S3_BUCKET_NAME", value: var.s3_bucket_name},
        {name: "FRONTEND_URL", value: var.frontend_url},
        {name: "ALB_DNS_NAME", value: "https://${var.alb_dns_name}"},
        {name: "DATABASE_HOST", value: var.rds_endpoint},
        {name: "DATABASE_USER", value: var.db_username},
        {name: "DATABASE_NAME", value: var.db_name},
        {name: "NODE_ENV", value: "production"},
      ]

      secrets = [
        {
          name      = "DATABASE_PASSWORD"
          valueFrom = var.db_password_secret_arn
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.backend.name
          awslogs-region        = var.region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  tags = {
    Name = "b3-backend-task"
  }
}
