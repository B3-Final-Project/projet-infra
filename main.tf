module "networks" {
  source = "./modules/networks"
}

module "s3" {
  source = "./modules/s3"
}

module "ecr" {
  source = "./modules/ecr"
}

module "rds" {
  source = "./modules/rds"
  aws_vpc_id = module.networks.aws_vpc_main_id
  aws_subnet_ids = module.networks.private_aws_subnet_ids
  db_password = "dopfiushobvypsurib4328907452kedwkvo_%tfs"
  db_name = "b3db"
  db_username = "postgres"
}

module "kms" {
  source = "./modules/kms"
}

module "cognito" {
  source = "./modules/cognito"
  region = var.region
  profile = "b3"
  google_client_id = local.envs["GOOGLE_CLIENT_ID"]
  google_client_secret = local.envs["GOOGLE_CLIENT_SECRET"]
  frontend_url = "holomatch.org"
}

module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.networks.aws_vpc_main_id
  public_subnet_ids = module.networks.public_aws_subnet_ids
  private_subnet_ids = module.networks.private_aws_subnet_ids
  region = var.region
  ecr_frontend_repository_url = module.ecr.frontend_repository_url
  ecr_backend_repository_url = module.ecr.backend_repository_url
  rds_endpoint = module.rds.db_instance_endpoint
  db_name = "b3db"
  db_username = "postgres"
  db_password_secret_arn = module.rds.db_password_secret_arn
  cognito_user_pool_id = module.cognito.user_pool_id
  s3_bucket_name = module.s3.bucket_name
  frontend_url = "https://holomatch.org"
  cognito_user_pool_client_id = module.cognito.user_pool_client_id
  cognito_hosted_ui_domain = module.cognito.hosted_ui_domain
  certificate_arn = module.route53.certificate_arn
  aws_access_key = local.envs["AWS_ACCESS_KEY_ID"]
  aws_secret_key = local.envs["AWS_SECRET_KEY"]
}

module "route53" {
  source = "./modules/route53"
  domain_name = "holomatch.org"
  alb_dns_name = module.ecs.load_balancer_dns_name
  alb_zone_id = module.ecs.load_balancer_zone_id
}

# if i want to activate everything again
# Uncomment module "rds" and module "ecs"
# Change route53_minimal to route53 in main.tf
