resource "aws_security_group" "application_sg" {
  name        = "application_sg"
  description = "Application SG"
  vpc_id      = "${aws_vpc.demo_network.id}"

  ingress {
    description = "tcp"
    from_port   = 8080
    to_port     = 8084
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "tcp"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "tcp"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Application SG"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Database SG"
  vpc_id      = "${aws_vpc.demo_network.id}"

  ingress {
    description = "DB-connection from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    description = "DB-connection from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["188.163.113.216/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DB SG"
  }
}
