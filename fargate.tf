// resource "aws_ecs_cluster" "cluster" {
//   name = "example-ecs-cluster"

//   setting {
//     name  = "containerInsights"
//     value = "disabled"
//   }
// }

// resource "aws_ecs_cluster_capacity_providers" "cluster" {
//   cluster_name = aws_ecs_cluster.cluster.name

//   capacity_providers = ["FARGATE"]

//   default_capacity_provider_strategy {
//     capacity_provider = "FARGATE"
//   }
// }
// resource "aws_ecs_task_definition" "test" {
//   family                   = "test"
//   requires_compatibilities = ["FARGATE"]
//   network_mode             = "awsvpc"
//   cpu                      = 4
//   memory                   = 8192
//   container_definitions    = <<TASK_DEFINITION
// [
//   {
//     "name": "wordpress",
//     "image": "http://docker.io/wordpress:latest",
//     "cpu": 4,
//     "memory": 8192,
//     "essential": true
//   }
// ]
// TASK_DEFINITION

//   runtime_platform {
//     operating_system_family = "docker"
//     cpu_architecture        = "X86_64"
//   }
// }
// resource "aws_lb_target_group" "threetier" {
//   name        = "threetier"
//   # 32 character max-length
//   port        = "80"
//   protocol    = "HTTP"
//   vpc_id      = module.vpc.vpc_id
//   target_type = "ip"

//   health_check {
//     path     = "/threetier"
//     protocol = "HTTP"
//     interval = 60
//   }
// }

// resource "aws_lb_target_group_attachment" "threetier" {
//   target_group_arn = aws_lb_target_group.threetier.arn
//   target_id        = aws_ecs_service.service.id
//   port             = 80
// }

// resource "aws_ecs_service" "service" {
//   name            = "threetier"
//   cluster         = module.ecs.this_ecs_cluster_id
//   task_definition = aws_ecs_task_definition.service.arn
//   desired_count   = var.task_count
//   launch_type     = "FARGATE"

//   network_configuration {
//     security_groups = [aws_security_group.ecs_task.id]
//     subnets         = module.vpc.private_subnets
//   }

//   load_balancer {
//     target_group_arn = aws_lb_target_group.apitest.arn
//     container_name   = "threetier"
//     container_port   = var.app_port
//   }
// }

