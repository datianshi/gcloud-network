resource "aws_subnet" "public_subnet_vpc" {
    provider= "aws"
    vpc_id = "${aws_vpc.vpc.id}"

    cidr_block = "${var.public_subnet_cidr_vpc}"
    availability_zone = "${var.az}"

    tags {
        Name = "vpc subnet"
    }
}
