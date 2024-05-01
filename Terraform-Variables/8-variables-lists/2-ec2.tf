

# EC2 instance
resource "aws_instance" "tf-ec2" {
  count         = var.instance_count # 0,1,2
  ami           = "ami-04e5276ebb8451442"
  instance_type = var.instance_type[2] # 750 hours
  key_name      = "terraformd3"
  vpc_security_group_ids = [
    aws_security_group.tf-sg-allow-ssh.id,
    aws_security_group.tf-sg-allow-http-https.id
  ]
  # index starts form 0
  tags = {
    "Name" = "${var.instance_name}-${count.index}" # this will create in AWS
  }
}


# webserver
