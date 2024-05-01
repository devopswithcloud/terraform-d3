variable "region" {
  description = "This is the region where the infra should be created"
  default     = "us-east-1"
  type        = string
}

/*
variable "instance_type" {
  description = "Instance type that is used in the infra"
  #type        = string
  #default     = "t2.micro"
  type = list(string)
  default = [ "t2.micro", "t2.small", "t3.micro" ]

  # Refer them in the resource block
  #instance_type = var.instance_type[0]
}
*/

variable "instance_count" {
  description = "How many instances are needed"
  type = number
  default = 1
}

variable "ami_id" {
  type    = string
  default = "ami-04e5276ebb8451442"
}

variable "instance_name" {
  description = "instnace name"
  default = "defaultname"
  type = string
}

variable "instance_tags" {
  description = "Instance tags used for"
  type = map(string)
  default = {
    "Name" = "webserver"
    "Owner" = "SRE"
  }
}

variable "instance_type" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "test" = "t2.small"
    "prod" = "t3.medium"
  }
}