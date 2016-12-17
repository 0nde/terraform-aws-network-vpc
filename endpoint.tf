# endpoint

resource "aws_vpc_endpoint" "default" {
  vpc_id          = "${aws_vpc.default.id}"
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = [
    "${aws_vpc.default.main_route_table_id}",
    "${aws_route_table.private.id}"]
}