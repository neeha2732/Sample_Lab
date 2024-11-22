terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
  }
  backend "s3" {
    bucket          = "tfstate-mybucket-12-123"
    key             = "state/terraform.tfstate"
    region          = "eu-central-1"
    encrypt         = true
    dynamodb_table  = "tfstate-dynamo-table"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
