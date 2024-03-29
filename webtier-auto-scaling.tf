
# Webtier auto-scaling group which uses the load balancer's target group as the pool to monitor and scale instances as and when needed

resource "aws_autoscaling_group" "webtier_asg" {
  name = "Legitvector-shop-${var.vpc_environment}-webtier-instance"
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1
  vpc_zone_identifier = [ for subnet in aws_subnet.webtier_private_subnets: subnet.id ]
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  target_group_arns = [ aws_lb_target_group.webtier_tg.arn ]

  launch_template {
    id      = aws_launch_template.webtier_launch_template.id
    version = aws_launch_template.webtier_launch_template.latest_version
  }
  tag {
    key                 = "Name"
    value               = "Legitvector-shop-${var.vpc_environment}-webtier-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_webtier_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.webtier_asg.id
  lb_target_group_arn = aws_lb_target_group.webtier_tg.arn
}