resource "aws_lb" "apptier-lb" {
    name               = "apptier-lb"
    internal           = true
    load_balancer_type = "application"
    security_groups    = [aws_security_group.apptier-alb-security-group.id]
    subnets            = [  for subnet in aws_subnet.apptier_private_subnets : subnet.id ]
    enable_deletion_protection = false

    tags = {
      Name = "Legitvector-shop-${var.vpc_environment}-apptier-lb"
    }
}

resource "aws_lb_listener" "apptier_lb_listener" {
  load_balancer_arn = aws_lb.apptier-lb.arn
  port              = "8443"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apptier_tg.arn
  }
}

output "app_lb_listener" {
  value = aws_lb_listener.apptier_lb_listener
}
