resource "aws_eip" "lv_shop_nat_eip" {
    tags = {
      Name = "${var.application_name}-webinfra-${var.vpc_environment}-ElasticIP"
    }
}

output "elastic_ip" {
    value = aws_eip.lv_shop_nat_eip.address
}