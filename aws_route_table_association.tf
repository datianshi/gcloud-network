# subnet associations for public subnet 2
resource "aws_route_table_association" "public_subnet" {
    provider = "aws"
    subnet_id = "${aws_subnet.public_subnet_vpc.id}"
    route_table_id = "${aws_route_table.PublicSubnetTB.id}"
}
