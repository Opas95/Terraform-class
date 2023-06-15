#
resource "aws_vpc" "food-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "food-vpc"
  }
}

#public subnet
resource "aws_subnet" "food-pub-sn" {
  vpc_id     = aws_vpc.food-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "food-pub-sn"
  }
}

#private subnet
resource "aws_subnet" "food-pvt-sn" {
  vpc_id     = aws_vpc.food-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "food-pvt-sn"
  }
}


