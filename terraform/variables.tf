variable "access_key" {
  type        = string
  description = "Personal Access Key used to access AWS account"
}

variable "secret_key" {
  type        = string
  description = "Secret Key for AWS account"
}

# variable "vpc_cidr_block" {
#   description = "subnet cidr block"
#   default     = "10.0.0.0/16"
# }

variable "cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  type        = list(string)
  default     = ["10.0.0.0/16", "10.0.40.0/24", "172.31.48.0/20"]
}

variable "environment" {
  description = "tag for deployment environment"
  default     = "development"
}
