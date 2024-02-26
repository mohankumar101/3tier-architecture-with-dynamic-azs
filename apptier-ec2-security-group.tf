# Apptier security group
resource "aws_security_group" "allow_apptier_traffic_sg" {
  name        = "allow_apptier_traffic_sg"
  description = "Allow app inbound traffic, ssh from bastion and all outbound traffic"
  vpc_id      = aws_vpc.lv_webinfra.id

# Allows traffic from apptier ALB to apptier EC2 instances
  ingress {
    description = "App traffic from Webtier"
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    # cidr_blocks = [ for subnet in aws_subnet.webtier_private_subnets: subnet.cidr_block ] 
    security_groups = [ aws_security_group.apptier-alb-security-group.id ]
  }

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
    Name = "Legitvector-shop-${var.vpc_environment}-apptier-ec2-security-group"
  }
}
