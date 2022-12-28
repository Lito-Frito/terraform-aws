variable "access_key" {
  type        = string
  description = "Personal Access Key used to access AWS account"
}

variable "secret_key" {
  type        = string
  description = "Secret Key for AWS account"
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
