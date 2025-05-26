resource "aws_cognito_user_pool" "tf--cognito_user_pool" {
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = "1"
    }

    recovery_mechanism {
      name     = "verified_phone_number"
      priority = "2"
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = "false"
  }

  auto_verified_attributes = ["email"]
  deletion_protection      = "ACTIVE"

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  mfa_configuration = "OPTIONAL"
  name              = "User pool - 1zfokm"

  password_policy {
    minimum_length                   = "8"
    password_history_size            = "0"
    require_lowercase                = "true"
    require_numbers                  = "true"
    require_symbols                  = "true"
    require_uppercase                = "true"
    temporary_password_validity_days = "7"
  }

  schema {
    attribute_data_type      = "Number"
    developer_only_attribute = "false"
    mutable                  = "true"
    name                     = "hasProfile"

    number_attribute_constraints {
      max_value = "1"
      min_value = "0"
    }

    required = "false"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = "false"
    mutable                  = "true"
    name                     = "display_name"
    required                 = "false"

    string_attribute_constraints {
      max_length = "12"
      min_length = "3"
    }
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = "false"
    mutable                  = "true"
    name                     = "email"
    required                 = "true"

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }

  sign_in_policy {
    allowed_first_auth_factors = ["PASSWORD"]
  }

  sms_configuration {
    external_id    = "579e83de-6148-4af7-abd4-b91db7d8e032"
    sns_caller_arn = "arn:aws:iam::989418411786:role/service-role/CognitoIdpSNSServiceRole"
    sns_region     = "eu-west-3"
  }

  software_token_mfa_configuration {
    enabled = "true"
  }

  user_pool_tier      = "ESSENTIALS"
  username_attributes = ["email", "phone_number"]

  username_configuration {
    case_sensitive = "false"
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_message        = "Your verification code is {####}."
    email_subject        = "Welcome to Holomatch"
    sms_message          = "Your verification code is {####}."
  }
}
