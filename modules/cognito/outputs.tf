output "user_pool_id" {
  description = "ID of the Cognito User Pool"
  value = aws_cognito_user_pool.tf--cognito_user_pool.id
}

output "user_pool_client_id" {
  description = "ID of the Cognito User Pool Client"
  value = aws_cognito_user_pool_client.tf--cognito_user_pool_client.id
}

output "user_pool_oidc_discovery_domain" {
  description = "Domain of the Cognito User Pool"
  value = "https://cognito-idp.eu-west-3.amazonaws.com/${aws_cognito_user_pool.tf--cognito_user_pool.id}"
}

output "hosted_ui_domain" {
  description = "Cognito hosted UI domain"
  value = "https://${aws_cognito_user_pool_domain.tf--cognito_user_pool_domain.domain}.auth.${var.region}.amazoncognito.com"
}

output "aws_cognito_user_pool_client_tf--b3-dating-app_400ece0ohqfefqun2ktbv0403b_id" {
  value = aws_cognito_user_pool_client.tf--cognito_user_pool_client.id
}

output "aws_cognito_user_pool_tf--User-pool--1zfokm_eu-west-3_018AFPXZG_id" {
  value = aws_cognito_user_pool.tf--cognito_user_pool.id
}