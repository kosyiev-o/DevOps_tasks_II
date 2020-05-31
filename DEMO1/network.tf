provider "aws" {
  profile = "default"
  region  = "us-west-2"
}
resource "aws_vpc" "demo_network" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "demo_network"
  }
}
resource "aws_subnet" "private_subnet1" {
  vpc_id            = "${aws_vpc.demo_network.id}"
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "private_subnet1"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id            = "${aws_vpc.demo_network.id}"
  cidr_block        = "10.0.21.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "private_subnet2"
  }
}
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = "${aws_vpc.demo_network.id}"
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = "${aws_vpc.demo_network.id}"
  cidr_block              = "10.0.22.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet2"
  }
}
resource "aws_subnet" "db_subnet1" {
  vpc_id            = "${aws_vpc.demo_network.id}"
  cidr_block        = "10.0.13.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "db_subnet1"
  }
}
resource "aws_subnet" "db_subnet2" {
  vpc_id            = "${aws_vpc.demo_network.id}"
  cidr_block        = "10.0.23.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "db_subnet2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.demo_network.id}"

  tags = {
    Name = "igw"
  }
}
resource "aws_eip" "ip1" {
  vpc = true
  tags = {
    Name = "ip1"
  }
}
resource "aws_eip" "ip2" {
  vpc = true
  tags = {
    Name = "ip2"
  }
}
resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = "${aws_eip.ip1.id}"
  subnet_id     = "${aws_subnet.public_subnet1.id}"
  depends_on    = ["aws_internet_gateway.igw"]

  tags = {
    Name = "nat1"
  }
}
resource "aws_nat_gateway" "nat_gw2" {
  allocation_id = "${aws_eip.ip2.id}"
  subnet_id     = "${aws_subnet.public_subnet2.id}"
  depends_on    = ["aws_internet_gateway.igw"]

  tags = {
    Name = "nat2"
  }
}

resource "aws_route_table" "private_route1" {
  vpc_id = "${aws_vpc.demo_network.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gw1.id}"
  }
  tags = {
    Name = "private_route1"
  }
}
resource "aws_route_table" "private_route2" {
  vpc_id = "${aws_vpc.demo_network.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gw2.id}"
  }
  tags = {
    Name = "private_route2"
  }
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
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route1.id
}
resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route2.id
}
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route.id
}
resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route.id
}
