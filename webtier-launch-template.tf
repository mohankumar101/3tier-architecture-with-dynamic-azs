resource "aws_launch_template" "webtier_launch_template" {

  name                      = "webtier_launch_template"
  disable_api_stop          = true
  disable_api_termination   = true
  ebs_optimized             = false
  image_id                  = local.webtier_ec2_ami.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type             = "t3.micro"
  key_name                  = "avmk-newkeys"
  
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = false
    security_groups = [ aws_security_group.allow_ec2_web_traffic_sg.id ]
  }
  user_data = filebase64("user-data.sh")
  tag_specifications {
    resource_type = "instance"
    tags = {
        name        = "Legitvector-shop-${var.vpc_environment}-webtier-launch-template"
        environment = var.vpc_environment
        tier        = "webtier"
    }
  }
}
