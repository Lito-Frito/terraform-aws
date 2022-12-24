variable "access_key" {
  type        = string
  description = "Personal Access Key used to access AWS account"
}

variable "secret_key" {
  type        = string
  description = "Secret Key for AWS account"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
  default     = "10.0.40.0/24"
}
