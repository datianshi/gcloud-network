provider "google" {
  credentials = "${file("account.json")}"
  project     = "ps-sding"
  region      = "${var.google_region}"
}
