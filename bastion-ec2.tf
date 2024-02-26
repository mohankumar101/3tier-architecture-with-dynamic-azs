
# Create bastion host, which is the landing machine to access all EC2 machines

resource "aws_instance" "bastion" {
        instance_type   = "t3.micro"
        ami             = local.webtier_ec2_ami.id
        key_name        = var.ssh_key_name
        subnet_id       = aws_subnet.public_subnets[0].id
        associate_public_ip_address = true
        security_groups = [ aws_security_group.bastion_allow_ssh_sg.id ]
        tags = {
            Name = "Bastion Host for SSH access"
        }
}
