resource "google_compute_network" "test" {
  provider= "google"
  name                    = "test"
  auto_create_subnetworks = "false"
}

resource "google_compute_firewall" "test" {
  name    = "test-allow-ssh"
  network = "${google_compute_network.test.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

}

resource "google_compute_subnetwork" "test_subnet_east" {
  provider= "google"
  name          = "testsubneteast"
  ip_cidr_range = "${var.region1_routable_cidr}"
  network       = "${google_compute_network.test.self_link}"
  region        = "${var.google_region}"
}


resource "google_compute_firewall" "test_internal" {
  name    = "test-allow-internal"
  network = "${google_compute_network.test.name}"
  source_ranges= ["${var.region1_routable_cidr}", "${var.vpc_cidr}"]

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

  source_tags = ["internal"]
}

resource "google_compute_route" "route_vpn" {
  name        = "vpnroute"
  dest_range  = "${var.vpc_cidr}"
  network     = "${google_compute_network.test.name}"
  next_hop_vpn_tunnel = "${google_compute_vpn_tunnel.tunnel1.self_link}"
  priority    = 100
}
