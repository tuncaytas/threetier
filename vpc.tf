module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "threetier"
  cidr = "0.0.0.0/0"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}