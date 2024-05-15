variable "region" {
  description = "This is the region where the infra should be created"
  default     = "us-east-1"
  type        = string
}

variable "instance_type" {
  description = "Instance type that is used in the infra"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "How many instances are needed"
  type = number
  default = 1
}


variable "instance_name" {
  description = "instnace name"
  default = "defaultname"
  type = string
}

variable "ami_id" {
  description = "AMI ID Needed for creating an EC2"
  type    = string
  default = "ami-04e5276ebb8451442" # or you can call from terraform.tfvars as well
  validation {
    condition = length(var.ami_id) > 4 && substr(var.ami_id, 0 , 4) == "ami-"
    error_message = "AMI ID should be valid and starts with ami-"
  }

}