module "alb" {
  source             = "terraform-aws-modules/alb/aws"
  name               = "threetier"
  load_balancer_type = "application"
  vpc_id             = "vpc-063d33c2607f516b9"
  subnets            = ["subnet-0b5d844078b6befec", "subnet-046be52b4e01cc29a", "subnet-082ab3abe05b94a65"]
  security_groups    = ["sg-02315e4a266c2cefb"]
  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
      targets = [
        {
          target_id = "i-0123456789abcdefg"
          port      = 80
        },
        {
          target_id = "i-a1b2c3d4e5f6g7h8i"
          port      = 8080
        }
      ]
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "threetier"
  }
}