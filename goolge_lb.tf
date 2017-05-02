resource "google_compute_target_pool" "lb" {
  provider = "google"
  name = "test"
  region = "us-east1"

  instances = [
    "${google_compute_instance.ubuntu_east.self_link}",
  ]

  health_checks = [
    "${google_compute_http_health_check.lb.name}",
  ]
}

resource "google_compute_http_health_check" "lb" {
  name                = "lb"
  request_path        = "/"
  check_interval_sec  = 30
  timeout_sec         = 5
  healthy_threshold   = 10
  unhealthy_threshold = 2
  port = 80
}

resource "google_compute_forwarding_rule" "lb" {
  name       = "lb"
  target     = "${google_compute_target_pool.lb.self_link}"
  port_range = "80"
  region = "us-east1"
}
