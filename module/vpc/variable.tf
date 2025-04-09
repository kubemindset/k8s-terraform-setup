variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet2_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "az1" {
  description = "Availability Zone for first subnet"
  type        = string
}

variable "az2" {
  description = "Availability Zone for second subnet"
  type        = string
}
