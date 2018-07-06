resource "aws_customer_gateway" "customer_gateway" {
  provider = "aws"
  bgp_asn    = 65000
  ip_address = "${var.peer_ip}"
  type       = "ipsec.1"

  tags {
    Name = "customer-gateway"
  }
}
