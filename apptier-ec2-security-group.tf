resource "aws_security_group" "allow_apptier_traffic_sg" {
  name        = "allow_apptraffic"
  description = "Allow app inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.lv_webinfra.id

  ingress {
    description = "App traffic from Webtier"
    from_port   = var.apptier_ingress_ports.app
    to_port     = var.apptier_ingress_ports.app
    protocol    = "tcp"
    cidr_blocks = [ for subnet in aws_subnet.webtier_private_subnets: subnet.cidr_block ] 
  }

  ingress {
    description = "SSH traffic from Bastion"
    from_port   = var.apptier_ingress_ports.ssh
    to_port     = var.apptier_ingress_ports.ssh
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
    Name = "Legitvector-shop-${var.vpc_environment}-apptier-ec2-security-group"
  }
}
