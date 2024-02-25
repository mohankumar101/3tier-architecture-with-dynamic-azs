

/* Public subnet */

resource "aws_subnet" "public_subnets" {
  count                   = length(local.public_subnets)
    vpc_id                  = aws_vpc.lv_webinfra.id
    cidr_block              = local.public_subnets[count.index]
    availability_zone       = local.availability_zones[count.index]
    tags = {
        Name        = "${var.vpc_environment}-${local.availability_zones[count.index]}-public-subnet"
        Environment = "${var.vpc_environment}"
    } 
}

### A route table for the VPC
resource "aws_route_table" "public_routing_table" {
  vpc_id = aws_vpc.lv_webinfra.id
  tags = {
    Name = "Legitvector-Shop-${var.vpc_environment}-public-RT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lv_internet_gw.id
  }
}

### route table association for the VPC
resource "aws_route_table_association" "public-RT-association" {
  count  = length(aws_subnet.public_subnets)
    subnet_id = aws_subnet.public_subnets[count.index].id
    route_table_id = aws_route_table.public_routing_table.id
}


/*
### Route entry on the routing table, referring to the Internet gateway as route for internet (0.0.0.0/0) 
resource "aws_route" "public_internet_route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.public_routing_table.id
  gateway_id = aws_internet_gateway.lv_internet_gw.id
}
*/



