resource "google_compute_vpn_gateway" "target_gateway" {
  provider= "google"
  name    = "vpn1"
  network = "${google_compute_network.test.self_link}"
  region  = "${var.google_region}"
}

resource "google_compute_address" "vpn_static_ip" {
  provider = "google"
  name   = "vpn-static-ip"
  region = "${var.google_region}"
}

resource "google_compute_forwarding_rule" "fr_esp" {
  provider= "google"
  name        = "fr-esp"
  region      = "${var.google_region}"
  ip_protocol = "ESP"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.target_gateway.self_link}"
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  provider= "google"
  name        = "fr-udp500"
  region      = "${var.google_region}"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.target_gateway.self_link}"
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  provider= "google"
  name        = "fr-udp4500"
  region      = "${var.google_region}"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.target_gateway.self_link}"
}


resource "google_compute_vpn_tunnel" "tunnel1" {
  provider= "google"
  name          = "tunnel1"
  region      = "${var.google_region}"
  peer_ip       = "${aws_vpn_connection.main.tunnel1_address}"
  shared_secret = "${aws_vpn_connection.main.tunnel1_preshared_key}"
  ike_version = "1"

  local_traffic_selector  = ["${var.region1_routable_cidr}"]
  remote_traffic_selector = ["${var.vpc_cidr}"]

  target_vpn_gateway = "${google_compute_vpn_gateway.target_gateway.self_link}"

  depends_on = [
    "google_compute_forwarding_rule.fr_esp",
    "google_compute_forwarding_rule.fr_udp500",
    "google_compute_forwarding_rule.fr_udp4500",
  ]
}
