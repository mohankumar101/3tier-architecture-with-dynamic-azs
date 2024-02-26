# Webtier EC2 security group
resource "aws_security_group" "allow_ec2_web_traffic_sg" {
  name        = "allow_ec2_web_traffic_sg"
  description = "Allow web inbound traffic, ssh from bastion and all outbound traffic"
  vpc_id      = aws_vpc.lv_webinfra.id

# Allow ingress connections from Webtier ALB to EC2
  ingress {
    description = "Web traffic from web-alb"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #cidr_blocks = [ for subnet in aws_subnet.webtier_private_subnets: subnet.cidr_block ]
    security_groups = [ aws_security_group.webtier-alb-security-group.id ]
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ for subnet in aws_subnet.public_subnets: subnet.cidr_block ] 
  }

  egress {
    description = "All traffic to internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Legitvector-shop-${var.vpc_environment}-webtier-ec2-security-group"
  }
}
