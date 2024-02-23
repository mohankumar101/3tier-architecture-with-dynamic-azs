resource "aws_lb_listener" "apptier_lb_listener" {
  load_balancer_arn = aws_lb.apptier-lb.arn
  port              = "8443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apptier_tg.arn
  }
}