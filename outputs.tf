output "cognito_domain_name" {
  value = module.cognito.hosted_ui_domain
}

output "route53_name_servers" {
  description = "Name servers to configure at your domain registrar"
  value = module.route53.hosted_zone_name_servers
}

output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value = module.ecs.load_balancer_dns_name
}

output "domain_name" {
  description = "The main domain name"
  value = module.route53.domain_name
}
