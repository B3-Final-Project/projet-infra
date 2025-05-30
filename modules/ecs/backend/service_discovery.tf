resource "aws_service_discovery_service" "backend" {
  name = "backend"

  dns_config {
    namespace_id = var.aws_service_discovery_main_dns_namespace

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = {
    Name = "b3-backend-discovery"
  }
}
