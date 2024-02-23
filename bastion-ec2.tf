
resource "aws_instance" "bastion" {
        instance_type   = "t3.micro"
        ami             = local.webtier_ec2_ami.id
        key_name        = "avmk-newkeys"
        subnet_id       = aws_subnet.public_subnets[0].id
        associate_public_ip_address = true
        security_groups = [ aws_security_group.bastion_allow_ssh_sg.id ]
        tags = {
            Name = "Bastion Host for SSH access"
        }
}
output "bastion_host_detail" {
    value = aws_instance.bastion.public_dns 
}