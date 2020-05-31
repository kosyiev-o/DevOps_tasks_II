
resource "aws_launch_configuration" "application" {
  name                 = "app_launch"
  image_id             = "ami-0d1cd67c26f5fca19"
  instance_type        = "t2.micro"
  security_groups      = ["${aws_security_group.bastion_sg.id}", "${aws_security_group.alb_sg.id}"]
  key_name             = "Demo-1_keys"
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  user_data            = "${file("setup.sh")}"

}

resource "aws_autoscaling_group" "app_auto" {
  name                      = "app_sg"
  max_size                  = 2
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  launch_configuration      = "${aws_launch_configuration.application.name}"
  vpc_zone_identifier       = ["${aws_subnet.private_subnet1.id}", "${aws_subnet.private_subnet2.id}"]

}

resource "aws_launch_configuration" "bastion" {
  name                        = "bastion_launch"
  image_id                    = "ami-0d1cd67c26f5fca19"
  instance_type               = "t2.micro"
  security_groups             = ["${aws_security_group.bastion_sg.id}"]
  key_name                    = "Demo-1_keys"
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile.name}"
  associate_public_ip_address = "true"
  user_data                   = "${file("setup.sh")}"

}

resource "aws_autoscaling_group" "bastion_auto" {
  name                      = "bastion_auto"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  launch_configuration      = "${aws_launch_configuration.bastion.name}"
  vpc_zone_identifier       = ["${aws_subnet.public_subnet1.id}", "${aws_subnet.public_subnet2.id}"]


}
