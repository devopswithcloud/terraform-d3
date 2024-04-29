# Settings block
terraform {
  # Required Terraform Version
  required_version = "value"

  # Required Terraform Providers 
  required_providers {
    aws = {
      version = "value"
      source  = "hashicorp/aws"
    }
  }

  # Remote backend solution to store terraform state information
  backend "s3" {
    bucket = "sdfasd"
  }

  # Experimental features
  experiments = []

  # metadata to providers 
  provider_meta "" {

  }
}
