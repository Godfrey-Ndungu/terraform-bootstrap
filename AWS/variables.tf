# VPC Variables
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "peach-api-vpc"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnet Variables
variable "subnet_name" {
  description = "Name of the subnets"
  type        = list(string)
  default     = ["peach-api-subnet-a", "peach-api-subnet-b"]
}

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Load Balancer Variables
variable "elb_name" {
  description = "Name of the Elastic Load Balancer"
  type        = string
  default     = "peach-api-elb"
}

# ECS Variables
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "peach-api-ecs-cluster"
}

# RDS Variables
variable "rds_instance_name" {
  description = "Name of the RDS instance"
  type        = string
  default     = "peach-api-db"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t2.micro"
}

# S3 Variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket for static files"
  type        = string
  default     = "peach-api-static-files"
}

# CloudFront Variables
variable "cloudfront_distribution_name" {
  description = "Name of the CloudFront distribution"
  type        = string
  default     = "peach-api-cloudfront"
}
