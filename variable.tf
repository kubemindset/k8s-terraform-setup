# Region
variable "region" {
  description = "AWS region"
  type        = string
}

# VPC & Subnet CIDRs
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

# Availability Zones
variable "az1" {
  description = "Availability Zone 1"
  type        = string
}

variable "az2" {
  description = "Availability Zone 2"
  type        = string
}

# VPC ID (if required for referencing elsewhere)
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

# Control Plane Ports (e.g., 6443 for API server, etc.)
variable "control_plane_ports" {
  description = "Ports for Kubernetes Control Plane"
  type        = list(number)
}

# Cluster EC2 Input Variables
variable "ubuntu_ami" {
  description = "Ubuntu AMI for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}




