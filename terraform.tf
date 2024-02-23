terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
/*
  backend "s3" {
    bucket = aws_s3_bucket.state_bucket.bucket
    key = "legitvector_shop/s3/${var.vpc_enviroment}/terraform.tfstate"
    region = "us-west-2"
    aws_dynamodb_table = aws_dynamodb_table.state_lock
    encrypt = true
  }
*/
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}
