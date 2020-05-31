resource "aws_vpc" "demo_network" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "demo_network"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = "${aws_vpc.demo_network.id}"
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = "${aws_vpc.demo_network.id}"
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet2"
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = "${aws_subnet.public_subnet1.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}
resource "aws_route_table_association" "public2" {
  subnet_id      = "${aws_subnet.public_subnet2.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}

resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.demo_network.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "public_route"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.demo_network.id}"

  tags = {
    Name = "demo_igw"
  }
}
