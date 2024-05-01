# i want to create a VPC
# VPC is a resourse


resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "sivavpc"
  }
}


# VPC, ec2, iam, vpn, s3, 
