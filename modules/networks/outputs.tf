output "public_aws_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "aws_vpc_main_id" {
  value = aws_vpc.main.id
}
