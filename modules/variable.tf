variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_a" {
  default = "10.0.1.0/24"
}

variable "public_subnet_b" {
  default = "10.0.2.0/24"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "toluxfash"
}

variable "app_port" {
  default = 3000
}

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

