module "networks" {
  source = "./modules/networks"
}

module "s3" {
  source = "./modules/s3"
}

module "rds" {
  source = "./modules/rds"
  aws_vpc_id = module.networks.aws_vpc_main_id
  aws_subnet_ids = module.networks.public_aws_subnet_ids
  db_password = "dopfiushobvypsurib4328907452kedwkvo_%tfs"
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
}
