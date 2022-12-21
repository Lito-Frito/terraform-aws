provider "aws" {
  region     = "us-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.development-vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-west-1b"
}

data "aws_vpc" "exisiting_vpc" {
  default = true
}

resource "aws_subnet" "dev-subnet-2" {
  vpc_id            = data.aws_vpc.exisiting_vpc.id
  cidr_block        = "172.31.48.0/20"
  availability_zone = "us-west-1c"
}
