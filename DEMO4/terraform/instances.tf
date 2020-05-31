resource "aws_launch_configuration" "nginx" {
  name                 = "VM1(nginx)"
  image_id             = "ami-00c5fcec4d0bcb70f"
  instance_type        = "t2.micro"
  security_groups      = ["${aws_security_group.application_sg.id}"]
  key_name             = "Epam_labs_us-west2"
  associate_public_ip_address = "true"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum upgrade -y
                EOF
}

resource "aws_autoscaling_group" "nginx_auto" {
  name                      = "app_sg"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  launch_configuration      = "${aws_launch_configuration.nginx.name}"
  vpc_zone_identifier       = ["${aws_subnet.public_subnet1.id}", "${aws_subnet.public_subnet2.id}"]
  tag {
    key                 = "Name"
    value               = "VM1"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "petclinic" {
  name                 = "VM2(petclinic)"
  image_id             = "ami-00c5fcec4d0bcb70f"
  instance_type        = "t2.micro"
  security_groups      = ["${aws_security_group.application_sg.id}"]
  key_name             = "Epam_labs_us-west2"
  associate_public_ip_address = "true"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum upgrade -y
                EOF
}

resource "aws_autoscaling_group" "petclinic_auto" {
  name                      = "petclinic_auto"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  launch_configuration      = "${aws_launch_configuration.petclinic.name}"
  vpc_zone_identifier       = ["${aws_subnet.public_subnet1.id}", "${aws_subnet.public_subnet2.id}"]
  tag {
    key                 = "Name"
    value               = "VM2"
    propagate_at_launch = true
  }
}


resource "aws_launch_configuration" "database" {
  name                 = "VM3(db)"
  image_id             = "ami-0d1cd67c26f5fca19"
  instance_type        = "t2.micro"
  security_groups      = ["${aws_security_group.db_sg.id}"]
  key_name             = "Epam_labs_us-west2"
  associate_public_ip_address = "true"
  user_data = <<-EOF
                #!/bin/bash
                apt-get update
                apt-get upgrade -y
                EOF
}

resource "aws_autoscaling_group" "database_auto" {
  name                      = "database_auto"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  launch_configuration      = "${aws_launch_configuration.database.name}"
  vpc_zone_identifier       = ["${aws_subnet.public_subnet1.id}", "${aws_subnet.public_subnet2.id}"]
  tag {
    key                 = "Name"
    value               = "VM3"
    propagate_at_launch = true
  }
}
