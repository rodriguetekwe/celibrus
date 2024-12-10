terraform {
  backend "s3" {
    bucket         = "celibrus-terraform-state" # Replace with your bucket name
    key            = "terraform-state/terraform.tfstate" # Customize this key structure if needed
    region         = "us-east-1" # Replace with your region
    dynamodb_table = "Dynamodb-celibrus-terraform" # Replace with your DynamoDB table name
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.4.0"
}

provider "aws" {
  region = "us-east-1"
}