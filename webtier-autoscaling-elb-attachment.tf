resource "aws_autoscaling_attachment" "asg_webtier_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.webtier_asg.id
  lb_target_group_arn = aws_lb_target_group.webtier_tg.arn
}