# Settings block
terraform {
  # Required Version, is the underlying terraform version which is in your machine
  # https://developer.hashicorp.com/terraform/language/expressions/version-constraints#version-constraint-syntax
  # Allows only the rightmost version component to increment.
  # Constraints
  required_version = "~> 1.2.1"
  required_providers {
    # What provider i want to go with 
    aws = {
      version = "~> 5.43.0"
      source  = "hashicorp/aws"
    }
    google = {
      version = "~> 5.26.0"
      source  = "hashicorp/google"
    }
  }

}



