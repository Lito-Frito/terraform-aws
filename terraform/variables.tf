variable "access_key" {
  type        = string
  description = "Personal Access Key used to access AWS account"
}

variable "secret_key" {
  type        = string
  description = "secret Key for AWS account"
}

variable "public_key_location" {
  type        = string
  description = "location for public key for AWS account"
}

variable "private_key_location" {
  type        = string
  description = "private key location for ssh"
}

variable "my_ip" {
  description = "my ip address"
}

variable "vpc_cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  default     = "10.0.10.0/24"
}

variable "avail_zone" {
  description = "availibility zone for AWS"
  default     = "us-west-1b"
}

variable "env_prefix" {
  description = "tag for deployment environment"
  default     = "dev"
}

variable "instance_type" {
  description = "type for ec2 instance"
  default     = "t2.micro"
}

variable "entry_script_location" {
  description = "location of entry script for ec2 instance"
  default     = "/home/ec2-user/entry-script-on-ec2.sh"
}

variable "image_name" {
  description = "name of image used for ec2 instaance"
  default     = "amzn2-ami-kernel*x86_64-gp2"
}
