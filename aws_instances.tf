resource "aws_instance" "test_machine" {
    provider = "aws"
    ami = "${var.instance_ami}"
    availability_zone = "${var.az}"
    instance_type = "${var.instance_type}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.regular_ssh.id}"]
    subnet_id = "${aws_subnet.public_subnet_vpc.id}"
    associate_public_ip_address = true
    root_block_device {
        volume_size = 20
    }
    tags {
        Name = "vpc_test"
    }
}
