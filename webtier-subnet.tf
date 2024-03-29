/* Apptier - private subnet */

resource "aws_subnet" "webtier_private_subnets" {
  count                 = length(local.web_subnets)
    vpc_id                  = aws_vpc.lv_webinfra.id
    cidr_block              = local.web_subnets[count.index]
    availability_zone       = local.availability_zones[count.index]
    tags = {
        Name        = "${var.vpc_environment}-${local.availability_zones[count.index]}-webtier-subnet"
        Environment = "${var.vpc_environment}"
    }
}

resource "aws_route_table" "webtier-routing-table" {
  vpc_id = aws_vpc.lv_webinfra.id
  tags = {
    Name = "Legitvector-Shop-${var.vpc_environment}-webtier-RT"
  }
}

### route table association for the private subnet
resource "aws_route_table_association" "webtier_rta" {
  count  = length(local.web_subnets)
    subnet_id = aws_subnet.webtier_private_subnets[count.index].id
    route_table_id = aws_route_table.webtier-routing-table.id
}

### Route for reaching internet from private subnets
resource "aws_route" "webtier_subnet_internet_route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.webtier-routing-table.id
  gateway_id = aws_nat_gateway.lv_shop_nat.id
}
