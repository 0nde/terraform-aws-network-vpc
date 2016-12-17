resource "aws_route53_zone" "default" {
  name    = "${var.region}-${aws_vpc.default.id}.priv"
  vpc_id  = "${aws_vpc.default.id}"
  comment = "${var.resource_name} private zone"
  tags {
    name    = "${var.resource_name}"
    billing = "${var.billing}"
  }
}