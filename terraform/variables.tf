variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "me-central-1" # UAE (Dubai) region
}

variable "instance_type" {
  description = "EC2 instance type for both Jenkins and target servers"
  type        = string
  default     = "t3.micro" # free-tier eligible in most regions
}

variable "key_pair_name" {
  description = "Name of an existing EC2 key pair for SSH access"
  type        = string
}

variable "my_ip" {
  description = "Your IP address in CIDR form, e.g. 1.2.3.4/32 — used to restrict SSH access"
  type        = string
}

variable "project_name" {
  description = "Prefix used for naming resources"
  type        = string
  default     = "cicd-demo"
}
