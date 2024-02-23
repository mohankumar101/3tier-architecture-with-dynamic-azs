
locals {
    public_subnets_3rdoctet  = 1
    web_subnets_3rdoctet = 5
    app_subnets_3rdoctet = 9
}

locals {
    availability_zones = data.aws_availability_zones.available.names
}

locals {
    webtier_ec2_ami = data.aws_ami.webtier-ec2-amidata
    apptier_ec2_ami = data.aws_ami.apptier-ec2-amidata
}


locals {
    web_subnets = [
        for az in local.availability_zones:
          "${lookup(var.cidr_2octets, var.vpc_environment)}.${local.web_subnets_3rdoctet + index(local.availability_zones, az)}.0/24"
    ]
    app_subnets = [
         for az in local.availability_zones:
          "${lookup(var.cidr_2octets, var.vpc_environment)}.${local.app_subnets_3rdoctet + index(local.availability_zones, az)}.0/24"
    ]
    public_subnets = [
        for az in local.availability_zones:
          "${lookup(var.cidr_2octets, var.vpc_environment)}.${local.public_subnets_3rdoctet + index(local.availability_zones, az)}.0/24"
    ]
}



