resource "aws_cognito_user_pool_client" "tf--cognito_user_pool_client" {
  access_token_validity                         = 1
  allowed_oauth_flows                           = ["code"]
  allowed_oauth_flows_user_pool_client          = true
  allowed_oauth_scopes                          = ["aws.cognito.signin.user.admin", "email", "openid", "profile"]
  auth_session_validity                         = 3
  callback_urls                                 = ["http://localhost:3000"]
  enable_propagate_additional_user_context_data = false
  enable_token_revocation                       = true
  explicit_auth_flows                           = ["ALLOW_ADMIN_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_SRP_AUTH"]
  id_token_validity                             = 60
  logout_urls                                   = ["http://localhost:3000"]
  name                                          = "b3-dating-app"
  prevent_user_existence_errors                 = "ENABLED"
  refresh_token_validity                        = 200
  supported_identity_providers                  = ["COGNITO", aws_cognito_identity_provider.google.provider_name]

  token_validity_units {
    access_token  = "days"
    id_token      = "minutes"
    refresh_token = "days"
  }

  user_pool_id = aws_cognito_user_pool.tf--cognito_user_pool.id
}

resource "aws_cognito_user_pool_domain" "tf--cognito_user_pool_domain" {
  domain       = "auth-holomatch"
  user_pool_id = aws_cognito_user_pool.tf--cognito_user_pool.id
  managed_login_version = 2
}
