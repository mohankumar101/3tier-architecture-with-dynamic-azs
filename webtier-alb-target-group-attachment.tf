resource "aws_lb_listener" "webtier_lb_listener" {
  load_balancer_arn = aws_lb.webtier-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webtier_tg.arn
  }
}