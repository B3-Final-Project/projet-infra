output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.ecs.load_balancer_dns_name
}

output "frontend_ecr_repository_url" {
  description = "URL of the frontend ECR repository"
  value       = module.ecr.frontend_repository_url
}

output "backend_ecr_repository_url" {
  description = "URL of the backend ECR repository"
  value       = module.ecr.backend_repository_url
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = module.ecs.cluster_name
}

output "rds_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = module.rds.db_instance_endpoint
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.networks.aws_vpc_main_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.networks.public_aws_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.networks.private_aws_subnet_ids
}

# Route53 Outputs
output "domain_name" {
  description = "The configured domain name"
  value       = module.route53.domain_name
}

output "hosted_zone_id" {
  description = "Route53 hosted zone ID"
  value       = module.route53.hosted_zone_id
}

output "hosted_zone_name_servers" {
  description = "Name servers for the hosted zone - configure these in your domain registrar"
  value       = module.route53.hosted_zone_name_servers
}

output "website_url" {
  description = "URL of the website"
  value       = "https://${module.route53.domain_name}"
}
