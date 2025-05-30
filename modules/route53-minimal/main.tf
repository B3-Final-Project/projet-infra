# Route53 Hosted Zone for the domain
resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Name = "${var.domain_name}-hosted-zone"
    Environment = "production"
  }
}

# SSL Certificate for the domain
resource "aws_acm_certificate" "main" {
  domain_name       = var.domain_name
  subject_alternative_names = ["www.${var.domain_name}"]
  validation_method = "DNS"

  tags = {
    Name = "${var.domain_name}-certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Certificate validation using Route53
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.main.zone_id
}

# Certificate validation - will wait for DNS propagation
resource "aws_acm_certificate_validation" "main" {
  certificate_arn         = aws_acm_certificate.main.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
  
  timeouts {
    create = "20m"
  }
}

# Note: A records for ALB are removed from this minimal version
# They will be added back when ECS is recreated
