resource "aws_security_group" "webtier-alb-security-group" {
  name        = "webtier_alb_security_group"
  description = "Webtier alb security group"
  vpc_id      = aws_vpc.lv_webinfra.id

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Legitvector-shop-${var.vpc_environment}-webtier-alb-security-group"
  }
}