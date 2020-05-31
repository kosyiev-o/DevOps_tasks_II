resource "aws_lb" "demo_lb" {
  name               = "DemoLB"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  subnets            = ["${aws_subnet.public_subnet1.id}", "${aws_subnet.public_subnet2.id}"]
  security_groups    = ["${aws_security_group.alb_sg.id}"]

}

resource "aws_lb_target_group" "alb_tg" {

  health_check {
    interval            = 10
    path                = "/var/www/html/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  name        = "my-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.demo_network.id}"
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "tg-attachment1" {
  target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  target_id        = "i-075825dde6e12a36e"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-attachment2" {
  target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  target_id        = "i-008eaf6e465a01171"
  port             = 80
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = "${aws_lb.demo_lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  }
}
