resource "google_compute_instance" "ubuntu_east" {
  provider = "google"
  name         = "testeast"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  tags = ["ubuntu", "internal"]

  disk {
    image = "ubuntu-1704-zesty-v20170413"
  }

  // Local SSD disk
  disk {
    type    = "local-ssd"
    scratch = true
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.test_subnet_east.name}"
    access_config {
    }
  }

  metadata {
    test = "yes"
  }

  metadata_startup_script = "${file("start_up.sh")}"

}
