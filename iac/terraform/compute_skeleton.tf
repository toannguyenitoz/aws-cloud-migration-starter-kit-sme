# This file provides a readable skeleton for the app tier.
# For a real deployment, review AMI IDs, user data, IAM instance profiles,
# health check path, HTTPS certificates, and application release process.

resource "aws_lb" "app" {
  name               = "${var.name_prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-alb"
  })
}

resource "aws_lb_target_group" "app" {
  name     = "${var.name_prefix}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/health.html"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

  tags = merge(local.tags, {
    Name = "${var.name_prefix}-tg"
  })
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}
