resource "aws_customer_gateway" "customer_gateway" {
  provider = "aws"
  bgp_asn    = 65000
  ip_address = "${google_compute_address.vpn_static_ip.address}"
  type       = "ipsec.1"

  tags {
    Name = "customer-gateway"
  }
}
