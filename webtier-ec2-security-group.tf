resource "aws_security_group" "allow_internet_web_traffic_sg" {
  name        = "allow_webtraffic"
  description = "Allow web inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.lv_webinfra.id

  ingress {
    description = "web traffic from Webtier"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Legitvector-shop-${var.vpc_environment}-webtier-ec2-security-group"
  }
}
