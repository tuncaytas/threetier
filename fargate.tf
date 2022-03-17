resource "aws_ecs_task_definition" "wordpress" {
  family                   = "test"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "wordpress",
    "image": "docker.io/wordress:latest",
    "cpu": 1024,
    "memory": 2048,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}

resource "aws_ecs_service" "wordpress" {
  name            = "wordpressdb"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.wordpress.arn
  desired_count   = 3
  //   iam_role        = aws_iam_role.foo.arn
  //   depends_on      = [aws_iam_role_policy.foo]
  network_configuration {
    security_groups  = [module.web_server_sg.security_group_id]
    subnets          = module.vpc.public_subnets
    assign_public_ip = false
  }


  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = resource.aws_lb_target_group.test.arn
    container_name   = "wordpress"
    container_port   = 80
  }
}