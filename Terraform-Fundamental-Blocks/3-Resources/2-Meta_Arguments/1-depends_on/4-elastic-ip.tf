resource "aws_eip" "tf-vpc-eip" {
    instance = aws_instance.tf-ec2.id
    domain   = "vpc"
    # Implementing a meta-argument called depends_on
    # This Elastic ip should be created only after creating the IGW
    depends_on = [
      aws_internet_gateway.tf-vpc-igw
    ]
    # its recommended to not use multiple depends_on
    # if you should be using, make sure you are having a good documentation around it .
    tags = {
      "Name" = "dev-eip" # this will create in AWS
    }
}
