

data "aws_availability_zones" "available" {
    state = "available"
}

data "aws_ami" "webtier-ec2-amidata" {
  most_recent   = true
  owners        = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_ami" "apptier-ec2-amidata" {
  most_recent   = true
  owners        = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

variable "application_name" {
    type = string
}

variable "vpc_environment" {
    type = string
}


variable "webtier_ec2_instance_type" {
    type = string
}

variable "apptier_ec2_instance_type" {
    type = string
}


variable "cidr_2octets" {
    type = map
    default = {
        dev         = "10.0"
        qa          = "10.0"
        staging     = "10.0"
        production  = "10.0"
    }
}


variable "lv_3tier_vpc" {
    description = "Common VPC variable - applicable for all VPCs"
    type = map(string)
    default = {
        cidr = "10.0.0.0/16"
    }
}

variable "webtier_ingress_ports" {
    description = "Webtier incoming connection ports"
    type = map(number)
    default = {
        ssh     = 22
        http    = 80
        https   = 443
    }
}

variable "apptier_ingress_ports" {
    description = "Webtier incoming connection ports"
    type = map(number)
    default = {
        ssh     = 22
        app     = 8443
    }
}