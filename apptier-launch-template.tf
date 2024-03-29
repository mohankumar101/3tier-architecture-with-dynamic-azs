
# Apptier EC2 instance launch template

resource "aws_launch_template" "apptier_launch_template" {
  name                      = "apptier_launch_template"
  disable_api_stop          = true
  disable_api_termination   = true
  ebs_optimized             = false
  image_id                  = local.apptier_ec2_ami.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type             = "t3.micro"
  key_name                  = var.ssh_key_name

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups = [ aws_security_group.allow_apptier_traffic_sg.id ]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
        name        = "Legitvector-shop-${var.vpc_environment}-apptier-instance"
        environment = var.vpc_environment
        tier        = "apptier"
    }
  }
}

