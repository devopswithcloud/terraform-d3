
# EC2 instance
resource "aws_instance" "tf-ec2" {
    ami = "ami-04e5276ebb8451442"
    instance_type = "t2.micro" # 750 hours
    key_name = "terraformd3"
    subnet_id = aws_subnet.tf-dev-public-subnet-1.id
    vpc_security_group_ids = [aws_security_group.tf-ssh-http-sg.id]
    # user_data = file("script.sh")
    user_data = <<-EOF
      #!/bin/bash
      sudo yum update -y
      sudo yum install -y httpd
      sudo service httpd start
      sudo systemctl enable httpd
      echo "<h1> Welcome to depends_on Session </h1>" > /var/www/html/index.html
    EOF
    tags = {
      "Name" = "dev-instance" # this will create in AWS
    }
}

# webserver
