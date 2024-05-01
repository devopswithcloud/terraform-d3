/*
variable "region" {
  description = "This is the region where the infra should be created"
  default     = "us-east-1"
  type        = string
}

variable "instance_type" {
  description = "Instance type that is used in the infra"
  default     = "t2.micro"
  type        = string
}

variable "instance_count" {
  description = "How many instances are needed"
  default     = 2
  type        = number
}
*/


# EC2 instance
resource "aws_instance" "tf-ec2" {
  count         = var.instance_count # 0,1,2
  ami           = "ami-04e5276ebb8451442"
  instance_type = var.instance_type # 750 hours
  key_name      = "terraformd3"
  vpc_security_group_ids = [
    aws_security_group.tf-sg-allow-ssh.id,
    aws_security_group.tf-sg-allow-http-https.id
  ]
  # index starts form 0
  tags = {
    "Name" = "WebInstance-${count.index}" # this will create in AWS
  }
}


# webserver
