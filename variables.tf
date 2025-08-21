variable "aws_region" {}
variable "vpc_cidr" {}
variable "public_subnet_a" {}
variable "public_subnet_b" {}
variable "instance_type" {}
variable "key_name" {}
variable "app_port" {}
variable "db_username" {
  description = "RDS admin username"
  type        = string
}

variable "db_password" {
  description = "RDS admin password"
  type        = string
  sensitive   = true
}

variable "private_subnet_a" {
  type = string
}

variable "private_subnet_b" {
  type = string
}

variable "ec2_cidr" {
  type        = string
  description = "CIDR block allowed to access RDS"
}
