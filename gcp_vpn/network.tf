resource "google_compute_vpn_gateway" "target_gateway" {
  provider= "google"
  name    = "vpn1"
  network = "${var.network}"
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
  peer_ip       = "${var.peer_ip}"
  shared_secret = "${var.shared_secret}"
  ike_version = "1"

  local_traffic_selector  = ["${var.local_traffic}"]
  remote_traffic_selector = ["${var.remote_traffic}"]

  target_vpn_gateway = "${google_compute_vpn_gateway.target_gateway.self_link}"

  depends_on = [
    "google_compute_forwarding_rule.fr_esp",
    "google_compute_forwarding_rule.fr_udp500",
    "google_compute_forwarding_rule.fr_udp4500",
  ]
}

resource "google_compute_route" "route_vpn" {
  name        = "vpnroute"
  dest_range  = "${var.remote_traffic}"
  network     = "${var.network}"
  next_hop_vpn_tunnel = "${google_compute_vpn_tunnel.tunnel1.self_link}"
  priority    = 100
}

resource "google_compute_firewall" "vpn" {
  name    = "test-allow-internal"
  network = "${var.network}"
  source_ranges= ["${var.remote_traffic}"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["1-65535"]
  }
}
