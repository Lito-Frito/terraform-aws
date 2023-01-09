terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "myapp-bucket-nana"
    key    = "myapp/state.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region     = "us-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = var.vpc_cidr_blocks

  azs            = [var.avail_zone]
  public_subnets = [var.subnet_cidr_blocks]
  public_subnet_tags = {
    Name = "${var.env_prefix}-subnet-1"
  }

  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}




module "myapp-webserver" {
  source = "./modules/webserver"

  vpc_id = module.vpc.vpc_id

  my_ip = var.my_ip

  env_prefix = var.env_prefix

  image_name = var.image_name

  public_key_location = var.public_key_location

  instance_type = var.instance_type

  subnet_id = module.vpc.public_subnets[0]

  avail_zone = var.avail_zone
}
