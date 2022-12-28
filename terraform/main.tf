provider "aws" {
  region     = "us-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.cidr_blocks[0]
  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.development-vpc.id
  cidr_block        = var.cidr_blocks[1]
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
  cidr_block        = var.cidr_blocks[2]
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
