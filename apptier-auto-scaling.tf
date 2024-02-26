
# Apptier auto-scaling group which uses the load balancer's target group as the pool to monitor and scale instances as and when needed

resource "aws_autoscaling_group" "apptier_asg" {
  name = "Legitvector-shop-${var.vpc_environment}-apptier-ASG"
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1
  target_group_arns = [ aws_lb_target_group.apptier_tg.arn ]
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  vpc_zone_identifier = [ for subnet in aws_subnet.apptier_private_subnets: subnet.id ]

  launch_template {
    id      = aws_launch_template.apptier_launch_template.id
    version = aws_launch_template.apptier_launch_template.latest_version
  }
    tag {
    key                 = "Name"
    value               = "Legitvector-shop-${var.vpc_environment}-apptier-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_apptier_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.apptier_asg.id
  lb_target_group_arn = aws_lb_target_group.apptier_tg.arn
}