variable "region1_routable_cidr" {
    description = "region1 routable cidr"
    default = "10.0.0.0/24"
}

variable "region2_routable_cidr" {
    description = "region2 routable cidr"
    default = "10.0.10.0/24"
}

variable "google_region" {}

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
    default = "10.0.1.0/24"
}

variable "public_subnet_cidr_vpc" {
  description = "VPC cidr"
  default = "10.0.1.0/25"
}

variable "instance_type" {
  description = "instance type"
  default = "m3.medium"
}

variable "instance_ami" {
  description = "intance ami - ubuntu"
  default = "ami-efd0428f"
}
