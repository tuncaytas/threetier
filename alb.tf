module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "threetier"

  load_balancer_type = "application"

  vpc_id             = "vpc-063d33c2607f516b9"
  subnets            = ["subnet-0b5d844078b6befec", "subnet-046be52b4e01cc29a", "subnet-082ab3abe05b94a65"]
  security_groups    = ["sg-02315e4a266c2cefb"]

  access_logs = {
    bucket = "threetier-logs"
  }

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = "i-0123456789abcdefg"
          port = 80
        },
        {
          target_id = "i-a1b2c3d4e5f6g7h8i"
          port = 8080
        }
      ]
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      target_group_index = 0
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