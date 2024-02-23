resource "aws_lb_target_group" "apptier_tg" {
  name          = "apptier-tg"
  port          = 8443
  protocol      = "TCP"
  target_type   = "instance"
  vpc_id        = aws_vpc.lv_webinfra.id
  target_health_state {
        enable_unhealthy_connection_termination = true
  }
  tags = {
    Name        = "Legitvector-shop-${var.vpc_environment}-apptier-target-group"
    Terraform   = true
  }
}