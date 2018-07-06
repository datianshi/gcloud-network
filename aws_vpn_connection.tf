resource "aws_vpn_connection" "main" {
  provider = "aws"
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gw.id}"
  customer_gateway_id = "${aws_customer_gateway.customer_gateway.id}"
  type                = "ipsec.1"
  static_routes_only  = true
  tunnel1_preshared_key = "BKOBs.7B2HxNZJbUV5KkdEVAw6Jo_A4c"
  tunnel2_preshared_key = "S9X6bFiikjeq.rMbYeyo8m8RJWE0J7I_"
}

resource "aws_vpn_connection_route" "TO_VPC1" {
  provider = "aws"
  destination_cidr_block = "${var.region1_routable_cidr}"
  vpn_connection_id      = "${aws_vpn_connection.main.id}"
}
