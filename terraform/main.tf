provider "aws" {
  region     = "us-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "development"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.development-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "us-west-1b"
  tags = {
    Name = "subnet-1-dev"
  }
}

data "aws_vpc" "exisiting_vpc" {
  default = true
}

resource "aws_subnet" "dev-subnet-2" {
  vpc_id            = data.aws_vpc.exisiting_vpc.id
  cidr_block        = "172.31.48.0/20"
  availability_zone = "us-west-1c"
  tags = {
    Name = "subnet-2-default"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}
