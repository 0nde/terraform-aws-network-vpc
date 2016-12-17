# nat gateway

resource "aws_eip" "nat" {
    vpc = true
}

resource "aws_nat_gateway" "default" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.dmz.0.id}"
}