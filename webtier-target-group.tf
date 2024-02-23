resource "aws_lb_target_group" "webtier_tg" {
  name          = "webtier-tg"
  port          = 80
  protocol      = "HTTP"
  target_type   = "instance"
  vpc_id        = aws_vpc.lv_webinfra.id
  target_health_state {
        enable_unhealthy_connection_termination = true
  }
  tags = {
    Name        = "Legitvector-shop-${var.vpc_environment}-webtier-target-group"
    Terraform   = true
  }
}