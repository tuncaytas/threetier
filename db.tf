resource "aws_db_instance" "threetier" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0.27"
  instance_class       = "db.t3.micro"
  db_name                 = "threetier"
  username             = "admin"
  password             = "wordpress"
//   parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}