resource "aws_lb_target_group" "test" {
  name        = "tf-example-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"
  health_check {
   healthy_threshold   = "10"
   interval            = "120"
   protocol            = "HTTP"
   matcher             = "200"
   timeout             = "119"
  //  path                = var.health_check_path
   unhealthy_threshold = "2"
  }
}

resource "aws_lb" "test" {
  name                       = "three-tier"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [module.web_server_sg.security_group_id]
  subnets                    = module.vpc.public_subnets
  enable_deletion_protection = false
}

resource "aws_lb_listener" "lb_listener_http" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.test.arn
    type             = "forward"
  }
}

