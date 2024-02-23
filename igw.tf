
resource "aws_internet_gateway" "lv_internet_gw" {
  vpc_id = aws_vpc.lv_webinfra.id
  tags = {
    Name = "Legitvector-Shop-${var.vpc_environment}-VPC-internet-gateway"
  }
}

output "internet_gateway_id" {
    value = aws_internet_gateway.lv_internet_gw.id
}