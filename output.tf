output "vpc_data" {
    value = aws_vpc.lv_webinfra.id
}

output "webtier_subnet_data" {
    value = aws_subnet.webtier_private_subnets[*].id
}

output "public_subnet_data" {
    value = aws_subnet.public_subnets[*].id
}

output "apptier_subnet_data" {
    value = aws_subnet.apptier_private_subnets[*].id
}

output "webtier_lb" {
    value = aws_lb.webtier-lb.dns_name
}

