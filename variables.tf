variable "region" {
  default = "eu-west-3"
}

locals {
  envs = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => tuple[1] }
}
