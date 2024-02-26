/*
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

output "lb_listener" {
  value = aws_lb_listener.webtier_lb_listener
}

output "app_lb_listener" {
  value = aws_lb_listener.apptier_lb_listener
}

*/

output "bastion_host_detail" {
    value = aws_instance.bastion.public_dns 
}

output "apptier_lb" {
    value = aws_lb.apptier-lb.dns_name
}

output "webtier_lb" {
    value = aws_lb.webtier-lb.dns_name
}

