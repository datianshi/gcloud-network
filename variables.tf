variable "region1_routable_cidr" {
    description = "region1 routable cidr"
    default = "10.0.0.0/22"
}

variable "cf_ip" {
    description = "cf ip"
    default = "10.0.0.10"
}

variable "opsman_ip" {
    description = "cf ip"
    default = "10.0.0.6"
}

variable "peer_ip" {
    default = "35.237.201.169"
}


variable "region2_routable_cidr" {
    description = "region2 routable cidr"
    default = "10.0.10.0/24"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "aws_key_name" {}

variable "az" {
  description = "Availability zone"
  default = "us-west-2a"
}

variable "vpc_cidr" {
    description = "VPC cidr"
    default = "10.0.16.0/23"
}

variable "public_subnet_cidr_vpc" {
  description = "VPC cidr"
  default = "10.0.16.0/24"
}

variable "instance_type" {
  description = "instance type"
  default = "m3.medium"
}

variable "instance_ami" {
  description = "intance ami - ubuntu"
  default = "ami-ba602bc2"
}
