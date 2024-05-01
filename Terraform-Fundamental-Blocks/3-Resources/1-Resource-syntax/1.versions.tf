# Settings block
terraform {
  required_version = "~> 1.2.1"
  required_providers {
    # What provider i want to go with
    aws = {
      version = "~> 5.43.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
