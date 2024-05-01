variable "region" {
  description = "This is the region where the infra should be created"
  default     = "us-east-1"
  type        = string
}

variable "instance_type" {
  description = "Instance type that is used in the infra"
  type        = string
}

variable "instance_count" {
  description = "How many instances are needed"
  default     = 1
  type        = number
}

variable "ami_id" {
  type    = string
  default = "ami-04e5276ebb8451442"
}
