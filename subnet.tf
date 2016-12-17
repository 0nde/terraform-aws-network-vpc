data "aws_availability_zones" "available" {
}

resource "aws_subnet" "front" {
  count                   = "${var.az_count}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 4, count.index)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = false
  vpc_id                  = "${aws_vpc.default.id}"
  tags {
    name    = "${var.resource_name}-${format("front-%02d", count.index + 1)}"
    billing = "${var.billing}"
  }
}

resource "aws_subnet" "dataapp" {
  count                   = "${var.az_count}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 4, count.index + 4)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = false
  vpc_id                  = "${aws_vpc.default.id}"
  tags {
    name    = "${var.resource_name}-${format("dataapp-%02d", count.index + 1)}"
    billing = "${var.billing}"
  }
}

resource "aws_subnet" "dmz" {
  count                   = "${var.az_count}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 4, count.index + 8)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = true
  vpc_id                  = "${aws_vpc.default.id}"
  tags {
    name    = "${var.resource_name}-${format("dmz-%02d", count.index + 1)}"
    billing = "${var.billing}"
  }
}

resource "aws_subnet" "admin" {
  count                   = "${var.az_count}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 4, count.index + 12)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = true
  vpc_id                  = "${aws_vpc.default.id}"
  tags {
    name    = "${var.resource_name}-${format("admin-%02d", count.index + 1)}"
    billing = "${var.billing}"
  }
}