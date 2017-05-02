provider "google" {
  credentials = "${file("account.json")}"
  project     = "ps-sding"
  region      = "${var.google_region}"
}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}
