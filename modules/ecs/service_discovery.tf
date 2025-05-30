# Service Discovery Namespace
resource "aws_service_discovery_private_dns_namespace" "main" {
  name        = "local"
  description = "Service discovery namespace for B3 application"
  vpc         = var.vpc_id

  tags = {
    Name = "b3-service-discovery"
  }
}
