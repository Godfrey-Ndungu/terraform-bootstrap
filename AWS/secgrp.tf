# Security Group for the Load Balancer
resource "aws_security_group" "elb_security_group" {
  name        = "arc-elb-sg"
  description = "Security Group for the ELB"

  # Define inbound rules to allow traffic from the internet to the ELB
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from any IP
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from any IP for HTTPS
  }
}

# Security Group for ECS Instances (if needed)
resource "aws_security_group" "ecs_instance_security_group" {
  name        = "arc-ecs-instance-sg"
  description = "Security Group for ECS Instances"

 
}

# Security Group for RDS
resource "aws_security_group" "rds_security_group" {
  name        = "arc-rds-sg"
  description = "Security Group for RDS"

