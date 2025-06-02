# Frontend Task Definition
resource "aws_ecs_task_definition" "frontend" {
  family                   = "b3-frontend"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn           = var.ecs_task_role_arn

  container_definitions = jsonencode([
    {
      name      = "frontend"
      image     = "${var.ecr_frontend_repository_url}:9a4875ec85bec6c37e56ea7b71d5e6392297a0ae"
      essential = true

      portMappings = [
        {
          containerPort = 3000
          protocol      = "tcp"
        }
      ]

      environment = [
        {
          name  = "BASE_URL"
          value = "${var.backend_url}/api"
        },
        {
          name  = "NEXT_PUBLIC_COGNITO_USER_POOL"
          value = "https://cognito-idp.eu-west-3.amazonaws.com/${var.cognito_user_pool_id}"
        },
        {
          name  = "NEXT_PUBLIC_COGNITO_CLIENT_ID"
          value = var.cognito_user_pool_client_id
        },
        {
          name = "NEXT_PUBLIC_COGNITO_CALLBACK_URL"
          value = var.frontend_url
        },
        {
          name  = "NEXT_PUBLIC_COGNITO_HOSTED_UI_DOMAIN"
          value = var.cognito_hosted_ui_domain
        },
        {
          name = "NODE_ENV"
          value = "production"
        },
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.frontend.name
          awslogs-region        = var.region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  tags = {
    Name = "b3-frontend-task"
  }
}
