resource "aws_vpc" "vpc" {
    provider = "aws"
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "vpc"
    }
}

resource "aws_internet_gateway" "internetGw" {
    provider = "aws"
    vpc_id = "${aws_vpc.vpc.id}"
    tags {
        Name = "vpc-internet-gateway"
    }
}

resource "aws_vpn_gateway" "vpn_gw" {
  provider = "aws"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "vpn_gateway_vpc"
  }
}
