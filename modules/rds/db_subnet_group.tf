resource "aws_db_subnet_group" "tf--default-vpc-0f46992fd43d58913" {
  description = "Created from the RDS Management Console"
  name        = "default-vpc-0f46992fd43d58913"
  subnet_ids  = ["subnet-01171b942c5f6f6b1", "subnet-09230901293c0ab17", "subnet-09878c3dd85226690"]
}
