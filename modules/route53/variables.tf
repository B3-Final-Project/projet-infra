
variable "domain_name" {
  description = "The domain name for the hosted zone"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  type        = string
}

variable "validation_records" {
  description = "List of domain validation records"
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
}
