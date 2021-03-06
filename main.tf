provider "aws" {
  region = "${var.region}"
  version = "1.33.0"
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_blocks[0]}"

  tags {
    Name = "${var.name} - main"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.name} - main"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name = "${var.name} - main"
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.main.id}"
}

resource "aws_subnet" "primary" {
  vpc_id = "${aws_vpc.main.id}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  cidr_block = "${var.cidr_blocks[1]}"

  tags {
    Name = "Primary"
  }
}

resource "aws_subnet" "secondary" {
  vpc_id = "${aws_vpc.main.id}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  cidr_block = "${var.cidr_blocks[2]}"

  tags {
    Name = "Secondary"
  }
}
