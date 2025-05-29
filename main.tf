module "s3" {
  source = "./modules/s3"
}

# module "rds" {
#   source = "./modules/rds"
# }
#
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
