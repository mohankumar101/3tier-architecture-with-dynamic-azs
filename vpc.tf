resource "aws_vpc" "lv_webinfra" {
  cidr_block = var.lv_3tier_vpc.cidr
  tags = {
    Name = "${var.application_name}-WebInfra-${var.vpc_environment}"
  }
  enable_dns_hostnames = true
  enable_dns_support = true
}

