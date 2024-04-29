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

# Create a ROute Table
resource "aws_route_table" "tf-vpc-public-route-table" {
    vpc_id = aws_vpc.tf-vpc.id
    tags = {
      "Name" = "rt-public"
    }
}
