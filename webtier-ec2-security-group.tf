resource "aws_security_group" "allow_ec2_web_traffic_sg" {
  name        = "allow_webtraffic"
  description = "Allow web inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.lv_webinfra.id


  ingress {
    description = "Web traffic from Internet"
    from_port   = var.webtier_ingress_ports.http
    to_port     = var.webtier_ingress_ports.http
    protocol    = "tcp"
    cidr_blocks = [ for subnet in aws_subnet.webtier_private_subnets: subnet.cidr_block ]
  }

/*
  ingress {
    description = "Web traffic from Internet"
    from_port   = var.webtier_ingress_ports.https
    to_port     = var.webtier_ingress_ports.https
    protocol    = "tcp"
    cidr_blocks = [ for subnet in aws_subnet.webtier_private_subnets: subnet.cidr_block ] 
  }
*/
  ingress {
    description = "SSH traffic from Bastion"
    from_port   = var.webtier_ingress_ports.ssh
    to_port     = var.webtier_ingress_ports.ssh
    protocol    = "tcp"
    cidr_blocks = [ for subnet in aws_subnet.public_subnets: subnet.cidr_block ] 
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
