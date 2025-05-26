output "aws_kms_alias_tf--dating-app-backend-key_id" {
  value = aws_kms_alias.tf--dating-app-backend-key.id
}

output "aws_kms_alias_tf--dating-app-fargate_id" {
  value = aws_kms_alias.tf--dating-app-fargate.id
}

output "aws_kms_alias_tf--dating-app-frontend-key_id" {
  value = aws_kms_alias.tf--dating-app-frontend-key.id
}
