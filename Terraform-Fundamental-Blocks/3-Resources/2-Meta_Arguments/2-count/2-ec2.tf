
# EC2 instance
resource "aws_instance" "tf-ec2" {
    count = 3 # 0,1,2
    ami = "ami-04e5276ebb8451442"
    instance_type = "t2.micro" # 750 hours
    key_name = "terraformd3"
    # index starts form 0
    tags = {
      "Name" = "server-${count.index}" # this will create in AWS
    }
}


# webserver
