resource "aws_cognito_identity_provider" "google" {
  user_pool_id  = aws_cognito_user_pool.tf--cognito_user_pool.id
  provider_name = "Google"
  provider_type = "Google"

  attribute_mapping = {
    email         = "email"
    username      = "sub"
    given_name    = "given_name"
    family_name   = "family_name"
  }

  provider_details = {
    client_id         = "157943089258-dsrcv3agum6l5tvlgpugio7tpchhbcnh.apps.googleusercontent.com"
    client_secret     = "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"
    authorize_scopes  = "openid email profile"
  }
}
