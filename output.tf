# route

output "aws_route_table_main_id" {
  value = "${aws_vpc.default.main_route_table_id}"
}
output "aws_route_table_private_id" {
  value = "${aws_route_table.private.id}"
}

# vpc

output "aws_vpc_id" {
  value = "${aws_vpc.default.id}"
}
output "aws_vpc_cidr_block" {
  value = "${aws_vpc.default.cidr_block}"
}

# subnet

output "aws_subnet_front" {
  value = ["${aws_subnet.front.*.id}"]
}
output "aws_subnet_dmz" {
  value = ["${aws_subnet.dmz.*.id}"]
}
output "aws_subnet_dataapp" {
  value = ["${aws_subnet.dataapp.*.id}"]
}
output "aws_subnet_admin" {
  value = ["${aws_subnet.admin.*.id}"]
}
output "aws_subnet_front_cidr_block" {
  value = ["${aws_subnet.front.*.cidr_block}"]
}
output "aws_subnet_dmz_cidr_block" {
  value = ["${aws_subnet.dmz.*.cidr_block}"]
}
output "aws_subnet_dataapp_cidr_block" {
  value = ["${aws_subnet.dataapp.*.cidr_block}"]
}
output "aws_subnet_admin_cidr_block" {
  value = ["${aws_subnet.admin.*.cidr_block}"]
}

# endpoint

output "endpoint_id" {
  value = "${aws_vpc_endpoint.default.id}"
}
output "endpoint_prefix" {
  value = "${aws_vpc_endpoint.default.prefix_list_id}"
}

# nat gateway

output "aws_nat_gateway_pub_ip" {
  value = "${aws_nat_gateway.default.public_ip}"
}