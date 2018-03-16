# nat gateway

resource "aws_eip" "nat" {
  vpc = true
  tags {
    Name    = "${var.resource_name}-nat-gw"
    Billing = "${var.billing}"
  }
}

resource "aws_nat_gateway" "default" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.dmz.0.id}"
  tags {
    Name    = "${var.resource_name}-nat-gw"
    Billing = "${var.billing}"
  }
}