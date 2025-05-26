resource "aws_kms_alias" "tf--dating-app-backend-key" {
  name          = "alias/dating-app-backend-key"
  target_key_id = "mrk-aab2b8d1dcaa4886a120afd58f023fcf"
}

resource "aws_kms_alias" "tf--dating-app-fargate" {
  name          = "alias/dating-app-fargate"
  target_key_id = "3fc05c34-686a-4366-ad20-37e3c881b58b"
}

resource "aws_kms_alias" "tf--dating-app-frontend-key" {
  name          = "alias/dating-app-frontend-key"
  target_key_id = "c1c80af3-4a26-4a6f-bcc0-18a9fdcc82ba"
}
