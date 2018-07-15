resource "aws_route53_zone" "shaozhenpcf" {
  name = "shaozhenpcf.com"
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route53_record" "gcp_cf_sys" {
  zone_id = "${aws_route53_zone.shaozhenpcf.zone_id}"
  name    = "*.sys.pcf.shaozhenpcf.com"
  type    = "A"
  ttl     = "300"
  records = ["${var.cf_ip}"]
}

resource "aws_route53_record" "gcp_cf_app" {
  zone_id = "${aws_route53_zone.shaozhenpcf.zone_id}"
  name    = "*.apps.pcf.shaozhenpcf.com"
  type    = "A"
  ttl     = "300"
  records = ["${var.cf_ip}"]
}

resource "aws_route53_record" "opsman" {
  zone_id = "${aws_route53_zone.shaozhenpcf.zone_id}"
  name    = "opsman.pcf.shaozhenpcf.com"
  type    = "A"
  ttl     = "300"
  records = ["${var.opsman_ip}"]
}
