
resource "aws_security_group" "apptier-alb-security-group" {
  name        = "apptier_alb_traffic_sg"
  description = "Apptier alb security group"
  vpc_id      = aws_vpc.lv_webinfra.id

  ingress {
    description = "App calls from Webtier"
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = [  for subnet in aws_subnet.webtier_private_subnets : subnet.cidr_block ]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [  for subnet in aws_subnet.apptier_private_subnets : subnet.cidr_block ]
  }


  tags = {
    Name = "Legitvector-shop-${var.vpc_environment}-apptier-alb-security-group"
  }
}
