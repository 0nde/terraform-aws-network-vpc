# internet gateway

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name    = "${var.resource_name}-igw"
    Billing = "${var.billing}"
  }
}