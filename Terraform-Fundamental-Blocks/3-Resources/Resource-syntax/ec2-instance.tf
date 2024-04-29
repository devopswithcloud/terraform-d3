
resource "aws_instance" "tf-my-ec2" {
  # code
  ami = "ami-04e5276ebb8451442"
  instance_type = "t2.micro"
  # availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  tags = {
    #"Name" = "web-server"
    "env" = "PreProd"
  }
}

resource "aws_instance" "tf-my-ec2-new" {
  # code
  ami = "ami-04e5276ebb8451442"
  instance_type = "t2.micro"
  # availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "web-server"
  }
}
