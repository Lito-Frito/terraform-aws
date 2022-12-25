variable "access_key" {
  type        = string
  description = "Personal Access Key used to access AWS account"
}

variable "secret_key" {
  type        = string
  description = "Secret Key for AWS account"
}

variable "vpc_cidr_block" {
  description = "subnet cidr block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block_dev_1" {
  description = "subnet cidr block"
  default     = "10.0.40.0/24"
}

variable "subnet_cidr_block_dev_2" {
  description = "subnet cidr block"
  default     = "10.0.20.0/24"
}

variable "environment" {
  description = "tag for deployment environment"
  default       = "development"
}
