module "backend" {
  source = "./backend"
  ecs_cluster_id = aws_ecs_cluster.main.id
  private_subnet_ids = var.private_subnet_ids
  ecs_task_execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  ecs_task_role_arn = aws_iam_role.ecs_task_role.arn
  ecr_backend_repository_url = var.ecr_backend_repository_url
  rds_endpoint = var.rds_endpoint
  db_name = var.db_name
  db_username = var.db_username
  db_password_secret_arn = var.db_password_secret_arn
  region = var.region
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  aws_service_discovery_main_dns_namespace = aws_service_discovery_private_dns_namespace.main.id
  frontend_ecs_security_group_id = module.frontend.aws_frontend_ecs_security_group_id
  alb_security_group_id = aws_security_group.alb.id
  vpc_id = var.vpc_id
  cognito_user_pool_domain = var.cognito_user_pool_discovery_domain
  cognito_client_id = var.cognito_client_id
  s3_bucket_name = var.s3_bucket_name
  frontend_url = var.frontend_url
  alb_dns_name = aws_lb.main.dns_name
}

module "frontend" {
  source = "./frontend"
  aws_ecs_cluster_id = aws_ecs_cluster.main.id
  ecr_frontend_repository_url = var.ecr_frontend_repository_url
  ecs_task_execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  ecs_task_role_arn = aws_iam_role.ecs_task_role.arn
  public_subnet_ids = var.public_subnet_ids
  region = var.region
  main_alb_arn = aws_lb.main.arn
  vpc_id = var.vpc_id
  aws_alb_security_group_id = aws_security_group.alb.id
  frontend_url = var.frontend_url
  backend_url = "https://holomatch.org"  # Use HTTPS through ALB for API calls
  s3_bucket_name = var.s3_bucket_name
  certificate_arn = var.certificate_arn
}
