resource "aws_lb" "webtier-lb" {
    name               = "webtier-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.webtier-alb-security-group.id]
    subnets            = [  for subnet in aws_subnet.webtier_private_subnets : subnet.id ]
    enable_deletion_protection = false

    tags = {
      Name = "Legitvector-shop-${var.vpc_environment}-webtier-lb"
    }
}

resource "aws_lb_listener" "webtier_lb_listener" {
  load_balancer_arn = aws_lb.webtier-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webtier_tg.arn
  }
}

output "lb_listener" {
  value = aws_lb_listener.webtier_lb_listener
}