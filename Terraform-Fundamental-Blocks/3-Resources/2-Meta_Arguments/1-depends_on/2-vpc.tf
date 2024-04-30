# Create a VPC
#Create a subnet
#* Create a IGW(internet gateway)
#* Create a Route Table
#* Create a explict route to internet from the RT created previously.
#* Create a security group for port 22, 80, 8080


# Create a VPC
resource "aws_vpc" "tf-vpc" { # tf-vpc, is a local name that can be used in terraform
  # code , arguments name, cidr range
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "dev-vpc" # this will create in AWS
  }
}

# Create a subnet
resource "aws_subnet" "tf-dev-public-subnet-1" {
  # selected vpc,
  # cidr range,
  # availability_zone
  # name
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "dev-public-subnet-1"
  }
  map_public_ip_on_launch = true
}

# Create a IGw
resource "aws_internet_gateway" "tf-vpc-igw" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    "Name" = "dev-igw"
  }
}

# Create a Route Table
resource "aws_route_table" "tf-vpc-public-route-table" {
    vpc_id = aws_vpc.tf-vpc.id
    tags = {
      "Name" = "rt-public"
    }
}

# Create a route in the route table fpr internet access
resource "aws_route" "tf-vpc-public-route" {
    route_table_id =  aws_route_table.tf-vpc-public-route-table.id
    destination_cidr_block = "0.0.0.0/0" # Currently we are hardcoding it. later we shall modify with varaibles
    gateway_id = aws_internet_gateway.tf-vpc-igw.id
}


# Associate the route table with a subnet
resource "aws_route_table_association" "tf-vpc-public-route-table-assoc" {
  subnet_id = aws_subnet.tf-dev-public-subnet-1.id
  route_table_id = aws_route_table.tf-vpc-public-route-table.id
}

# Create a Security Group
resource "aws_security_group" "tf-ssh-http-sg" {
    # ssh, http, ports
    name = "dev-vpc-sg"
    description = "This SG allows http and ssh traffic"
    vpc_id = aws_vpc.tf-vpc.id
    # ingress, egress
    ingress {
      description = "Allos SSH"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      description = "Allow http"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
