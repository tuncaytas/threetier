// module "db" {
//   source = "terraform-aws-modules/rds/aws"

//   identifier = "demodb"

//   engine            = "mysql"
//   engine_version    = "5.7.25"
//   instance_class    = "db.t3a.large"
//   allocated_storage = 5
//   db_name  = "threetier"
//   username = "user"
//   port     = "3306"
//   vpc_security_group_ids = ["vpc-063d33c2607f516b9"]

//   // maintenance_window = "Mon:00:00-Mon:03:00"
//   // backup_window      = "03:00-06:00"

//   # Enhanced Monitoring - see example for details on how to create the role
//   # by yourself, in case you don't want to create it automatically
//   // monitoring_interval    = "30"
//   // monitoring_role_name   = "MyRDSMonitoringRole"
//   // create_monitoring_role = true

// }
// // resource "aws_rds_cluster" "threetier" {
// //   cluster_identifier      = "rds-cluster-threetier"
// //   engine                  = "rds"
// //   engine_version          = "5.7.25"
// //   availability_zones      = ["us-east-2a", "us-east-2b", "us-east-2c"]
// //   database_name           = "threetier"
// //   master_username         = "admin"
// //   master_password         = "bar"
// //   backup_retention_period = 5
// // //   preferred_backup_window = "07:00-09:00"
// // }