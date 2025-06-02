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
    client_id         = var.google_client_id
    client_secret     = var.google_client_secret
    authorize_scopes  = "openid email profile"
  }
}
