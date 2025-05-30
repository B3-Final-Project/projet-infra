output "public_aws_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_aws_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "aws_vpc_main_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}
