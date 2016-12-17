# public route

resource "aws_default_route_table" "public" {
  default_route_table_id = "${aws_vpc.default.default_route_table_id}"
  lifecycle {
    ignore_changes = [
      "route"]
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
  tags {
    name    = "${var.resource_name}-public-route-table"
    billing = "${var.billing}"
  }
}

# public route table association

resource "aws_route_table_association" "admin" {
  count          = "${var.az_count}"
  subnet_id      = "${element(aws_subnet.admin.*.id, count.index)}"
  route_table_id = "${aws_default_route_table.public.id}"
}
resource "aws_route_table_association" "dmz" {
  count          = "${var.az_count}"
  subnet_id      = "${element(aws_subnet.dmz.*.id, count.index)}"
  route_table_id = "${aws_default_route_table.public.id}"
}

# private route

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.default.id}"
  lifecycle {
    ignore_changes = [
      "route"]
  }
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.default.id}"
  }
  tags {
    name    = "${var.resource_name}-private-route-table"
    billing = "${var.billing}"
  }
}

# private route table association

resource "aws_route_table_association" "dataapp" {
  count          = "${var.az_count}"
  subnet_id      = "${element(aws_subnet.dataapp.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}
resource "aws_route_table_association" "front" {
  count          = "${var.az_count}"
  subnet_id      = "${element(aws_subnet.front.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}