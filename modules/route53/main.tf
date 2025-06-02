# Route53 Hosted Zone for the domain
resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Name = "${var.domain_name}-hosted-zone"
    Environment = "production"
  }
}

# A record pointing to the ALB
resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

# WWW subdomain pointing to the ALB
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

# Certificate validation using Route53
resource "aws_route53_record" "cert_validation" {
  count   = length(var.validation_records)

  allow_overwrite = true
  name    = var.validation_records[count.index].name
  records = [var.validation_records[count.index].value]
  ttl     = 60
  type    = var.validation_records[count.index].type
  zone_id = aws_route53_zone.main.zone_id
}

# Certificate validation - will wait for DNS propagation
# resource "aws_acm_certificate_validation" "main" {
#   certificate_arn         = aws_acm_certificate.main.arn
#   validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
#
#   timeouts {
#     create = "20m"
#   }
# }
