resource "aws_autoscaling_attachment" "asg_apptier_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.apptier_asg.id
  lb_target_group_arn = aws_lb_target_group.apptier_tg.arn
}