terraform {
  // required_version = "0.14.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.42.0"
    }
  }
}
provider "aws" {
  region = "us-east-2"
}

