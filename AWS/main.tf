# Import providers and variables
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "arc_api_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}


# Create security groups (import from secgrp.tf)

# Create an ECS Cluster
resource "aws_ecs_cluster" "arc_api_ecs_cluster" {
  name = var.ecs_cluster_name
}

# Create an RDS instance
resource "aws_db_instance" "arc_api_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.7"
  instance_class       = var.rds_instance_class
  name                 = "arc_api_db"
  username             = "db_user"
  password             = "db_password"
  parameter_group_name = "default.postgres12"
}

# Create an S3 bucket for static files
resource "aws_s3_bucket" "arc_api_static_files_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private" # Adjust access controls as needed
}

# Create CloudFront distribution
resource "aws_cloudfront_distribution" "arc_api_cloudfront" {
  origin {
    domain_name = aws_s3_bucket.arc_api_static_files_bucket.bucket_regional_domain_name
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "arc API Static Files Distribution"
  default_root_object = "index.html"

  # Additional CloudFront configuration settings as needed
}

