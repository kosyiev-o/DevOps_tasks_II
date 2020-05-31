resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = ["${aws_subnet.db_subnet1.id}", "${aws_subnet.db_subnet2.id}"]

  tags = {
    Name = "DB subnet group"
  }
}


resource "aws_db_instance" "demo_db" {
  allocated_storage         = 20
  storage_type              = "gp2"
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t2.micro"
  name                      = "demo_db"
  username                  = "root"
  password                  = "12345678"
  db_subnet_group_name      = "db_subnet"
  parameter_group_name      = "default.mysql5.7"
  vpc_security_group_ids    = ["${aws_security_group.rds_sg.id}"]
  final_snapshot_identifier = "true"

  tags = {
    Name = "Demo DB"
  }
}
