resource "aws_vpn_connection" "main" {
  provider = "aws"
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gw.id}"
  customer_gateway_id = "${aws_customer_gateway.customer_gateway.id}"
  type                = "ipsec.1"
  static_routes_only  = true
}

resource "aws_vpn_connection_route" "TO_VPC1" {
  provider = "aws"
  destination_cidr_block = "${var.region1_routable_cidr}"
  vpn_connection_id      = "${aws_vpn_connection.main.id}"
}
