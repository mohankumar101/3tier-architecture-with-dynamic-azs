resource "aws_lb" "apptier-lb" {
    name               = "apptier-lb"
    internal           = true
    load_balancer_type = "application"
    security_groups    = [aws_security_group.apptier-alb-security-group.id]
    subnets            = [  for subnet in aws_subnet.apptier_private_subnets : subnet.id ]
#    enable_deletion_protection = true

    tags = {
      Name = "Legitvector-shop-${var.vpc_environment}-apptier-lb"
    }
}
