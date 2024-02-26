resource "aws_nat_gateway" "lv_shop_nat" {
  allocation_id = aws_eip.lv_shop_nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id
  tags = {
      Name = "${var.application_name}-webinfra-${var.vpc_environment}-NAT"
    }
  depends_on = [aws_eip.lv_shop_nat_eip]
}
