resource "aws_lb" "webtier-lb" {
    name               = "webtier-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.webtier-alb-security-group.id]
    subnets            = [  for subnet in aws_subnet.webtier_private_subnets : subnet.cidr_block ]
    enable_deletion_protection = true

    tags = {
      Name = "Legitvector-shop-${var.vpc_environment}-webtier-lb"
    }
}
