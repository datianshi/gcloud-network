resource "aws_route_table" "PublicSubnetTB" {
    provider= "aws"
    vpc_id = "${aws_vpc.vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.internetGw.id}"
    }

    route {
        cidr_block = "${var.region1_routable_cidr}"
        gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
    }


    tags {
        Name = "public subnet route table2"
    }
}
