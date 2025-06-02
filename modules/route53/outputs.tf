output "hosted_zone_id" {
  description = "ID of the Route53 hosted zone"
  value       = aws_route53_zone.main.zone_id
}

output "hosted_zone_name_servers" {
  description = "Name servers for the hosted zone"
  value       = aws_route53_zone.main.name_servers
}

output "domain_name" {
  description = "The domain name"
  value       = var.domain_name
}

output "main_domain_fqdn" {
  description = "Fully qualified domain name for the main domain"
  value       = aws_route53_record.main.fqdn
}

output "www_domain_fqdn" {
  description = "Fully qualified domain name for the www subdomain"
  value       = aws_route53_record.www.fqdn
}
